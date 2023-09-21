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
		String sql = "insert into file values(0,?,?,?);";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, dto.getParentSeq());
			pstat.setString(2, dto.getOriginName());
			pstat.setString(3, dto.getSystemName());
			return pstat.executeUpdate();
		}
	}
	
	public List<FileDTO> selectForPost(int postSeq) throws Exception{
		//post.jsp load 시 사용됨
		String sql ="select * from file where cbSeq = ?;";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, postSeq);
			try (ResultSet rs = pstat.executeQuery();) {
				
				List<FileDTO> list = new ArrayList<>();
				while(rs.next()) {
					list.add(new FileDTO(rs.getInt("fSeq"), rs.getInt("cbSeq"), rs.getString("fOriginName"), rs.getString("fSystemName")));
				}
				return list;
			}
		}
	}

}
