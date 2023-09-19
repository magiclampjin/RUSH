<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/board/freeboard.css">
<script type="text/javascript" src="/js/board/boardTab.js"></script>
<script type="text/javascript" src="/js/board/boardMainPagination.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
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
	text-decoration: none;
}

.dropdown-menu[data-bs-popper] {
	right: 0;
	left: auto;
}
</style>
</head>
<body>
	<div class="container-fluid p-0">
		<div class="header bColorBlack">
			<div class="header_guide">
				<a href="#">
					<div class="logo fontLogo colorWhite">RUSH</div>
				</a>
				<nav class="navbar navbar-expand navbar-light colorWhite">
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
										<li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Another
												action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Something
												else here</a></li>
									</ul></li>
								<li class="nav-item dropdown col-3 text-end"><a
									class="nav-link text-white fontEnglish" href="#"
									id="navbarDropdownMenuLink" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> AWARDS </a>
									<ul class="dropdown-menu p-0"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Another
												action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Something
												else here</a></li>
									</ul></li>
								<li class="nav-item dropdown col-3 text-end"><a
									class="nav-link text-white fontEnglish" href="#"
									id="navbarDropdownMenuLink" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> BOARD </a>
									<ul class="dropdown-menu p-0"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Another
												action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Something
												else here</a></li>
									</ul></li>
								<li class="nav-item dropdown col-3 text-end"><a
									class="nav-link text-white fontEnglish" href="#"
									id="navbarDropdownMenuLink" role="button"
									data-bs-toggle="dropdown" aria-expanded="false"> LOGIN </a>
									<ul class="dropdown-menu p-0"
										aria-labelledby="navbarDropdownMenuLink">
										<li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Another
												action</a></li>
										<li><a class="dropdown-item fontEnglish" href="#">Something
												else here</a></li>
									</ul></li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>

		<div class="board">
			<div class="board_guide">
				<div class="boardNav">
					<div class="boardNav_body">
						<a href="/listing.board?cpage=1"><div class="boardNav_li bColorGreen">자유게시판</div></a>
						<a href="/listing.qna?cpage=1"><div class="boardNav_li fontEnglish">Q&A</div></a>
					</div>
				</div>
				<div class="boardCont">
					<div class="boardTitle">자유게시판</div>
					<ul class="tabs boardTabs">
						<a href="/listing.board?category=rhythm&cpage=1" class="rhythm current"><li
							class="tab-link">리듬게임</li></a>
						<a href="/listing.board?category=arcade&cpage=1" class="arcade"><li
							class="tab-link">아케이드게임</li></a>
						<a href="/listing.board?category=puzzle&cpage=1" class="puzzle"><li
							class="tab-link">퍼즐게임</li></a>
					</ul>
					

					<div class="boardHeader">
						<div class="num">번호</div>
						<div class="title">제목</div>
						<div class="writer">작성자</div>
						<div class="date">작성일</div>
						<div class="view">조회</div>
						<div class="recommend">추천</div>
						<div class="file">파일</div>
					</div>
					<div class="boardMain">
						<c:forEach var="noti" items="${notiList }">
							<div class="post bColorBoard">
								<div class="maxBoard">
									<div class="num"></div>
									<div class="title">
										<div class="loud">
											<i class="fa-solid fa-bullhorn"></i>
										</div>
										<a href="/load.board?cpage=${cpage }&seq=${noti.seq }&category=${category }"><div class="mainTitle">${noti.title }</div></a>
										
										<div class="replyCnt colorPink fontEnglish">${noti.replyCount }</div>
									</div>
									<div class="writer">${noti.nickName }</div>
									<div class="date">${noti.stringFormat }</div>
									<div class="view fontEnglish">${noti.view }</div>
									<div class="recommend fontEnglish">${noti.recommend }</div>
									<div class="file">
										<i class="fa-solid fa-paperclip"></i>
									</div>
								</div>
								<div class="minBoard">
									<div class="num"></div>
									<div class="minCon">
										<div class="title">
											<div class="loud">
												<i class="fa-solid fa-bullhorn"></i>
											</div>
											<a href="/load.board?cpage=${cpage }&seq=${noti.seq }&category=${category }&category=${category }"><div class="mainTitle">${noti.title }</div></a>
											<div class="replyCnt colorPink fontEnglish">${noti.replyCount }</div>
										</div>
										<div class="info">
											<div class="minWriter colorDarkgray">${noti.nickName }</div>
											<div class="minDate colorDarkgray">${noti.stringFormat }</div>
											<div class="minView fontEnglish colorDarkgray"><i class="fa-regular fa-eye"></i>&nbsp;${noti.view }</div>
											<div class="minRecommend fontEnglish colorDarkgray"><i class="fa-regular fa-thumbs-up"></i>&nbsp;${noti.recommend }</div>
											<div class="minFile">
												<i class="fa-solid fa-paperclip"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<c:forEach var="post" items="${boardList }">
							<div class="post">
								<div class="maxBoard">
									<div class="num fontEnglish">${post.seq }</div>
									<div class="title">
										<a href="/load.board?cpage=${cpage }&seq=${post.seq }&category=${category }"><div class="mainTitle">${post.title }</div></a>
										<div class="replyCnt colorPink fontEnglish">${post.replyCount }</div>
									</div>
									<div class="writer">${post.nickName }</div>
									<div class="date">${post.stringFormat }</div>
									<div class="view fontEnglish">${post.view }</div>
									<div class="recommend fontEnglish">${post.recommend }</div>
									<div class="file">
										<i class="fa-solid fa-paperclip"></i>
									</div>
								</div>
								<div class="minBoard">
									<div class="num fontEnglish">${post.seq }</div>
									<div class="minCon">
										<div class="title">
											<div class="loud">
												<i class="fa-solid fa-bullhorn"></i>
											</div>
											<a href="/load.board?cpage=${cpage }&seq=${post.seq }"><div class="mainTitle">${post.title }</div></a>
											<div class="replyCnt colorPink fontEnglish">${post.replyCount }</div>
										</div>
										<div class="info">
											<div class="minWriter colorDarkgray">${post.nickName }</div>
											<div class="minDate colorDarkgray">${post.stringFormat }</div>
											<div class="minView fontEnglish colorDarkgray"><i class="fa-regular fa-eye"></i>&nbsp;${post.view }</div>
											<div class="minRecommend fontEnglish colorDarkgray"><i class="fa-regular fa-thumbs-up"></i>&nbsp;${post.recommend }</div>
											<div class="minFile">
												<i class="fa-solid fa-paperclip"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>

					</div>
					<div id="pagination"></div>
					<div class="search_write">
						<div class="write"></div>
						<div class="search">
							<form action="">
								<div class="category">
									<select class="form-select" aria-label="Default select example">
										<option value="title" selected>제목</option>
										<option value="writer">작성자</option>
										<option value="content">내용</option>
									</select>
								</div>
								<div class="keyword">
									<input type="text">
								</div>
								<div class="sertchBtn">
									<input type="submit" class="boardBtn bColorGreen" value="검색">
								</div>
							</form>

						</div>
						<div class="write">
							<input type="button" value="글쓰기" class="boardBtn bColorGreen">
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<input type="hidden" value="${category }" id="category">
		<input type="hidden" id="recordTotalCount" value="${recordTotalCount }">
		<input type="hidden" id="recordCountPerPage" value="${recordCountPerPage }">
		<input type="hidden" id="naviCountPerPage" value="${naviCountPerPage }">
		<input type="hidden" id="lastPageNum" value="${lastPageNum }">
		
		<a href="#">
			<div class="upArrow bColorPink colorWhite">
				<i class="fa-solid fa-arrow-up-long"></i>
			</div>
		</a>

		<div class="footer bColorBlack">
			<div class="footer_guide">
				<div class="footer_logo fontLogo colorWhite">RUSH</div>
				<div class="copy fontEnglish colorWhite">COPYRIGHT © SKY. ALL
					RIGHT RESERVED</div>
				<div class="footer_contents">
					<div class="about conDiv fontEnglish">
						<div class="footer_title fontEnglish colorWhite">ABOUT US</div>
						<div class="footer_con ">
							<div class="con colorWhite">팀명 :</div>
							<div class="encon colorWhite">SKY</div>
						</div>
					</div>
					<div class="office conDiv fontEnglish">
						<div class="footer_title fontEnglish colorWhite">OFFICE</div>
						<div class="footer_con">
							<div class="con colorWhite">충청남도 천안시 서북구 천안대로 1223-24</div>
						</div>
					</div>
					<div class="contact conDiv fontEnglish">
						<div class="footer_title fontEnglish colorWhite">CONTACT US</div>
						<div class="footer_con fontEnglish">
							<div class="con fontEnglish colorWhite">a@naver.com</div>
							<div class="con fontEnglish colorWhite">01012345678</div>
						</div>
					</div>
					<div class="provision conDiv fontEnglish">
						<div class="footer_title fontEnglish colorWhite">PROVISION</div>
						<div class="footer_con">
							<div class="con colorWhite">개인정보 처리방침</div>
							<div class="con colorWhite">서비스 이용약관</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>