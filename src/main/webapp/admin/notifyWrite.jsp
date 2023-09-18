<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
 <!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
 <style>
 	.container{width:1300px; margin:auto;}
 	.inputTitle{width:100%;}
 </style>
</head>
<body>
<div class="container">
	<nav>RUSH nav</nav>
	<form action="/insert.board" method="post" enctype="multipart/form-data">
		<div class="container" >
			<div><h3>자유게시판 - 관리자 공지게시글 작성</h3></div>
			<div>
				<input class="inputTitle" type="text" name="title" placeholder="제목을 입력하세요">
			</div>
			<div>
				<button type="button" id="btnAdd">+</button> 파일첨부
				<div id="fileContainer"></div>
			</div>
			<div>
				<textarea id="summernote" class="content" rows="35" cols="100" placeholder="내용을 입력하세요." name="contents"></textarea>
			</div>
			
			<div>
				<input type="submit" value="작성">
			</div>
		</div>
	</form>	
</div>
	
</body>

<script>
$(document).ready(function () {
    $('#summernote').summernote({
        placeholder: '내용을 작성하세요',
        height: 400,
        maxHeight: 400
    });
});

//	file의 count를 셈
let count = 0;

$("#btnAdd").on("click",function(){
	if($("input[type=file]").length > 5){
		alert("파일은 5개까지 첨부 가능합니다.");
		return false;
	}
	
	let fileDiv = $("<div>");
	let fileInput = $("<input>");
	fileInput.css("display","inline");
	fileInput.attr("type","file");
	fileInput.attr("name","file"+ (count++));
	
	let btnX = $("<input>");
	btnX.attr("value","X");
	btnX.attr("type","button");
	
	btnX.addClass("del");
	
	fileDiv.append(fileInput);
	fileDiv.append(btnX);
	
	$("#fileContainer").append(fileDiv);

})

$(document).on("click",".del",function(){
	$(this).closest("div").remove();
})



</script>

</html>