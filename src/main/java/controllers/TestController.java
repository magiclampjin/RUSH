package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.GameDAO;
import dao.MemberDAO;
import dto.BoardDTO;
import dto.MemberDTO;
import dto.ReplyDTO;

@WebServlet("*.test")
public class TestController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 한글깨짐방지
		response.setContentType("text/html;charset=utf8"); // 한글깨짐방지
		GameDAO dao = GameDAO.getInstance();
		MemberDAO mdao = MemberDAO.getInstance();
		Gson gson = new Gson();
		String cmd = request.getRequestURI();
		System.out.println("game cmd: "+cmd);
		PrintWriter pw = response.getWriter();
		
		
		try {
			if(cmd.equals("/test.test")) {
				List<ReplyDTO> data = dao.selectAll();
				
				pw.print(gson.toJson(data));
			}else if(cmd.equals("/test2.test")) {
				String id = request.getParameter("id");
				MemberDTO data = mdao.selectUserInfo(id);
				
				pw.print(gson.toJson(data));
			}else if(cmd.equals("/getAdBoard.test")) {
				List<BoardDTO> data = dao.selectAdBoard();
				
				pw.println(gson.toJson(data));
			}else if(cmd.equals("/setBlacklist.test")) {
				//MemberDAO에 블랙리스트 추가 구현
				String mID = request.getParameter("writer");
				//int result = mdao.insertBlacklist(mID, ?, ?, ?);
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
