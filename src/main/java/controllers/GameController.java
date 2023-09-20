package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GameDAO;

@WebServlet("*.game")
public class GameController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GameDAO dao = GameDAO.getInstance();
		String cmd = request.getRequestURI();
		System.out.println("game cmd: "+cmd);
		
		try {
			if(cmd.equals("/moveToGamePage.game")) {
				String gameName = request.getParameter("game");
				String gameCategory = dao.selectByGameName(gameName);
				String mID = "rubiver";  //추후 mID 넘기는거로 변경해야함.
				System.out.println(gameName);
				System.out.println(gameCategory);
				request.setAttribute("game",gameName);
				request.setAttribute("category",gameCategory);
				request.getRequestDispatcher("/game/GamePage_"+gameCategory+".jsp").forward(request, response);
				
			}else if(cmd.equals("/moveToCategory.game")) {
				String category = request.getParameter("category");
				request.setAttribute("category", category);
				request.getRequestDispatcher("/game/GamePage_Category.jsp").forward(request, response);
			}else if(cmd.equals("/favorite.game")) {
				String mID = request.getParameter("mID"); //넘어오는 파라미터 이름은 추후 수정 가능.
				String gameName = request.getParameter("gameName");
				//GameFavoriteDAO, GameFavoriteDTO 작성 해야함.
				//ajax로 할듯?
				int result = dao.insertFavorite(gameName, mID);
				PrintWriter out = response.getWriter();
				if(result>0) {
					System.out.println("즐겨찾기 성공");
					out.println("o");
				}else {
					System.out.println("즐겨찾기 실패");
					out.println("x");
				}
			}else if(cmd.equals("/moveToBestGame.game")) {
				request.getRequestDispatcher("/GamePage_BestGame?").forward(request, response);
			}else if(cmd.equals("/checkFavorite.game")) {
				String gameName = request.getParameter("game");
				String mID = request.getParameter("mID");
				int isFavorite = dao.selectFavorite(gameName, mID);
				PrintWriter out = response.getWriter();
				out.println(isFavorite);
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
