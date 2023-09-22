package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MemberDTO;

public class MemberDAO {
	private MemberDAO() {}
	private static MemberDAO instance;
	public static MemberDAO getInstance() {
		if (instance == null)
			instance = new MemberDAO();
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	// insert, selectBy~, selectAll, update, delete 로 함수명 통일 (최대한 sql 구문을 활용한 작명)
	public int insert(MemberDTO dto) throws Exception {
		String sql = "insert into members (mID, mPW, mNickname, mName, mIdNumber, mPhone, mEmail, mAgreement) values(?, ?, ?, ?, ?, ?, ?, ?)";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getPw());
			pstat.setString(3, dto.getNickName());
			pstat.setString(4, dto.getName());
			pstat.setString(5, dto.getIdNumber());
			pstat.setString(6, dto.getPhone());
			pstat.setString(7, dto.getEmail());
			pstat.setBoolean(8, dto.isAgreement());
			return pstat.executeUpdate();
		}
	}
	
	public boolean selectById(String id) throws Exception {
		String sql = "select * from members where mID = ?";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);

			try(ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}
	
	public MemberDTO selectUserInfo(String id) throws Exception {
		String sql = "select * from members where mID = ?";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);

			try(ResultSet rs = pstat.executeQuery();) {
				if(rs.next()) {
					String userid = rs.getString("mID");
					String idNumber = rs.getString("mIdNumber");
					String name = rs.getString("mName");
					String email = rs.getString("mEmail");
					String nickName = rs.getString("mNickname");
					String phone = rs.getString("mPhone");
					int point = rs.getInt("mPoint");
					int level = rs.getInt("mLevel");
					Timestamp signupDate = rs.getTimestamp("mSignupDate"); 
					
					return new MemberDTO(userid, idNumber, name, email, nickName, phone, point, level, signupDate);
				}
			}
		}
		return null;
	}
	
	public boolean selectByNickname(String nickName) throws Exception {
		String sql = "select * from members where mNickname = ?";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, nickName);

			try(ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}
	
	public boolean selectByIdPw(String id, String pw) throws Exception {
		String sql = "select * from members where mID = ? and mPW = ?";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			pstat.setString(2, pw);

			try(ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}
	
	public String selectNicknameById(String id) throws Exception {
		String sql = "select mNickname from members where mID = ?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			
			try(ResultSet rs = pstat.executeQuery();) {
				rs.next();
				return rs.getString("mNickname");
			}
		}
	}
	
	public String selectIdByNameEmail(String name, String email) throws Exception {
		String sql = "select * from members where mName = ? and mEmail = ?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, name);
			pstat.setString(2, email);
			
			try(ResultSet rs = pstat.executeQuery();) {
				if(rs.next()) {
					return rs.getString("mId");
				} else {
					return null;
				}
			}
		}
	}
	
	public boolean selectByIdNameEmail(String id, String name, String email) throws Exception {
		String sql = "select * from members where mId = ? and mName = ? and mEmail = ?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, id);
			pstat.setString(2, name);
			pstat.setString(3, email);
			
			try(ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}
	
	public int updatePwById(String pw, String id) throws Exception {
		String sql = "update members set mPw = ? where mId = ?";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, pw);
			pstat.setString(2, id);
			return pstat.executeUpdate();
		}
	}

	
}
