$(document).ready(function() {
	let category = $("#category").val();
	$("ul.tabs a").removeClass("current");
	let page = $("ul.tabs a")
	
	let writeBtnLink = $("#writeBtnLink")

	for (let i = 0; i < page.length; i++) {
		if (category == $(page[i]).attr("class")) {
			$(page[i]).addClass("current")
			writeBtnLink.attr("href","/write.board?menu=board&category="+category)
		}
	}
	
	
	console.log(writeBtnLink.attr("href"))
	

	$("ul.tabs a").click(function() {
		$("ul.tabs a").removeClass("current");

		$(this).addClass("current");
	});

})

