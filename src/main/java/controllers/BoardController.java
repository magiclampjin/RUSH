package controllers;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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

import com.google.gson.Gson;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import constants.Constants; //pagination에 사용 될 상수 저장용
import dao.BoardDAO;
import dao.FileDAO;
import dao.GameDAO;
import dto.BoardDTO;
import dto.FileDTO;
import dto.GameRecordDTO;

@WebServlet("*.board")
public class BoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // 한글깨짐방지
		response.setContentType("text/html;charset=utf8"); // 한글깨짐방지

		String cmd = request.getRequestURI();
		System.out.println("board cmd: " + cmd);

		BoardDAO dao = BoardDAO.getInstance();
		FileDAO fdao = FileDAO.getInstance();
		GameDAO gdao = GameDAO.getInstance();
		PrintWriter pw = response.getWriter();
		Gson gson = new Gson();

		try {
			if (cmd.equals("/insert.board")) {
				// 게시글 등록
				int maxSize = 1024 * 1024 * 10; // 업로드 파일 최대 사이즈 10mb로 제한

				String uploadPath = request.getServletContext().getRealPath("files");
				File filepath = new File(uploadPath);
				if (!filepath.exists()) {
					filepath.mkdir();
				}
				MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "utf8",
						new DefaultFileRenamePolicy());
				String category = multi.getParameter("category");
				String title = multi.getParameter("title");
				String content = multi.getParameter("contents");

				String id = (String) request.getSession().getAttribute("loginID");
				String userNick = (String) request.getSession().getAttribute("loginNickname");
				int parentSeq = dao.insert(new BoardDTO(0, id, category, userNick, title, content, null, 0));

				Enumeration<String> fileNames = multi.getFileNames(); // 보내진 파일들 이름의 리스트

				while (fileNames.hasMoreElements()) { // 파일이 존재하는 동안
					String fileName = fileNames.nextElement(); // 다음 파일을 불러옴
					if (multi.getFile(fileName) != null) {

						String ori_name = multi.getOriginalFileName(fileName);
						String sys_name = multi.getFilesystemName(fileName);
						FileDTO fileDto = new FileDTO(0, parentSeq, ori_name, sys_name, false, false);
						int fileResult = fdao.insert(fileDto);
					}
				}

				// 세션에 저장해둔 첨부 이미지의 parentSeq를 변경
				if (request.getSession().getAttribute("fileSeq") != null) {
					List<Integer> fileSeq = (List<Integer>) request.getSession().getAttribute("fileSeq");
					for (int i = 0; i < fileSeq.size(); i++) {
						fdao.updateParentSeq(parentSeq, fileSeq.get(i));
					}

					// 첨부 이미지의 parentSeq를 변경해줬다면 session정보 지우기
					request.getSession().removeAttribute("fileSeq");
				}

				if (parentSeq != 0) {
					response.sendRedirect("/listing.board?cpage=1&category=" + category);
				}

			} else if (cmd.equals("/load.board")) {
				String cpage = request.getParameter("cpage");
		        int currentPage = (cpage == null || cpage=="") ? 1 : Integer.parseInt(cpage);

				int postSeq = Integer.parseInt(request.getParameter("seq"));
				String category = request.getParameter("category");
				category = (category == null || category=="") ? "":category;
				String search = request.getParameter("search");
				String keyword = request.getParameter("keyword");
				
				BoardDTO post = dao.selectPost(postSeq);

				if(post == null) {
					System.out.println("포스트 삭제됨.. alert창 띄우고 boardList로 이동하게 구현하기");
				}
				boolean postRec = dao.checkPostRecommend(postSeq,
						(String) request.getSession().getAttribute("loginID"));
				boolean bookmark = dao.checkPostBookmark(postSeq,
						(String) request.getSession().getAttribute("loginID"));
				request.setAttribute("post", post);
				request.setAttribute("cpage", currentPage);
				request.setAttribute("category", category);

				if (postRec)
					request.setAttribute("postRec", postRec);
				if (bookmark)
					request.setAttribute("bookmark", bookmark);

				List<FileDTO> files = fdao.selectForPost(postSeq);
				request.setAttribute("files", files);
				
				if(search != null) {
					request.setAttribute("search",search);
					request.setAttribute("keyword",keyword);
				}
				request.getRequestDispatcher("/board/post.jsp").forward(request, response);

			} else if (cmd.equals("/updateLoad.board")) {
				// 게시글 수정
				int postSeq = Integer.parseInt(request.getParameter("postSeq"));
				String cpage = request.getParameter("cpage");
				int currentPage = (cpage == null || cpage=="") ? 1 : Integer.parseInt(cpage);
				String category = request.getParameter("category");
				String menu = request.getParameter("menu");
				String search = request.getParameter("search");
				String keyword = request.getParameter("keyword");
				
				List<FileDTO> files = fdao.inPostFilesList(postSeq);
				BoardDTO post = dao.selectPost(postSeq);
				
				request.setAttribute("category", category);
				request.setAttribute("files", files);
				request.setAttribute("post", post);
				request.setAttribute("cpage", currentPage);
				request.setAttribute("menu", menu);
				if(search != null) {
					request.setAttribute("search",search);
					request.setAttribute("keyword",keyword);
				}
				request.getRequestDispatcher("/board/postUpdate.jsp").forward(request, response);
				

			} else if (cmd.equals("/update.board")) {
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
				String category = multi.getParameter("category");
				int postSeq = Integer.parseInt(multi.getParameter("postSeq"));
				String title = multi.getParameter("title");
				String content = multi.getParameter("contents");
				
				// 게시글 수정 시 수정된 파일 DB, realpath에서 삭제
				String[] deleteFileSeqStr = multi.getParameter("deleteFiles").split(",");
				for(int i=0; i<deleteFileSeqStr.length-1; i++) {
					String sysname = fdao.selectSysName(Integer.parseInt(deleteFileSeqStr[i+1]));
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
				
				String search = multi.getParameter("search");
				String keyword = multi.getParameter("keyword");
				keyword = URLEncoder.encode(keyword, StandardCharsets.UTF_8.toString());
				
				String id = (String) request.getSession().getAttribute("loginID");
				String userNick = (String) request.getSession().getAttribute("loginNickname");
				dao.update(new BoardDTO(postSeq, id, category, userNick, title, content, null, 0));

				Enumeration<String> fileNames = multi.getFileNames(); // 보내진 파일들 이름의 리스트

				while (fileNames.hasMoreElements()) { // 파일이 존재하는 동안
					String fileName = fileNames.nextElement(); // 다음 파일을 불러옴
					if (multi.getFile(fileName) != null) {

						String ori_name = multi.getOriginalFileName(fileName);
						String sys_name = multi.getFilesystemName(fileName);
						FileDTO fileDto = new FileDTO(0, postSeq, ori_name, sys_name, false, false);
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

				if(search != null) {
					response.sendRedirect("/load.board?seq="+postSeq+"&category=" + category+"&cpage="+cpage+"&search="+search+"&keyword="+keyword);
				} else {
					response.sendRedirect("/load.board?seq="+postSeq+"&category=" + category+"&cpage="+cpage);
				}
						

			} else if (cmd.equals("/delete.board")) {
				// 게시글 삭제
				// 이미지 삭제해야대..
				int postSeq = Integer.parseInt(request.getParameter("postSeq"));
				String category = request.getParameter("category");
				List<String> filesName = fdao.inPostFilesNameList(postSeq);
				
				String uploadPath = request.getServletContext().getRealPath("files");
				for(String file:filesName) {
					File filepath = new File(uploadPath+"/"+file);
					filepath.delete();
					// 외래키 cascade로 설정하면 DB에서는 게시글 삭제할 때 연쇄적으로 삭제됨. 
				}
				dao.deletePost(postSeq);
				response.sendRedirect("/listing.board?cpage=1&category=" + category);
			} else if (cmd.equals("/listing.board")) {
				// 게시판 출력
				String category = request.getParameter("category");
				category = (category == null) ? "rhythm" : category;

				String cpage = request.getParameter("cpage");
				int currentPage = (cpage == null || cpage=="") ? 1 : Integer.parseInt(cpage);
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
					// 제목으로 검색
					if (search.equals("title")) {
						list = dao.selectByTitle(category, keyword,
								currentPage * Constants.RECORD_COUNT_PER_PAGE - Constants.RECORD_COUNT_PER_PAGE,
								Constants.RECORD_COUNT_PER_PAGE);
						request.setAttribute("recordTotalCount", dao.getRecordCountTitle(category, keyword));

					} else if (search.equals("writer")) {
						list = dao.selectByWriter(category, keyword,
								currentPage * Constants.RECORD_COUNT_PER_PAGE - Constants.RECORD_COUNT_PER_PAGE,
								Constants.RECORD_COUNT_PER_PAGE);
						request.setAttribute("recordTotalCount", dao.getRecordCountWriter(category, keyword));

					} else if (search.equals("content")) {
						list = dao.selectByContents(category, keyword,
								currentPage * Constants.RECORD_COUNT_PER_PAGE - Constants.RECORD_COUNT_PER_PAGE,
								Constants.RECORD_COUNT_PER_PAGE);
						request.setAttribute("recordTotalCount", dao.getRecordCountContents(category, keyword));
					}

					request.setAttribute("search", search);
					request.setAttribute("keyword", keyword);

				}
				// 게시글
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

				// 게시글을 작성하던 중에 목록으로 넘어오게되면 절대경로에 저장되어있던 이미지 파일과 DB에 parent가 없는 이미지 파일 지우기
				if (request.getSession().getAttribute("fileSeq") != null) {
					List<Integer> fileSeq = (List<Integer>) request.getSession().getAttribute("fileSeq");
					String uploadPath = request.getServletContext().getRealPath("files");

					for (int i = 0; i < fileSeq.size(); i++) {
						String fileSys_name = fdao.selectSysName(fileSeq.get(i));
						File filepath = new File(uploadPath + "/" + fileSys_name);
						filepath.delete();
						fdao.deleteFile(fileSeq.get(i));
					}

				}
			} else if (cmd.equals("/write.board")) {
				String menu = request.getParameter("menu");
				String category = request.getParameter("category");
				request.setAttribute("menu", menu);
				request.setAttribute("category", category);
				request.getRequestDispatcher("/board/boardWrite.jsp").forward(request, response);
			} else if (cmd.equals("/insertRecommend.board")) {
				int postSeq = Integer.parseInt(request.getParameter("postSeq"));
				int result = dao.insertPostRecommend(postSeq, (String) request.getSession().getAttribute("loginID"));
				pw.append(gson.toJson(result));
			} else if (cmd.equals("/deleteRecommend.board")) {
				int postSeq = Integer.parseInt(request.getParameter("postSeq"));
				int result = dao.deletePostRecommend(postSeq, (String) request.getSession().getAttribute("loginID"));
				pw.append(gson.toJson(result));
			} else if (cmd.equals("/insertBookmark.board")) {
				int postSeq = Integer.parseInt(request.getParameter("postSeq"));
				int result = dao.insertPostBookmark(postSeq, (String) request.getSession().getAttribute("loginID"));
				pw.append(gson.toJson(result));
			} else if (cmd.equals("/deleteBookmark.board")) {
				int postSeq = Integer.parseInt(request.getParameter("postSeq"));
				int result = dao.deletePostBookmark(postSeq, (String) request.getSession().getAttribute("loginID"));
				pw.append(gson.toJson(result));
				
			} else if(cmd.equals("/moveToAwards.board")) {
				// 명예의 전당으로 이동
				List<String> list = new ArrayList();
				list = gdao.selectGameName();
				request.setAttribute("gNameList", list);
				request.getRequestDispatcher("/board/awards.jsp").forward(request, response);
				
			} else if(cmd.equals("/rankerList.board")) {
				// 상위 랭커 리스트 가져오기
				String game = request.getParameter("game");
				
				List<GameRecordDTO> rankerList = new ArrayList();
				rankerList = gdao.selectUserByGame(game);
				pw.append(gson.toJson(rankerList));
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
