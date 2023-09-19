package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.QNABoardDTO;

public class QNABoardDAO {
	private QNABoardDAO() {}
	private static QNABoardDAO instance;
	public static QNABoardDAO getInstance() {
		if (instance == null)
			instance = new QNABoardDAO();
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	// insert, selectBy~, selectAll, update, delete 로 함수명 통일 (최대한 sql 구문을 활용한 작명)
	public int insert(QNABoardDTO dto) throws Exception{
		String sql = "insert into qna_board values(0,?,?,?,?,default,?,?);";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getNickName());
			pstat.setString(3, dto.getTitle());
			pstat.setString(4, dto.getContents());
			pstat.setString(5, dto.getCategory());
			pstat.setBoolean(6, dto.isSecret());
			
			return pstat.executeUpdate();
		}
	}
	
}
