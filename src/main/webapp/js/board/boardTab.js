$(document).ready(function() {
	// 현재 접속한 카테고리 설정
	let category = $("#category").val();
	console.log(category)
	$("ul.tabs a").removeClass("current");
	let page = $("ul.tabs a")
	
	// 현재 위치한 게시판 카테고리에 맞춰 글쓰기 버튼과 검색 버튼 url 설정
	let writeBtnLink = $("#writeBtnLink")
	let searchForm = $("#searchForm")

	for (let i = 0; i < page.length; i++) {
		if (category == $(page[i]).attr("class")) {
			$(page[i]).addClass("current")
			writeBtnLink.attr("href","/write.board?menu=board&category="+category)
			searchForm.attr("action", "/listing.board?cpage=1&category="+category+"&test")
		}
	}

	// 클릭한 카테고리로 변경
	$("ul.tabs a").click(function() {
		$("ul.tabs a").removeClass("current");

		$(this).addClass("current");
	});

	// 검색 카테고리 지정
	let search = $("#search").val();
	if(search == ""){
		search = "title";
	}
	$("option[value=\""+search+"\"]").attr("selected", "true");
})

