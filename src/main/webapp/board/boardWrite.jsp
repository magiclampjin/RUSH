<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RUSH-게시글 작성</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- 스타일 시트 & js -->
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/board/boardWrite.css">

<script type="text/javascript" src="/js/board/summernote_editor.js"></script>

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>


<!-- summernote -->
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

<!-- Header Style -> 부트스트랩 속성 제거 -->
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
	color: #111111;
}

.dropdown-menu[data-bs-popper] {
	right: 0;
	left: auto;
}

.dropdown-toggle::after {
	display: none;
}
</style>
</head>
<body>
	<div class="container-fluid p-0">
	<%@ include file="/common/writeHeader.jsp" %>
		
		<div class="boardWrite">
			<div class="boardWrite_guide">
				<c:choose>
					<c:when test="${menu == 'qna'}">
						<form action="/insert.qna" method="post"
							enctype="multipart/form-data">

							<div class="writeTitle">Q&A 작성</div>

							<input type="text" class="inputTitle" name="title"
								placeholder="제목을 입력하세요">
							<div class="fileBox">
								<input type="button" id="btnAdd" class="writebtn bColorGreen"
									value="+"> <span>파일첨부</span>
								<div id="fileContainer"></div>
							</div>
							<textarea id="summernote" class="content" rows="35" cols="100"
								placeholder="내용을 입력하세요." name="contents"></textarea>
							<div class="secretBox">
								<input id="secret" class="screteChk" type="checkbox"> <input
									id="secret_hidden" class="screteChk" type="hidden"
									name="secret" value="false"> <label for="secret"
									class="colorDarkgray">비밀글 설정하기</label>
							</div>
							<div class="writeBox">
								<c:choose>
									<c:when test="${menu eq 'qna'}">
										<a href="/listing.qna?&cpage=1"><input
											class="writebtn bColorGreen" type="button" value="목록으로"></a>
									</c:when>
									<c:otherwise>
										<a href="/listing.board?category=${category }&cpage=1"><input
											class="writebtn bColorGreen" type="button" value="목록으로"></a>
									</c:otherwise>
								</c:choose>

								<input class="writebtn bColorGreen" type="submit" value="작성">
							</div>

						</form>
						<script type="text/javascript" src="/js/board/qnaWriteSecret.js"></script>
					</c:when>
					<c:otherwise>
						<form action="/insert.board" method="post"
							enctype="multipart/form-data" id="boardForm">
							<input type="hidden" value="${category }" name="category">
							<c:choose>
								<c:when test="${loginID == 'admin' }">
									<div class="writeTitle">공지게시글 작성</div>
									
								</c:when>
								<c:otherwise>
									<div class="writeTitle">자유게시글 작성</div>
								</c:otherwise>
							</c:choose>

							<input type="text" class="inputTitle" name="title"
								placeholder="제목을 입력하세요" id="title">
							<div class="fileBox">
								<input type="button" id="btnAdd" class="writebtn bColorGreen"
									value="+"> <span>파일첨부</span>
								<div id="fileContainer"></div>
							</div>
							<textarea id="summernote" class="content" id="content" rows="35"
								cols="100" placeholder="내용을 입력하세요." name="contents"></textarea>
							<div class="writeBox">
								<a href="/listing.board?category=${category }&cpage=1"><input
									class="writebtn bColorGreen" type="button" value="목록으로"></a>
								<input class="writebtn bColorGreen" type="submit" value="작성">
							</div>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

		<%@include file="/common/writeFooter.jsp"%>
	</div>
</body>
</html>