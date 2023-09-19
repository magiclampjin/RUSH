<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
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
.qna {
	height: 50px;
	margin:40px 0px;
	border-bottom:1px solid #7D7D7D;
	font: bold;
}
.contentBox{
	width:100%; height:660px;
}
.infoBox{
	height:25%; border:1px solid #7d7d7d;
	padding:20px;
}
.contentInsideBox{height:75%; border:1px solid #7d7d7d;
	padding:20px;
}
.titleBox h3{margin:20px 0;}
.bottom{margin-top:10px; width:100%;}
.bottomRight{text-align:right;}
#btnAdd{
	border:none;
	background-color:#CCF423; border-radius:10px;
	width:30px; height:30px;
}
.Btn{
	border:none;
	background-color:#CCF423; border-radius:10px;
	width:100px; height: 50px;
}
.listBtn{
	border:none; border-radius:10px;
	width:100px; height: 50px;
}
</style>
</head>
<body>
	<div class="container row g-0 p-0">
		<form action="" method="post" enctype="multipart/form-data">
			<div class="qna col-12">
				<h2 class="fontEnglish">Q&A</h2>
			</div>
			<div class="contentBox col-12">
				<div class="infoBox">
					<div class="titleBox">
						<h3>제목</h3>
					</div>
					<div class="writerBox">
						<h5>작성자</h5>
					</div>
					<div class="timeBox">
						<h5 class="colorDarkgray">작성일시</h5>
					</div>
					<input type="hidden" value="${list.seq }">
				</div>
				<div class="col-12 contentInsideBox">
					<div class="content" id="contentsBox" contenteditable="false">내용영역</div>
					<textarea class="content" id="contents" name="contents" >수정내용</textarea>
				</div>
			</div>
			<div class="row bottom">
				<div class="col-6">
					<c:forEach var="i" items="${fileList }">
						<a href="">첨부된 파일</a> <br>
					</c:forEach>
				</div>
				<div class="col-6 bottomRight">
					<input class="Btn" type="submit" value="수정">
					<input class="Btn" type="submit" value="삭제">
					<input class="listBtn bColorBlue colorWhite" type="submit" value="목록">
				</div>
			</div>
		</form>
	</div>
	<div class="container row g-0 p-0">
		<!-- 댓글 작성 -->
		<form action="" method="post">
			<div id="replyWrite col-12">
				<div class="reply replyLeft">
					<input type="hidden" name="writer" value="${loginID}">
					<input type="hidden" name="parentSeq" value="${oneList.seq }">
					<input id="reply" type="text" name="contents" placeholder="댓글을 입력하세요.">
				</div>
				<div class="reply replyRight">
					<input class="btn content" type="submit" value="등록">
				</div>
			</div>
		</form>
		<!-- 댓글 목록 보기 -->
		<div id="replyList">
			<h3 class="replyTitle">댓글</h3>
			<div id="insert">
				<!-- 여기에 댓글 -->
			</div> 
		</div>
			
			
	</div>
</body>
</html>