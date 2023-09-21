package controllers;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import constants.Constants;
import dao.FileDAO;
import dao.QNABoardDAO;
import dto.BoardDTO;
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
				String mID = (String)request.getSession().getAttribute("loginID");
				String mNickname = (String )request.getSession().getAttribute("loginNickname");
				System.out.println("ID : "+ mID);
				System.out.println("Nickname : "+mNickname);
				
				String title = multi.getParameter("title");
				String contents = multi.getParameter("contents");
				//String category = multi.getParameter("category");
				String category = "일단 아무거나";
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
						
						// 추후에 파일관련 기능 구현되면 파일인지 이미지인지 구분해서 5번쨰 변수 알맞게 수정해주세요!
						FileDAO.getInstance().insert(new FileDTO(0,parent_seq,ori_name,sys_name,false,true));
					}
				}
				response.sendRedirect("/listing.qna");
				
				
			} else if(cmd.equals("/load.qna")) {
				// 게시글 출력
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int qnaSeq = Integer.parseInt(request.getParameter("seq"));
				
				
				QNABoardDTO list = QNABoardDAO.getInstance().selectPost(qnaSeq);
				int qnaYN= QNABoardDAO.getInstance().answerYN(qnaSeq);
				int fileYN = QNABoardDAO.getInstance().fileYN(qnaSeq);
				
				request.setAttribute("qnalist", list);
				request.setAttribute("cpage", cpage);
				request.setAttribute("qnaYN", qnaYN);
				request.setAttribute("fileYN", fileYN);
				request.getRequestDispatcher("/qna/qnaWatch.jsp").forward(request, response);
				
			} else if(cmd.equals("/update.qna")) {
				// 게시글 수정
				
			} else if(cmd.equals("/delete.qna")) {
				// 게시글 삭제
				
			} else if(cmd.equals("/listing.qna")) {
				// 게시판 출력 
				String cpage = request.getParameter("cpage");
				int currentPage = (cpage == null) ? 1 : Integer.parseInt(cpage);
				request.getSession().setAttribute("lastPageNum", currentPage);
				
				List<QNABoardDTO> list = new ArrayList<>();
				
				// 검색한 키워드
				String keyword = request.getParameter("keyword") == null ? "" : request.getParameter("keyword");
				String searchBy = request.getParameter("searchBy") == null ? "" : request.getParameter("searchBy");
				System.out.println("keyword : "+keyword +", searchBy "+searchBy);
				
				if(keyword.equals("")) { // 찾는 값 없음
					list = QNABoardDAO.getInstance().selectBy((currentPage * Constants.RECORD_COUNT_PER_PAGE - (Constants.RECORD_COUNT_PER_PAGE-1)), (currentPage * Constants.RECORD_COUNT_PER_PAGE));
					request.getSession().setAttribute("latestPageNum", currentPage);
					
					request.setAttribute("list", list);
					request.setAttribute("recordTotalCount", QNABoardDAO.getInstance().getRecordCount());

				}
				else {
					list = QNABoardDAO.getInstance().selectBy((currentPage * Constants.RECORD_COUNT_PER_PAGE - (Constants.RECORD_COUNT_PER_PAGE-1)), (currentPage * Constants.RECORD_COUNT_PER_PAGE),searchBy,keyword);
					request.getSession().setAttribute("latestPageNum", currentPage);
					
					request.setAttribute("list", list);
					request.setAttribute("recordTotalCount", QNABoardDAO.getInstance().getRecordCountKeyword(searchBy,keyword));
					request.setAttribute("searchBy", searchBy);
					request.setAttribute("keyword", keyword);
					
				}
				
				request.setAttribute("recordCountPerPage", Constants.RECORD_COUNT_PER_PAGE);
				request.setAttribute("naviCountPerPage", Constants.NAVI_COUNT_PER_PAGE);
				request.getRequestDispatcher("/qna/qnaList.jsp").forward(request, response);
				
			}
			else if(cmd.equals("/write.qna")) {
				// q&a에서 글쓰기 누를때
				// q&a 매개변수
				String menu = request.getParameter("menu");
				System.out.println("qna : "+menu);
				request.setAttribute("menu", menu);
				request.getRequestDispatcher("/board/boardWrite.jsp").forward(request, response);
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
