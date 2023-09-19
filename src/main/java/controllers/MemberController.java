package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.member")
public class MemberController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html;charset=utf8");
		
		String cmd = request.getRequestURI();
		System.out.println("member cmd: "+cmd);
		
		try {
			if(cmd.equals("/insert.member")) {
				// 회원 가입 (회원 정보 등록)
				
			} else if(cmd.equals("/load.member")) {
				// 마이페이지 (회원 정보 출력)
				
			} else if(cmd.equals("/update.member")) {
				// 회원 정보 수정
				
			} else if(cmd.equals("/delete.member")) {
				// 회원 탈퇴 (회원 정보 삭제)
				
			} else if(cmd.equals("/login.member")) {
				// 회원 로그인
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.html");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
