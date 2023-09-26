package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.GameDAO;
import dao.MemberDAO;
import dto.GameDTO;
import dto.GameRecordDTO;
import dto.MemberDTO;
import dto.ReplyDTO;
import dao.KordleWordDAO;
import dto.KordleWordDTO;

@WebServlet("*.game")
public class GameController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 한글깨짐방지
		response.setContentType("text/html;charset=utf8"); // 한글깨짐방지
		GameDAO dao = GameDAO.getInstance();
		MemberDAO mdao = MemberDAO.getInstance();
		Gson gson = new Gson();
		String cmd = request.getRequestURI();
		System.out.println("game cmd: "+cmd);
		PrintWriter pw = response.getWriter();
		
		KordleWordDAO kwdao = KordleWordDAO.getInstance();
		
		try {
			if(cmd.equals("/moveToGamePage.game")) {
				String gameName = request.getParameter("game");
				String gameCategory = dao.selectByGameName(gameName);
				System.out.println(gameName);
				System.out.println(gameCategory);
				request.setAttribute("game",gameName);
				request.setAttribute("category",gameCategory);
				if(gameName.equals("Kordle")) {
					request.getRequestDispatcher("/game/GamePage_"+gameName+".jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("/game/GamePage_"+gameCategory+".jsp").forward(request, response);
				}
				
				
			}else if(cmd.equals("/moveToCategory.game")) {
				String category = request.getParameter("category");
				request.setAttribute("category", category);
				request.getRequestDispatcher("/game/GamePage_Category.jsp").forward(request, response);
			}else if(cmd.equals("/favorite.game")) {
				String mID = request.getParameter("mID"); //넘어오는 파라미터 이름은 추후 수정 가능.
				String gameName = request.getParameter("gameName");
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
				request.getRequestDispatcher("/game/GamePage_BestGame.jsp").forward(request, response);
			}else if(cmd.equals("/checkFavorite.game")) {
				String gameName = request.getParameter("game");
				String mID = request.getParameter("mID");
				int isFavorite = dao.selectFavorite(gameName, mID);
				pw.println(isFavorite);
			}else if(cmd.equals("/deletefavorite.game")) {
				String mID = request.getParameter("mID"); //넘어오는 파라미터 이름은 추후 수정 가능.
				String gameName = request.getParameter("gameName");
				int result = dao.deleteFavorite(gameName, mID);
				if(result>0) {
					System.out.println("즐겨찾기제거 성공");
					pw.println("o");
				}else {
					System.out.println("즐겨찾기제거 실패");
					pw.println("x");
				}
			}else if(cmd.equals("/getRecord.game")) {
				List<GameRecordDTO> list = new ArrayList<>();
				String gameName = request.getParameter("gameName");
				System.out.println("old : "+gameName);
				list = dao.selectGameRecord(gameName);
				// 기록이 없을 때에 대한 처리 필요
				pw.println(gson.toJson(list));
			}else if(cmd.equals("/getBestGame.game")) {
				List<GameDTO> list = dao.selectBestGame();
				pw.print(gson.toJson(list));
			}else if(cmd.equals("/getCategoryGame.game")) {
				String category = request.getParameter("category");
				List<GameDTO> list = dao.selectCategoryGame(category);
				pw.println(gson.toJson(list));
			}else if(cmd.equals("/getGameList.game")) {
				List<GameDTO> list = dao.selectGames();
				pw.print(gson.toJson(list));
			}else if(cmd.equals("/setGameRecord.game")) {
				String mID = request.getParameter("mID");
				String gName = request.getParameter("game");
				String mNickname = request.getParameter("nickName");
				int score = Integer.parseInt(request.getParameter("score"));
				
				int result = dao.insertGameRecord(new GameRecordDTO(0,mID,gName,mNickname,null,score,0));
				System.out.println("record result : "+result);
			}else if(cmd.equals("/test.game")) {
				List<ReplyDTO> data = dao.selectAll();
				PrintWriter out = response.getWriter();
				out.print(gson.toJson(data));
			}else if(cmd.equals("/test2.game")) {
				String id = request.getParameter("id");
				MemberDTO data = mdao.selectUserInfo(id);
				PrintWriter out = response.getWriter();
				out.print(gson.toJson(data));
			}else if(cmd.equals("/kordleWordCompare.game")) {
				String noun = request.getParameter("noun");
				boolean result = kwdao.isExist(noun);
				pw.append(gson.toJson(result));
			}else if(cmd.equals("/kordleGameStart.game")) {
				KordleWordDTO dap = kwdao.randomWord();
				System.out.println("정답: "+dap.getJamo_word());
				pw.append(gson.toJson(dap));
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
