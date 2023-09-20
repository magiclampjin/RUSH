<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Awards</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="/css/main.css" rel="stylesheet">
<link href="/css/board/awards.css" rel="stylesheet">
<script type="text/javascript" src="/js/board/awards.js"></script>

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
	<body class="bColorBlack">
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

        <div id="container" class="container bColorBlack">
            <div id="title" class="colorWhite">명예의 전당</div>
            <div id="category" class="row g-0 m-0">
                <div id="leftCategory" class="game col bColorGreen">게임1</div>
                <div class="game col colorWhite">게임2</div>
                <div class="game col colorWhite">게임3</div>
                <div class="game col colorWhite">게임4</div>
                <div id="rightCategory" class="game col colorWhite">게임5</div>
            </div>
            <div id="Box row">
                <div class="line col"></div>
                <div class="subTitleBox row g-0">
                    <div class="subTitle col-1 colorWhite">순위</div>
                    <div class="col-11">
                        <div class="row">
                            <div class="subTitle col-8 col-md-9 colorWhite">유저 정보</div>
                            <div class="subTitle col-2 col-lg-3 colorWhite">점수</div>
                        </div> 
                    </div>
                </div>
                <div class="line col"></div>
                <div id="ranker">
                
                </div>
            </div>
        </div>
        
        <a href="#">
            <div class="upArrow bColorPink colorWhite">
                <i class="fa-solid fa-arrow-up-long"></i>
            </div>
        </a>

        <div class="footer bColorBlack colorWhite">
            <div class="footer_guide">
                <div class="footer_logo fontLogo colorWhite">RUSH</div>
                <div class="copy fontEnglish colorWhite">COPYRIGHT © SKY. ALL RIGHT RESERVED</div>
                <div class="footer_contents">
                    <div class="about conDiv fontEnglish colorWhite">
                        <div class="footer_title fontEnglish">ABOUT US</div>
                        <div class="footer_con ">
                            <div class="con">팀명 :
                            </div>
                            <div class="encon fontEnglish"> SKY</div>
                        </div>
                    </div>
                    <div class="office conDiv fontEnglish colorWhite">
                        <div class="footer_title fontEnglish">OFFICE</div>
                        <div class="footer_con">
                            <div class="con">충청남도 천안시 서북구<br> 천안대로 1223-24</div>
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