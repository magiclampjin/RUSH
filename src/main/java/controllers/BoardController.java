package controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import dto.BoardDTO;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println("board cmd: "+cmd);
		
		BoardDAO dao = BoardDAO.getInstance();
		
		try {
			if(cmd.equals("/insert.board")) {
				// 게시글 등록
				
			} else if(cmd.equals("/load.board")) {
				// cpage 가져와야하고,
				// 게시글 번호를 가져와야함.
				// 그리고 게시판 위치 (자유게시판인지 qna인지) -> 이거는 여기서 보내주는 것
				
//				int cpage = Integer.parseInt(request.getParameter("cpage"));
//				int postSeq = Integer.parseInt(request.getParameter("postSeq"));
				
				int cpage = 1;
				int postSeq = 18;
				BoardDTO post = dao.selectPost(postSeq);
				request.setAttribute("post", post);
//				request.getRequestDispatcher("/board/post.jsp").forward(request, response);
				
				
			} else if(cmd.equals("/update.board")) {
				// 게시글 수정
				
			} else if(cmd.equals("/delete.board")) {
				// 게시글 삭제
				
			} else if(cmd.equals("/listing.board")) {
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
