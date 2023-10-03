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
import dao.KordleWordDAO;
import dao.MemberDAO;
import dto.GameDTO;
import dto.GameRecordDTO;
import dto.KordleWordDTO;
import dto.MemberDTO;
import dto.ReplyDTO;

@WebServlet("*.game")
public class GameController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 한글깨짐방지
		response.setContentType("text/html;charset=utf8"); // 한글깨짐방지

		GameDAO dao = GameDAO.getInstance();
		MemberDAO mdao = MemberDAO.getInstance();
		Gson gson = new Gson();
		String cmd = request.getRequestURI();
		PrintWriter pw = response.getWriter();
		System.out.println("game cmd: "+cmd);
		
		KordleWordDAO kwdao = KordleWordDAO.getInstance();
		
		try {
			if(cmd.equals("/moveToGamePage.game")) {
				String gameName = request.getParameter("game");
				String gameCategory = dao.selectByGameName(gameName);
				String developer = dao.selectDevByGameName(gameName);
				request.setAttribute("game",gameName);
				request.setAttribute("category",gameCategory);
				request.setAttribute("dev",developer);
				request.getRequestDispatcher("/game/GamePage_"+gameCategory+".jsp").forward(request, response);
				
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
					out.println("o");
				}else {
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
					pw.println("o");
				}else {
					pw.println("x");
				}
			}else if(cmd.equals("/getRecord.game")) {
				List<GameRecordDTO> list = new ArrayList<>();
				String gameName = request.getParameter("gameName");
				if(gameName.equals("Kordle")){
					list = dao.selectKordleGameRecord();
				}else {
					list = dao.selectGameRecord(gameName);
				}
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
				String mID = (String) request.getSession().getAttribute("loginID");
				String gName = request.getParameter("game");
				String mNickname = (String) request.getSession().getAttribute("loginNickname");
				int score = Integer.parseInt(request.getParameter("score"));
				
				// 로그인 하지 않았거나 관리자면 게임 기록이 안남도록 설정
				if(mID!=null && !mID.equals("admin")) {
					int result = dao.insertGameRecord(new GameRecordDTO(0,mID,gName,mNickname,null,score,0));
					mdao.updatePointById(mID);
					mdao.updateLevelById(mID);
				}

				List<GameRecordDTO> list = new ArrayList<>();
				if(gName.equals("Kordle")){
					list = dao.selectKordleGameRecord();
				}else {
					list = dao.selectGameRecord(gName);
				}
				pw.append(gson.toJson(list));
				
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
				pw.append(gson.toJson(dap));
			} else if(cmd.equals("/bestPlayGame.game")) {
				List<GameDTO> list = dao.selectIndexBestPlayGame();
				pw.append(gson.toJson(list));
			} else if(cmd.equals("/bestBookmarkGame.game")) {
				List<GameDTO> list = dao.selectBestBookmarkGame();
				pw.append(gson.toJson(list));
			}else if(cmd.equals("/getGenders.game")) {
				String gameName = request.getParameter("game");
				int count = dao.selectRecordCount(gameName);
				int male = (int) Math.round(dao.selectGameMaleCount(gameName)*100.0/count);
				int female = (int) Math.round(dao.selectGameFemaleCount(gameName)*100.0/count);
				System.out.println(dao.selectGameFemaleCount(gameName));
				System.out.println(male+" "+female);
				List list = new ArrayList<>();
				list.add(male);
				list.add(female);
				pw.append(gson.toJson(list));
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
