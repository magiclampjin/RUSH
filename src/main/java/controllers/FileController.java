package controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
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
		
		FileDAO dao = FileDAO.getInstance();
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();
		
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
				Enumeration<String> fileNames = multi.getFileNames();
				List<String> fileList = new ArrayList<>();
				while(fileNames.hasMoreElements()) {
					String fileName = fileNames.nextElement(); 
					
					if(multi.getFile(fileName) != null) {
						String ori_name = multi.getOriginalFileName(fileName);
						String sys_name = multi.getFilesystemName(fileName);
						
						FileDTO fileDto = new FileDTO(0, 0, ori_name, sys_name);
						fileList.add("/files/"+fileDto.getSystemName());
						for(int i =0;i<fileList.size();i++) {
							System.out.println(fileList.get(i));
						}
						int fileResult = dao.insert(fileDto);
						//pw.append("/files/"+sys_name);
					}
				}
				String result = gson.toJson(fileList);
				System.out.println(result);
				pw.append(result);
				
			} else if(cmd.equals("/download.file")) {
				// 파일 다운로드
				
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
