<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시글 작성</title>
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

<style>
* {
	box-sizing: border-box;
	font-family: Noto Sans KR, Jost;
}

.container {
	width: 1300px;
	margin: auto;
}
.titleBox{margin:10px 0px;}
.inputTitle {width: 100%;}
.qna {
	height: 50px;
	margin-bottom:10px;
	border-bottom:1px solid #7D7D7D;
	font: bold;
}
.titleBox{width:100%; height:50px;}
.fileBox{width:100%; padding:10px;margin-bottom:10px; border:1px solid #7D7D7D;}
.inputTitle{height:100%;}
</style>
</head>
<body>
	<div class="container row g-0 p-0">
		<nav>RUSH nav</nav>
		<form action="" method="post" enctype="multipart/form-data">

			<div class="qna col-12">
				<h2>Q&A - 게시글 작성</h2>
			</div>
			<div class="titleBox col-12">
				<input class="inputTitle" type="text" name="title" placeholder="제목을 입력하세요">
			</div>
			<div class="col-12 fileBox" style="border:1px solid black;">
				<button type="button" id="btnAdd" style="border:none;">+</button>
				<span>파일첨부</span>
				<div id="fileContainer"></div>
			</div>
			<div class="col-12">
				<textarea id="summernote" class="content" rows="35" cols="100"
					placeholder="내용을 입력하세요." name="contents"></textarea>
			</div>
			<div>
				<input type="checkbox">비밀글 설정하기
			</div>
			<div>
				<input type="submit" value="작성">
			</div>
		</form>
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
		btnX.attr("value", "X");
		btnX.attr("type", "button");
		btnX.css("border", "none");

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