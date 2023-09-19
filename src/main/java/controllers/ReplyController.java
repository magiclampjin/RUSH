package controllers;

import java.io.IOException;
import java.lang.reflect.Type;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
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
		
		try {
			if(cmd.equals("/insert.reply")) {
				// 댓글 작성
				
			} else if(cmd.equals("/load.reply")) {
				int postSeq = Integer.parseInt(request.getParameter("postSeq"));
				List<ReplyDTO> replys = dao.selectAll(postSeq);
				Gson gson = new GsonBuilder().registerTypeAdapter(Timestamp.class, new JsonSerializer<Timestamp>() {
					private final SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
					public JsonElement serialize(Timestamp arg0, Type arg1, JsonSerializationContext arg2) {
						long currentTime = System.currentTimeMillis();
						long writeTime = arg0.getTime();
						long gapTime = currentTime - writeTime;

						if (gapTime < 60000) {
							return new JsonPrimitive((gapTime / 1000) + "초 전");
						} else if (gapTime < 60000 * 60) {
							return new JsonPrimitive( gapTime / 60000 + " 분 전");
						} else if (gapTime < 60000 * 60 * 24) {
							long hour = gapTime / 60000 / 60;
							long min = ((gapTime / 60000) % 60);
							return new JsonPrimitive("약 "+hour + "시간 전");
						} else {
							return new JsonPrimitive(sdf.format(arg0));
						}					
					}
				}).create();
				
				response.getWriter().append(gson.toJson(replys));

				
			} else if(cmd.equals("/update.reply")) {
				// 댓글 수정
				
			} else if(cmd.equals("/delete.board")) {
				// 댓글 삭제
				
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
