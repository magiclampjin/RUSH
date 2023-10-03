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
import dao.QnaAnswerDAO;
import dto.QnaAnswerDTO;
import dto.ReplyDTO;


@WebServlet("*.answer")
public class QnaAnswerController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			response.setContentType("text/html;charset=utf8"); // 한글깨짐방지

			String cmd = request.getRequestURI();
			System.out.println("reply cmd: " + cmd);

			QnaAnswerDAO dao = QnaAnswerDAO.getInstance();
			PrintWriter pw = response.getWriter();
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
				if (cmd.equals("/insert.answer")) {
					String contents = request.getParameter("contents");
					int postSeq = Integer.parseInt(request.getParameter("postSeq"));
					dao.insert(new QnaAnswerDTO(postSeq, contents));
				} else if(cmd.equals("/load.answer")) {
					
					int postSeq = Integer.parseInt(request.getParameter("postSeq"));
					List<QnaAnswerDTO> answers = dao.selectAll(postSeq);			

					if(answers.size() >0)
						pw.append(gsonTs.toJson(answers));
				} else if(cmd.equals("/update.answer")) {
					// 댓글 수정
					int qaSeq = Integer.parseInt(request.getParameter("qaSeq"));
					String qaContents = request.getParameter("qaContents");
					
					dao.update(qaSeq, qaContents);
					
				} else if(cmd.equals("/delete.answer")) {
					// 댓글 삭제
					int qaSeq = Integer.parseInt(request.getParameter("qaSeq"));
					dao.delete(qaSeq);
					
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
