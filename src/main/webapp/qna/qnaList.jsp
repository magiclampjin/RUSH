<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 목록</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css">
<style>
* {
	box-sizing: border-box;
}

body {
	width: 1920px;
}

.container {
	width: 1155px;
	margin: auto;
	padding: none;
}

.qna {
	margin: 40px 0px;
	font: bold;
}

.qnaNav, .qnaContents {
	width: 100%;
	border-bottom: 2px solid #7D7D7D;
}

ul {
	display: flex;
	list-style: none;
}

ul li {
	text-align: center;
}

.inside {
	height: 50px;
	width: 100%; justify-content : center;
	align-items: center;
	border-bottom: 1px solid #7D7D7D;
	align-items: center;
	justify-content: center;
}

.qnaContents .inside ul {
	list-style: none;
}

.qnaContents .inside a li {
	display: flex;
	align-items: center;
	justify-content: center;
}

.qnaContents .inside a {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
}

#pages {
	width: 100%;
	text-align: center;
	margin: 40px 0px;
}

.bottom {
	width: 100%;
	padding-bottom: 100px;
}

.search {
	text-align: center;
}

.h50 {
	height: 50px;
	margin-right: 15px;
}

.btn {
	background-color: #CCF423;
	border-radius: 10px;
}

.sideTap {
	border: 1px solid black;
	border-radius: 10px; position : fixed;
	width: 120px;
	height: 80px;
	position: fixed; width : 120px; height : 80px;
	top: 30%;
	left: 10%;
}

.side {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 50%;
}

a {
	text-decoration: none;
}
</style>
</head>
<body>
	<div class="container-fluid p-0">
		<div class="sideTap m-0">
			<div class="side">
				<a href="">자유게시판</a>
			</div>
			<div class="side" style="border-top: 1px solid black;">
				<a href="">Q&A</a>
			</div>
		</div>

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

		<div class="container row g-0">
			<div class="qna col-12">
				<h2 class="fontEnglish">Q&A</h2>
			</div>
			<div class="qnaBox col-12 g-0">
				<div class="qnaNav row m-0">
					<ul class="p-0">
						<li class="col-1">번호</li>
						<li class="col-5">제목</li>
						<li class="col-2">작성자</li>
						<li class="col-2">작성일</li>
						<li class="col-1">조회</li>
						<li class="col-1">파일</li>
					</ul>
				</div>
				<div class="qnaContents col-12 g-0">
					<c:forEach begin="0" end="10" step="1">
						<div class="inside row m-0">
							<ul class="p-0">
								<a href="">
									<li class="col-1">번호</li>
									<li class="col-5">제목</li>
									<li class="col-2">작성자</li>
									<li class="col-2">작성일</li>
									<li class="col-1">조회</li>
									<li class="col-1">파일</li>
								</a>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
			<div id="pages">1 2 3 4 5 6 7 8 8 10 > >></div>
			<div class="bottom row m-0 g-0">
				<div class="col-1"></div>
				<div class="search col-10">
					<select class="selectBox h50"
						style="width: 130px; text-align: center">
						<option value="title">제목</option>
						<option value="writer">글쓴이</option>
						<option value="contents">내용</option>
					</select> <input class="h50" type="text" placeholder="검색할 내용을 입력하세요."
						style="width: 300px;"> <input class="h50 btn"
						type="button" value="검색" style="width: 85px;">
				</div>
				<div class="col-1">
					<a class="writeBtn" href=""> <input class="h50 btn"
						type="button" value="글쓰기" style="width: 100px;">
					</a>
				</div>
			</div>

		</div>
		<div class="footer bColorBlack">
			<div class="footer_guide">
				<div class="footer_logo fontLogo colorWhite">RUSH</div>
				<div class="copy fontEnglish colorWhite">COPYRIGHT © SKY. ALL
					RIGHT RESERVED</div>
				<div class="footer_contents">
					<div class="about conDiv fontEnglish colorWhite">
						<div class="footer_title fontEnglish">ABOUT US</div>
						<div class="footer_con ">
							<div class="con">팀명 :</div>
							<div class="encon">SKY</div>
						</div>
					</div>
					<div class="office conDiv fontEnglish colorWhite">
						<div class="footer_title fontEnglish">OFFICE</div>
						<div class="footer_con">
							<div class="con">
								충청남도 천안시 서북구<br> 천안대로 1223-24
							</div>
						</div>
					</div>
					<div class="contact conDiv fontEnglish colorWhite">
						<div class="footer_title fontEnglish">CONTACT US</div>
						<div class="footer_con fontEnglish">
							<div class="con fontEnglish">a@naver.com</div>
							<div class="con fontEnglish">01012345678</div>
						</div>
					</div>
					<div class="provision conDiv fontEnglish colorWhite">
						<div class="footer_title fontEnglish">PROVISION</div>
						<div class="footer_con">
							<div class="con">개인정보 처리방침</div>
							<div class="con">서비스 이용약관</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>

<script>
// let recordCountPerPage = ${recordCountPerPage};
// let naviCountPerPage = ${naviCountPerPage};
// let currentPage = ${currentPage};
// let recordTotalCount = ${recordTotalCount};

// let pagaeTotalCount = 0;
// // 전체 페이지의 개수 정하기
// if(recordTotalCount % recordCountPerPage >0){
// 	pagaeTotalCount = recordTotalCount / recordCountPerPage + 1;
// }else{
// 	pagaeTotalCount = recordTotalCount / recordCountPerPage;
// }

// // 현재 페이지가 1보다 작거나, 전체 페이지 수보다 클때
// if(currentPage < 1){
// 	currentPage = 1;
// }else if(currentPage > pagaeTotalCount){
// 	currentPage = pagaeTotalCount;
// }

// // 네비 숫자 정하기
// let startNavi = Math.floor((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1
// let endNavi = startNavi + (naviCountPerPage - 1);

// if(endNavi > pagaeTotalCount){
// 	endNavi = pagaeTotalCount;
// }


// // 네비게이션을 추가해줄 요소를 얻어옴
// let pages = $("#pages")

// // 더 보여줄 앞장, 뒷장이 있는지
// let needPrev = true;
// let needNext = true;
// // 네비값이 1이면 앞장 안보여줌, 네비값이 끝장이면 뒷장 안보여줌
// if(startNavi == 1){needPrev = false;}
// if(endNavi == pagaeTotalCount){needNext = false;}

// if(needPrev) {
// 	pages.append("<a href='"+(startNavi-1)+"'>"+"<<"+"</a>");
// }

// for(let i=startNavi;i<=endNavi;i++){
// 	pages.append("<a href='"+i+"'>"+i+" </a>");
// }

// if(needNext){
// 	pages.append("<a href='"+(endNavi+1)+"'>"+">>"+"</a>");
// }
</script>

</html>