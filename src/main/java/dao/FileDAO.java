package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.FileDTO;

public class FileDAO {
	private FileDAO() {}
	private static FileDAO instance;
	public static FileDAO getInstance() {
		if (instance == null)
			instance = new FileDAO();
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	// insert, selectBy~, selectAll, update, delete 로 함수명 통일 (최대한 sql 구문을 활용한 작명)
	public int insert (FileDTO dto) throws Exception{
		String sql = "insert into file values(default, ?, ?, ?);";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, dto.getParentSeq());
			pstat.setString(2, dto.getOriginName());
			pstat.setString(3, dto.getSystemName());
			return pstat.executeUpdate();
		}
	}
}
