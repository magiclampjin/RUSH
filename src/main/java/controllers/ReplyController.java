package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.reply")
public class ReplyController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println("reply cmd: "+cmd);
		
		try {
			if(cmd.equals("/insert.reply")) {
				// 댓글
				
			} else if(cmd.equals("/load.reply")) {
				int postSeq = Integer.parseInt(request.getParameter("postSeq"));
				
				
			} else if(cmd.equals("/update.reply")) {
				// 댓글 수정
				
			} else if(cmd.equals("/delete.board")) {
				// 댓글 삭제
				
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
