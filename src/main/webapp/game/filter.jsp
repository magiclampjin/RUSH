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
	}
	#replies{
	width : 100%;
	height:600px;
	}
</style>
</head>
<body>
<script>
	window.onload = function(){
		$.ajax({
			url:"/test.game",
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
				deleteBtn.text("삭제");
				
				let blackBtn = $("<button>");
				blackBtn.attr("type","button");
				deleteBtn.addClass("blackUser");
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
				let nick = $(this).closest("nickName").text();
				let user= $(this).closest("writer").text();
				console.log(nick+" "+user);
			});
		});
		
	};
</script>
	<div class="container">
		<div class="row g-0">
			<div class="col-6">
				<div id="ids">
					
				</div>
			</div>
			
			<div class="col-6">
				<div>
					<input type="text" name="id" id="inputID">
					<button type="button" id="select">search</button>
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
			url:"/test2.game",
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
	
	</script>
</body>
</html>