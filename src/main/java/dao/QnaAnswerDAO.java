package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
		String sql ="insert into qna_answer values(null,?,?,default);";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, dto.getParentSeq());
			pstat.setString(2, dto.getContents());
			pstat.executeUpdate();
		}
	}
	
	public List<QnaAnswerDTO> selectAll(int postSeq) throws Exception{
		String sql ="select * from qna_answer where qbSeq = ?;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, postSeq);
			try(ResultSet rs = pstat.executeQuery();){
				List<QnaAnswerDTO> list = new ArrayList<>();
				while(rs.next()) {
					list.add(new QnaAnswerDTO(rs.getInt("qaSeq"), rs.getInt("qbSeq"), rs.getString("qaContents"),rs.getTimestamp("qaWriteDate")));
				}
				return list;
			}
			
		}
	}
}
