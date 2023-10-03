<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	
<%@ include file="/common/style.jsp" %> 
</head>
<body class="bColorBlack">
    <div class="container-fluid p-0">
        <%@ include file="/common/header.jsp" %>

        <div id="container" class="container bColorBlack">
            <div id="title" class="colorWhite">명예의 전당</div>
            <div id="category" class="row g-0 m-0">
            	<c:forEach var="gName" items="${gNameList }" varStatus="status">
            		<c:if test="${status.index == 0 }">
            			<div id="game${status.index}" class="game leftCategory col fontEnglish bColorGreen">${gName}</div>
            		</c:if>
            		<c:if test="${status.index != 0 && status.index != gNameList.size()-1 }">
            			<div id="game${status.index}" class="game col fontEnglish colorWhite">${gName}</div>
            		</c:if>
            		<c:if test="${status.index == gNameList.size()-1 }">
            			<div id="game${status.index}" class="game rightCategory col fontEnglish colorWhite">${gName}</div>
            		</c:if>
            	</c:forEach>
            </div>
            
            <div id="Box row">
                <div class="line col"></div>
                <div class="subTitleBox row g-0">
                    <div class="subTitle pl-10 col-2 col-xs-1 col-md-1 col-lg-1 col-xl-1 colorWhite">순위</div>
                    	<div class="col-10 col-xs-11">
	                    	<div class="row g-0">
	                    		<div class="subTitle col-8 col-md-9 colorWhite">유저 정보</div>
		                        <div class="subTitle g-0 p-0 pl-15 col-4 col-md-3">                    
		                        	<div class="scoreAlign colorWhite subTitleScore">점수</div>
		                        </div>	
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

        <%@include file="/common/footer.jsp"%>
    </div>
</body>
</html>