<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 목록</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
	 <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
<style>
*{box-sizing:border-box; font-family:Noto Sans KR, Jost;}
body{width:1920px;}
.container {
	width: 1155px;
	height: 720px;
	margin: auto;
	padding:none;
}

.qna {
	margin-bottom: 40px;
	font:bold;
}

.qnaNav,.qnaContents {
	width: 100%;
	border-bottom: 2px solid #7D7D7D;
}

ul {
	display: flex;
	list-style: none;
}

ul li {
	text-align: center;
}

.inside {
	height: 50px;
	width: 100%;
	justify-content: center; align-items : center;
	border-bottom: 1px solid #7D7D7D;
	align-items: center;
}

.qnaContents .inside ul {
	list-style: none;
}

.qnaContents .inside a li {
	display: flex;
	align-items: center;
	justify-content: center;
}

.qnaContents .inside a {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 100%;
}
#pages{width:100%; text-align:center; margin:40px 0px;}
.bottom{width:100%;}
.search{text-align:center; height:50%;}
.h50{height:50px; margin-right:15px;}
.btn{background-color:#CCF423; border-radius:10px;}
.sideTap{
	border:1px solid black; border-radius:10px;
	position:fixed; width:120px; height:80px; top:408px; left:213px;
}
.side{display: flex;align-items: center;justify-content: center; height:50%; }
</style>
</head>
<body>
	<div class="sideTap m-0">
		<div class="side"><a>자유게시판</a></div>
		<div class="side" style="border-top:1px solid black;"><a>Q&A</a></div>
	</div>

	<nav>RUSH nav</nav>
	<div class="container row g-0">
		<div class="qna col-12">
			<h2>Q&A</h2>
		</div>
		<div class="qnaBox col-12 g-0">
			<div class="qnaNav row m-0">
				<ul class="p-0">
					<li class="col-1">번호</li>
					<li class="col-5">제목</li>
					<li class="col-2">작성자</li>
					<li class="col-2">작성일</li>
					<li class="col-1">조회</li>
					<li class="col-1">파일</li>
				</ul>
			</div>
			<div class="qnaContents col-12 g-0">
				<c:forEach begin="0" end="10" step="1">
					<div class="inside row m-0">
						<ul class="p-0">
							<a href="">
								<li class="col-1">번호</li>
								<li class="col-5">제목</li>
								<li class="col-2">작성자</li>
								<li class="col-2">작성일</li>
								<li class="col-1">조회</li>
								<li class="col-1">파일</li>
							</a>
						</ul>
					</div>
				</c:forEach>
			</div>
		</div>
		<div id="pages">
			1 2 3 4 5 6 7 8 8 10 > >>
		</div>
		<div class="bottom row m-0 g-0">
			<div class="col-1">
			
			</div>
			<div class="search col-10">
				<select class="selectBox h50" style="width:130px; text-align:center">
					<option value="title">제목</option>
					<option value="writer">글쓴이</option>
					<option value="contents">내용</option>
				</select>
				<input class="h50" type="text" placeholder="검색할 내용을 입력하세요." style="width:300px;">
				<input class="h50 btn" type="button" value="검색" style="width:85px;">
			</div>
			<div class="col-1"> 
				<a class="writeBtn" href=""> 
					<input class="h50 btn" type="button" value="글쓰기" style="width:100px;">
				</a>
			</div>
		</div>
		
	</div>
</body>

<script>
// let recordCountPerPage = ${recordCountPerPage};
// let naviCountPerPage = ${naviCountPerPage};
// let currentPage = ${currentPage};
// let recordTotalCount = ${recordTotalCount};

// let pagaeTotalCount = 0;
// // 전체 페이지의 개수 정하기
// if(recordTotalCount % recordCountPerPage >0){
// 	pagaeTotalCount = recordTotalCount / recordCountPerPage + 1;
// }else{
// 	pagaeTotalCount = recordTotalCount / recordCountPerPage;
// }

// // 현재 페이지가 1보다 작거나, 전체 페이지 수보다 클때
// if(currentPage < 1){
// 	currentPage = 1;
// }else if(currentPage > pagaeTotalCount){
// 	currentPage = pagaeTotalCount;
// }

// // 네비 숫자 정하기
// let startNavi = Math.floor((currentPage - 1) / naviCountPerPage) * naviCountPerPage + 1
// let endNavi = startNavi + (naviCountPerPage - 1);

// if(endNavi > pagaeTotalCount){
// 	endNavi = pagaeTotalCount;
// }


// // 네비게이션을 추가해줄 요소를 얻어옴
// let pages = $("#pages")

// // 더 보여줄 앞장, 뒷장이 있는지
// let needPrev = true;
// let needNext = true;
// // 네비값이 1이면 앞장 안보여줌, 네비값이 끝장이면 뒷장 안보여줌
// if(startNavi == 1){needPrev = false;}
// if(endNavi == pagaeTotalCount){needNext = false;}

// if(needPrev) {
// 	pages.append("<a href='"+(startNavi-1)+"'>"+"<<"+"</a>");
// }

// for(let i=startNavi;i<=endNavi;i++){
// 	pages.append("<a href='"+i+"'>"+i+" </a>");
// }

// if(needNext){
// 	pages.append("<a href='"+(endNavi+1)+"'>"+">>"+"</a>");
// }
</script>

</html>