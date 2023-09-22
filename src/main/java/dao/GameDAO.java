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

import dto.GameDTO;
import dto.GameRecordDTO;

public class GameDAO {
	private GameDAO() {}
	private static GameDAO instance;
	public static GameDAO getInstance() {
		if (instance == null)
			instance = new GameDAO();
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	public int insertFavorite(String name, String id) throws Exception {
		String sql = "insert into game_favorite values(0,?,?);";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, name);
			pstat.setString(2, id);
			return pstat.executeUpdate();
		}
	}
	public int deleteFavorite(String name, String id) throws Exception {
		String sql = "delete from game_favorite where gName = ? and mID = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, name);
			pstat.setString(2, id);
			return pstat.executeUpdate();
		}
	}
	public String selectByGameName(String gName) throws Exception{
		String sql = "select * from game where gName = ?";
		String result = "";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, gName);
			ResultSet rs = pstat.executeQuery();
			rs.next();
			return rs.getString("gCategory");	
		}
	}
	
	public List<GameDTO> selectBestGame()throws Exception{
		String sql = "select row_number() over (order by gr.gName desc) as seq, gr.gName, count(*) as count, g.gDeveloper, g.gImageURL from game_record gr,game g where g.gName = gr.gName group by gr.gName order by count desc;";
		List<GameDTO> list = new ArrayList<>();
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			while(rs.next()) {
				GameDTO dto = new GameDTO();
				String gName = rs.getString("gName");
				String dev = rs.getString("gDeveloper");
				String image = rs.getString("gImageURL");
				dto.setgName(gName);
				dto.setgDeveloper(dev);
				dto.setgImageURL(image);
				list.add(dto);
			}
			return list;
		}
	}
	public List<GameDTO> selectGames() throws Exception {
		String sql = "select * from game";
		List<GameDTO> list = new ArrayList<>();
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();
				){
			while(rs.next()) {
				GameDTO dto = new GameDTO();
				String gName = rs.getString("gName");
				String dev = rs.getString("gDeveloper");
				String image = rs.getString("gImageURL");
				String category = rs.getString("gCategory");
				dto.setgName(gName);
				dto.setgDeveloper(dev);
				dto.setgImageURL(image);
				dto.setgCategory(category);
				list.add(dto);
			}
		}
		return list;
	}
	
	public List<GameDTO> selectCategoryGame(String category)throws Exception{
		String sql = "select * from game where gCategory = ?";
		List<GameDTO> list = new ArrayList<>();
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				
				){
			pstat.setString(1, category);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				while(rs.next()) {
					GameDTO dto = new GameDTO();
					String gName = rs.getString("gName");
					String dev = rs.getString("gDeveloper");
					String image = rs.getString("gImageURL");
					dto.setgName(gName);
					dto.setgDeveloper(dev);
					dto.setgImageURL(image);
					list.add(dto);
				}
				return list;
			}
		}
	}
	
	public int selectFavorite(String gName, String mID) throws Exception {
		String sql = "select count(*) as count from game_favorite where gName = ? and mID = ?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, gName);
			pstat.setString(2, mID);
			ResultSet rs = pstat.executeQuery();
			rs.next();
			int count = rs.getInt("count");
			return count;
		}
	}
	
	public List<GameRecordDTO> selectGameRecord(String gName) throws Exception{
		String sql = "select gr.*, ul.mLevel as level from game_record gr, userlevel ul where gName = ? and gr.mID = ul.mID order by grScore desc;";
		List<GameRecordDTO> list = new ArrayList<>();
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, gName);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				while(rs.next()) {
					GameRecordDTO dto = new GameRecordDTO();
					int seq = rs.getInt("grSeq");
					String mID = rs.getString("mID");
					String gameName = rs.getString("gName");
					String mNickname = rs.getString("mNickname");
					Timestamp grStartGameTiem = rs.getTimestamp("grStartGameTime");
					int grScore = rs.getInt("grScore");
					int level = rs.getInt("level");
					dto.setSeq(seq);
					dto.setId(mID);
					dto.setGameName(gameName);
					dto.setNickName(mNickname);
					dto.setStartGameTime(grStartGameTiem);
					dto.setScore(grScore);
					dto.setLevel(level);
					list.add(dto);
				}
			}
		}
		return list;
	}
	
	public int insertGameRecord(GameRecordDTO dto) throws Exception {
		String sql = "insert into game_record values(0,?,?,?,now(),?);";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getId());
			pstat.setString(2, dto.getGameName());
			pstat.setString(3, dto.getNickName());
			pstat.setInt(4, dto.getScore());
			return pstat.executeUpdate();
		}
	}
	
	// insert, selectBy~, selectAll, update, delete 로 함수명 통일 (최대한 sql 구문을 활용한 작명)
}
