package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.QnaAnswerDTO;

public class QnaAnswerDAO {
	
	private QnaAnswerDAO() {}
	private static QnaAnswerDAO instance;
	public static QnaAnswerDAO getInstance() {
		if(instance == null)
			instance = new QnaAnswerDAO();
		return instance;
	}
	
	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}

	public void insert(QnaAnswerDTO dto) throws Exception {
		String sql ="insert into qna_answer values(null,?,?,defalut);";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, dto.getParentSeq());
			pstat.setString(2, dto.getContents());
			pstat.executeUpdate();
		}
	}
}
