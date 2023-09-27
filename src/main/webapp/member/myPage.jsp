<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RUSH-마이페이지</title>

<%@ include file="/common/style.jsp" %>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/member/myPage.css">
<link rel="stylesheet" href="/css/board/boardList.css">
<script type="text/javascript" src="/js/member/infoModified.js"></script>
<script type="text/javascript" src="/js/member/myPage.js"></script>
<script type="text/javascript" src="/js/member/secession.js"></script>
<script type="text/javascript" src="/js/member/favoriteTab.js"></script>
<script type="text/javascript" src="/js/member/recordTab.js"></script>
<script type="text/javascript" src="/js/member/adminPagination.js"></script>

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

/*.num, .writer, .date, .file {
   width: 15%;
}*/

/*<<<<<<< HEAD
=======
.mainTitle {
   padding-left: 5px;
}

.tabBox {
   border: 1px solid black;
   border-radius: 5px;
}

ul.tabs {
   margin: 0px;
   padding: 0px;
   list-style: none;
   border-bottom: 1px solid black;
   display: flex;
}

ul.tabs li {
   background: none;
   color: #222;
   display: inline-block;
   padding: 10px 0px;
   cursor: pointer;
   width: 25%;
   text-align: center;
}

ul.tabs li.current {
   background: #ededed;
   background-color: #131217;
   color: #ffffff;
}

.tab-content {
   display: none;
   padding: 15px;
   height: 600px;
   margin: 0px;
}

.tab-content.current {
   display: inherit;
}

#tab-1,#tab-2,#tab-3,#tab-4 {
   overflow: auto;
}
>>>>>>> c51216701a3a38dfd8dd7355c4979538cd34cd47*/
</style>
</head>
<body>
   <div class="container-fluid p-0">
      <%@ include file="/common/header.jsp" %>

      <div class="myPage">
         <div class="nickNameBox bColorBlack">
            <div class="nicknameInfo">
               <div class="nickname colorWhite">${loginNickname }님</div>
               <c:if test="${loginID != 'admin' }">
                  <div class="levelBox">
                     <div class="level colorWhite fontEnglish">Lv. ${user.level }</div>
                     <div class="singDay colorDarkgray">가입일: ${user.stringFormat }</div>
                  </div>
               </c:if>

            </div>
         </div>
         <div class="myPage_guide">
            <div class="memberInfo">
               <div class="memberBasicTitle">기본 회원정보</div>
               <c:choose>
                  <c:when test="${loginID == 'admin' }">
                     <div class="memberInfoBox updateBox">
                        <div class="infoBox">
                           <!-- div였다가 수정하기 버튼 누르면 input 나오게 -->
                           <div class="infoCagetory">아이디</div>
                           <div class="infocon">${loginID }</div>
                           <input type="hidden" id="userID" value="${loginID }">
                        </div>
                        <div class="infoBox">
                           <div class="infoCagetory">비밀번호</div>
                           <div class="infocon">
                              <i class="fa-solid fa-lock"></i>&nbsp;비밀번호
                           </div>
                        </div>
                        <div class="infoBox modifiedBox">
                           <div>
                              <input class="myPagebtn bColorBlue colorWhite"
                                 id="pwUpdateBtn" type="button" value="비밀번호 수정하기">
                           </div>
                        </div>
                     </div>
                  </c:when>
                  <c:otherwise>
                     <div class="memberInfoBox updateBox">
                        <div class="infoBox">
                           <!-- div였다가 수정하기 버튼 누르면 input 나오게 -->
                           <div class="infoCagetory">아이디</div>
                           <div class="infocon">${user.id }</div>
                           <input type="hidden" id="userID" value="${user.id }">
                        </div>
                        <div class="infoBox">
                           <div class="infoCagetory">비밀번호</div>
                           <div class="infocon">
                              <i class="fa-solid fa-lock"></i>&nbsp;비밀번호
                           </div>
                        </div>
                        <div class="infoBox">
                           <div class="infoCagetory">닉네임</div>
                           <div class="infocon">${user.nickName }</div>
                           <input type="hidden" id="userNick" value="${user.nickName }">
                        </div>
                        <div class="infoBox">
                           <div class="infoCagetory">휴대전화</div>
                           <div class="infocon">${user.phone }</div>
                           <input type="hidden" id="userPhone" value="${user.phone }">
                        </div>
                        <div class="infoBox">
                           <div class="infoCagetory">이메일</div>
                           <div class="infocon">${user.email }</div>
                           <input type="hidden" id="userEmail" value="${user.email }">
                        </div>
                        <div class="infoBox modifiedBox">
                           <div>
                              <input class="myPagebtn bColorBlue colorWhite"
                                 id="pwUpdateBtn" type="button" value="비밀번호 수정하기"> <input
                                 class="myPagebtn bColorBlue colorWhite" id="updateBtn"
                                 type="button" value="개인정보 수정하기">
                           </div>
                        </div>
                     </div>
                  </c:otherwise>
               </c:choose>

            </div>
            <c:if test="${loginID != 'admin' }">
               <div class="memberInfo">
                  <div class="memberBasicTitle">추가 회원정보</div>
                  <div class="memberInfoBox">
                     <div class="infoBox">
                        <div class="infoCagetory">생년월일</div>
                        <div class="infocon">${user.formedBirth }</div>
                     </div>
                     <div class="infoBox">
                        <div class="infoCagetory">성별</div>
                        <div class="infocon">${user.gender }</div>
                     </div>
                  </div>
               </div>
            </c:if>


            <c:choose>
               <c:when test="${loginID == 'admin' }">
                  <div class="memberInfo">
                     <div class="memberBasicTitle">작성된 공지글</div>
                     <div class="memberInfoBox adminBoard">
                        <div class="boardHeader">
                           <div class="num">번호</div>
                           <div class="title">제목</div>
                           <div class="writer">작성자</div>
                           <div class="date">작성일</div>
                           <div class="view">조회</div>
                           <div class="recommend">추천</div>
                           <div class="file">파일</div>
                           <div class="pin">고정</div>
                        </div>
                        <div class="adminBoardBody"></div>
                        <div id="adminPagination"></div>
                     </div>

                  </div>
               </c:when>
               <c:otherwise>
                  <div class="memberInfo">
                     <div class="tabBox">
                        <!-- 탭박스 -->
                        <ul class="tabs">
                           <li class="tab-link current" id="myWrite" data-tab="tab-1">내가
                              쓴 글</li>
                           <li class="tab-link" id="myBookMark" data-tab="tab-2">북마크</li>
                           <li class="tab-link" id="favorites" data-tab="tab-3">즐겨찾기</li>
                           <li class="tab-link" id="gameRecord" data-tab="tab-4">게임기록</li>
                        </ul>

                        <div id="tab-1" class="tab-content current">
                           <div class="boardHeader">
                              <div class="num">번호</div>
                              <div class="title">제목</div>
                              <div class="writer">작성자</div>
                              <div class="date">작성일</div>
                              <div class="view">조회</div>
                              <div class="recommend">추천</div>
                              <div class="file">파일</div>
                           </div>
                           <div class="post1" id="post">
                           	
                           </div>
                        </div>
                        <div id="tab-2" class="tab-content">
                           <div class="boardHeader">
                              <div class="num">번호</div>
                              <div class="title">제목</div>
                              <div class="writer">작성자</div>
                              <div class="date">작성일</div>
                              <div class="view">조회</div>
                              <div class="recommend">추천</div>
                              <div class="file">파일</div>
                           </div>
                           <div class="post2" id="post">
                           		
                           </div>
                        </div>
                        <div id="tab-3" class="tab-content">
                           <div class="favoriteTabBox">
                              <!-- 탭박스 -->
                              <ul class="favoriteTabs">
                                 <li class="tab-link current" id="favoriteAll"
                                    data-tab="favoriteTab-1">전체</li>
                                 <li class="tab-link" id="Arcade" data-tab="favoriteTab-2">Arcade</li>
                                 <li class="tab-link" id="Puzzle" data-tab="favoriteTab-3">Puzzle</li>
                                 <li class="tab-link" id="Rhythm" data-tab="favoriteTab-4">Rhythm</li>
                              </ul>
                              <div class="favoriteCategory">
                                 <select class="form-select"
                                    aria-label="Default select example" id="selectBox"
                                    name="favoriteCategory">
                                    <option value="currentOrder" selected>최신순</option>
                                    <option value="favoriOrder">인기순</option>
                                    <option value="nameOrder">이름순</option>
                                 </select>
                              </div>
                              <div id="favoriteTab-1" class="favoriteTab-content current">
                                 <div class="favoriteHeader">
                                    <div class="gameInfoBox">게임 정보</div>
                                    <div class="gameLink">게임 바로가기</div>
                                 </div>
                                 <div class="favoriteBody"></div>
                              </div>
                              <div id="favoriteTab-2" class="favoriteTab-content">
                                 <div class="favoriteHeader">
                                    <div class="gameInfoBox">게임 정보</div>
                                    <div class="gameLink">게임 바로가기</div>
                                 </div>
                                 <div class="favoriteBody"></div>
                              </div>
                              <div id="favoriteTab-3" class="favoriteTab-content">
                                 <div class="favoriteHeader">
                                    <div class="gameInfoBox">게임 정보</div>
                                    <div class="gameLink">게임 바로가기</div>
                                 </div>
                                 <div class="favoriteBody"></div>
                              </div>
                              <div id="favoriteTab-4" class="favoriteTab-content">
                                 <div class="favoriteHeader">
                                    <div class="gameInfoBox">게임 정보</div>
                                    <div class="gameLink">게임 바로가기</div>
                                 </div>
                                 <div class="favoriteBody"></div>
                              </div>
                           </div>
                        </div>
                        <div id="tab-4" class="tab-content">
                           <div class="recordTabBox">
                              <!-- 탭박스 -->
                              <ul class="recordTabs">
                                 <li class="tab-link current" id="gameAll"
                                    data-tab="recordTab-1">전체</li>
                                 <li class="tab-link" id="Candy" data-tab="recordTab-2">Candy Crush</li>
                                 <li class="tab-link" id="Doodle" data-tab="recordTab-3">Doodle Jump</li>
                                 <li class="tab-link" id="Flappy" data-tab="recordTab-4">Fluppy Bird</li>
                                 <li class="tab-link" id="Kjmax" data-tab="recordTab-5">KJMAX</li>
                                 <li class="tab-link" id="Kordle" data-tab="recordTab-6">Kordle</li>
                              </ul>
                              <div class="recordCategory">
                                 <select class="form-select"
                                    aria-label="Default select example" id="selectBoxGame"
                                    name="recordCategory">
                                    <option value="score" selected>점수순</option>
                                    <option value="time">최신순</option>
                                 </select>
                              </div>
                              <div id="recordTab-1" class="recordTab-content current">
                                 <div class="recordHeader">
                                    <div class="gameRank">게임명</div>
                                    <div class="gameScore">점수</div>
                                    <div class="gameTime">게임일시</div>
                                 </div>
                                 <div class="recordBody"></div>
                              </div>
                              <div id="recordTab-2" class="recordTab-content">
                                 <div class="recordHeader">
                                    <div class="gameRank">게임명</div>
                                    <div class="gameScore">점수</div>
                                    <div class="gameTime">게임일시</div>
                                 </div>
                                 <div class="recordBody"></div>
                              </div>
                              <div id="recordTab-3" class="recordTab-content">
                                 <div class="recordHeader">
                                    <div class="gameRank">게임명</div>
                                    <div class="gameScore">점수</div>
                                    <div class="gameTime">게임일시</div>
                                 </div>
                                 <div class="recordBody"></div>
                              </div>
                              <div id="recordTab-4" class="recordTab-content">
                                 <div class="recordHeader">
                                    <div class="gameRank">게임명</div>
                                    <div class="gameScore">점수</div>
                                    <div class="gameTime">게임일시</div>
                                 </div>
                                 <div class="recordBody"></div>
                              </div>
                              <div id="recordTab-5" class="recordTab-content">
                                 <div class="recordHeader">
                                    <div class="gameRank">게임명</div>
                                    <div class="gameScore">점수</div>
                                    <div class="gameTime">게임일시</div>
                                 </div>
                                 <div class="recordBody"></div>
                              </div>
                              <div id="recordTab-6" class="recordTab-content">
                                 <div class="recordHeader">
                                    <div class="gameRank">게임명</div>
                                    <div class="gameScore">점수</div>
                                    <div class="gameTime">게임일시</div>
                                 </div>
                                 <div class="recordBody"></div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>

               </c:otherwise>
            </c:choose>



            <div class="memberInfo">
               <div class="deletBtnBox">
                  <span>탈퇴를 원하시면 탈퇴버튼을 눌러주세요.</span> <input type="button"
                     class="deleteBtn bColorWhite colorDarkgray" id="secessionBtn"
                     value="회원탈퇴">
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