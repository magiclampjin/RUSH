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
	// 공지 게시글 불러오기
	public List<BoardDTO> selectByNoti() throws Exception{
		String sql ="select * from board_reply_count where cbCategory = \"notice\" order by cbSeq desc;";
		List<BoardDTO> list = new ArrayList<>();
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
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
				list.add(new BoardDTO(cbSeq, cbID, cbCategory, cbNickname, cbTitle, cbContent, cbWriteDate, cbView, cbRecommend, replyCount));
			}
			return list;
		}
	}
	
	// 카테고리에 해당하는 모든 게시물 불러오기
	public List<BoardDTO> selectByCategory(String category, int start, int count) throws Exception{
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
					list.add(new BoardDTO(cbSeq, cbID, cbCategory, cbNickname, cbTitle, cbContent, cbWriteDate, cbView, cbRecommend, replyCount));
				}
				return list;
			}
		}
	}
	
	public int getRecordCount() throws Exception{
		String sql = "select count(*) as count from common_board";
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();) {

			if (rs.next()) {
				return rs.getInt("count");
			} else {
				return 0;
			}
		}
	}
	
	
}
