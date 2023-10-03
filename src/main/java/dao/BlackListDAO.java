package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BlackListDTO;
import dto.BoardDTO;
import dto.MemberDTO;
import dto.ReplyDTO;

public class BlackListDAO {
	private BlackListDAO() {}
	private static BlackListDAO instance;
	public static BlackListDAO getInstance() {
		if (instance == null)
			instance = new BlackListDAO();
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	public List<BlackListDTO> selectAllBlackList() throws Exception{
		String sql = "select * from blacklist";
		List<BlackListDTO> list = new ArrayList<>();
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			while(rs.next()) {
				BlackListDTO dto = new BlackListDTO();
				int seq = rs.getInt("blSeq");
				String id = rs.getString("blID");
				String nickName = rs.getString("blNickname");
				String phone = rs.getString("blPhone");
				String email = rs.getString("blEmail");
				dto.setBlSeq(seq);
				dto.setBlID(id);
				dto.setBlNickname(nickName);
				dto.setBlPhone(phone);
				dto.setBlEmail(email);
				list.add(dto);
			}
		}
		return list;
	}
	
	public int insertBlackList(BlackListDTO dto) throws Exception {
		String sql = "insert into blacklist values(0,?,?,?,?);";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getBlID());
			pstat.setString(2, dto.getBlNickname());
			pstat.setString(3, dto.getBlPhone());
			pstat.setString(4, dto.getBlEmail());
			return pstat.executeUpdate();
		}
	}
	public int selectWarningCount(String mid) throws Exception{
		String sql = "select mWarningCount from members where mID = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, mid);
			try(ResultSet rs = pstat.executeQuery();){
				rs.next();
				int count = rs.getInt("mWarningCount");
				return count;
			}
			
		}
	}
	
	public int updateWarningCount(String mid, int newCount) throws Exception{
		String sql = "update members set mWarningCount = ? where mID = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, newCount);
			pstat.setString(2, mid);
			return pstat.executeUpdate();
		}
	}

	/*
	 * public int updateBlackMember(String mid) throws Exception { String sql =
	 * "update" return 0; }
	 */
	public List<MemberDTO> selectWarnUser(String id) throws Exception {
		String sql = "select * from members where mWarningCount >= 3";
		List<MemberDTO> list = new ArrayList<>();
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			try(ResultSet rs = pstat.executeQuery();) {
				while(rs.next()) {
					String userid = rs.getString("mID");
					String idNumber = rs.getString("mIdNumber");
					String name = rs.getString("mName");
					String email = rs.getString("mEmail");
					String nickName = rs.getString("mNickname");
					String phone = rs.getString("mPhone");
					int point = rs.getInt("mPoint");
					int level = rs.getInt("mLevel");
					Timestamp signupDate = rs.getTimestamp("mSignupDate");
					list.add(new MemberDTO(userid, idNumber, name, email, nickName, phone, point, level, signupDate));
				}
				return list;
			}
		}
	}
		
	//ReplyDAO 에 들어갈 비속어 및 광고성 문구 필터링 기능 임시 구현
	public List<ReplyDTO> selectAll() throws Exception{
		String sql = "select * from reply where rContents regexp '광고|무료|증정|http|ㅎ|ㄱ';";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			try(ResultSet rs = pstat.executeQuery();){
				List<ReplyDTO> replies = new ArrayList<>();
				while(rs.next()) {
					replies.add(new ReplyDTO(rs.getInt("rSeq"), rs.getInt("cbSeq"), rs.getString("mID"), rs.getString("mNickname"), rs.getString("rContents"), rs.getTimestamp("rWriteDate"), rs.getInt("parentRSeq")));
				}
				return replies;
			}
		}
	}
	public String selectFilterData() throws Exception{
		String sql = "select * from filter;";
		List<String> list = new ArrayList<>();
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			
			try(ResultSet rs = pstat.executeQuery();){
				while(rs.next()) {
					list.add(rs.getString("fdata"));
				}
				String str = String.join("|", list);
				return str;
			}
		}
	}
	public List<ReplyDTO> selectAdReplies() throws Exception{
		String sql = "select * from reply where rContents regexp ?;";
		String filter = selectFilterData();
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, filter);
			try(ResultSet rs = pstat.executeQuery();){
				List<ReplyDTO> replies = new ArrayList<>();
				while(rs.next()) {
					replies.add(new ReplyDTO(rs.getInt("rSeq"), rs.getInt("cbSeq"), rs.getString("mID"), rs.getString("mNickname"), rs.getString("rContents"), rs.getTimestamp("rWriteDate"), rs.getInt("parentRSeq")));
				}
				return replies;
			}
		}
	}
	public List<BoardDTO> selectAdBoard() throws Exception {
		String sql = "select * from common_board where cbTitle regexp ? or cbContent regexp ?;";
		List<BoardDTO> list = new ArrayList<>();
		String filter = selectFilterData();
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, filter);
			pstat.setString(2, filter);
			try(ResultSet rs = pstat.executeQuery();){
				while (rs.next()) {
					int cbSeq = rs.getInt("cbSeq");
					String cbID = rs.getString("cbID");
					String cbNickname = rs.getString("cbNickname");
					String cbTitle = rs.getString("cbTitle");
					String cbContent = rs.getString("cbContent");
					Timestamp cbWriteDate = rs.getTimestamp("cbWriteDate");
					int cbView = rs.getInt("cbView");
					String cbCategory = rs.getString("cbCategory");
					list.add(new BoardDTO(cbSeq, cbID, cbCategory, cbNickname, cbTitle, cbContent, cbWriteDate, cbView));
				}
			}
			return list;
		}
	}
}
