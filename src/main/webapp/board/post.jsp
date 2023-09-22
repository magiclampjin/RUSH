<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>${post.title}</title>

<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/board/post.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script src="/js/board/post.js"></script>

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

.body_guide {
	max-width: 1300px;
	width: 100%;
	height: 100%;
	margin: auto;
}

.w15 {
	width: 15%;
}

.w20 {
	width: 20%;
}

.w35 {
	width: 35%;
}

.w45 {
	width: 45%;
}

.ml20 {
	margin-left: 20px;
}

.mt200 {
	margin-top: 200px;
}

.mt80 {
	margin-top: 80px;
}

.mt10 {
	margin-top: 10px;
}

.mb200 {
	margin-bottom: 200px;
}

.mb80 {
	margin-bottom: 80px;
}

.mb50 {
	margin-bottom: 50px;
}

.mb40 {
	margin-bottom: 40px;
}

.mb30 {
	margin-bottom: 30px;
}

.mb15 {
	margin-bottom: 15px;
}

.mb10 {
	margin-bottom: 10px;
}

.ptb50 {
	padding: 30px 0px;
}

.ptb50 {
	padding: 50px 0px;
}

.pb180 {
	padding-bottom: 180px;
}

.pl15 {
	padding-left: 15px;
}

.postTop {
	min-height: 190px;
	padding: 25px 15px;
}

#postContents {
	min-height: 470px;
	padding: 0px 15px;
}

.postBtns {
	margin: 10px 0px 0px 20px;
	border: 0px;
	border-radius: 10px;
	width: 100px;
	height: 50px;
}

.postBtnsMini {
	margin: 10px 0px 0px 10px;
	border: 0px;
	border-radius: 10px;
	width: 50px;
	height: 50px;
}

.reply{
	padding: 15px 0px 0px 15px;
}

.reply, .nestedReply{
	border: 1px solid #7d7d7d;
}

.replyInsertBtn {
	border: 0px;
	background-color: #ffffff00;
	padding: 0px 25px 25px 0px;
}

.nestedCover {
	padding: 0px 25px 25px 0px;
}

.nestedCover button{
	border: 0px;
	background-color: #ffffff00;
	margin-left:15px;
}


.replyBtns div, .nestedReplyBtn, .nestedReplyPrintBtn {
	cursor: pointer;
}

.nestedReplyBtn:hover ,.nestedReplyPrintBtn:hover{
	text-decoration: underline;
}

