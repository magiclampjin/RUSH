
$(document).ready(function() {
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
		});
		location.reload(true);
	});
});
