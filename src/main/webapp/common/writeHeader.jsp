<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<script type="text/javascript" src="/js/board/summernote_editor.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
			<link
		href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
		rel="stylesheet">
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link
		href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
		rel="stylesheet">
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<link rel="stylesheet" href="/css/main.css">
<style>
* {
	box-sizing: border-box;
	margin: 0px;
	padding: 0px;
	text-decoration: none;
	list-style: none;
}

.container {
	width: 100%;
}

a {
	text-decoration: none !important;
}

.dropdown-menu[data-bs-popper] {
	right: 0;
	left: auto;
}

.mb0{
	margin-bottom: 0px !important;
}

#navbarNavDropdown{
	-webkit-box-shadow:inset 0 1px 0 rgba(255,255,255,0);
	box-shadow: inset 0 1px 0 rgba(255,255,255,0);
	
}
</style>
</head>
<body>
	<header class="header bColorBlack">
		<div class="header_guide">
			<a href="/index.jsp">
				<div class="logo fontLogo colorWhite" >RUSH</div>
			</a>
			<nav class="navbar navbar-expand navbar-light colorWhite mb0">
				<div class="container-fluid p-0">
					<div class="collapse navbar-collapse w-100 g-0 m-0"
						id="navbarNavDropdown">
						<ul class="navbar-nav row g-0 w-100">
							<li class="nav-item dropdown col-3 text-end"><a
								class="nav-link text-white fontEnglish" href="#"
								id="navbarDropdownMenuLink" role="button"
								data-bs-toggle="dropdown" aria-expanded="false"> GAME </a>
								<ul class="dropdown-menu p-0"
									aria-labelledby="navbarDropdownMenuLink">
									<li><a class="dropdown-item fontEnglish"
										href="/game/GamePage_Main.jsp">Main</a></li>
									<li><a class="dropdown-item fontEnglish"
										href="/game/GamePage_BestGame.jsp">BestGame</a></li>
								</ul></li>
							<li class="nav-item dropdown col-3 text-end"><a
								class="nav-link text-white fontEnglish"
								href="/moveToAwards.board"> AWARDS </a></li>
							<li class="nav-item dropdown col-3 text-end"><a
								class="nav-link text-white fontEnglish"
								href="/listing.board?cpage=1" id="navbarDropdownMenuLink"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
									BOARD </a>
								<ul class="dropdown-menu p-0"
									aria-labelledby="navbarDropdownMenuLink">
									<li><a class="dropdown-item" href="/listing.board?cpage=1">자유게시판</a></li>
									<li><a class="dropdown-item fontEnglish"
										href="/listing.qna?cpage=1">Q&A</a></li>
									<li><a class="dropdown-item" href="/moveToAwards.board">명예의
											전당</a></li>
								</ul></li>
							<c:choose>
								<c:when test="${loginID == null }">
									<li class="nav-item dropdown col-3 text-end p8"><a
										class="text-white fontEnglish"
										href="/member/login.jsp"> LOGIN </a></li>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${loginID == 'admin' }">
											<li class="nav-item dropdown col-3 text-end"><a
												class="nav-link text-white fontEnglish"
												href="/load.member"
												id="navbarDropdownMenuLink" role="button"
												data-bs-toggle="dropdown" aria-expanded="false"> MYPAGE
											</a>
												<ul class="dropdown-menu p-0"
													aria-labelledby="navbarDropdownMenuLink">
													<li><a class="dropdown-item fontEnglish"
														href="/load.member">MyPage</a></li>
														<li><a class="dropdown-item fontEnglish"
														href="/member/adminDashBoard.jsp">DashBoard</a></li>
													<li><a class="dropdown-item fontEnglish"
														href="/logout.member">Log Out</a></li>
												</ul></li>
										</c:when>
										<c:otherwise>
											<li class="nav-item dropdown col-3 text-end"><a
												class="nav-link text-white fontEnglish"
												href="/load.member"
												id="navbarDropdownMenuLink" role="button"
												data-bs-toggle="dropdown" aria-expanded="false"> MYPAGE
											</a>
												<ul class="dropdown-menu p-0"
													aria-labelledby="navbarDropdownMenuLink">
													<li><a class="dropdown-item fontEnglish"
														href="/load.member">MyPage</a></li>
													<li><a class="dropdown-item fontEnglish"
														href="/logout.member">Log Out</a></li>
												</ul></li>
										</c:otherwise>
									</c:choose>

								</c:otherwise>
							</c:choose>



							<script type="text/javascript">
								console.log("${loginID }")
							</script>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>

</body>
</html>