<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>범수의 뭔가 뭔가임</title>

    <!-- Favicon -->
    <link rel="icon" href="/resources/bueno-master/img/core-img/favicon.ico">

    <!-- Stylesheet -->
    <link rel="stylesheet" href="/resources/bueno-master/style.css">
</head>
<body id="page-top">
	<!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-content">
            <h3>Corkage loding..</h3>
            <div id="cooking">
                <div class="bubble"></div>
                <div class="bubble"></div>
                <div class="bubble"></div>
                <div class="bubble"></div>
                <div class="bubble"></div>
                <div id="area">
                    <div id="sides">
                        <div id="pan"></div>
                        <div id="handle"></div>
                    </div>
                    <div id="pancake">
                        <div id="pastry"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Header Area Start ##### -->
    <header class="header-area" style="align-items: center;">

        <!-- Top Header Area -->
        <div class="bueno-main-menu" id="sticker">
            <div class="classy-nav-container breakpoint-off bg-img bg-overlay" style="background-image: url(/resources/bueno-master/img/bg-img/header.jpg);">
                <div class="container">
                	<div>
                    <!-- Menu -->
                    <nav class="classy-navbar" id="buenoNav">

                        <!-- Toggler 
                        <div id="toggler"><img src="/resources/bueno-master/img/core-img/toggler.png" alt=""></div> -->

                        <!-- Navbar Toggler 
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div> -->

                        <!-- Menu -->
                        <div class="classy-menu" align="center">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav Start -->
                            
                            <div class="classynav">
                            <a href="/content/main"><img src="/resources/bueno-master/img/core-img/logo3.png" alt=""></a>
                                <ul>
                                    <li><a href="/content/main" style="color:gold">MAIN</a></li>
                                    <sec:authorize access="hasRole('ROLE_ADMIN')">
										<li><a href="/admin/adminMain" style="color:gold">ADMINMAIN</a></li>
									</sec:authorize>
                                    <li><a href="/user/mypage" style="color:gold">MyPage</a></li>
                                    <li><a href="/content/colkageMap" style="color:gold">CorkageMap</a></li>
                                    <li><a href="/review/reviewList?res_no=0" style="color:gold">Timeline</a></li>
                                    <li><a href="/content/alcoholList" style="color:gold">Alcohol</a></li>
                                    <li><a href="#" style="color:gold">Category</a>
                                        <ul class="dropdown" style="color:gold">
                                            <li><a href="/content/restaurantList?res_ca=all">All Dining</a></li>
                                            <li><a href="/content/restaurantList?res_ca=고기">Beef</a></li>
                                            <li><a href="/content/restaurantList?res_ca=오마카세">Omakase</a></li>
                                            <li><a href="/content/restaurantList?res_ca=회">Sushi</a></li>
                                            <li><a href="/content/restaurantList?res_ca=레스토랑">Restaurant</a></li>
                                            <li><a href="/content/restaurantList?res_ca=뷔페">Buffet</a></li>
                                            <li><a href="/content/restaurantList?res_ca=기타">Different Order</a></li>
                                        </ul>
                                    </li>
                                </ul>

                                <!-- Login/Register -->
                                <div>
									<sec:authorize access="isAnonymous()">
										<div class="login-area">
		                                    <a href="/user/login"  style="color:gold">Login / Register</a>
		                                </div>
									</sec:authorize>
									<sec:authorize access="isAuthenticated()">	
										
									</sec:authorize>
								</div>
                            </div>
                           
                            <!-- Nav End -->

                        </div>
                    </nav>
                    </div>
                </div>
            </div>
        </div>

        <!-- Logo Area -->
        

        <!-- Navbar Area -->
    </header>
    <!-- ##### Header Area End ##### -->
