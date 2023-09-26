<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	div{
		border : 1px solid black;
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
	input[type="radio"]{
    display: none;
}

	input[type="radio"]:checked + .btn {
	    color: #fff;
	    background: #ff60bd!important;
	}
	
	input[type="radio"]:hover + .btn {
	  color: #fff;
	  background-color: red;
	}
</style>
</head>
<body>
<script>
	window.onload = function(){
		$.ajax({
			url:"/getAdReply.test",
		}).done(function(res){
			let data = JSON.parse(res);
			console.log(data);
			console.log(data.length);
			for(let i=0; i<data.length; i++){
				let divRow = $("<div>");
				divRow.addClass("row g-0");
				
				let divSeq = $("<input>");
				divSeq.attr("type","hidden");
				divSeq.attr("name","seq");
				divSeq.val(data[i]["seq"]);
				
				let divParSeq = $("<input>");
				divParSeq.attr("type","hidden");
				divParSeq.attr("name","parSeq");
				divParSeq.val(data[i]["parentSeq"]);
				
				let divColWriter = $("<div>");
				divColWriter.addClass("col-2 writer");
				divColWriter.text(data[i]["writer"]);
				
				let divColNickname = $("<div>");
				divColNickname.addClass("col-2 nickName");
				divColNickname.text(data[i]["nickName"]);

				let divColContents = $("<div>");
				divColContents.addClass("col-4 contents");
				divColContents.text(data[i]["contents"]);
				
				let divBtn = $("<div>");
				divBtn.addClass("col-4");
				
				let deleteBtn = $("<button>");
				deleteBtn.attr("type","button");
				deleteBtn.addClass("deleteReply");
				deleteBtn.addClass("btn btn-outline-dark");
				deleteBtn.text("삭제");
				
				let blackBtn = $("<button>");
				blackBtn.attr("type","button");
				blackBtn.addClass("blackUser");
				blackBtn.addClass("btn btn-outline-dark");
				blackBtn.text("블랙리스트");
				
				divBtn.append(deleteBtn);
				divBtn.append(blackBtn);
				
				divRow.append(divSeq);
				divRow.append(divParSeq);
				divRow.append(divColWriter);
				divRow.append(divColNickname);
				divRow.append(divColContents);
				divRow.append(divBtn);
				
				$("#ids").append(divRow);
			}
			$(".deleteReply").on("click",function(){
				let nick = $(this).parent().siblings(".nickName").text();
				let cont = $(this).parent().siblings(".contents").text();
				console.log(nick+" / "+cont);
			});
			$(".blackUser").on("click",function(){
				let nick = $(this).parent().siblings(".nickName").text();
				let user = $(this).parent().siblings(".writer").text();
				console.log(nick+" "+user);
			});
		});
		
	};
</script>
	<div class="container">
		<div class="row g-0 p-2">
			<div class="col-6">
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
					<div class="row g-0 mh600">
						<div class="col-12" id="ids">
							
						</div>
						<div class="col-12" id="boards">
							
						</div>
					</div>
			</div>
			
			<div class="col-6">
				<div>
					<input type="text" name="id" id="inputID">
					<button type="button" class="btn btn-lignt" id="select">search</button>
				</div>
				<div id="replies">
				
				</div>
			</div>
		</div>
	</div>
	<script>
	$("#select").on("click",function(){
		let inputid = $("#inputID").val();
		$.ajax({
			url:"/getSearchUser.test",
			data :{
				id : inputid
			},
		}).done(function(res){
			let data = JSON.parse(res);
			console.log(data);
			let divRow = $("<div>");
			divRow.addClass("row g-0");
			
			let divColID = $("<div>");
			divColID.addClass("col-3 writer");
			divColID.text(data["id"]);
			
			let divColNickname = $("<div>");
			divColNickname.addClass("col-3 nickName");
			divColNickname.text(data["name"]);

			let divColEmail = $("<div>");
			divColEmail.addClass("col-4 email");
			divColEmail.text(data["email"]);
			
			let divBtn = $("<div>");
			divBtn.addClass("col-2");
			
			let deleteBtn = $("<button>");
			deleteBtn.attr("type","button");
			deleteBtn.addClass("deleteUser");
			deleteBtn.text("회원 삭제");
			
			divBtn.append(deleteBtn);
			
			divRow.append(divColID);
			divRow.append(divColNickname);
			divRow.append(divColEmail);
			divRow.append(divBtn);
			
			$("#replies").append(divRow);
		});
	});
	$("#btnradio1").on("click",function(){
    	$("#ids").css("display","block");
    	$("#ids").css("justify-content","center");
    	$("#boards").css("display","none");
    	$("#ids").text("");
    	$.ajax({
			url:"/getAdReply.test",
		}).done(function(res){
			let data = JSON.parse(res);
			console.log(data);
			console.log(data.length);
			for(let i=0; i<data.length; i++){
				let divRow = $("<div>");
				divRow.addClass("row g-0");
				
				let divSeq = $("<input>");
				divSeq.attr("type","hidden");
				divSeq.attr("name","seq");
				divSeq.val(data[i]["seq"]);
				
				let divParSeq = $("<input>");
				divParSeq.attr("type","hidden");
				divParSeq.attr("name","parSeq");
				divParSeq.val(data[i]["parentSeq"]);
				
				let divColWriter = $("<div>");
				divColWriter.addClass("col-2 writer");
				divColWriter.text(data[i]["writer"]);
				
				let divColNickname = $("<div>");
				divColNickname.addClass("col-2 nickName");
				divColNickname.text(data[i]["nickName"]);

				let divColContents = $("<div>");
				divColContents.addClass("col-4 contents");
				divColContents.text(data[i]["contents"]);
				
				let divBtn = $("<div>");
				divBtn.addClass("col-4");
				
				let deleteBtn = $("<button>");
				deleteBtn.attr("type","button");
				deleteBtn.addClass("deleteReply");
				deleteBtn.addClass("btn btn-outline-dark");
				deleteBtn.text("삭제");
				
				let blackBtn = $("<button>");
				blackBtn.attr("type","button");
				blackBtn.addClass("blackUser");
				blackBtn.addClass("btn btn-outline-dark");
				blackBtn.text("블랙리스트");
				
				divBtn.append(deleteBtn);
				divBtn.append(blackBtn);
				
				divRow.append(divSeq);
				divRow.append(divParSeq);
				divRow.append(divColWriter);
				divRow.append(divColNickname);
				divRow.append(divColContents);
				divRow.append(divBtn);
				
				$("#ids").append(divRow);
			}
			$(".deleteReply").on("click",function(){
				let nick = $(this).parent().siblings(".nickName").text();
				let cont = $(this).parent().siblings(".contents").text();
				console.log(nick+" / "+cont);
			});
			$(".blackUser").on("click",function(){
				let nick = $(this).parent().siblings(".nickName").text();
				let user = $(this).parent().siblings(".writer").text();
				console.log(nick+" "+user);
		});
    });
    
    $("#btnradio2").on("click",function(){
    	$("#boards").css("display","block");
    	$("#ids").css("display","none");
    	$("#boards").text("");
    	$.ajax({
			url:"/getAdBoard.test",
		}).done(function(res){
			let data = JSON.parse(res);
			console.log(data);
			console.log(data.length);
			for(let i=0; i<data.length; i++){
				let divRow = $("<div>");
				divRow.addClass("row g-0");
				
				let divSeq = $("<input>");
				divSeq.attr("type","hidden");
				divSeq.attr("name","cbSeq");
				divSeq.val(data[i]["cbSeq"]);
				
				let divColWriter = $("<div>");
				divColWriter.addClass("col-2 writer");
				divColWriter.text(data[i]["writer"]);
				
				let divColNickname = $("<div>");
				divColNickname.addClass("col-2 title");
				divColNickname.text(data[i]["title"]);

				let divColContents = $("<div>");
				divColContents.addClass("col-4 contents");
				divColContents.text(data[i]["contents"]);
				
				let divBtn = $("<div>");
				divBtn.addClass("col-4");
				
				let deleteBtn = $("<button>");
				deleteBtn.attr("type","button");
				deleteBtn.addClass("deletePost");
				deleteBtn.text("삭제");
				
				let blackBtn = $("<button>");
				blackBtn.attr("type","button");
				blackBtn.addClass("blackUser");
				blackBtn.text("블랙리스트");
				
				divBtn.append(deleteBtn);
				divBtn.append(blackBtn);
				
				divRow.append(divSeq);
				divRow.append(divColWriter);
				divRow.append(divColNickname);
				divRow.append(divColContents);
				divRow.append(divBtn);
				
				$("#boards").append(divRow);
			}
			$(".deletePost").on("click",function(){
				let writer = $(this).parent().siblings(".writer").text();
				let cont = $(this).parent().siblings(".title").text();
				console.log(writer+" / "+cont);
			});
			$(".blackUser").on("click",function(){
				let user = $(this).parent().siblings(".writer").text();
				console.log(user);
			});
			
		});
    });
	
	</script>
</body>
</html>