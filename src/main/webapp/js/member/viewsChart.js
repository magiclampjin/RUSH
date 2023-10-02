window.onload = function() {
	//게임 이용 순위
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
	});


	//성별 별 선호 게임
	$.ajax({
		url: "/genderByRank.member",
		dataType: "json"
	}).done(function(resp) {
		let gameName = [];
		let womanGamePlayCount = [];
		let manGamePlayCount = [];


		for (let i = 0; i < resp[0].length; i++) {
			gameName.push(resp[0][i].gName)
			womanGamePlayCount.push(resp[0][i].playCount)
		}

		for (let i = 0; i < resp[1].length; i++) {
			manGamePlayCount.push(resp[1][i].playCount)
		}

		var genderByRankings = document.getElementById("genderByRankings").getContext("2d");
		var genderByRankings = new Chart(genderByRankings, {
			type: "line",
			data: {
				labels: gameName,
				datasets: [
					{
						label: "남성 게임별 플레이 횟수",
						data: manGamePlayCount,
						borderWidth: 1,
					}, {
						label: "여성 게임별 플레이 횟수",
						data: womanGamePlayCount,
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
	});


	//연령 별 선호 게임
	$.ajax({
		url: "/ageByRank.member",
		dataType: "json"
	}).done(function(resp) {
		let gameName = [];
		let playCount10 = [];
		let playCount20 = [];
		let playCount30 = [];
		let playCount40 = [];
		let playCount50 = [];
		let playCountEtc = [];
		for (let i = 0; i < resp.length; i++) {
			gameName.push(resp[i].gName);
			playCount10.push(resp[i].playCount1)
			playCount20.push(resp[i].playCount2)
			playCount30.push(resp[i].playCount3)
			playCount40.push(resp[i].playCount4)
			playCount50.push(resp[i].playCount5)
			playCountEtc.push(resp[i].playCount0)
		}

		console.log(gameName)
		var ageByRankings = document.getElementById("ageByRankings").getContext("2d");
		var ageByRankings = new Chart(ageByRankings, {
			type: "line",
			data: {
				labels: gameName,
				datasets: [
					{
						label: "10대 게임별 플레이 횟수",
						data: playCount10,
						borderWidth: 1,
					},
					{
						label: "20대 게임별 플레이 횟수",
						data: playCount20,
						borderWidth: 1,
					}, {
						label: "30대 게임별 플레이 횟수",
						data: playCount30,
						borderWidth: 1,
					}, {
						label: "40대 게임별 플레이 횟수",
						data: playCount40,
						borderWidth: 1,
					}, {
						label: "50대 게임별 플레이 횟수",
						data: playCount50,
						borderWidth: 1,
					}, {
						label: "기타 게임별 플레이 횟수",
						data: playCountEtc,
						borderWidth: 1,
					}
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
