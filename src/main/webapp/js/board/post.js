$(document).ready(function() {
	
			
	function replyReload(postSeq){
		$.ajax({
			url:"/load.reply",
			data:{
				postSeq : postSeq
			},
			dataType:"json",
			type:"post"
		}).done(function(resp){
			let postWriter = $("#postWriter").val();
			console.log("postWriter: "+postWriter);
			let loginID = $("#loginID").val();
			let replys = $("#replys");
			for(let i=0; i<resp.length; i++){
				
				let replyTag = $("<div>").attr("class", "col-12 reply");
				let row = $("<div>").attr("class","row g-0");
				let col10 = $("<div>").attr("class","col-10");
				let writerCover = $("<div>").attr("class","d-flex align-items-end mb10").append($("<div>").attr("class","writer fw500 fs20").html(resp[i].nickName));
				console.log("댓글 작성자: "+resp[i].writer);
				console.log("글 작성자: "+postWriter);
				if(resp[i].writer == postWriter){
					let isWriterTag = $("<div>").attr("class","isWriter colorWhite bColorBlue fw400 fs15").html("작성자");
					writerCover.append(isWriterTag);
				}
				let contents = $("<div>").attr("class","contents fw400 fs20 mb10").html(resp[i].contents);
				let detailInfo = $("<div>").attr("class","replyDetailInfo fw400 fs15 colorDarkgray").html(resp[i].writeDate+"&nbsp;&nbsp;");
				let nestedReplyBtn = $("<a>").attr("href","#").attr("class","nestedReplyBtn colorDarkgray").html("답글 쓰기");
				detailInfo.append(nestedReplyBtn);
				
				row.append(col10.append(writerCover).append(contents).append(detailInfo));
				let replyBtns = $("<div>").attr("class","col-2 d-none d-md-flex replyBtns");
				if(resp[i].writer == loginID){
					replyBtns = $("<div>").attr("class","col-2 d-none d-md-flex replyBtns");
					let updateBtn = $("<div>").attr("class","replyUpdate bColorGreen fw400 fs17").html("수정");
					let deleteBtn = $("<div>").attr("class","replyDelete bColorGreen fw400 fs17").html("삭제");
					replyBtns.append(updateBtn).append(deleteBtn);
					
					let replyBtnsMini = $("<div>").attr("class","col-2 d-md-none replyBtns");
					let updateBtnMini = $("<div>").attr("class","replyUpdate bColorGreen fw400 fs17").html("<i class='fa-solid fa-pen-to-square'></i>");
					let deleteBtnMini = $("<div>").attr("class","replyDelete bColorGreen fw400 fs17").html("<i class='fa-solid fa-trash-can'></i>");
					replyBtnsMini.append(updateBtnMini).append(deleteBtnMini);
					
					row.append(replyBtns).append(replyBtnsMini);
				}else{
					replyBtns = $("<div>").attr("class","col-2 replyBtns");
					let recommendBtn = $("<div>").attr("class","col-2 fw400 fs15 recommendBtn").attr("id","replyRec").html("<i class='fa-regular fa-thumbs-up'></i>"+"&nbsp;추천");
					row.append(replyBtns.append(recommendBtn));
				}
				
				replys.append(replyTag.append(row));
				
			}
		});
	}
	
	// 댓글창 로드
	$("#replys").html(replyReload( $("#postSeq").val()));

	let cpage = $("#cpage").val();
	let category = $("#category").val();
	$("#goList").on("click", function() {
		location.href = "/listing.board?cpage="+cpage+"&category="+category; 
	});
	
	$("#replyInsertBtn").on("click",function(){	
		let txt = $("#replyInsertTxt").html();
		if(txt=="" || txt==null){
			alert("댓글 내용을 입력하세요.");
			return false;
		}
		$("#replyInsertTxt").html("");
		
		$.ajax({
			url:"/insert.reply",
			data:{
				postSeq	: $("#postSeq").val(),
				contents : txt
			},
			type:"post"
		}).done(function(){
			$("#replys").html("");
			$("#replys").html(replyReload( $("#postSeq").val()));
		});
		// location.reload(true);
		
	});
	
	// 게시글 북마크/ 추천 눌렀을 때 게시글 삭제됏으면 삭제된 게시글이라고 출력
	// 댓글 추천 눌렀을 때 댓글 삭제됐으면 삭제된 댓글이라고 출력
	
	$("#bookmark").on("click",function(){
		if($(this).hasClass("btnClicked")===true){ //delete
			$.ajax({
				url:"/deleteBookmark.board",
				data:{
					postSeq	: $("#postSeq").val()
				},
				type:"post",
				dataType:"json"
			}).done(function(success){
				if(success == 1)
					$("#bookmark").removeClass("btnClicked");
				else{
					alert("삭제된 게시글입니다.");
					location.href = "/listing.board?cpage="+cpage+"&category="+category; 
				}
			});
			
				
		}else{ //insert
			$.ajax({
				url:"/insertBookmark.board",
				data:{
					postSeq	: $("#postSeq").val()
				},
				type:"post",
				dataType:"json"
			}).done(function(success){
				if(success == 1)
					$("#bookmark").addClass("btnClicked");
				else{
					alert("삭제된 게시글입니다.");
					location.href = "/listing.board?cpage="+cpage+"&category="+category; 
				}
			});
		
		}
	});
	
	$("#postRec").on("click",function(){
		if($(this).hasClass("btnClicked")===true){ //delete
			$.ajax({
				url:"/deleteRecommend.board",
				data:{
					postSeq	: $("#postSeq").val()
				},
				type:"post",
				dataType:"json"
			}).done(function(success){
				if(success == 1)
					$("#postRec").removeClass("btnClicked");
				else{
					alert("삭제된 게시글입니다.");
					location.href = "/listing.board?cpage="+cpage+"&category="+category; 
				}
			});
			
				
		}else{ //insert
			$.ajax({
				url:"/insertRecommend.board",
				data:{
					postSeq	: $("#postSeq").val()
				},
				type:"post",
				dataType:"json"
			}).done(function(success){
				if(success == 1)
					$("#postRec").addClass("btnClicked");
				else{
					alert("삭제된 게시글입니다.");
					location.href = "/listing.board?cpage="+cpage+"&category="+category; 
				}
			});

		}
	});
	
	
	
});
