package dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

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

	
}
