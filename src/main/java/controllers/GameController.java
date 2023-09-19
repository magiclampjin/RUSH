package controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.game")
public class GameController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println("game cmd: "+cmd);
		
		try {
			if(cmd.equals("/moveToGamePage.game")) {
				request.getRequestDispatcher("/game/GamePage_Play.jsp").forward(request, response);
			}else if(cmd.equals("/moveToCategory.game")) {
				String category = request.getParameter("category");
				request.setAttribute("category", category);
				request.getRequestDispatcher("/game/GamePage_Category.jsp").forward(request, response);
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
