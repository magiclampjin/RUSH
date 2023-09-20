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

import dto.BoardDTO;

public class BoardDAO {
	private BoardDAO() {
	}

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

	public void upViewCount(int postSeq) throws Exception {
		String sql = "update common_board set cbview = cbview+1 where cbseq=?;";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, postSeq);
			pstat.executeUpdate();
		}
	}
	
	public boolean checkPostRecommend(int postSeq, String loginId) throws Exception{
		String sql = "select * from postRecommend where cbSeq = ? and mId = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, postSeq);
			pstat.setString(2, loginId);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}
	
	public int insertPostRecommend(int postSeq, String loginId) throws Exception{
		String sql = "insert into postRecommend values(null, ?, ?);";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, postSeq);
			pstat.setString(2, loginId);
			return pstat.executeUpdate();
		}
	}
	
	public int deletePostRecommend(int postSeq, String loginId) throws Exception{
		String sql = "delete from postRecommend where cbSeq =? and mId = ?;";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, postSeq);
			pstat.setString(2, loginId);
			return pstat.executeUpdate();
		}
	}
	
	
	
	public boolean checkPostBookmark(int postSeq, String loginId) throws Exception{
		String sql = "select * from bookmark where cbSeq = ? and mId = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, postSeq);
			pstat.setString(2, loginId);
			try (ResultSet rs = pstat.executeQuery();) {
				return rs.next();
			}
		}
	}
	

	public int insertPostBookmark(int postSeq, String loginId) throws Exception{
		String sql = "insert into bookmark values(null, ?, ?);";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, postSeq);
			pstat.setString(2, loginId);
			return pstat.executeUpdate();
		}
	}
	
	public int deletePostBookmark(int postSeq, String loginId) throws Exception{
		String sql = "delete from bookmark where cbSeq =? and mId = ?;";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, postSeq);
			pstat.setString(2, loginId);
			return pstat.executeUpdate();
		}
	}
	
	
	public BoardDTO selectPost(int postSeq) throws Exception { // post.jsp에서 게시글 출력할 떄 사용
		this.upViewCount(postSeq);
		
		String sql = "select * from common_board where cbSeq = ?;";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, postSeq);
			try (ResultSet rs = pstat.executeQuery();) {
				rs.next();
				return new BoardDTO(rs.getInt("cbSeq"), rs.getString("cbID"), rs.getString("cbCategory"),
						rs.getString("cbNickname"), rs.getString("cbTitle"), rs.getString("cbContent"),
						rs.getTimestamp("cbWriteDate"), rs.getInt("cbView"), rs.getInt("cbRecommend"));
			}
		}
	}

	// 공지 게시글 불러오기
	public List<BoardDTO> selectByNoti() throws Exception {
		String sql = "select * from board_reply_count where cbCategory = \"notice\" order by cbSeq desc;";
		List<BoardDTO> list = new ArrayList<>();
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {
			while (rs.next()) {
				int cbSeq = rs.getInt("cbSeq");
				String cbID = rs.getString("cbID");
				String cbNickname = rs.getString("cbNickname");
				String cbTitle = rs.getString("cbTitle");
				String cbContent = rs.getString("cbContent");
				Timestamp cbWriteDate = rs.getTimestamp("cbWriteDate");
				int cbView = rs.getInt("cbView");
				String cbCategory = rs.getString("cbCategory");
				int cbRecommend = rs.getInt("cbRecommend");
				int replyCount = rs.getInt("replyCount");
				list.add(new BoardDTO(cbSeq, cbID, cbCategory, cbNickname, cbTitle, cbContent, cbWriteDate, cbView,
						cbRecommend, replyCount));
			}
			return list;
		}
	}

	// 카테고리에 해당하는 모든 게시물 불러오기
	public List<BoardDTO> selectByCategory(String category, int start, int count) throws Exception {
		String sql = "select *  from board_reply_count where cbCategory = ? order by cbSeq desc limit ?, ?;";
		List<BoardDTO> list = new ArrayList<>();
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, category);
			pstat.setInt(2, start);
			pstat.setInt(3, count);
			try (ResultSet rs = pstat.executeQuery()) {
				while (rs.next()) {
					int cbSeq = rs.getInt("cbSeq");
					String cbID = rs.getString("cbID");
					String cbNickname = rs.getString("cbNickname");
					String cbTitle = rs.getString("cbTitle");
					String cbContent = rs.getString("cbContent");
					Timestamp cbWriteDate = rs.getTimestamp("cbWriteDate");
					int cbView = rs.getInt("cbView");
					String cbCategory = rs.getString("cbCategory");
					int cbRecommend = rs.getInt("cbRecommend");
					int replyCount = rs.getInt("replyCount");
					list.add(new BoardDTO(cbSeq, cbID, cbCategory, cbNickname, cbTitle, cbContent, cbWriteDate, cbView,
							cbRecommend, replyCount));
				}
				return list;
			}
		}
	}

	public int getRecordCount(String category) throws Exception {
		String sql = "select count(*) as count from board_reply_count where cbCategory= ?";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, category);
			try(ResultSet rs = pstat.executeQuery()){
				if (rs.next()) {
					return rs.getInt("count");
				} else {
					return 0;
				}
			}
		}
	}
	
	public int insert(BoardDTO dto) throws Exception{
		String sql ="insert into common_board values (default, ?, ?, ?, ?, default, default, ?, default);";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);){
			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getNickName());
			pstat.setString(3, dto.getTitle());
			pstat.setString(4, dto.getContents());
			pstat.setString(5, dto.getCategory());
			pstat.executeUpdate();
			
			try(ResultSet rs = pstat.getGeneratedKeys()){
				rs.next();
				return rs.getInt(1);
			}
			
		}
	}
	
	public String selectNickName(String id) throws Exception{
		String sql = "select mNickname from members where mID=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, id);
			try(ResultSet rs = pstat.executeQuery()){
				if (rs.next()) {
					return rs.getString("mNickname");
				} else {
					return null;
				}
			}
		}
	}
	
	public void deletePost(int postSeq) throws Exception{
		String sql = "delete from common_board where cbSeq = ?;";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, postSeq);
			pstat.executeUpdate();
		}
	}
}
