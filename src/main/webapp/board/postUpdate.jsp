<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RUSH-게시글 수정</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>

<!-- 스타일 시트 & js -->
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/board/boardWrite.css">
<script src="/js/board/isUserImmediately.js"></script>

<!-- <script type="text/javascript" src="/js/board/summernote_editor.js"></script> -->

<!-- 부트스트랩 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>


<!-- summernote -->

<!-- Header Style -> 부트스트랩 속성 제거 -->
<style>
* {
	box-sizing: border-box;
	margin: 0px;
	padding: 0px;
	text-decoration: none;
	list-style: none;
}

.container {
	width: 100% !important;
}

a {
	text-decoration: none !important;
	color: #111111 !important;
}

</style>
<script>
	window.history.forward(); function noBack(){
		window.history.forward();
	}
</script>
</head>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
	<div class="container-fluid p-0">
		<input id="userID" type="hidden" value="${loginID}">
		<%@ include file="/common/writeHeader.jsp" %>
		<div class="boardWrite">
			<div class="boardWrite_guide">
				<c:choose>
					<c:when test="${menu == 'qna'}">
						<form action="/update.qna" method="post" enctype="multipart/form-data">
							<input type="hidden" value="${category }" name="category">
							<input type="hidden" value="${post.seq}" name="postSeq">
							<input type="hidden" value="${requestScope.cpage}" name="cpage">
							<input type="hidden" name="searchBy" value="${searchBy}">
							<input type="hidden" name="keyword" value="${keyword}">
							<textarea id="deleteFiles" style="display:none;" name="deleteFiles"></textarea>
	       					<textarea id="deleteImgs" style="display:none;" name="deleteImgs"></textarea>
							<div class="writeTitle">Q&A 수정</div>
								
							<input type="text" class="inputTitle" name="title"
								placeholder="제목을 입력하세요" value="${post.title}">
							 <div class="fileBox">
					            <input type="button" id="btnAdd" class="writebtn bColorGreen"
					                value="+"> <span>파일첨부</span>
					            <div id="fileContainer">
					                <c:choose>
					                    <c:when test="${files.size()>0}">
					                        <c:forEach var="i" items="${files}" varStatus="status">
					                            <div>
					                                <input type="file" style="display:none">
					                                <span style="display: inline; margin-top: 10px;" id="file${status.index}">${i.originName}</span>
					                                <input value="x" type="button" class="del filedel" style="border: none; width: 30px; height: 30px;">
					                                <input type="hidden" value="${i.seq}">
					                            </div>
					                        </c:forEach>
					                    </c:when>
					                </c:choose>
					            
					                <script>
					                    $(document).on("click", ".filedel", function() {
					                        let fileSeq = $(this).next().val();
					                        let prev = $("#deleteFiles").html();
					                        $("#deleteFiles").html(prev+","+fileSeq);
					                    });
					                    
					                </script>
					            </div>
					        </div>
							<textarea id="summernote" class="content" rows="35" cols="100"
								placeholder="내용을 입력하세요." name="contents">${post.contents}</textarea>
							<div class="secretBox">
								
								<c:choose>
									<c:when test="${post.secret eq false}">
										<input id="secret" class="screteChk" type="checkbox"> 
										<input id="secret_hidden" class="screteChk" type="hidden" name="secret" value="false"> 
										<label for="secret" class="colorDarkgray">비밀글 설정하기</label>
									</c:when>
									<c:otherwise>
										<input id="secret" class="screteChk" type="checkbox" checked> 
										<input id="secret_hidden" class="screteChk" type="hidden" name="secret" value="true"> 
										<label for="secret" class="colorDarkgray">비밀글 설정하기</label>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="writeBox">
					            <c:choose>
					                <c:when test="${not empty searchBy}">
					                    <a href="/listing.qna?category=${category }&cpage=${requestScope.cpage}&searchBy=${searchBy}&keyword=${keyword}">
					                    <input class="writebtn bColorGreen" type="button" value="목록으로"></a>
					                </c:when>
					                <c:otherwise>
					                    <a href="/listing.qna?category=${category }&cpage=${requestScope.cpage}">
					                    <input class="writebtn bColorGreen" type="button" value="목록으로"></a>
					                </c:otherwise>
					            </c:choose>
					            
					            <input class="writebtn bColorGreen" type="submit" value="수정">
					        </div>
						</form>
						<script type="text/javascript" src="/js/board/qnaWriteSecret.js"></script>
					</c:when>
					<c:otherwise>
						<form action="/update.board" method="post"
							enctype="multipart/form-data" id="boardForm">
							<input type="hidden" value="${category }" name="category">
							<input type="hidden" value="${post.seq}" name="postSeq">
							<input type="hidden" value="${requestScope.cpage}" name="cpage">
							<input type="hidden" name="search" value="${search}">
							<input type="hidden" name="keyword" value="${keyword}">
							<textarea id="deleteFiles" style="display:none;" name="deleteFiles"></textarea>
							<textarea id="deleteImgs" style="display:none;" name="deleteImgs"></textarea>
							<c:choose>
								<c:when test="${loginID eq 'admin' }">
									<div class="writeTitle">공지게시글 수정</div>
								</c:when>
								<c:otherwise>
									<div class="writeTitle">자유게시글 수정</div>
								</c:otherwise>
							</c:choose>
							<input type="text" class="inputTitle" name="title"
								placeholder="제목을 입력하세요" id="title" value="${post.title}">
							<div class="fileBox">
								<input type="button" id="btnAdd" class="writebtn bColorGreen"
									value="+"> <span>파일첨부</span>
								<div id="fileContainer">
									<c:choose>
										<c:when test="${files.size()>0}">
											<c:forEach var="i" items="${files}" varStatus="status">
												<div>
													
													<input type="file" style="display:none">
													<span style="display: inline; margin-top: 10px;" id="file${status.index}">${i.originName}</span>
													<input value="x" type="button" class="del filedel" style="border: none; width: 30px; height: 30px;">
													<input type="hidden" value="${i.seq}">
												</div>
											</c:forEach>
										</c:when>
									</c:choose>
								
									<script>
										$(document).on("click", ".filedel", function() {
											let fileSeq = $(this).next().val();
											let prev = $("#deleteFiles").html();
											$("#deleteFiles").html(prev+","+fileSeq);
										});
										
									</script>
								</div>
							</div>
							<textarea id="summernote" class="content" id="content" rows="35"
								cols="100" placeholder="내용을 입력하세요." name="contents">${post.contents}</textarea>
							<div class="writeBox">
								<c:choose>
									<c:when test="${not empty search}">
										<a href="/listing.board?category=${category }&cpage=${requestScope.cpage}&search=${search}&keyword=${keyword}">
										<input class="writebtn bColorGreen" type="button" value="목록으로"></a>
									</c:when>
									<c:otherwise>
										<a href="/listing.board?category=${category }&cpage=${requestScope.cpage}">
										<input class="writebtn bColorGreen" type="button" value="목록으로"></a>
									</c:otherwise>
								</c:choose>
								
								<input class="writebtn bColorGreen" type="submit" value="수정">
							</div>
						</form>
					</c:otherwise>
				</c:choose>
			</div>
		</div>

			<%@include file="/common/writeFooter.jsp"%>
		</div>
	</div>
</body>
</html>