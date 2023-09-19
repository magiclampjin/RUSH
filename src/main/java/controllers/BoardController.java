package controllers;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import constants.Constants;
import dao.BoardDAO;
import dto.BoardDTO;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println("board cmd: "+cmd);
		
		BoardDAO dao = BoardDAO.getInstance();
		
		try {
			if(cmd.equals("/insert.board")) {
				// 게시글 등록
				
			} else if(cmd.equals("/load.board")) {
				// 게시글 출력
				
			} else if(cmd.equals("/update.board")) {
				// 게시글 수정
				
			} else if(cmd.equals("/delete.board")) {
				// 게시글 삭제
				
			} else if(cmd.equals("/listing.board")) {
				// 게시판 출력 
				String category = request.getParameter("category");
				category = (category==null)?"arcade":category;
				String cpage = request.getParameter("cpage");
				int currentPage = (cpage == null)?1:Integer.parseInt(cpage);
				request.getSession().setAttribute("lastPageNum", currentPage);
				
				List<BoardDTO> list = new ArrayList<>();
				
				// 검색한 카테고리, 키워드에 맞는 페이지 찾기
				String search = request.getParameter("search");
				String keyword = request.getParameter("keyword");
				
				if(keyword == null || keyword.equals("")) {
					// 검색 키워드가 넘어오지 않은 경우
					if(category.equals("arcade")) {
						list = dao.selectByCategory(category ,currentPage * Constants.RECORD_COUNT_PER_PAGE - Constants.RECORD_COUNT_PER_PAGE, Constants.RECORD_COUNT_PER_PAGE);
						request.setAttribute("recordTotalCount", dao.getRecordCount());
					}
					
				}else {
					// 검색 키워드가 넘어온 경우
				}
				
				request.setAttribute("type", "freeBoard");
				request.setAttribute("boardList", list);
				request.setAttribute("recordCountPerPage", Constants.RECORD_COUNT_PER_PAGE);
				request.setAttribute("naviCountPerPage", Constants.NAVI_COUNT_PER_PAGE);
				request.getRequestDispatcher("/board/boardlist.jsp").forward(request, response);
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
