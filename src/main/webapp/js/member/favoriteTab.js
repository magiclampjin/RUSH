$(document).ready(function(){
	$("ul.favoriteTabs li").on("click",function(){
		let tab_id = $(this).attr("data-tab");		
		$("ul.favoriteTabs li").removeClass("current");
		$(".favoriteTab-content").removeClass("current");
		
		$(this).addClass("current");
		$("#"+tab_id).addClass("current");
	})
})