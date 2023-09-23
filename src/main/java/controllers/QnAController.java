package controllers;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
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
		
		QNABoardDAO dao = QNABoardDAO.getInstance();
		FileDAO fdao = FileDAO.getInstance();
		try {
			if(cmd.equals("/insert.qna")) {
				// 게시글 등록
				int maxSize = 1024 * 1024 *10;
				
				String uploadPath = request.getServletContext().getRealPath("files");
				System.out.println(uploadPath);
				File filesPath = new File(uploadPath);
				if(!filesPath.exists()) {
					filesPath.mkdir();
				}
				
				
				MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf8",new DefaultFileRenamePolicy());
				
				//String category = multi.getParameter("category");
				String category = "일단 아무거나";
				String title = multi.getParameter("title");
				String contents = multi.getParameter("contents");
				
				String mID = (String)request.getSession().getAttribute("loginID");
				String mNickname = (String )request.getSession().getAttribute("loginNickname");

				boolean secret = Boolean.valueOf(multi.getParameter("secret"));

				// auto_increment로 seq값 생성됨
				int parent_seq = QNABoardDAO.getInstance().insert(new QNABoardDTO(0,mID,mNickname,title,contents,category,secret));
				
				
				Enumeration<String> fileNames = multi.getFileNames();

				while (fileNames.hasMoreElements()) { // 파일이 존재하는 동안
					String fileName = fileNames.nextElement(); // 다음 파일을 불러옴
					if (multi.getFile(fileName) != null) {

						String ori_name = multi.getOriginalFileName(fileName);
						String sys_name = multi.getFilesystemName(fileName);
						FileDTO fileDto = new FileDTO(0, parent_seq, ori_name, sys_name, false, true);
						int fileResult = fdao.insert(fileDto);
					}
				}

				// 세션에 저장해둔 첨부 이미지의 parentSeq를 변경
				if (request.getSession().getAttribute("fileSeq") != null) {
					List<Integer> fileSeq = (List<Integer>) request.getSession().getAttribute("fileSeq");
					for (int i = 0; i < fileSeq.size(); i++) {
						fdao.updateParentSeq(parent_seq, fileSeq.get(i));
					}

					// 첨부 이미지의 parentSeq를 변경해줬다면 session정보 지우기
					request.getSession().removeAttribute("fileSeq");
				}

				if (parent_seq != 0) {
					response.sendRedirect("/listing.qna");
				}		
			} 
			
//			else if(cmd.equals("/load.qna")) {
//				// 게시글 출력
//				int cpage = Integer.parseInt(request.getParameter("cpage"));
//				int qnaSeq = Integer.parseInt(request.getParameter("seq"));
//				
//				
//				QNABoardDTO list = QNABoardDAO.getInstance().selectPost(qnaSeq);
//				
//				request.setAttribute("qnalist", list);
//				request.setAttribute("cpage", cpage);
//				request.getRequestDispatcher("/qna/qnaWatch.jsp").forward(request, response);
//				
//			} 
			
			else if(cmd.equals("/load.qna")) {
				// 게시글 출력
				int cpage = Integer.parseInt(request.getParameter("cpage"));
				int qnaSeq = Integer.parseInt(request.getParameter("seq"));
				String keyword = request.getParameter("keyword");
				String searchBy = request.getParameter("searchBy");
				
				QNABoardDTO post = dao.selectPost(qnaSeq);
				
				request.setAttribute("postSeq", qnaSeq);
				request.setAttribute("post", post);
				request.setAttribute("cpage", cpage);
		
				if(searchBy != null)
					request.setAttribute("searchBy", searchBy);
				if(keyword != null)
					request.setAttribute("keyword", keyword);
				
				List<FileDTO> files = fdao.selectForPost(qnaSeq);
				request.setAttribute("files", files);
				request.getRequestDispatcher("/qna/qnaPost.jsp").forward(request, response);
			} 
			
			else if(cmd.equals("/updateLoad.qna")) {
				// 게시글 수정 페이지로 이동
				int postSeq = Integer.parseInt(request.getParameter("postSeq"));
				String cpage = request.getParameter("cpage");
				int currentPage = (cpage == null || cpage=="") ? 1 : Integer.parseInt(cpage);
				String category = request.getParameter("category");
				String menu = request.getParameter("menu");
				String searchBy = request.getParameter("searchBy");
				String keyword = request.getParameter("keyword");
				
				List<FileDTO> files = fdao.inQnaFilesList(postSeq);
				QNABoardDTO post = dao.selectPost(postSeq);
				
				request.setAttribute("category", category);
				request.setAttribute("files", files);
				request.setAttribute("post", post);
				request.setAttribute("cpage", currentPage);
				request.setAttribute("menu", menu);
				if(searchBy != null) {
					request.setAttribute("searchBy",searchBy);
					request.setAttribute("keyword",keyword);
				}
				request.getRequestDispatcher("/board/postUpdate.jsp").forward(request, response);
				
			}
			else if(cmd.equals("/update.qna")) {
				// 게시글 수정
				int maxSize = 1024 * 1024 * 10; // 업로드 파일 최대 사이즈 10mb로 제한
				String uploadPath = request.getServletContext().getRealPath("files");
				File filepath = new File(uploadPath);
				
				if (!filepath.exists()) {
					filepath.mkdir();
				}
				MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf8",
						new DefaultFileRenamePolicy());
				String cpage = multi.getParameter("cpage");
//				String category = multi.getParameter("category");
				int postSeq = Integer.parseInt(multi.getParameter("postSeq"));
				String title = multi.getParameter("title");
				String content = multi.getParameter("contents");
				
				// 게시글 수정 시 수정된 파일 DB, realpath에서 삭제
				String[] deleteFileSeqStr = multi.getParameter("deleteFiles").split(",");
				for(int i=0; i<deleteFileSeqStr.length-1; i++) {
					String sysname = fdao.selectSysName(Integer.parseInt(deleteFileSeqStr[i+1]));
					System.out.println("삭제할 파일: "+sysname);
					int result = fdao.deleteFile(sysname);
					if(result == 1) {
						File deleteFilePath = new File(uploadPath+"/"+sysname);
						deleteFilePath.delete();
					}	
				}
				
				// 게시글 수정 시 수정된 이미지 DB, realpath에서 삭제
				String[] deleteImgNameStr = multi.getParameter("deleteImgs").split(":");
				for(int i=0; i<deleteImgNameStr.length-1; i++) {
					String sysname = deleteImgNameStr[i+1];
					
					sysname = sysname.substring(7);
					
					int result = fdao.deleteFile(sysname);
					if(result == 1) {
						File deleteImgfilepath = new File(uploadPath+"/"+sysname);
						deleteImgfilepath.delete();
					}	
				}					
				
				String searchBy = multi.getParameter("searchBy");
				String keyword = multi.getParameter("keyword");
				keyword = URLEncoder.encode(keyword, StandardCharsets.UTF_8.toString());
				
				String id = (String) request.getSession().getAttribute("loginID");
				String userNick = (String) request.getSession().getAttribute("loginNickname");
//				dao.update(new BoardDTO(postSeq, id, category, userNick, title, content, null, 0));

				Enumeration<String> fileNames = multi.getFileNames(); // 보내진 파일들 이름의 리스트

				while (fileNames.hasMoreElements()) { // 파일이 존재하는 동안
					String fileName = fileNames.nextElement(); // 다음 파일을 불러옴
					if (multi.getFile(fileName) != null) {
						String ori_name = multi.getOriginalFileName(fileName);
						String sys_name = multi.getFilesystemName(fileName);
						FileDTO fileDto = new FileDTO(0, postSeq, ori_name, sys_name, false, true);
						int fileResult = fdao.insert(fileDto);
					}
				}

				// 세션에 저장해둔 첨부 이미지의 parentSeq를 변경
				if (request.getSession().getAttribute("fileSeq") != null) {
					List<Integer> fileSeq = (List<Integer>) request.getSession().getAttribute("fileSeq");
					for (int i = 0; i < fileSeq.size(); i++) {
						fdao.updateParentSeq(postSeq, fileSeq.get(i));
					}

					// 첨부 이미지의 parentSeq를 변경해줬다면 session정보 지우기
					request.getSession().removeAttribute("fileSeq");
				}

				if(searchBy != null) {
					response.sendRedirect("/load.qna?seq="+postSeq+"&cpage="+cpage+"&search="+searchBy+"&keyword="+keyword);
				} else {
					response.sendRedirect("/load.qna?seq="+postSeq+"&cpage="+cpage);
				}
						
			} else if(cmd.equals("/delete.qna")) {
				// 게시글 삭제
				int qnaSeq = Integer.parseInt(request.getParameter("postSeq"));
				
				List<String> filesName = fdao.inQnaFilesNameList(qnaSeq);
				String uploadPath = request.getServletContext().getRealPath("files");
				for(String file:filesName) {
					File filepath = new File(uploadPath+"/"+file);
					filepath.delete();
					// 외래키 cascade로 설정하면 DB에서는 게시글 삭제할 때 연쇄적으로 삭제됨. 
				}
				dao.delete(qnaSeq);
				response.sendRedirect("/listing.qna");
				
				
			} else if(cmd.equals("/listing.qna")) {
				// 게시판 출력 
				String cpage = request.getParameter("cpage");
				int currentPage = (cpage == null) ? 1 : Integer.parseInt(cpage);
				request.getSession().setAttribute("lastPageNum", currentPage);
				
				List<QNABoardDTO> list = new ArrayList<>();
				
				// 검색한 키워드
				String keyword = request.getParameter("keyword") == null ? "" : request.getParameter("keyword");
				String searchBy = request.getParameter("searchBy") == null ? "" : request.getParameter("searchBy");
				
				
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
