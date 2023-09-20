package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.file")
public class FileController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println("file cmd: "+cmd);
		
		try {
			if(cmd.equals("/insert.file")) {
				// 파일 업로드
				// QnAController 의 insert.qna에 글 넣으면서 같이 넣음!
			} else if(cmd.equals("/download.file")) {
				// 파일 다운로드
				
			} else if(cmd.equals("/delete.file")) {
				// 파일 삭제
				
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
