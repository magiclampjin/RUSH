package controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.BlackListDAO;
import dao.BoardDAO;
import dao.FileDAO;
import dao.MemberDAO;
import dao.ReplyDAO;
import dto.BlackListDTO;
import dto.BoardDTO;
import dto.MemberDTO;
import dto.ReplyDTO;

@WebServlet("*.black")
public class BlackController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 한글깨짐방지
		response.setContentType("text/html;charset=utf8"); // 한글깨짐방지
		BlackListDAO dao = BlackListDAO.getInstance();
		BoardDAO bdao = BoardDAO.getInstance();
		ReplyDAO rdao = ReplyDAO.getInstance();
		MemberDAO mdao = MemberDAO.getInstance();
		FileDAO fdao = FileDAO.getInstance();
		Gson gson = new Gson();
		String cmd = request.getRequestURI();
		System.out.println("test cmd: "+cmd);
		PrintWriter pw = response.getWriter();
		
		try {
			if(cmd.equals("/getAdReply.black")) {
				List<ReplyDTO> data = dao.selectAdReplies();
				
				pw.print(gson.toJson(data));
			}else if(cmd.equals("/getSearchUser.black")) {
				String id = request.getParameter("id");
				List<MemberDTO> data = dao.selectWarnUser(id);
				
				pw.print(gson.toJson(data));
			}else if(cmd.equals("/getAdBoard.black")) {
				List<BoardDTO> data = dao.selectAdBoard();
				
				pw.println(gson.toJson(data));
			}else if(cmd.equals("/setBlackList.black")) {
				//MemberDAO에 블랙리스트 추가 구현
				String mID = request.getParameter("mID");
				MemberDTO dto = mdao.selectUserInfo(mID);
				String nickName = dto.getNickName();
				String Phone = dto.getPhone();
				String Email = dto.getEmail();
				int result = dao.insertBlackList(new BlackListDTO(0,mID, nickName, Phone, Email));
				pw.println(result);
			}else if (cmd.equals("/deletePost.black")) {

	            int postSeq = Integer.parseInt(request.getParameter("postSeq"));
	            String category = request.getParameter("category");
	            List<String> filesName = fdao.inPostFilesNameList(postSeq);
	            String user = request.getParameter("userID");
				int warnCount = dao.selectWarningCount(user);
				int result = dao.updateWarningCount(user, warnCount+1);
	            
	            String uploadPath = request.getServletContext().getRealPath("files");
	            for(String file:filesName) {
	               File filepath = new File(uploadPath+"/"+file);
	               filepath.delete();
	            }
	            bdao.deletePost(postSeq);
	            pw.println(result);
	         }else if (cmd.equals("/deleteUser.black")) {
					String id = request.getParameter("userID");
					int result = mdao.deleteById(id);
					if (result != 0) {
						pw.println("true");
					} else {
						pw.println("false");
					}
	         }else if(cmd.equals("/deleteReply.black")) {
					// 댓글 삭제
					int replySeq = Integer.parseInt(request.getParameter("replySeq"));
					rdao.delete(replySeq);
					String user = request.getParameter("userID");
					int warnCount = dao.selectWarningCount(user);
					dao.updateWarningCount(user, warnCount+1);
					
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
