package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BoardDTO;

public class BoardDAO {
	private BoardDAO() {}
	private static BoardDAO instance;
	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	// insert, selectBy~, selectAll, update, delete 로 함수명 통일 (최대한 sql 구문을 활용한 작명)
	
	public BoardDTO selectPost(int postSeq) throws Exception {
		String sql = "selete * from common_board where cbSeq = ?";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(postSeq, 1);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				return new BoardDTO(rs.getInt("cbSeq"), rs.getString("cbID"), rs.getString("cbNickname"), rs.getString("Cetegory"), rs.getString("cbTitle"), rs.getString("cbContent"), rs.getTimestamp("writeDate"), rs.getInt("view"),rs.getInt("recommend"));
			}
		}
	}
	
	
}
