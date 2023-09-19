package dao;

import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ReplyDTO;

public class ReplyDAO {
	private ReplyDAO() {}
	private static ReplyDAO instance;
	public static ReplyDAO getInstance() {
		if (instance == null)
			instance = new ReplyDAO();
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	// insert, selectBy~, selectAll, update, delete 로 함수명 통일 (최대한 sql 구문을 활용한 작명)
	
	public List<ReplyDTO> selectAll(int postSeq){
		String sql = "select * from reply where cbSeq = ?;";
		return null;
	}
}
