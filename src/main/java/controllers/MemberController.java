package controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import commons.EncryptionUtils;
import dao.MemberDAO;
import dto.MemberDTO;

@WebServlet("*.member")
public class MemberController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf8");
		response.setContentType("text/html;charset=utf8");
		
		String cmd = request.getRequestURI();
		System.out.println("member cmd: "+cmd);
		
		MemberDAO dao = MemberDAO.getInstance();
		
		try {
			if(cmd.equals("/insert.member")) {
				// 회원 가입 (회원 정보 등록)
				String id = request.getParameter("id");
				String pw = EncryptionUtils.getSHA512(request.getParameter("pw"));
				String idNumber = request.getParameter("birth");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String nickName = request.getParameter("nickname");
				String phone = request.getParameter("contact");
				boolean agreement = Boolean.parseBoolean(request.getParameter("agree"));
				
				dao.insert(new MemberDTO(id, pw, idNumber, name, email, nickName, phone, agreement));
				response.sendRedirect("/index.jsp");
				
			} else if(cmd.equals("/idCheck.member")) {
				// 아이디 중복 체크
				PrintWriter pw = response.getWriter();
				String id = request.getParameter("id");

				boolean result = dao.selectById(id);
				if(result) {
					pw.append("used");
				} else {
					pw.append("usable");
				}
				
			} else if(cmd.equals("/nicknameCheck.member")) {
				// 닉네임 중복 체크
				PrintWriter pw = response.getWriter();
				String nickName = request.getParameter("nickname");

				boolean result = dao.selectByNickname(nickName);
				if(result) {
					pw.append("used");
				} else {
					pw.append("usable");
				}
				
			} else if(cmd.equals("/load.member")) {
				// 마이페이지 (회원 정보 출력)
				
			} else if(cmd.equals("/update.member")) {
				// 회원 정보 수정
				
			} else if(cmd.equals("/delete.member")) {
				// 회원 탈퇴 (회원 정보 삭제)
				
			} else if(cmd.equals("/login.member")) {
				// 회원 로그인
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				
				boolean isAuthenticated = dao.selectByIdPw(id, pw);
				
				if(isAuthenticated) { // 로그인에 성공하는 순간
					request.getSession().setAttribute("loginID", id); // session scope
				}	

				response.sendRedirect("/index.jsp");
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
