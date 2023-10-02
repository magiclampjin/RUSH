package controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class test {
	public static void main(String[] args) {

		String sql = "insert into common_board value(null, ?, ?, ?, ?, default, default,?,default);";

		try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost/support", "support", "support");
				PreparedStatement pstat = con.prepareStatement(sql);) {
			for (int i = 110; i < 140; i++) {
				pstat.setString(1, "admin");
				pstat.setString(2, "관리자");
				pstat.setString(3, "title" + i);
				pstat.setString(4, "contents" + i);
				pstat.setString(5, "notice");
				pstat.addBatch(); // executeUpdate()를 해도 괜찮지만,
				// 한번에 하나씩 insert 쿼리 날리는 것보다,
				// addBatch();로 일괄처리하는 것이 성능면에서 더 좋음.
			}
			pstat.executeBatch();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		

//		String sql = "insert into reply value(null, ?, ?, ?, ?, default, default);";
//
//		try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost/rush", "rush", "rush");
//				PreparedStatement pstat = con.prepareStatement(sql);) {
//			for (int i = 5; i < 10; i++) {
//				pstat.setInt(1, 166);
//				pstat.setString(2, "user");
//				pstat.setString(3, "nick");
//				pstat.setString(4, "contents" + i);
//				pstat.addBatch(); // executeUpdate()를 해도 괜찮지만,
//				// 한번에 하나씩 insert 쿼리 날리는 것보다,
//				// addBatch();로 일괄처리하는 것이 성능면에서 더 좋음.
//			}
//			pstat.executeBatch();
//		} catch (SQLException e) {
//
//			e.printStackTrace();
//		}
		
	}
}
