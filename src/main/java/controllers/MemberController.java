package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonSerializationContext;
import com.google.gson.JsonSerializer;

import commons.EncryptionUtils;
import dao.GameDAO;
import dao.MemberDAO;
import dto.GameDTO;
import dto.GameRecordDTO;
import dto.MemberDTO;

@WebServlet("*.member")
public class MemberController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html;charset=utf8");

		String cmd = request.getRequestURI();
		System.out.println("member cmd: " + cmd);

		MemberDAO dao = MemberDAO.getInstance();
		PrintWriter printwriter = response.getWriter();
		Gson gson = new Gson();
		Gson gsonTs = new GsonBuilder().registerTypeAdapter(Timestamp.class, new JsonSerializer<Timestamp>() {
			private final SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy-MM-dd");
			public JsonElement serialize(Timestamp arg0, Type arg1, JsonSerializationContext arg2) {
				long currentTime = System.currentTimeMillis();
				long writeTime = arg0.getTime();
				long gapTime = currentTime - writeTime;

				if (gapTime < 60000) {
					return new JsonPrimitive("방금 전");
				} else if (gapTime < 60000 * 60) {
					return new JsonPrimitive( gapTime / 60000 + " 분 전");
				} else if (gapTime < 60000 * 60 * 24) {
					long hour = gapTime / 60000 / 60;
					long min = ((gapTime / 60000) % 60);
					return new JsonPrimitive("약 "+hour + "시간 전");
				} else {
					return new JsonPrimitive(sdfDay.format(arg0));
				}					
			}
		}).create();

		try {
			if (cmd.equals("/insert.member")) {
				// 회원 가입 (회원 정보 등록)
				String id = request.getParameter("id");
				String pw = EncryptionUtils.getSHA512(request.getParameter("pw"));
				String idNumber = request.getParameter("birth");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String nickName = request.getParameter("nickname");
				String phone = request.getParameter("contact");
				boolean agreement = Boolean.parseBoolean(request.getParameter("agree"));

				dao.insert(new MemberDTO(id, pw, idNumber, name, email, nickName, phone, agreement));
				response.sendRedirect("/member/login.jsp");

			} else if (cmd.equals("/idCheck.member")) {
				// 아이디 중복 체크

				String id = request.getParameter("id");

				boolean result = dao.selectById(id);
				if (result) {
					printwriter.append("used");
				} else {
					printwriter.append("usable");
				}

			} else if (cmd.equals("/nicknameCheck.member")) {
				// 닉네임 중복 체크
				String nickName = request.getParameter("nickname");
				String userId = request.getParameter("userID");
				boolean result = dao.selectByNickname(nickName);
				System.out.println("result : " + result);
				if (result) {
					if (userId != null || userId == "") {
						String userNick = dao.selectNicknameById(userId);
						if (nickName.equals(userNick)) {
							printwriter.append("myNick");
						}
					} else {
						printwriter.append("used");
					}

				} else {
					printwriter.append("usable");
				}

			} else if (cmd.equals("/load.member")) {
				// 마이페이지 (회원 정보 출력)
				String userID = (String) request.getSession().getAttribute("loginID");
				MemberDTO user = dao.selectUserInfo(userID);
				request.setAttribute("user", user);
				request.getRequestDispatcher("/member/myPage.jsp").forward(request, response);

			} else if (cmd.equals("/pwCheck.member")) {
				// 회원 정보 수정 전 비밀번호 확인
				String id = request.getParameter("userID");
				String pw = EncryptionUtils.getSHA512(request.getParameter("userPW"));
				System.out.println(id);
				System.out.println(request.getParameter("userPW"));
				boolean result = dao.selectByIdPw(id, pw);
				if (result) {
					printwriter.append("true");
				} else {
					printwriter.append("false");
				}
			} else if (cmd.equals("/update.member")) {
				// 회원 정보 수정
				String id = request.getParameter("userID");
				String newNick = request.getParameter("newNick");
				String newPhone = request.getParameter("newPhone");
				String newEmail = request.getParameter("newEmail");
				System.out.println(newEmail);

				int result = dao.updateInfoById(id, newNick, newPhone, newEmail);
				if (result != 0) {
					printwriter.append("true");
					request.getSession().setAttribute("loginNickname", newNick); // 닉네임 세션 업데이트
				} else {
					printwriter.append("false");
				}
			} else if (cmd.equals("/pwUpdate.member")) {
				String id = request.getParameter("userID");
				String newPw = EncryptionUtils.getSHA512(request.getParameter("newPW"));

				int result = dao.updatePwById(newPw, id);
				if (result != 0) {
					printwriter.append("true");
				} else {
					printwriter.append("false");
				}
			} else if (cmd.equals("/delete.member")) {
				// 회원 탈퇴 (회원 정보 삭제)
				String id = request.getParameter("userID");
				System.out.println(id);
				int result = dao.deleteById(id);
				if (result != 0) {
					printwriter.append("true");
					request.getSession().invalidate();
				} else {
					printwriter.append("false");
				}
			} else if (cmd.equals("/login.member")) {
				// 회원 로그인
				String id = request.getParameter("id");
				String pw = EncryptionUtils.getSHA512(request.getParameter("pw"));

				boolean isAuthenticated = dao.selectByIdPw(id, pw);

				if (isAuthenticated) { // 로그인에 성공하는 순간
					request.getSession().setAttribute("loginID", id); // 아이디 세션

					String nickName = dao.selectNicknameById(id);
					request.getSession().setAttribute("loginNickname", nickName); // 닉네임 세션

				} else {
					response.getWriter().append("failed");
				}

			} else if (cmd.equals("/findId.member")) {
				// 아이디 찾기
				String name = request.getParameter("name");
				String email = request.getParameter("email");

				String id = dao.selectIdByNameEmail(name, email);
				if (id == null) {
					response.getWriter().append("null");
				} else {
					response.getWriter().append(id);
				}

			} else if (cmd.equals("/findPw.member")) {
				// 비밀번호 찾기
				String id = request.getParameter("id");
				String name = request.getParameter("name");
				String email = request.getParameter("email");

				boolean ExistPw = dao.selectByIdNameEmail(id, name, email);
				if (!ExistPw) {
					response.getWriter().append("null");
				}

			} else if (cmd.equals("/updatePw.member")) {
				// 비밀번호 수정
				String pw = EncryptionUtils.getSHA512(request.getParameter("pw"));
				String id = request.getParameter("id");
				dao.updatePwById(pw, id);
				response.sendRedirect("/member/login.jsp");

			} else if (cmd.equals("/logout.member")) {
				// 회원 로그아웃
				request.getSession().invalidate();
			}
			/////////////////////////////////////////////////////////
			else if(cmd.equals("/myFavoriteGame.member")) {

			    System.out.println("/myFavoriteGame.member");
			    String id = (String) request.getSession().getAttribute("loginID");
			    String category = request.getParameter("param");
			    System.out.println("Favo category "+category);
			    
			    List<GameDTO> list = new ArrayList<>();
			    
			    if(category.equals("favoriteAll")) {
			        list = GameDAO.getInstance().myFavoriateGame(id);
			        
			    }else {
			        list = GameDAO.getInstance().myFavoriateGame(id,category);
			    }
			    
			    
			    printwriter.append(gson.toJson(list));
			    
			}else if(cmd.equals("/mycurrentOrder.member")) {
			    System.out.println("/mycurrentOrder.member");
			    String id = (String) request.getSession().getAttribute("loginID");
			    String category = request.getParameter("param");
			    System.out.println("Favo category "+category);
			    
			    List<GameDTO> list = new ArrayList<>();
			    
			    if(category.equals("favoriteAll")) {
			        list = GameDAO.getInstance().myCurrentOrderGame(id);
			    }else {
			        list = GameDAO.getInstance().myCurrentOrderGame(id,category);
			    }
			    
			    printwriter.append(gson.toJson(list));
			    
			}else if(cmd.equals("/mynameOrderGame.member")) {
			    System.out.println("/mynameOrderGame.member");
			    
			    String id = (String) request.getSession().getAttribute("loginID");
			    String category = request.getParameter("param");
			    
			    List<GameDTO> list = new ArrayList<>();
			    
			    if(category.equals("favoriteAll")) {
			        list = GameDAO.getInstance().myNameOrderGame(id);
			    }else {
			        list = GameDAO.getInstance().myNameOrderGame(id,category);
			    }
			    
			    printwriter.append(gson.toJson(list));
			    
			}else if(cmd.equals("/myFavoriteOrderGame.member")) {
			    System.out.println("/myFavoriteOrderGame.member");
			    String id = (String) request.getSession().getAttribute("loginID");
			    String category = request.getParameter("param");
			    
			    List<GameDTO> list = new ArrayList<>();
			    
			    if(category.equals("favoriteAll")) {
			        list = GameDAO.getInstance().myFavoriteOrderGame(id);
			    }else {
			        list = GameDAO.getInstance().myFavoriteOrderGame(id,category);
			    }
			    printwriter.append(gson.toJson(list));
			    
			}else if(cmd.equals("/myGameRecord.member")) {
			    System.out.println("/myGameRecord.member");
			    String id = (String) request.getSession().getAttribute("loginID");
			    String gName = request.getParameter("param");
			    
			    List<GameRecordDTO> list = new ArrayList<>();
			    
			    if(gName.equals("gameAll")) {
			    	 list = GameDAO.getInstance().myGameRecord(id);
			    }else {
			    	list = GameDAO.getInstance().myGameRecord(id,gName);
			    }
			    
			    printwriter.append(gson.toJson(list));
			}else if(cmd.equals("/myGameScoreOrder.member")) {
				
				System.out.println("/myGameScoreOrder.member");
			    String id = (String) request.getSession().getAttribute("loginID");
			    String gName = request.getParameter("param");
				
			    List<GameRecordDTO> list = new ArrayList<>();
			    
			    if(gName.equals("gameAll")) {
			    	 list = GameDAO.getInstance().myGameScoreOrder(id);
			    }else {
			    	list = GameDAO.getInstance().myGameScoreOrder(id,gName);
			    }
			    printwriter.append(gson.toJson(list));
			}else if(cmd.equals("/myGameCurrentOrder.member")) {
				
				System.out.println("/myGameCurrentOrder.member");
			    String id = (String) request.getSession().getAttribute("loginID");
			    String gName = request.getParameter("param");
				
			    List<GameRecordDTO> list = new ArrayList<>();
			    
			    if(gName.equals("gameAll")) {
			    	 list = GameDAO.getInstance().myGameCurrentOrder(id);
			    }else {
			    	list = GameDAO.getInstance().myGameCurrentOrder(id,gName);
			    }
			    printwriter.append(gson.toJson(list));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.html");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
