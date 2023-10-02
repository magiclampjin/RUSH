window.onload = function() {
	//방문자 수
	var visitors = document.getElementById("visitors").getContext("2d");
	var visitors = new Chart(visitors, {
		type: 'bar',
		data: {
			labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
			datasets: [{
				label: '# of Votes',
				data: [12, 19, 3, 5, 2, 3],
				borderWidth: 1
			}]
		},
		options: {
			scales: {
				y: {
					beginAtZero: true
				}
			}
		}
	});

	$.ajax({
		url: "/gameRank.member",
		dataType: "json"
	}).done(function(resp) {
		let gameName = []
		let gamePlayCount = []
		for (let i = 0; i < resp.length; i++) {
			gameName.push(resp[i].gName)
			gamePlayCount.push(resp[i].playCount)
		}

		//게임 이용 순위
		var gameRankings = document.getElementById("gameRankings").getContext("2d");
		var gameRankings = new Chart(gameRankings, {
			type: 'bar',
			data: {
				labels: gameName,
				datasets: [{
					label: '게임 이용 횟수',
					data: gamePlayCount,
					borderWidth: 1
				}]
			},
			options: {
				scales: {
					y: {
						beginAtZero: true
					}
				}
			}
		});
	})


	//게임별 누적 조회수
	var cumulativeViews = document.getElementById("cumulativeViews").getContext("2d");
	var cumulativeViews = new Chart(cumulativeViews, {
		type: "doughnut",
		data: {
			labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
			datasets: [
				{
					label: "게임별 누적 조회수",
					data: [12, 19, 3, 5, 2, 3],
					borderWidth: 1,
				},
			],
		},
		options: {
			responsive: true,
			plugins: {
				legend: {
					position: "top",
				},
				title: {
					display: true
				},
			},
		}
	});

	// 게임 별 일일 조회수
	var dailyViews = document.getElementById("dailyViews").getContext("2d");
	var dailyViews = new Chart(dailyViews, {
		type: "doughnut",
		data: {
			labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
			datasets: [
				{
					label: "게임별 누적 조회수",
					data: [12, 19, 3, 5, 2, 3],
					borderWidth: 1,
				},
			],
		},
		options: {
			responsive: true,
			plugins: {
				legend: {
					position: "top",
				},
				title: {
					display: true
				},
			},
		}
	});
	
	window.history.forward();
	noBack();
};

function noBack(){
	window.history.forward();
}
	
window.onpageshow = function(event) {
	if(event.persisted) noBack();
}
