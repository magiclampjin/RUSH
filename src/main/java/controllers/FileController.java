package controllers;


import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.FileDAO;
import dto.FileDTO;

@WebServlet("*.file")
public class FileController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println("file cmd: "+cmd);

		response.setContentType("text/html; charset=utf8"); // 한글깨짐방지
		FileDAO dao = FileDAO.getInstance();
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();

		response.setContentType("text/html; charset=utf8");

		try {
			if(cmd.equals("/insert.file")) {
				// 파일 업로드
				String uploadPath = request.getServletContext().getRealPath("files");
				int maxSize = 1024 * 1024 * 10; // 업로드 파일 최대 사이즈 10mb로 제한
				File filepath = new File(uploadPath);
				if(!filepath.exists()) {
					filepath.mkdir();
				}
				
				MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf8", new DefaultFileRenamePolicy());
				boolean isqna = Boolean.parseBoolean(multi.getParameter("isqna"));
				Enumeration<String> fileNames = multi.getFileNames();
				List<String> fileList = new ArrayList<>();
				
				// fileSeq라는 이름이 session에 존재한다면 불러와서 추가하고
				// 없다면 새로 만들기
				// 하나의 게시물에 이미지 첨부를 여러번 나눠서 할수도 있기 때문
				List<Integer> fileSeq = null;
				if(request.getSession().getAttribute("fileSeq")==null) {
					fileSeq = new ArrayList<>();
				}else {
					fileSeq = (List<Integer>) request.getSession().getAttribute("fileSeq");
				}
				
				while(fileNames.hasMoreElements()) {
					String fileName = fileNames.nextElement(); 
					
					if(multi.getFile(fileName) != null) {
						String ori_name = multi.getOriginalFileName(fileName);
						String sys_name = multi.getFilesystemName(fileName);
						
						FileDTO fileDto = new FileDTO(0, 0, ori_name, sys_name, true, isqna);
						fileList.add("/files/"+fileDto.getSystemName());
						fileSeq.add(dao.insert(fileDto));
						
						//int fileResult = dao.insert(fileDto);
						//pw.append("/files/"+sys_name);
					}
				}
				// 이미지 첨부 파일을 모두 DB에 저장하고 나면 DB에 저장된 seq를 세션에 모두 등록
				request.getSession().setAttribute("fileSeq", fileSeq);
				String result = gson.toJson(fileList);
				pw.append(result);
				

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
