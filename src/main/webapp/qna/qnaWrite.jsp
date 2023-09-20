<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시글 작성</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script type="text/javascript" src="/js/board/qnaWriteSecret.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="/css/main.css">
<style>
* {
	box-sizing: border-box;
	font-family: Noto Sans KR, Jost;
}

.container {
	width: 1300px;
	margin: auto;
}

.titleBox {
	margin: 10px 0px;
}

.inputTitle {
	width: 100%;
}

.qna {
	height: 50px;
	margin: 40px 0px;
	border-bottom: 1px solid #7D7D7D;
	font: bold;
}

.titleBox {
	width: 100%;
	height: 50px;
}

.fileBox {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #7D7D7D;
}

.inputTitle {
	height: 100%;
}

.bottom {
	margin: 50px 0 100px 0;
	position: relative;
}

#btnAdd {
	border: none;
	background-color: #CCF423;
	border-radius: 10px;
	width: 30px;
	height: 30px;
}

.submitBtn {
	border: none;
	background-color: #CCF423;
	border-radius: 10px;
	width: 100px;
	height: 50px;
}

.screteChk {
	width: 20px;
	height: 20px;
}

label {
	margin: 0 10px;
	position: absolute;
	top: 3px;
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
		
		
		<c:choose>
			<c:when test="${menu == 'qna'}">
				<div class="container row g-0 p-0">
					<form action="/insert.qna" method="post" enctype="multipart/form-data">
						<!-- 카테고리 숨겨놓음 -->
						<input type="hidden" value="${category }" name="category">
						<div class="qna col-12">
							<h2 class="fontEnglish">Q&A - 게시글 작성</h2>
						</div>
						<div class="titleBox col-12">
							<input class="inputTitle" type="text" name="title"
								placeholder="제목을 입력하세요">
						</div>
						<div class="col-12 fileBox">
							<button type="button" id="btnAdd">+</button>
							<span>파일첨부</span>
							<div id="fileContainer"></div>
						</div>
						<div class="col-12">
							<textarea id="summernote" class="content" rows="35" cols="100"
								placeholder="내용을 입력하세요." name="contents"></textarea>
						</div>
						<div class="row bottom">
							<div class="col-11">
								<input id="secret" class="screteChk" type="checkbox">
								<input id="secret_hidden" class="screteChk" type="hidden" name="secret" value="false">
								
								<label for="secret" class="colorDarkgray">비밀글 설정하기</label>
								
							</div>
		
							<input class="submitBtn col-1" type="submit" value="작성">
						</div>
					</form>
				</div>
			</c:when>
			<c:otherwise>
				<div class="container row g-0 p-0">
					<form action="" method="post" enctype="multipart/form-data">
		
						<div class="qna col-12">
							<h2 class="fontEnglish">자유게시글 작성</h2>
						</div>
						<div class="titleBox col-12">
							<input class="inputTitle" type="text" name="title"
								placeholder="제목을 입력하세요">
						</div>
						<div class="col-12 fileBox">
							<button type="button" id="btnAdd">+</button>
							<span>파일첨부</span>
							<div id="fileContainer"></div>
						</div>
						<div class="col-12">
							<textarea id="summernote" class="content" rows="35" cols="100"
								placeholder="내용을 입력하세요." name="contents"></textarea>
						</div>
						<div class="row bottom">
						<div class="col-11">
						</div>
							<input class="submitBtn col-1" type="submit" value="작성">
						</div>
					</form>
				</div>
			</c:otherwise>
		</c:choose>
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

<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			placeholder : '내용을 작성하세요',
			height : 700,
			maxHeight : 1300
		});
	});

	//	file의 count를 셈
	let count = 0;

	$("#btnAdd").on("click", function() {
		if ($("input[type=file]").length > 5) {
			alert("파일은 5개까지 첨부 가능합니다.");
			return false;
		}

		let fileDiv = $("<div>");
		let fileInput = $("<input>");
		fileInput.css("display", "inline");
		fileInput.css("margin-top", "5px");
		fileInput.attr("type", "file");
		fileInput.attr("name", "file" + (count++));

		let btnX = $("<input>");
		btnX.attr("value", "x");
		btnX.attr("type", "button");
		btnX.css("border", "none");
		btnX.css("width", "30px");
		btnX.css("height", "30px");

		btnX.addClass("del");

		fileDiv.append(fileInput);
		fileDiv.append(btnX);

		$("#fileContainer").append(fileDiv);

	})

	$(document).on("click", ".del", function() {
		$(this).closest("div").remove();
	})
</script>

</html>