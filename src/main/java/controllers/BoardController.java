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

import constants.Constants; //pagination에 사용 될 상수 저장용
import dao.BoardDAO;
import dao.FileDAO;
import dto.BoardDTO;
import dto.FileDTO;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println("board cmd: " + cmd);

		BoardDAO dao = BoardDAO.getInstance();
		FileDAO fdao =FileDAO.getInstance();

		try {
			if (cmd.equals("/insert.board")) {
				// 게시글 등록
				int maxSize = 1024 * 1024 * 10; // 업로드 파일 최대 사이즈 10mb로 제한
				
				String uploadPath = request.getServletContext().getRealPath("files");
				File filepath = new File(uploadPath);
				if(!filepath.exists()) {
					filepath.mkdir();
				}
				System.out.println(uploadPath);
				MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf8", new DefaultFileRenamePolicy());
				String category = multi.getParameter("category");
				String title = multi.getParameter("title");
				String content = multi.getParameter("contents");
				
				String id = (String) request.getSession().getAttribute("loginID");
				String userNick = dao.selectNickName(id);
				System.out.println("title"+title+"contents"+content);
				int parentSeq = dao.insert(new BoardDTO(0, id, category, userNick, title, content, null, 0, 0));
				
				Enumeration<String> fileNames = multi.getFileNames(); // 보내진 파일들 이름의 리스트
				while(fileNames.hasMoreElements()) { // 파일이 존재하는 동안
					String fileName = fileNames.nextElement(); // 다음 파일을 불러옴
					
					if(multi.getFile(fileName) != null) {
						String ori_name = multi.getOriginalFileName(fileName);
						String sys_name = multi.getFilesystemName(fileName);
						FileDTO fileDto = new FileDTO(0, parentSeq, ori_name, sys_name);
						int fileResult = fdao.insert(fileDto);
					}
				}
				
				if(parentSeq!=0) {
					response.sendRedirect("/listing.board");
				}
			} else if (cmd.equals("/load.board")) {
				// cpage 가져와야하고,
				// 게시글 번호를 가져와야함.
				// 그리고 게시판 위치 (자유게시판인지 qna인지) -> 이거는 여기서 보내주는 것

				
				// <a href="/load.board?cpage=${cpage }&seq=${post.seq }&category=${category }">
				int cpage =  Integer.parseInt(request.getParameter("cpage"));
				int postSeq = Integer.parseInt(request.getParameter("seq"));
				String category = request.getParameter("category");
				
				BoardDTO post = dao.selectPost(postSeq);
				request.setAttribute("post", post);
				request.setAttribute("cpage", cpage);
				request.setAttribute("category", category);
				request.getRequestDispatcher("/board/post.jsp").forward(request, response);

			} else if (cmd.equals("/update.board")) {
				// 게시글 수정

			} else if (cmd.equals("/delete.board")) {
				// 게시글 삭제

			} else if (cmd.equals("/listing.board")) {
				// 게시판 출력
				String category = request.getParameter("category");
				category = (category == null) ? "rhythm" : category;

				String cpage = request.getParameter("cpage");
				int currentPage = (cpage == null) ? 1 : Integer.parseInt(cpage);
				request.getSession().setAttribute("lastPageNum", currentPage);

				List<BoardDTO> list = new ArrayList<>();

				// 검색한 카테고리, 키워드에 맞는 페이지 찾기
				String search = request.getParameter("search");
				String keyword = request.getParameter("keyword");

				if (keyword == null || keyword.equals("")) {
					// 검색 키워드가 넘어오지 않은 경우
					list = dao.selectByCategory(category,
							currentPage * Constants.RECORD_COUNT_PER_PAGE - Constants.RECORD_COUNT_PER_PAGE,
							Constants.RECORD_COUNT_PER_PAGE);
					request.setAttribute("recordTotalCount", dao.getRecordCount(category));

				} else {
					// 검색 키워드가 넘어온 경우
				}

				List<BoardDTO> notiList = new ArrayList<>();
				notiList = dao.selectByNoti();
				
				request.setAttribute("cpage", cpage);

				request.setAttribute("category", category);
				request.setAttribute("type", "freeBoard");
				request.setAttribute("notiList", notiList);
				request.setAttribute("boardList", list);
				request.setAttribute("recordCountPerPage", Constants.RECORD_COUNT_PER_PAGE);
				request.setAttribute("naviCountPerPage", Constants.NAVI_COUNT_PER_PAGE);
				request.getRequestDispatcher("/board/boardList.jsp").forward(request, response);
			}else if(cmd.equals("/write.board")) {
				String menu = request.getParameter("menu");
				System.out.println(menu);
				String category = request.getParameter("category");
				System.out.println(category);
				request.setAttribute("menu", menu);
				request.setAttribute("category", category);
				request.getRequestDispatcher("/board/boardWrite.jsp").forward(request, response);
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.html");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
