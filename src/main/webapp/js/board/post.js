
function replyReload(){
	
}

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
	
	// 게시글 북마크/ 추천 눌렀을 때 게시글 삭제됏으면 삭제된 게시글이라고 출력
	// 댓글 추천 눌렀을 때 댓글 삭제됐으면 삭제된 댓글이라고 출력
	
	$("postRec").on("click",function(){
		if(this.hasClass("btnClicked")==true){
			//delete
			
			$.ajax({
				
			});
		}else{
			//insert
			$.ajax({
				
			});
		}
	});
	
	
});
