package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
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
	
	public List<ReplyDTO> selectAll(int postSeq) throws Exception{
		String sql = "select * from replyRecommCnt where cbSeq = ? and parentRSeq is null;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, postSeq);
			try(ResultSet rs = pstat.executeQuery();){
				List<ReplyDTO> replys = new ArrayList<>();
				while(rs.next()) {
					replys.add(new ReplyDTO(rs.getInt("rSeq"), rs.getInt("cbSeq"), rs.getString("mID"), rs.getString("mNickname"), rs.getString("rContents"), rs.getTimestamp("rWriteDate"), rs.getInt("parentRSeq"),  rs.getInt("recCnt")));
				}
				return replys;
			}
		}
	}
	
	public List<ReplyDTO> selectByPage(int postSeq, int start, int end) throws Exception{
		String sql = "select * from replyRecommCnt where cbSeq = ? and parentRSeq is null limit ?,?;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, postSeq);
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			try(ResultSet rs = pstat.executeQuery();){
				List<ReplyDTO> replys = new ArrayList<>();
				while(rs.next()) {
					replys.add(new ReplyDTO(rs.getInt("rSeq"), rs.getInt("cbSeq"), rs.getString("mID"), rs.getString("mNickname"), rs.getString("rContents"), rs.getTimestamp("rWriteDate"), rs.getInt("parentRSeq"),  rs.getInt("recCnt")));
				}
				return replys;
			}
		}
	}
	
	public int getRecordCount(int postSeq) throws Exception{
		String sql = "select count(*) from replyRecommCnt where cbSeq = ? and parentRSeq is null;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, postSeq);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()){
					return rs.getInt(1);
				}else {
					return 0;
				}
				
			}
		}
	}
	
	public List<ReplyDTO> selectNestedReplys(int replySeq, String loginId) throws Exception{
//		String sql = "select * from replyrecList where parentRSeq = ? and (isnull(recid) or recid = ?);";
		String sql = "select * from replyRecommCnt where parentRSeq = ?;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, replySeq);
			try(ResultSet rs = pstat.executeQuery();){
				List<ReplyDTO> replys = new ArrayList<>();
				while(rs.next()) {
					replys.add(new ReplyDTO(rs.getInt("rSeq"), rs.getInt("cbSeq"), rs.getString("mID"), rs.getString("mNickname"), rs.getString("rContents"), rs.getTimestamp("rWriteDate"), rs.getInt("parentRSeq"),  rs.getInt("recCnt")));
				}
				return replys;
			}
		}
	}
	
	// post 내 댓글들의 좋아요 목록 가져오기
	public List<ReplyDTO> selectReplyRecommCnt(int postSeq, String loginId) throws Exception {
		String sql = "select * from replyreclist where cbSeq = ? and mid = ? order by rseq;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, postSeq);
			pstat.setString(2, loginId);
			try(ResultSet rs = pstat.executeQuery();){
				List<ReplyDTO> replysRecList = new ArrayList<>();
				while(rs.next()) {
					replysRecList.add(new ReplyDTO(rs.getInt("rSeq"), rs.getInt("cbSeq"), rs.getString("mID")));
				}
				return replysRecList;
			}
		}
	}
	
	public void insert(ReplyDTO reply) throws Exception{
		String sql = "insert into reply values(null, ?, ?, ?, ?, default, null);";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1,reply.getParentSeq());
			pstat.setString(2, reply.getWriter());
			pstat.setString(3, reply.getNickName());
			pstat.setString(4, reply.getContents());
			pstat.executeUpdate();
		}
	}
	
	public void delete(int replySeq) throws Exception{
		String sql = "delete from reply where rSeq =?;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, replySeq);
			pstat.executeUpdate();
		}
	}
	
	public void update(int replySeq, String replyCcontents) throws Exception{
		String sql = "update reply set rContents = ? where rSeq =?;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, replyCcontents);
			pstat.setInt(2, replySeq);
			pstat.executeUpdate();
		}
	}
	
	public int  insertRecommend(int replySeq, String loginId) throws Exception{
		String sql = "insert into replyRecommend values(null, ?, ?);";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, replySeq);
			pstat.setString(2, loginId);
			return pstat.executeUpdate();
		}
	}
	
	public int deletetRecommend(int replySeq, String loginId) throws Exception{
		String sql = "delete from replyRecommend where rseq = ? and mid = ?;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, replySeq);
			pstat.setString(2, loginId);
			return pstat.executeUpdate();
		}
	}
	
	public int countRecommend(int replySeq) throws Exception{
		String sql = "select recCnt from replyRecommCnt where rSeq =?;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, replySeq);
			try(ResultSet rs = pstat.executeQuery();){
				List<ReplyDTO> replys = new ArrayList<>();
				if(rs.next()) {
					return rs.getInt(1);
				}else {
					return -1;
				}
			
			}
		}
	}
	
	public int nestedInsert(ReplyDTO reply) throws Exception{
		String sql = "insert into reply values(null, ?, ?, ?, ?, default, ?);";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1,reply.getParentSeq());
			pstat.setString(2, reply.getWriter());
			pstat.setString(3, reply.getNickName());
			pstat.setString(4, reply.getContents());
			pstat.setInt(5, reply.getParentRSeq());
			return pstat.executeUpdate();
		}
	}
}
