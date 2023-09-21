package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class GameDAO {
	private GameDAO() {}
	private static GameDAO instance;
	public static GameDAO getInstance() {
		if (instance == null)
			instance = new GameDAO();
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	public int insertFavorite(String name, String id) throws Exception {
		String sql = "insert into game_favorite values(0,?,?);";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, name);
			pstat.setString(2, id);
			return pstat.executeUpdate();
		}
	}
	
	public List<String> selectFamousGame() throws Exception {
		List<String> list = new ArrayList();
		String sql = "select row_number() over (order by gName desc) as seq, gName, count(*) as count from game_record group by gName order by count desc;";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs =  pstat.executeQuery();
				){
			while(rs.next()) {
				list.add(rs.getString("gName"));
			}
		}
		return list;
	}
	
	// insert, selectBy~, selectAll, update, delete 로 함수명 통일 (최대한 sql 구문을 활용한 작명)
}
