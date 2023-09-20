package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GameDAO;

@WebServlet("*.game")
public class GameController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		GameDAO dao = new GameDAO();
		String cmd = request.getRequestURI();
		System.out.println("game cmd: "+cmd);
		
		try {
			if(cmd.equals("/moveToGamePage.game")) {
				request.getRequestDispatcher("/game/GamePage_Play.jsp").forward(request, response);
				
			}else if(cmd.equals("/moveToCategory.game")) {
				String category = request.getParameter("category");
				request.setAttribute("category", category);
				request.getRequestDispatcher("/game/GamePage_Category.jsp").forward(request, response);
			}else if(cmd.equals("/favorite.game")) {
				String mID = request.getParameter("user"); //넘어오는 파라미터 이름은 추후 수정 가능.
				String gameName = request.getParameter("gName");
				//GameFavoriteDAO, GameFavoriteDTO 작성 해야함.
				//ajax로 할듯?
				int result = dao.insertFavorite(gameName, mID);
			}else if(cmd.equals("/moveToBestGame.game")) {
				request.getRequestDispatcher("/GamePage_BestGame?").forward(request, response);
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
