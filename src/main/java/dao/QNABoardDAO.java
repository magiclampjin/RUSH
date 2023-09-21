package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.QNABoardDTO;

public class QNABoardDAO {
	private QNABoardDAO() {}
	private static QNABoardDAO instance;
	public static QNABoardDAO getInstance() {
		if (instance == null)
			instance = new QNABoardDAO();
		return instance;
	}

	public Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/mysql");
		return ds.getConnection();
	}
	
	// insert, selectBy~, selectAll, update, delete 로 함수명 통일 (최대한 sql 구문을 활용한 작명)
	// DB에 삽입
	public int insert(QNABoardDTO dto) throws Exception{
		String sql = "insert into qna_board values(0,?,?,?,?,default,?,?);";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);){
			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getNickName());
			pstat.setString(3, dto.getTitle());
			pstat.setString(4, dto.getContents());
			pstat.setString(5, dto.getCategory());
			pstat.setBoolean(6, dto.isSecret());
			pstat.executeUpdate();
			
			try(ResultSet rs = pstat.getGeneratedKeys()){
				rs.next();
				return rs.getInt(1);
			}
		}
	}
	// 전체 리스트 불러옴
	public List<QNABoardDTO> selectAll(QNABoardDTO dto) throws Exception{
		String sql = "select * from qna_board;";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			
			List<QNABoardDTO> list = new ArrayList<>();
			
			ResultSet rs = pstat.executeQuery();
			while(rs.next()) {
				list.add(new QNABoardDTO(rs.getInt("qbSeq"),rs.getString("mID"),
						rs.getString("mNickname"),rs.getString("qbTitle"),
						rs.getString("qbContents"),rs.getTimestamp("qbWriteDate"),
						rs.getString("qbCategory"),rs.getBoolean("secret")));
			}
			return list;
		}
		
	}
	
	// 찾을 키워드 없을
	public List<QNABoardDTO> selectBy(int start, int end) throws Exception{
		String sql = "select * "
				+ "from (select row_number() over(order by qbseq desc) rn, qna_board.* from qna_board) temp "
				+ "where rn between ? and ?;";
		
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, start);
			pstat.setInt(2, end);
			try(ResultSet rs  = pstat.executeQuery()){
				List<QNABoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					list.add(new QNABoardDTO(rs.getInt("qbSeq"),rs.getString("mID"),
							rs.getString("mNickname"),rs.getString("qbTitle"),
							rs.getString("qbContents"),rs.getTimestamp("qbWriteDate"),
							rs.getString("qbCategory"),rs.getBoolean("secret")));
				}
				return list;
			}
		}
		
	}
	
	// 찾을 키워드 있을 때
	public List<QNABoardDTO> selectBy(int start, int end,String searchBy ,String keyword) throws Exception{
		String sql = "select * "
				+ "from (select row_number() over(order by qbseq desc) rn, qna_board.* "
				+ 		"from qna_board "
				+ 		"where "+ searchBy +" like ?) temp "
				+ "where rn between ? and ?;";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "%"+keyword+"%");
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			
			try(ResultSet rs = pstat.executeQuery();){
				List<QNABoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					list.add(new QNABoardDTO(rs.getInt("qbseq"),rs.getString("mID"),
							rs.getString("mNickname"),rs.getString("qbTitle"),
							rs.getString("qbContents"),rs.getTimestamp("qbWriteDate"),
							rs.getString("qbCategory"),rs.getBoolean("secret")));
				}
				return list;
			}
		}
	}
	// 키워드 있을 때 레코드 개수
	public int getRecordCountKeyword(String searchBy ,String keyword) throws Exception{
		String sql = "select count(*) "
				+ "from (select row_number() over(order by qbseq desc) rn, qna_board.* "
				+ 		"from qna_board "
				+ 		"where "+ searchBy +" like ?) temp;";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
				
				pstat.setString(1, "%"+keyword+"%");
				ResultSet rs = pstat.executeQuery();
				rs.next(); // 화살표가 데이터 라인을 가리킴

				return rs.getInt(1);
			}
	}
	
	// 키워드 없을 때 레코드 개수		
	public int getRecordCount() throws Exception{
		String sql = "select count(*) from qna_board;";
		try(Connection con = this.getConnection();
			PreparedStatement pstat = con.prepareStatement(sql);){
			
			ResultSet rs = pstat.executeQuery();
			rs.next(); // 화살표가 데이터 라인을 가리킴
			
			return rs.getInt(1);
		}
	}
	
	public QNABoardDTO selectPost(int qnaSeq) throws Exception{
		String sql = "select * from qna_board where qbSeq=?;";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
				
				pstat.setInt(1, qnaSeq);
				try(ResultSet rs = pstat.executeQuery();){
					rs.next();
					return new QNABoardDTO(rs.getInt("qbseq"),rs.getString("mID"),
							rs.getString("mNickname"),rs.getString("qbTitle"),
							rs.getString("qbContents"),rs.getTimestamp("qbWriteDate"),
							rs.getString("qbCategory"),rs.getBoolean("secret"));
				}
			}
	}
	
}
