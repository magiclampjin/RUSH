$(document).ready(function() {
	let category = $("#category").val();
	console.log(category)
	$("ul.tabs a").removeClass("current");
	let page = $("ul.tabs a")

	for (let i = 0; i < page.length; i++) {
		if (category == $(page[i]).attr("class")) {
			$(page[i]).addClass("current")
		}
	}

	$("ul.tabs a").click(function() {
		$("ul.tabs a").removeClass("current");

		$(this).addClass("current");
	});

})

