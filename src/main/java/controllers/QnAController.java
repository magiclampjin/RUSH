package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
@WebServlet("*.qna")
public class QnAController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println("qna cmd: "+cmd);
		
		try {
			if(cmd.equals("/insert.qna")) {
				// 게시글 등록
				
			} else if(cmd.equals("/load.qna")) {
				// 게시글 출력
				
			} else if(cmd.equals("/update.qna")) {
				// 게시글 수정
				
			} else if(cmd.equals("/delete.qna")) {
				// 게시글 삭제
				
			} else if(cmd.equals("/listing.qna")) {
				// 게시판 출력 
				
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
