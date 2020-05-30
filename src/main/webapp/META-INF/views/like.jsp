<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>유저 추천</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
<link rel="shortcut icon" type="image/x-icon"
	href="assets/img/favicon.ico">

<!-- CSS here -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.min.css">
<link rel="stylesheet" href="assets/css/slicknav.css">
<link rel="stylesheet" href="assets/css/flaticon.css">
<link rel="stylesheet" href="assets/css/animate.min.css">
<link rel="stylesheet" href="assets/css/magnific-popup.css">
<link rel="stylesheet" href="assets/css/fontawesome-all.min.css">
<link rel="stylesheet" href="assets/css/themify-icons.css">
<link rel="stylesheet" href="assets/css/slick.css">
<link rel="stylesheet" href="assets/css/nice-select.css">
<link rel="stylesheet" href="assets/css/style.css">
</head>

<body class="body-bg">
	<!--? Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="assets/img/logo/logo.png" alt="	">
				</div>
			</div>
		</div>
	</div>
	<header>
		<!-- Header Start -->
		<div class="header-area header-transparent">
			<div class="main-header header-sticky">
				<div class="container-fluid">
					<div
						class="menu-wrapper d-flex align-items-center justify-content-between">
						<!-- Logo -->
						<div class="logo">
							<a href="/"><img src="assets/img/logo/logo.png" alt=""></a>
						</div>
						<!-- Main-menu -->
						<div class="main-menu f-right d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li><a href="/">홈</a></li>
									<c:if test="${member != null}">
										<li><a href="/sendView">트렌드 추천</a></li>
									</c:if>
									<c:if test="${member != null}">
										<li><a href="/like">유저 취향 추천</a></li>
									</c:if>

									<c:if test="${member != null}">
										<li><a href="/logout">로그아웃</a></li>
									</c:if>
									<c:if test="${member == null}">
										<li><a href="/login">로그인</a></li>
									</c:if>
									<c:if test="${member == null}">
										<li><a href="/regist">회원가입</a></li>
									</c:if>
									<c:if test="${member != null}">
										<li><a href="/">${member.EMP_ID}님 </a></li>
									</c:if>
								</ul>

							</nav>
						</div>

						<!-- Mobile Menu -->
						<div class="col-12">
							<div class="mobile_menu d-block d-lg-none"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Header End -->
	</header>

	<main>
		<!--? Hero Start -->
		<div class="slider-area2">
			<div class="slider-height2 hero-overly d-flex align-items-center">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap hero-cap2 text-center pt-80">
								<h2>좋아요 목록</h2>
							</div>
						</div>
					</div>
					<div class="lode-more-btn text-center pt-60 pb-100">
						<a href="/userlike" class="btn">추천 목록</a>
					</div>
				</div>
			</div>
		</div>
		<!-- Hero End -->
		<!--? Gallery Area Start -->
		<div class="gallery-area pt-30 pb-40">
			<div class="container-fluid p-0 fix">
				<div class="row" id="image_container"></div>
				<div class="row">
					<div class="col-lg-12">
						<div class="lode-more-btn text-center pt-60 pb-100">
							<a href="/like" class="btn">더보기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- Gallery Area End -->
	</main>



	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
		
	</script>

	<script type="text/javascript">
		$
				.ajax({
					url : "/showlike.do",
					dataType : 'text',
					processData : false,
					contentType : false,
					type : 'POST',
					success : function(data) {
						var myObject = eval(data);
						for (var i = 0; i < myObject.length; i++) {
							var strDOM = "";
							strDOM += '<div class="col-xl-3 col-lg-3 col-md-6">';
							strDOM += '<div class="single-gallery mb-30">';
							strDOM += '<div class="gallery-img" style="background-image: url('
									+ myObject[i]["경로"] + ');"></div>';
							strDOM += '<div class="thumb-content-box">	';

							if (myObject[i]["상의"] != "not") {
								strDOM += '<h4><span>상의:</span>'
										+ myObject[i]["상의"] + '</h4>';
							}
							if (myObject[i]["하의"] != "not") {
								strDOM += '<h4><span>하의:</span>'
										+ myObject[i]["하의"] + '</h4>';
							}
							if (myObject[i]["전신"] != "not") {
								strDOM += '<h4><span>전신:</span>'
										+ myObject[i]["전신"] + '</h4>';
							}
							if (myObject[i]["외투"] != "not") {
								strDOM += '<h4><span>외투:</span>'
										+ myObject[i]["외투"] + '</h4>';
							}

							strDOM += '<button  value='+ myObject[i]["경로"] +' class="like" style="color:red;"> <i class="fas fa-angle-right">취소</i></button>';
							strDOM += '</div>';
							strDOM += '</div>';
							strDOM += '</div>';

							var $imageContainer = $("#image_container");
							$imageContainer.append(strDOM);
						}
					},
					error : function(jqXHR) {
						console.log('error');
					}
				});

		$(document).on("click", ".like", function() {
			var cdata = 'cdata=' + encodeURI($(this).val());
			var bt = $(this);
			$.ajax({
				url : "/cancellike.do",
				data : cdata,
				dataType : 'text',
				type : 'POST',
				processData : false,

				success : function(data) {
					console.log(cdata);
					bt.closest('.col-xl-3').hide();
				},
				error : function(jqXHR) {
					console.log('error');
				}
			});

		});
	</script>
	<script src="./assets/js/vendor/modernizr-3.5.0.min.js"></script>
	<!-- Jquery, Popper, Bootstrap -->
	<script src="./assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="./assets/js/popper.min.js"></script>
	<script src="./assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="./assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="./assets/js/owl.carousel.min.js"></script>
	<script src="./assets/js/slick.min.js"></script>
	<!-- One Page, Animated-HeadLin -->
	<script src="./assets/js/wow.min.js"></script>
	<script src="./assets/js/animated.headline.js"></script>
	<script src="./assets/js/jquery.magnific-popup.js"></script>

	<!-- Nice-select, sticky -->
	<script src="./assets/js/jquery.nice-select.min.js"></script>
	<script src="./assets/js/jquery.sticky.js"></script>

	<!-- contact js -->
	<script src="./assets/js/contact.js"></script>
	<script src="./assets/js/jquery.form.js"></script>
	<script src="./assets/js/jquery.validate.min.js"></script>
	<script src="./assets/js/mail-script.js"></script>
	<script src="./assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="./assets/js/plugins.js"></script>
	<script src="./assets/js/main.js"></script>