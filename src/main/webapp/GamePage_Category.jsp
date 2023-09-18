<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RUSH</title>
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<style>
        *{
            box-sizing: border-box;
        }
        div{
            border: 1px solid black;
        }
        .container{
            border: 1px solid black;
        }
        .test{
            background-color: white;
            width: 300px;
            height: 200px;
        }
        /* body{
            background-color: #131217;
        } */
        #going_up{
            position: fixed;
            right: 30px;
            bottom: 30px;
            width: 50px;
            height: 50px;
            border-radius: 50%;
        }
    </style>
</head>
<body>
	<div class="container-fluid">
        header
    </div>
    <div class="container">
        <div class="row g-0">
            <div class="col-2 d-flex justify-content-center">
                <div class="row g-0">
                    <div class="col-12 mt-5">
                        <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
                            <button type="button" class="btn btn-primary">최신게임</button>
                            <button type="button" class="btn btn-primary active">인기게임</button>
                            <button type="button" class="btn btn-primary">리듬게임</button>
                            <button type="button" class="btn btn-primary">아케이드게임</button>
                            <button type="button" class="btn btn-primary">퍼즐게임</button>
                            <!-- js로 넘어가기 -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-10">
                <div class="row g-0 mt-4 mb-5">
                    <p class="categories fs-2">인기게임</p>
                    <!-- 나중에 jstl 적용? -->
                    <div class="col-xs-12 col-lg-6 col-xl-4">
                        <div class="test">

                        </div>
                        <p>게임1</p>
                    </div>
                    <div class="col-xs-12 col-lg-6 col-xl-4">
                        <div class="test">

                        </div>
                        <p>게임2</p>
                    </div>
                    <div class="col-xs-12 col-lg-6 col-xl-4">
                        <div class="test">

                        </div>
                        <p>게임3</p>
                    </div>
                    <div class="col-xs-12 col-lg-6 col-xl-4">
                        <div class="test">

                        </div>
                        <p>게임3</p>
                    </div>
                    <div class="col-xs-12 col-lg-6 col-xl-4">
                        <div class="test">

                        </div>
                        <p>게임3</p>
                    </div>
                    <div class="col-xs-12 col-lg-6 col-xl-4">
                        <div class="test">

                        </div>
                        <p>게임3</p>
                    </div>
                    <div class="col-xs-12 col-lg-6 col-xl-4">
                        <div class="test">

                        </div>
                        <p>게임3</p>
                    </div>
                    <div class="col-xs-12 col-lg-6 col-xl-4">
                        <div class="test">

                        </div>
                        <p>게임3</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        footer
    </div>
    <button id="going_up">화살표</button>
    <script>
        $(".btn").on("click",function(){
            // $(".categories").text();
            console.log("");
        });
    </script>
</body>
</html>