<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RUSH</title>
<%@ include file="/common/style.jsp" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="/css/game/game.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/game/game.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<style>
	*{
	box-sizing : border-box;
	}
	#ids{
		width : 100%;
		height:600px;
		overflow:auto;
	}
	#replies{
		width : 100%;
		height:600px;
		overflow:auto;
	}
	.container{
	height : 700px;
	}
	.mh600{
		max-height:600px;
		overflow:auto;
	}
	input[type="radio"] + .btn{
		color : #131217;
		backgrond-color : #7D7D7D;
	}

	input[type="radio"]:checked + .btn {
	    color: #F9F9F9;
	    background: #131217!important;
	}
	
	input[type="radio"]:hover + .btn {
	  color: #F9F9F9;
	  background-color: #131217;
	}
	.center{
		display:flex;
		justify-content : center;
		align-items : center;
	}
	.row{
		font-size : 12px;
	}
	.row button{
		font-size : 12px;
	}
	.borders{
		border : 1px solid black;
		border-radius : 5px;
	}
</style>
<script>
	window.history.forward(); 
	function noBack(){
		window.history.forward();
	}
</script>
</head>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
<script>
	window.onload = function(){
		$.ajax({
			url:"/getAdReply.black",
		}).done(function(res){
			let data = JSON.parse(res);
			for(let i=0; i<data.length; i++){
				let divRow = $("<div>");
				divRow.addClass("row g-0");
				divRow.css("border","1px solid black");
				
				let divSeq = $("<input>");
				divSeq.attr("type","hidden");
				divSeq.attr("name","seq");
				divSeq.addClass("replySeq");
				divSeq.val(data[i]["seq"]);
				
				let divParSeq = $("<input>");
				divParSeq.attr("type","hidden");
				divParSeq.attr("name","parSeq");
				divParSeq.val(data[i]["parentSeq"]);
				
				let divColWriter = $("<div>");
				divColWriter.addClass("col-2 writer center");
				divColWriter.text(data[i]["writer"]);
				
				let divColNickname = $("<div>");
				divColNickname.addClass("col-2 nickName center");
				divColNickname.text(data[i]["nickName"]);

				let divColContents = $("<div>");
				divColContents.addClass("col-4 contents center");
				divColContents.text(data[i]["contents"]);
				
				let divBtn = $("<div>");
				divBtn.addClass("col-4 center");
				
				let deleteBtn = $("<button>");
				deleteBtn.attr("type","button");
				deleteBtn.addClass("deleteReply");
				deleteBtn.addClass("btn btn-outline-dark");
				deleteBtn.text("삭제");
				
				divBtn.append(deleteBtn);
				
				divRow.append(divSeq);
				divRow.append(divParSeq);
				divRow.append(divColWriter);
				divRow.append(divColNickname);
				divRow.append(divColContents);
				divRow.append(divBtn);
				
				$("#ids").append(divRow);
			}
			$(".deleteReply").on("click",function(){
				let seq = $(this).parent().siblings(".replySeq").val();
				let user = $(this).parent().siblings(".writer").text();
				$.ajax({
					url:"/deleteReply.black",
					data : {
						replySeq : seq,
						userID : user
					},
					type : "post"
				}).done(function(res){
					location.reload();
				});
			});
		});
		$.ajax({
			url:"/getSearchUser.black"
		}).done(function(res){
			let data = JSON.parse(res);
			for(let i=0; i<data.length; i++){
				let divRow = $("<div>");
				divRow.addClass("row g-0");
				
				let divColID = $("<div>");
				divColID.addClass("col-3 writer center");
				divColID.text(data[i]["id"]);
				
				let divColNickname = $("<div>");
				divColNickname.addClass("col-2 nickName center");
				divColNickname.text(data[i]["name"]);

				let divColEmail = $("<div>");
				divColEmail.addClass("col-4 email center");
				divColEmail.text(data[i]["email"]);
				
				let divBtn = $("<div>");
				divBtn.addClass("col-3 center");
				
				let deleteBtn = $("<button>");
				deleteBtn.attr("type","button");
				deleteBtn.addClass("btn btn-outline-dark blackUser");
				deleteBtn.text("블랙리스트");
				
				$.ajax({
					url:"/getBlacklist.black",
					data : {
						userID : data[i]["id"]
					}
				}).done(function(res){
					let data = JSON.parse(res);
					console.log(data);
					if(data>=1){
						deleteBtn.addClass("active");
					}
				});
				
				
				
				
				divBtn.append(deleteBtn);
				
				divRow.append(divColID);
				divRow.append(divColNickname);
				divRow.append(divColEmail);
				divRow.append(divBtn);
				
				$("#replies").append(divRow);
			}
			
			$(".blackUser").on("click",function(){
				let nick = $(this).parent().siblings(".nickName").text();
				let user = $(this).parent().siblings(".writer").text();
				$.ajax({
					url:"/setBlackList.black",
					data : {
						mID : user
					}
				}).done(function(res){
					if(res==0){
						alert("블랙리스트 실패");
					}else{
						alert("블랙리스트 성공");
					}
				});
			});
		});
	};
