package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.KordleWordDTO;


public class KordleWordDAO {
	private KordleWordDAO() {}

	private static KordleWordDAO instance;

	public static KordleWordDAO getInstance() {
		if (instance == null)
			instance = new KordleWordDAO();
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}

	// insert, selectBy~, selectAll, update, delete 로 함수명 통일 (최대한 sql 구문을 활용한 작명)

	public boolean isExist(String noun) throws Exception{
		String sql ="select * from wordle_data where jamo_word=?;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1,noun);
			try(ResultSet rs = pstat.executeQuery();){
				return rs.next();
			}
		}
	}
	
	public int countWord() throws Exception{
		String sql ="select count(*) from wordle_data;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next())
					return rs.getInt(1);
				else
					return 0;
			}
		}
	}
	
	public KordleWordDTO randomWord() throws Exception{
		int cnt = this.countWord(); //35063
		int randomSeq = (int)(Math.random()*cnt)+1;
		
		String sql ="select * from wordle_data where seq=?;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, randomSeq);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next())
					return new KordleWordDTO(rs.getInt("seq"), rs.getString("ori_word"), rs.getString("jamo_word"));
				else
					return null;
			}
		}
	}
}
