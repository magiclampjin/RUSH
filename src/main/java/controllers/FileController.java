package controllers;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.file")
public class FileController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println("file cmd: "+cmd);
		
		response.setContentType("text/html; charset=utf8");
		
		try {
			if(cmd.equals("/insert.file")) {
				// 파일 업로드
				// QnAController 의 insert.qna에 글 넣으면서 같이 넣음!
			} else if(cmd.equals("/download.file")) {
				// 파일 다운로드
				String sys_name = request.getParameter("sysname");
				String ori_name = request.getParameter("oriname");
				ori_name = new String(ori_name.getBytes("utf8"), "ISO-8859-1");
				String filePath = request.getServletContext().getRealPath("files");
				
				response.setHeader("Content-Disposition", "attachment; filename="+ori_name);
				File targetFile = new File(filePath+"/"+sys_name);
				byte[] fileContents = new byte[(int) targetFile.length()];
				
				try(DataInputStream dis = new DataInputStream(new FileInputStream(targetFile))){
					ServletOutputStream sos = response.getOutputStream();
					dis.readFully(fileContents);
					sos.write(fileContents);
					sos.flush();
				}
						
				
			} else if(cmd.equals("/delete.file")) {
				// 파일 삭제
				
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
