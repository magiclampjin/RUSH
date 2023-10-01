$(document).ready(function() {
	console.log("gameRecord.js로 이동")
	console.log($("#gameOver").val())
	if ($("#gameOver").val()=="true") {
		$.ajax({
			url: "/setGameRecord.game",
			data: {
				game: 'Doodle Jump',
				score: $("#score").val()
			},
			dataType: "json",
			type: "post"
		})

	}
});	