.isWriter {
	border: 1px solid #5d6ce1;
	border-radius: 10px;
	margin-left: 10px;
	width: 65px;
	height: 25px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.filename {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.topBtns {
	height: 50px;
	display: flex;
	justify-content: end;
	align-items: center;
}

.topBtns button {
	padding: 5px 10px;
	border: 3px solid black;
	background-color: #FFFFFF00;
	margin-left: 10px;
	border-radius: 5px;
}

.topBtns button:hover, .recommendBtn:hover {
	background-color: #5d6ce1;
	color: white;
	border: 3px solid #5d6ce1;
}

.topBtns button:hover i, .recommendBtn:hover i {
	color: white;
}

.topBtns .btnClicked, .replyBtns .btnClicked {
	background-color: #5d6ce1;
	color: white;
	border: 3px solid #5d6ce1;
}

.btnClicked i {
	color: white;
}

.replyUpdate, .replyDelete, .replyCancel,
.replySave {
	display: flex;
	justify-content: center;
	align-items: center;
}

.recommendBtn {
	border: 2px solid black;
	width: 70px;
	height: 40px;
	border-radius: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	margin: 1px;
}

.nestedReplyPrintBtn{
	margin-right:10px;
}

.ptb15{
	padding:15px 0px;
}

.nopadding{
	padding: 10px 0 0 0;
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

		<div class="body">
			<div class="body_guide">
				<div class="row g-0 mb80">
					<div class="col-12 common fontEnglish fw700 fs40 mt80">자유게시판</div>

					<!-- 글 작성자 = 로그인 사용자이면 글 추천, 글 북마크 버튼 출력 x -->
					<c:choose>
						<c:when test="${loginID ne post.writer}">

							<div class="col-12 topBtns">
								<button id="postRec"><i class="fa-regular fa-thumbs-up"></i>&nbsp;&nbsp;추천</button>
								<button id="bookmark"><i class="fa-regular fa-bookmark"></i>&nbsp;&nbsp;북마크</button>

								<!-- 로그인한 유저가 해당 글을 추천 / 북마크 했는 지 여부 판단 -->
								<c:choose>
									<c:when test="${not empty postRec}">
										<script>
											$("#postRec").attr("class",	"btnClicked");
										</script>
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${not empty bookmark}">
										<script>
											$("#bookmark").attr("class", "btnClicked");
										</script>
									</c:when>
								</c:choose>
							</div>
						</c:when>
					</c:choose>

					<div class="col-12">
						<div class="row g-0 post">
							<div class="col-12 postTop">
								<div class="col-12 fw400 fs35 mb15" id="postTitle">${post.title}
								</div>
								<div class="col-12 fontEnglish fw400 fs25 mb10 pl15"
									id="postWriter">${post.nickName}</div>
								<div class="col-12 fw400 fs20 colorDarkgray pl15"
									id="postDetailInfo">${post.formedDate }&nbsp;&nbsp;&nbsp;조회
									${post.view}</div>
								<hr>
								<div class="col-12 fw400 fs25" id="postContents">${post.contents}</div>
							</div>
						</div>
						<div class="row g-0 postBottom mb40">
							<div class="col-3 col-sm-2 col-xl-1 fw400 fs20 mt10">첨부 파일</div>
							<div class="col-4 col-sm-4 col-xl-5 fw400 fs20 colorBlue mt10 filename">
								<c:choose>
									<c:when test="${files.size() > 0}">
										<c:forEach var="i" items="${files}">
											<a href="/download.file?sysname=${i.systemName}&oriname=${i.originName}">${i.originName}</a><br>
										</c:forEach>
									</c:when>
									<c:otherwise><span class="colorBlack">없음</span></c:otherwise>
								</c:choose>	
							</div>
							<div class="col-5 col-sm-6 d-flex justify-content-end fw400 fs20">
								<div class="d-none d-md-flex">
									<c:choose>
										<c:when test="${ loginID eq post.writer}">
											<button class="postBtns bColorGreen update">수정</button>
											<button class="postBtns bColorGreen delete">삭제</button>
										</c:when>
									</c:choose>
									<button class="postBtns bColorBlue colorWhite goList">목록</button>
								</div>

								<div class="d-md-none">
									<c:choose>
										<c:when test="${ loginID eq post.writer}">
											<button class="postBtnsMini bColorGreen update">
												<i class="fa-solid fa-pen-to-square"></i>
											</button>
											<button class="postBtnsMini bColorGreen delete">
												<i class="fa-solid fa-trash-can"></i>
											</button>
										</c:when>
									</c:choose>
									<button class="postBtnsMini bColorBlue colorWhite goList">
										<i class="fa-solid fa-bars" style="color: #ffffff;"></i>
									</button>
								</div>

								<input type="hidden" id="cpage" value="${cpage}"> <input
									type="hidden" id="category" value="${category}">
							</div>
						</div>
					</div>
					<div class="row g-0">
						<div class="col-12 common fontEnglish fw700 fs35 mb40">댓글</div>
						<div class="col-12 mb30">
							<div class="row g-0 replyInput">
								<div class="col-10 col-lg-11" id="replyInsertTxt"
									contenteditable></div>
								<input type="hidden" id="postSeq" value="${post.seq}">
								<div class="col-2 col-lg-1 btnCover">
									<button class="fw400 fs25 colorDarkgray replyInsertBtn"
										id="replyInsertBtn">등록</button>
								</div>
							</div>
						</div>

						<div class="col-12">
							<input type="hidden" id="loginID" value="${loginID}"> <input
								type="hidden" id="postWriterName" value="${post.writer}">
							<div class="row g-0 replys  justify-content-end" id="replys">
							</div>
							<div id="pagination" class="mb200"></div>
							<input type="hidden" id="recordTotalCount" value="${recordTotalCount }">
							<input type="hidden" id="recordCountPerPage" value="${recordCountPerPage }"> 
							<input type="hidden" id="naviCountPerPage" value="${naviCountPerPage }"> 
							<input type="hidden" id="lastPageNum" value="${lastPageNum }"> 
						</div>
					</div>
				</div>
			</div>


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