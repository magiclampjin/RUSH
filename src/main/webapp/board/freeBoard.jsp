<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link rel="stylesheet" href="/css/main.css">
<link rel="stylesheet" href="/css/board/freeboard.css">
<script type="text/javascript" src="/js/board/boardTab.js"></script>

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
        <div class="header bColorBlack">
            <div class="header_guide">
                <a href="#">
                    <div class="logo fontLogo colorWhite">RUSH</div>
                </a>
                <nav class="navbar navbar-expand navbar-light colorWhite">
                    <div class="container-fluid p-0">
                        <div class="collapse navbar-collapse w-100 g-0 m-0" id="navbarNavDropdown">
                            <ul class="navbar-nav row g-0 w-100">
                                <li class="nav-item dropdown col-3 text-end">
                                    <a class="nav-link text-white fontEnglish" href="#" id="navbarDropdownMenuLink"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        GAME
                                    </a>
                                    <ul class="dropdown-menu p-0" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Another action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Something else here</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown col-3 text-end">
                                    <a class="nav-link text-white fontEnglish" href="#" id="navbarDropdownMenuLink"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        AWARDS
                                    </a>
                                    <ul class="dropdown-menu p-0" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Another action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Something else here</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown col-3 text-end">
                                    <a class="nav-link text-white fontEnglish" href="#" id="navbarDropdownMenuLink"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        BOARD
                                    </a>
                                    <ul class="dropdown-menu p-0" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Another action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Something else here</a></li>
                                    </ul>
                                </li>
                                <li class="nav-item dropdown col-3 text-end">
                                    <a class="nav-link text-white fontEnglish" href="#" id="navbarDropdownMenuLink"
                                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                        LOGIN
                                    </a>
                                    <ul class="dropdown-menu p-0" aria-labelledby="navbarDropdownMenuLink">
                                        <li><a class="dropdown-item fontEnglish" href="#">Action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Another action</a></li>
                                        <li><a class="dropdown-item fontEnglish" href="#">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </div>
        </div>

        <div class="board">
            <div class="board_guide">
                <div class="boardNav">
                    <div class="boardNav_body">
                        <div class="boardNav_li bColorGreen">자유게시판</div>
                        <div class="boardNav_li">Q&A</div>
                    </div>
                </div>
                <div class="boardCont">
                    <div class="boardTitle">자유게시판</div>
                    <ul class="tabs boardTabs">
                        <li class="tab-link current" data-tab="tab-1">리듬게임</li>
                        <li class="tab-link" data-tab="tab-2">아케이드게임</li>
                        <li class="tab-link" data-tab="tab-3">퍼즐게임</li>
                    </ul>

                    <div id="tab-1" class="tab-content current">
                        <div class="boardHeader">
                            <div class="col-1">번호</div>
                            <div class="col-5">제목</div>
                            <div class="col-2">작성자</div>
                            <div class="col-2">작성일</div>
                            <div class="col-1">조회</div>
                            <div class="col-1">파일</div>
                        </div>
                        <div class="boardMain">
                            <div class="post notice bColorBoard">
                                <div class="bNum col-1">번호</div>
                                <div class="bTitle col-5">
                                    <div class="loud"><i class="fa-solid fa-bullhorn"></i></div>
                                    <div class="mainTitle">관리자만 작성할 수 있는
                                        공지글 영역입니다.</div>
                                    <div class="replyCnt colorBlue fontEnglish">2</div>
                                </div>
                                <div class="bWriter col-2">작성자</div>
                                <div class="bDate col-2">2023-09-16</div>
                                <div class="bView col-1">조회</div>
                                <div class="bFile col-1"><i class="fa-solid fa-paperclip"></i></div>
                            </div>
                            <div class="post general">
                                <div class="bNum col-1">1</div>
                                <div class="bTitle col-5">
                                    <div class="mainTitle">회원만 작성할 수 있는 자유게시판 영역입니다.</div>
                                    <div class="replyCnt colorBlue fontEnglish">2</div>
                                </div>
                                <div class="bWriter col-2">작성자</div>
                                <div class="bDate col-2">2023-09-16</div>
                                <div class="bView col-1">조회</div>
                                <div class="bFile col-1"><i class="fa-solid fa-paperclip"></i></div>
                            </div>
                        </div>
                        <div class="pagination">
                            123456789>>>
                        </div>
                        <div class="search_write">
                            <div class="search col-11">
                                <form action="">
                                    <div class="category">
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected>제목</option>
                                            <option value="1">작성자</option>
                                            <option value="2">내용</option>
                                        </select>
                                    </div>
                                    <div class="keyword">
                                        <input type="text">
                                    </div>
                                    <div class="sertchBtn">
                                        <input type="submit" class="boardBtn">
                                    </div>
                                </form>

                            </div>
                            <div class="write col-1">
                                <input type="button" value="글쓰기" class="boardBtn">
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-content">
                        <div class="boardHeader">
                            <div class="col-1">번호</div>
                            <div class="col-5">제목</div>
                            <div class="col-2">작성자</div>
                            <div class="col-2">작성일</div>
                            <div class="col-1">조회</div>
                            <div class="col-1">파일</div>
                        </div>
                        <div class="boardMain">
                            <div class="post notice bColorBoard">
                                <div class="bNum col-1">번호</div>
                                <div class="bTitle col-5">
                                    <div class="loud"><i class="fa-solid fa-bullhorn"></i></div>
                                    <div class="mainTitle">관리자만 작성할 수 있는
                                        공지글 영역입니다.</div>
                                    <div class="replyCnt colorBlue fontEnglish">2</div>
                                </div>
                                <div class="bWriter col-2">작성자</div>
                                <div class="bDate col-2">2023-09-16</div>
                                <div class="bView col-1">조회</div>
                                <div class="bFile col-1"><i class="fa-solid fa-paperclip"></i></div>
                            </div>
                            <div class="post general">
                                <div class="bNum col-1">1</div>
                                <div class="bTitle col-5">
                                    <div class="mainTitle">회원만 작성할 수 있는 자유게시판 영역입니다.</div>
                                    <div class="replyCnt colorBlue fontEnglish">2</div>
                                </div>
                                <div class="bWriter col-2">작성자</div>
                                <div class="bDate col-2">2023-09-16</div>
                                <div class="bView col-1">조회</div>
                                <div class="bFile col-1"><i class="fa-solid fa-paperclip"></i></div>
                            </div>
                        </div>
                        <div class="pagination">
                            123456789>>>
                        </div>
                        <div class="search_write">
                            <div class="search col-11">
                                <form action="">
                                    <div class="category">
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected>제목</option>
                                            <option value="1">작성자</option>
                                            <option value="2">내용</option>
                                        </select>
                                    </div>
                                    <div class="keyword">
                                        <input type="text">
                                    </div>
                                    <div class="sertchBtn">
                                        <input type="submit" class="boardBtn">
                                    </div>
                                </form>

                            </div>
                            <div class="write col-1">
                                <input type="button" value="글쓰기" class="boardBtn">
                            </div>
                        </div>
                    </div>
                    <div id="tab-3" class="tab-content">
                        <div class="boardHeader">
                            <div class="col-1">번호</div>
                            <div class="col-5">제목</div>
                            <div class="col-2">작성자</div>
                            <div class="col-2">작성일</div>
                            <div class="col-1">조회</div>
                            <div class="col-1">파일</div>
                        </div>
                        <div class="boardMain">
                            <div class="post notice bColorBoard">
                                <div class="bNum col-1">번호</div>
                                <div class="bTitle col-5">
                                    <div class="loud"><i class="fa-solid fa-bullhorn"></i></div>
                                    <div class="mainTitle">관리자만 작성할 수 있는
                                        공지글 영역입니다.</div>
                                    <div class="replyCnt colorBlue fontEnglish">2</div>
                                </div>
                                <div class="bWriter col-2">작성자</div>
                                <div class="bDate col-2">2023-09-16</div>
                                <div class="bView col-1">조회</div>
                                <div class="bFile col-1"><i class="fa-solid fa-paperclip"></i></div>
                            </div>
                            <div class="post general">
                                <div class="bNum col-1">1</div>
                                <div class="bTitle col-5">
                                    <div class="mainTitle">회원만 작성할 수 있는 자유게시판 영역입니다.</div>
                                    <div class="replyCnt colorBlue fontEnglish">2</div>
                                </div>
                                <div class="bWriter col-2">작성자</div>
                                <div class="bDate col-2">2023-09-16</div>
                                <div class="bView col-1">조회</div>
                                <div class="bFile col-1"><i class="fa-solid fa-paperclip"></i></div>
                            </div>
                        </div>
                        <div class="pagination">
                            123456789>>>
                        </div>
                        <div class="search_write">
                            <div class="search col-11">
                                <form action="">
                                    <div class="category">
                                        <select class="form-select" aria-label="Default select example">
                                            <option selected>제목</option>
                                            <option value="1">작성자</option>
                                            <option value="2">내용</option>
                                        </select>
                                    </div>
                                    <div class="keyword">
                                        <input type="text">
                                    </div>
                                    <div class="sertchBtn">
                                        <input type="submit" class="boardBtn">
                                    </div>
                                </form>

                            </div>
                            <div class="write col-1">
                                <input type="button" value="글쓰기" class="boardBtn">
                            </div>
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

        <div class="footer bColorBlack">
            <div class="footer_guide">
                <div class="footer_logo fontLogo colorWhite">RUSH</div>
                <div class="copy fontEnglish colorWhite">COPYRIGHT © SKY. ALL RIGHT RESERVED</div>
                <div class="footer_contents">
                    <div class="about conDiv fontEnglish colorWhite">
                        <div class="footer_title fontEnglish">ABOUT US</div>
                        <div class="footer_con ">
                            <div class="con">팀명 :
                            </div>
                            <div class="encon"> SKY</div>
                        </div>
                    </div>
                    <div class="office conDiv fontEnglish colorWhite">
                        <div class="footer_title fontEnglish">OFFICE</div>
                        <div class="footer_con">
                            <div class="con">충청남도 천안시 서북구 천안대로 1223-24</div>
                        </div>
                    </div>
                    <div class="contact conDiv fontEnglish colorWhite">
                        <div class="footer_title fontEnglish">CONTACT US</div>
                        <div class="footer_con fontEnglish">
                            <div class="con fontEnglish">a@naver.com</div>
                            <div class="con fontEnglish">01012345678</div>
                        </div>
                    </div>
                    <div class="provision conDiv fontEnglish colorWhite">
                        <div class="footer_title fontEnglish">PROVISION</div>
                        <div class="footer_con">
                            <div class="con">개인정보 처리방침</div>
                            <div class="con">서비스 이용약관</div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</body>
</html>