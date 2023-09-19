package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.Constants; //pagination에 사용 될 상수 저장용
import dao.BoardDAO;
import dto.BoardDTO;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println("board cmd: " + cmd);

		BoardDAO dao = BoardDAO.getInstance();

		try {
			if (cmd.equals("/insert.board")) {
				// 게시글 등록

				
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
					request.setAttribute("recordTotalCount", dao.getRecordCount());

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
				request.getRequestDispatcher("/board/boardlist.jsp").forward(request, response);
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
