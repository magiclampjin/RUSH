package controllers;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.FileDAO;
import dao.QNABoardDAO;
import dto.FileDTO;
import dto.QNABoardDTO;
 
@WebServlet("*.qna")
public class QnAController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println("qna cmd: "+cmd);
		
		try {
			if(cmd.equals("/insert.qna")) {
				// 게시글 등록
				System.out.println("RealPath : "+request.getServletContext().getRealPath(""));
				String uploadPath = request.getServletContext().getRealPath("files");
				
				File filesPath = new File(uploadPath);
				if(!filesPath.exists()) {
					filesPath.mkdir();
				}
				
				int maxSize = 1024 * 1024 *10;
				MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf8",new DefaultFileRenamePolicy());
				
				// 아직 Session 안해서 일단 String으로 넣어놓음
//				String mID = (String)request.getSession().getAttribute("loginID");
//				String mNickname = (String )request.getSession().getAttribute("loginNickname");
//				
				String mID = "ID";
				String mNickname = "Nickname";
				
				
				String title = multi.getParameter("title");
				String contents = multi.getParameter("contents");
				String category = multi.getParameter("category");
				System.out.println("title : "+title +" contents : "+contents+" category: "+category);
				
				String secret = multi.getParameter("secret");
				boolean checked = true;
				System.out.println("boolean 값 : "+secret);
				if(secret.equals("false")) {
					checked = false;
				}
				// auto_increment로 seq값 생성됨
				int parent_seq = QNABoardDAO.getInstance().insert(new QNABoardDTO(0,mID,mNickname,title,contents,category,checked));
				System.out.println("부모 번호 : "+parent_seq);
				
				Enumeration<String> fileNames = multi.getFileNames();
				
				while(fileNames.hasMoreElements()) {
					String fileName = fileNames.nextElement();
					System.out.println("파일 이름 : "+fileName);
					
					if(multi.getFile(fileName)!=null) {
						String ori_name = multi.getOriginalFileName(fileName);
						String sys_name = multi.getFilesystemName(fileName);
						
						FileDAO.getInstance().insert(new FileDTO(0,parent_seq,ori_name,sys_name));
					}
				}
				response.sendRedirect("/listing.qna");
				
				
			} else if(cmd.equals("/load.qna")) {
				// 게시글 출력
				
			} else if(cmd.equals("/update.qna")) {
				// 게시글 수정
				
			} else if(cmd.equals("/delete.qna")) {
				// 게시글 삭제
				
			} else if(cmd.equals("/listing.qna")) {
				// 게시판 출력 
				
			}else if(cmd.equals("/write.qna")) {
				// q&a에서 글쓰기 누를때
				// q&a 매개변수
				String menu = request.getParameter("menu");
				System.out.println("qna : "+menu);
				// 카테고리도 받아와야함
				String category = request.getParameter("category");
				System.out.println("category : "+category);
				request.setAttribute("menu", menu);
				request.setAttribute("category", category);
				request.getRequestDispatcher("/qna/qnaWrite.jsp").forward(request, response);
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
