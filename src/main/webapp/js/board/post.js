
$(document).ready(function() {
	let cpage = $("#cpage").val();
	let category = $("#category").val();
	$("#goList").on("click", function() {
		location.href = "/listing.board?cpage="+cpage+"&category="+category; 
	});
});
