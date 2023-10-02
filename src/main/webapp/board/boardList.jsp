<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RUSH-게시판</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- 스타일 시트, 자바 스크립트 -->
<%@ include file="/common/style.jsp" %>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/board/boardList.css">
<script type="text/javascript" src="/js/board/boardTab.js"></script>
<script type="text/javascript" src="/js/board/boardMainPagination.js"></script>
<script type="text/javascript" src="/js/board/isUser.js"></script>

<!-- 부트스트랩, fontawesome -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<style>
* {
	box-sizing: border-box;
	margin: 0px;
	padding: 0px;
	text-decoration: none;
	list-style: none;
}

.container {
	width: 100%;
}

a {
	text-decoration: none;
}

.dropdown-menu[data-bs-popper] {
	right: 0;
	left: auto;
}
</style>
</head>
<body>
	<div class="container-fluid p-0">
	<%@ include file="/common/header.jsp" %>
		<div class="board">
			<div class="board_guide">
				<div class="boardNav">
					<div class="boardNav_body">
						<a href="/listing.board?cpage=1"><div
								class="boardNav_li bColorGreen">자유게시판</div></a> <a
							href="/listing.qna?cpage=1"><div
								class="boardNav_li fontEnglish">Q&A</div></a>
					</div>
				</div>
				<div class="boardCont">
					<div class="boardTitle">자유게시판</div>
					<ul class="tabs boardTabs">
						<a href="/listing.board?category=rhythm&cpage=1"
							class="rhythm current"><li class="tab-link">리듬게임</li></a>
						<a href="/listing.board?category=arcade&cpage=1" class="arcade"><li
							class="tab-link">아케이드게임</li></a>
						<a href="/listing.board?category=puzzle&cpage=1" class="puzzle"><li
							class="tab-link">퍼즐게임</li></a>
					</ul>


					<div class="boardHeader">
						<div class="num">번호</div>
						<div class="title">제목</div>
						<div class="writer">작성자</div>
						<div class="date">작성일</div>
						<div class="view">조회</div>
						<div class="recommend">추천</div>
						<div class="file">파일</div>
					</div>
					<div class="boardMain">
						<c:forEach var="noti" items="${notiList }">
							<div class="post bColorBoard">
								<div class="maxBoard">
									<div class="num"></div>
									<div class="title">
										<div class="loud">
											<i class="fa-solid fa-bullhorn"></i>
										</div>
										<a
											href="/load.board?cpage=${cpage }&seq=${noti.seq }&category=${category }&menu=board"><div
												class="mainTitle">${noti.title }</div></a>

										<div class="replyCnt colorPink fontEnglish">${noti.replyCount }</div>
									</div>
									<div class="writer">${noti.nickName }</div>
									<div class="date">${noti.stringFormat }</div>
									<div class="view fontEnglish">${noti.view }</div>
									<div class="recommend fontEnglish">${noti.recommend }</div>
									<c:if test="${noti.fCount!=0 }">
										<div class="file">
											<i class="fa-solid fa-paperclip"></i>
										</div>
									</c:if>

								</div>
								<div class="minBoard">
									<div class="num"></div>
									<div class="minCon">
										<div class="title">
											<div class="loud">
												<i class="fa-solid fa-bullhorn"></i>
											</div>
											<a
												href="/load.board?cpage=${cpage }&seq=${noti.seq }&category=${category }&menu=board"><div
													class="mainTitle">${noti.title }</div></a>
											<div class="replyCnt colorPink fontEnglish">${noti.replyCount }</div>
										</div>
										<div class="info">
											<div class="minWriter colorDarkgray">${noti.nickName }</div>
											<div class="minDate colorDarkgray">${noti.stringFormat }</div>
											<div class="minView fontEnglish colorDarkgray">
												<i class="fa-regular fa-eye"></i>&nbsp;${noti.view }
											</div>
											<div class="minRecommend fontEnglish colorDarkgray">
												<i class="fa-regular fa-thumbs-up"></i>&nbsp;${noti.recommend }
											</div>
											<c:if test="${noti.fCount!=0 }">
												<div class="minFile">
													<i class="fa-solid fa-paperclip"></i>
												</div>
											</c:if>

										</div>
									</div>
								</div>
							</div>
						</c:forEach>
						<c:choose>
							<c:when test="${recordTotalCount != 0 }">
								<c:forEach var="post" items="${boardList }">
									<div class="post">
										<div class="maxBoard">
											<div class="num fontEnglish">${post.seq }</div>
											<div class="title">
												<a
													href="/load.board?cpage=${cpage }&seq=${post.seq }&category=${category }&menu=board"><div
														class="mainTitle">${post.title }</div></a>
												<div class="replyCnt colorPink fontEnglish">${post.replyCount }</div>
											</div>
											<div class="writer">${post.nickName }</div>
											<div class="date">${post.stringFormat }</div>
											<div class="view fontEnglish">${post.view }</div>
											<div class="recommend fontEnglish">${post.recommend }</div>
											<c:if test="${post.fCount!=0 }">
												<div class="file">
													<i class="fa-solid fa-paperclip"></i>
												</div>
											</c:if>

										</div>
										<div class="minBoard">
											<div class="num fontEnglish">${post.seq }</div>
											<div class="minCon">
												<div class="title">
													<a href="/load.board?cpage=${cpage }&seq=${post.seq }&category=${category }&menu=board"><div
															class="mainTitle">${post.title }</div></a>
													<div class="replyCnt colorPink fontEnglish">${post.replyCount }</div>
												</div>
												<div class="info">
													<div class="minWriter colorDarkgray">${post.nickName }</div>
													<div class="minDate colorDarkgray">${post.stringFormat }</div>
													<div class="minView fontEnglish colorDarkgray">
														<i class="fa-regular fa-eye"></i>&nbsp;${post.view }
													</div>
													<div class="minRecommend fontEnglish colorDarkgray">
														<i class="fa-regular fa-thumbs-up"></i>&nbsp;${post.recommend }
													</div>
													<c:if test="${post.fCount!=0 }">
														<div class="minFile">
															<i class="fa-solid fa-paperclip"></i>
														</div>
													</c:if>

												</div>
											</div>
										</div>
									</div>

								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="noResult">검색 결과가 없습니다.</div>
							</c:otherwise>
						</c:choose>


					</div>
					<div id="pagination"></div>
					<div class="search_write">
						<div class="write"></div>
						<div class="search">
							<form id="searchForm">
								<input type="hidden" name="category" value=${category }>
								<div>
									<select class="form-select" aria-label="Default select example"
										name="search">
										<option value="title" selected>제목</option>
										<option value="writer">작성자</option>
										<option value="content">내용</option>
									</select>
								</div>
								<div class="keyword">
									<input type="text" name="keyword" value="${keyword }"
										id="keyword">
								</div>
								<div class="sertchBtn">
									<input type="submit" class="boardBtn bColorGreen" value="검색">
								</div>
							</form>

						</div>
						<div class="write">
							<a id="writeBtnLink" href=""><input type="button" value="글쓰기"
								class="boardBtn bColorGreen"></a>

						</div>
					</div>
				</div>
			</div>
		</div>

		<input type="hidden" value="${category }" id="category"> <input
			type="hidden" id="recordTotalCount" value="${recordTotalCount }">
		<input type="hidden" id="recordCountPerPage"
			value="${recordCountPerPage }"> <input type="hidden"
			id="naviCountPerPage" value="${naviCountPerPage }"> <input
			type="hidden" id="lastPageNum" value="${lastPageNum }"> <input
			type="hidden" value=${search } id="search"> 
			<input type="hidden" value=${loginID } id="userID">
			
			<a href="#">
			<div class="upArrow bColorPink colorWhite">
				<i class="fa-solid fa-arrow-up-long"></i>
			</div>
		</a>
		<%@include file="/common/footer.jsp"%>
	</div>
</body>
</html>