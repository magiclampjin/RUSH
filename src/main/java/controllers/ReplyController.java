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

import constants.Constants;
import dao.ReplyDAO;
import dto.ReplyDTO;

@WebServlet("*.reply")
public class ReplyController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 한글깨짐방지
		response.setContentType("text/html;charset=utf8"); // 한글깨짐방지
		
		String cmd = request.getRequestURI();
		System.out.println("reply cmd: "+cmd);
		
		ReplyDAO dao = ReplyDAO.getInstance();
		PrintWriter pw = response.getWriter();
		Gson gsonDefault = new Gson();
		Gson gsonTs = new GsonBuilder().registerTypeAdapter(Timestamp.class, new JsonSerializer<Timestamp>() {
			private final SimpleDateFormat sdfDay = new SimpleDateFormat("yyyy.MM.dd");
			private final SimpleDateFormat sdfTime = new SimpleDateFormat("hh:mm");
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
					return new JsonPrimitive(sdfDay.format(arg0)+"&nbsp;&nbsp;"+sdfTime.format(arg0));
				}					
			}
		}).create();
		
		try {
			if(cmd.equals("/insert.reply")) {
				// 댓글 작성							
				String contents = request.getParameter("contents");
				int postSeq = Integer.parseInt(request.getParameter("postSeq"));
				String writer = (String) request.getSession().getAttribute("loginID");
				String nickname = (String) request.getSession().getAttribute("loginNickname");
				
				dao.insert(new ReplyDTO(0, postSeq, writer, nickname, contents, null, 0));
				
			} else if(cmd.equals("/load.reply")) {
				int postSeq = Integer.parseInt(request.getParameter("postSeq"));
				String loginId = (String) request.getSession().getAttribute("loginID");
				List<ReplyDTO> replys = dao.selectAll(postSeq,loginId);

				// 페이지 네이션
				String replyPage = request.getParameter("replyPage");
				int currentReplyPage = (replyPage == null) ? 1 : Integer.parseInt(replyPage);
				request.setAttribute("lastReplyPageNum", currentReplyPage);
				request.setAttribute("recordCountPerPage", Constants.REPLY_COUNT_PER_PAGE);
				request.setAttribute("naviCountPerPage", Constants.REPLY_NAVI_COUNT_PER_PAGE);
				// 여기까지 페이지 네이션
				
				
				List<ReplyDTO> replyRecList = dao.selectReplyRecommCnt(postSeq, loginId);
				
				List<Object> result = new ArrayList<>();
				result.add(replys);
				result.add(replyRecList);
				
				pw.append(gsonTs.toJson(result));
	
			} else if(cmd.equals("/update.reply")) {
				// 댓글 수정
				int replySeq = Integer.parseInt(request.getParameter("replySeq"));
				String replyContents = request.getParameter("replyContents");
				
				dao.update(replySeq, replyContents);
				
			} else if(cmd.equals("/delete.reply")) {
				// 댓글 삭제
				int replySeq = Integer.parseInt(request.getParameter("replySeq"));
				dao.delete(replySeq);
				
			} else if(cmd.equals("/insertReplyRecommend.reply")) {
				// 댓글 좋아요 추가
				int replySeq = Integer.parseInt(request.getParameter("replySeq"));
				String loginId = (String) request.getSession().getAttribute("loginID");
				int result = dao.insertRecommend(replySeq, loginId);
				int recCnt = dao.countRecommend(replySeq);
				List<Integer> list = new ArrayList<>();
				list.add(result);
				list.add(recCnt);
				
				pw.append(gsonDefault.toJson(list));
				
			} else if(cmd.equals("/deleteReplyRecommend.reply")) {
				// 댓글 좋아요 취소
				int replySeq = Integer.parseInt(request.getParameter("replySeq"));
				String loginId = (String) request.getSession().getAttribute("loginID");
				int result = dao.deletetRecommend(replySeq, loginId);
				int recCnt = dao.countRecommend(replySeq);
				List<Integer> list = new ArrayList<>();
				list.add(result);
				list.add(recCnt);
				pw.append(gsonDefault.toJson(list));
				
				
			} else if(cmd.equals("/nestedInsert.reply")) {
				String writer = (String) request.getSession().getAttribute("loginID");
				int postSeq = Integer.parseInt(request.getParameter("postSeq"));
				String nickname = (String) request.getSession().getAttribute("loginNickname");
				String contents = request.getParameter("contents");
				int replySeq = Integer.parseInt(request.getParameter("replySeq"));	
				
				int result = dao.nestedInsert(new ReplyDTO(0, postSeq, writer, nickname, contents, null, replySeq));
				pw.append(gsonDefault.toJson(result));
				
			} else if(cmd.equals("/nestedPrint.reply")) {
				int replySeq = Integer.parseInt(request.getParameter("replySeq"));
				String loginId = (String) request.getSession().getAttribute("loginID");
				List<ReplyDTO> nestedReplys = dao.selectNestedReplys(replySeq, loginId);
				pw.append(gsonTs.toJson(nestedReplys));
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
