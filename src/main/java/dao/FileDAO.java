package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.FileDTO;

public class FileDAO {
	private FileDAO() {}
	private static FileDAO instance;
	public static FileDAO getInstance() {
		if (instance == null)
			instance = new FileDAO();
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	// insert, selectBy~, selectAll, update, delete 로 함수명 통일 (최대한 sql 구문을 활용한 작명)

	public int insert(FileDTO dto) throws Exception{
		String sql = "insert into file values(0,?,?,?,?,?);";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);){
			pstat.setInt(1, dto.getParentSeq());
			pstat.setString(2, dto.getOriginName());
			pstat.setString(3, dto.getSystemName());
			pstat.setBoolean(4, dto.isImg());
			pstat.setBoolean(5, dto.isQna());
			pstat.executeUpdate();
			
			try(ResultSet rs = pstat.getGeneratedKeys()){
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	
	public List<FileDTO> selectForPost(int postSeq) throws Exception{
		//post.jsp load 시 사용됨
		String sql ="select * from file where cbSeq = ? and img = false;";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, postSeq);
			try (ResultSet rs = pstat.executeQuery();) {
				
				List<FileDTO> list = new ArrayList<>();
				while(rs.next()) {
					list.add(new FileDTO(rs.getInt("fSeq"), rs.getInt("cbSeq"), rs.getString("fOriginName"), rs.getString("fSystemName"), rs.getBoolean("img"), rs.getBoolean("qna")));
				}
				return list;
			}
		}
	}
	
	public int updateParentSeq(int parent, int seq) throws Exception{
		String sql = "update file set cbSeq = ? where fSeq = ?";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, parent);
			pstat.setInt(2, seq);
			return pstat.executeUpdate();
		}
	}
	
	public String selectSysName(int seq) throws Exception{
		String sql = "select fSystemName from file where fSeq=?;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery();){
				if(rs.next()) {
					return rs.getString("fSystemName");
				}else {
					return null;
				}
			}
		}
	}
	
	public int deleteFile(int seq) throws Exception{
		String sql = "delete from file where fSeq=?;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			return pstat.executeUpdate();
		}
	}
	
	public int deleteFile(String sysname) throws Exception{
		String sql = "delete from file where fSystemName=?;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, sysname);
			return pstat.executeUpdate();
		}
	}
	
	public List<String> inPostFilesNameList(int parentSeq) throws Exception{
		String sql = "select fSystemName from file where cbSeq = ? and qna = false and img=false;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, parentSeq);
			try(ResultSet rs = pstat.executeQuery();){
				List<String> filesName = new ArrayList<>();
				while(rs.next()) {
					filesName.add(rs.getString(1));
				}
				return filesName;
			}
		}
	}
	
	public List<FileDTO> inPostFilesList(int parentSeq) throws Exception{
		String sql = "select * from file where cbSeq = ? and qna = false and img=false;";
		try(Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, parentSeq);
			try(ResultSet rs = pstat.executeQuery();){
				List<FileDTO> files = new ArrayList<>();
				while(rs.next()) {
					files.add(new FileDTO(rs.getInt("fSeq"), rs.getInt("cbSeq"), rs.getString("fOriginName"), rs.getString("fSystemName"), rs.getBoolean("img"), rs.getBoolean("qna")));
				}
				return files;
			}
		}
	}

}