</script>
<%@ include file="/common/header.jsp" %>
	<div class="container">
		<div class="row g-0 p-2">
			<div class="col-6 p-2">
				<div class="borders">
					<div class="row g-0">
						<div class="col-12 d-flex justify-content-center">
							<div class="btn-group w100p mxWidth1030" role="group"
								aria-label="Basic radio toggle button group">
								<input type="radio" class="btn-check" name="btnradio"
									id="btnradio1" autocomplete="off" checked> <label
									class="btn btn-outline-light" for="btnradio1">댓글</label>

								<input type="radio" class="btn-check" name="btnradio"
									id="btnradio2" autocomplete="off"> <label
									class="btn btn-outline-light" for="btnradio2">게시글</label>
							</div>
						</div>
						
						<!-- jstl 버튼 checked 확인해서 순위나 조작방법으로 바꿔야됨. -->
					</div>
					<div class="row g-0">
						<div class="col-12 mh600 p-2" id="ids">
							
						</div>
						<div class="col-12 mh600 p-2" id="boards">
							
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-6 p-2">
				<div class="borders">
					<div>
						<button type="button" class="btn btn-ouline-light" id="select">새로고침</button>
					</div>
					<div id="replies">
					
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<script>
	$("#select").on("click",function(){
		$("#replies").text("");
		$.ajax({
			url:"/getSearchUser.black"
		}).done(function(res){
			let data = JSON.parse(res);
			for(let i=0; i<data.length; i++){
				let divRow = $("<div>");
				divRow.addClass("row g-0");
				
				let divColID = $("<div>");
				divColID.addClass("col-3 writer center");
				divColID.text(data[i]["id"]);
				
				let divColNickname = $("<div>");
				divColNickname.addClass("col-2 nickName center");
				divColNickname.text(data[i]["name"]);

				let divColEmail = $("<div>");
				divColEmail.addClass("col-4 email center");
				divColEmail.text(data[i]["email"]);
				
				let divBtn = $("<div>");
				divBtn.addClass("col-3 center");
				
				$.ajax({
					url:"/getBlacklist.black",
					data : {
						userID : data[i]["id"]
					}
				}).done(function(res){
					let data = JSON.parse(res);
					console.log(data);
					if(data>=1){
						deleteBtn.addClass("active");
					}
				});
				
				let deleteBtn = $("<button>");
				deleteBtn.attr("type","button");
				deleteBtn.addClass("btn btn-outline-dark blackUser");
				deleteBtn.text("블랙리스트");
				
				divBtn.append(deleteBtn);
				
				divRow.append(divColID);
				divRow.append(divColNickname);
				divRow.append(divColEmail);
				divRow.append(divBtn);
				
				$("#replies").append(divRow);
			}
			
			$(".blackUser").on("click",function(){
				let nick = $(this).parent().siblings(".nickName").text();
				let user = $(this).parent().siblings(".writer").text();
				$.ajax({
					url:"/setBlackList.black",
					data : {
						mID : user
					}
				}).done(function(res){
					if(res==0){
						alert("블랙리스트 실패");
					}else{
						alert("블랙리스트 성공");
					}
				});
			});
		});
	});
	$("#btnradio1").on("click",function(){
    	$("#ids").css("display","block");
    	$("#ids").css("justify-content","center");
    	$("#boards").css("display","none");
    	$("#ids").text("");
    	$.ajax({
			url:"/getAdReply.black",
		}).done(function(res){
			let data = JSON.parse(res);
			for(let i=0; i<data.length; i++){
				let divRow = $("<div>");
				divRow.addClass("row g-0");
				divRow.css("border","1px solid black");
				
				let divSeq = $("<input>");
				divSeq.attr("type","hidden");
				divSeq.attr("name","seq");
				divSeq.addClass("replySeq");
				divSeq.val(data[i]["seq"]);
				
				let divParSeq = $("<input>");
				divParSeq.attr("type","hidden");
				divParSeq.attr("name","parSeq");
				divParSeq.val(data[i]["parentSeq"]);
				
				let divColWriter = $("<div>");
				divColWriter.addClass("col-2 writer center");
				divColWriter.text(data[i]["writer"]);
				
				let divColNickname = $("<div>");
				divColNickname.addClass("col-2 nickName center");
				divColNickname.text(data[i]["nickName"]);

				let divColContents = $("<div>");
				divColContents.addClass("col-4 contents center");
				divColContents.text(data[i]["contents"]);
				
				let divBtn = $("<div>");
				divBtn.addClass("col-4 center");
				
				let deleteBtn = $("<button>");
				deleteBtn.attr("type","button");
				deleteBtn.addClass("deleteReply");
				deleteBtn.addClass("btn btn-outline-dark");
				deleteBtn.text("삭제");
				
				divBtn.append(deleteBtn);
				
				divRow.append(divSeq);
				divRow.append(divParSeq);
				divRow.append(divColWriter);
				divRow.append(divColNickname);
				divRow.append(divColContents);
				divRow.append(divBtn);
				
				$("#ids").append(divRow);
			}
			$(".deleteReply").on("click",function(){
				let seq = $(this).parent().siblings(".replySeq").val();
				let user = $(this).parent().siblings(".writer").text();
				$.ajax({
					url:"/deleteReply.black",
					data : {
						replySeq : seq,
						userID : user
					},
					type : "post"
				}).done(function(res){
					location.reload();
				});
			});
			
		});
    });
    
    $("#btnradio2").on("click",function(){
    	$("#boards").css("display","block");
    	$("#ids").css("display","none");
    	$("#boards").text("");
    	$.ajax({
			url:"/getAdBoard.black",
		}).done(function(res){
			let data = JSON.parse(res);
			for(let i=0; i<data.length; i++){
				let divRow = $("<div>");
				divRow.addClass("row g-0");
				divRow.css("border","1px solid black");
				
				let divSeq = $("<input>");
				divSeq.attr("type","hidden");
				divSeq.attr("name","seq");
				divSeq.addClass("postSeq");
				divSeq.val(data[i]["seq"]);
				
				let divCategory = $("<input>");
				divCategory.attr("type","hidden");
				divCategory.attr("name","category");
				divCategory.addClass("category");
				divCategory.val(data[i]["category"]);
				
				let divColWriter = $("<div>");
				divColWriter.addClass("col-2 writer center");
				divColWriter.text(data[i]["writer"]);
				
				
				let divColTitle = $("<div>");
				divColTitle.addClass("col-2 title center");
				
				let boardAnker = $("<a>");
				boardAnker.attr("href","/load.board?cpage=1&seq="+data[i]["seq"]+"&category="+data[i]["category"]+"&menu=board");
				boardAnker.text(data[i]["title"]);
				divColTitle.append(boardAnker);

				let divColContents = $("<div>");
				divColContents.addClass("col-4 contents center");
				divColContents.html(data[i]["contents"]);
				
				let divBtn = $("<div>");
				divBtn.addClass("col-4 center");
				
				let deleteBtn = $("<button>");
				deleteBtn.attr("type","button");
				deleteBtn.addClass("deletePost");
				deleteBtn.addClass("btn btn-outline-dark");
				deleteBtn.text("삭제");
				
				divBtn.append(deleteBtn);
				
				divRow.append(divSeq);
				divRow.append(divCategory);
				divRow.append(divColWriter);
				divRow.append(divColTitle);
				divRow.append(divColContents);
				divRow.append(divBtn);
				
				$("#boards").append(divRow);
			}
			$(".deletePost").on("click",function(){
				let postSeq = $(this).parent().siblings(".postSeq").val();
				let category = $(this).parent().siblings(".category").val();
				let user = $(this).parent().siblings(".writer").text();
				$.ajax({
					url:"/deletePost.black",
					data : {
						postSeq : postSeq,
						category : category,
						userID : user
					}
				}).done(function(res){
					if(res>0){
						alert("게시글 삭제 성공");
						location.reload();
					}else{
						alert("게시글 삭제 실패");
						location.reload();
					}
				});
			});			
		});
    });
	
	</script>
	<%@include file="/common/footer.jsp"%>
</body>
</html>