<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RUSH DashBoard</title>
<%@ include file="/common/style.jsp"%>

<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/member/dashBoard.css">
<script type="text/javascript" src="/js/member/viewsChart.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
</head>

<body>
	<div class="container-fluid p-0">
		<%@ include file="/common/header.jsp"%>

		<div class="body">
			<div class="body_guide">
				<div class="chartDiv">
					<div class="chartDivTitle">사이트 방문자수</div>
					<div class="chartCon">
						<div class="chartBox">
							<canvas id="visitors" width="100%"></canvas>
						</div>
					</div>
				</div>
				<div class="chartDiv">
					<div class="chartDivTitle">게임 이용 순위</div>
					<div class="chartCon">
						<div class="chartBox">
							<canvas id="gameRankings" width="100%"></canvas>
						</div>
					</div>
					<input type="hidden" id="gameRankData" value="${gameRank }">
				</div>
				<div class="chartDiv">
					<div class="chartDivTitle">게임별 조회수</div>
					<div class="chartCon twoDiv">
						<div class="chartBox">
							<div class="chartTitle">게임별 누적 조회수</div>
							<canvas id="cumulativeViews"></canvas>
						</div>
						<div class="chartBox">
							<div class="chartTitle">게임별 일일 조회수</div>
							<canvas id="dailyViews"></canvas>
						</div>
					</div>


				</div>
			</div>
		</div>
		<a href="#">
			<div class="upArrow bColorPink colorWhite">
				<i class="fa-solid fa-arrow-up-long"></i>
			</div>
		</a>
		<%@include file="/common/footer.jsp"%>
	</div>
</body>
</html>