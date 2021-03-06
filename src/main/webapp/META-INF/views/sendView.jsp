<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>메인</title>
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

<!--Bootsrap 4 CDN-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<!--Fontawesome CDN-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<style>
.thumb-content label {
	color:white;
}
.thumb-content .like{
	color:red;
}

.file_input_textbox
{
float: left
}
 
.file_input_div
{
position: relative;
width: 100px;
height: 23px;
overflow: hidden;
}
 
.file_input_button
{
width: 100px;
position: absolute;
top: 0px;
background-color: #33BB00;
color: #FFFFFF;
border-style: solid;
}
 
.file_input_hidden
{
font-size: 45px;
position: absolute;
right: 0px;
top: 0px;
opacity: 0;
 
filter: alpha(opacity=0);
-ms-filter: "alpha(opacity=0)";
-khtml-opacity: 0;
-moz-opacity: 0;
}

</style>

</head>

<body class="body-bg">
	<!--? Preloader Start -->
	<div id="preloader-active">
		<div
			class="preloader d-flex align-items-center justify-content-center">
			<div class="preloader-inner position-relative">
				<div class="preloader-circle"></div>
				<div class="preloader-img pere-text">
					<img src="assets/img/logo/logo.png" alt="">
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
	<div class="slider-area2">
		<div class="slider-height2 hero-overly d-flex align-items-center">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<br> <br> <br> <br>
					</div>
				</div>
				<div class="lode-more-btn text-center pt-60 pb-100">
					<div class="container">
						<div class="d-flex justify-content-center h-100">
							<div class="card">
								<div class="card-header" style="background-color: #11141b">
									<h3 style="color: white">착장 등록</h3>
								</div>
								<div class="card-body" style="background-color: #e0dcdc">


									<form id="form" name="form" method="POST"
										enctype="multipart/form-data">
										<div class="input-group form-group">
											<div class="input-group-prepend"></div>
											<input type="file" id="uploadFile" name="uploadFile"
												accept="image/*">

										</div>
						

										
										<div class="input-group form-group">
											<div class="input-group-prepend"></div>
											<input type="text" class="form-control" placeholder= ${member.EMP_AGE}
												value=${member.EMP_AGE} id="age" name="age">
										</div>
										<div class="input-group form-group">
										<c:if test="${member.EMP_SEX == 'm'}">
											<input type="radio" name="sex" value="Female">
											여자</label> <label><input type="radio" name="sex" value="male" checked>
												남자</label>
										</c:if>
										<c:if test="${member.EMP_SEX == 'f'}">
											<input type="radio" name="sex" value="Female" checked>
											여자</label> <label><input type="radio" name="sex" value="male">
												남자</label>
										</c:if>
										</div>

										<input type="text" name="filename" id="filename" value=""
											style="display: none"> <input type="text"
											name="recominput" id="recominput" value=""
											style="display: none"> <input type="text"
											name="recominput_upper" id="recominput_upper" value=""
											style="display: none"> <input type="text"
											name="recominput_lower" id="recominput_lower" value=""
											style="display: none"> <input type="text"
											name="recominput_full" id="recominput_full" value=""
											style="display: none"> <input type="text"
											name="recominput_outer" id="recominput_outer" value=""
											style="display: none">

									</form>
									<div class="form-group">
										<input type="submit" value="업로드" id="btn-upload"
											class="btn float-right login_btn">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!--  이미지 정보 입력   -->

	<div style="display: none">
		<form id="likeform" name="likeform" method="POST"
			enctype="multipart/form-data">
			<input type="text" id="likeupper" name="likeupper" value="">
			<input type="text" id="likelower" name="likelower" value="">
			<input type="text" id="likefull" name="likefull" value=""> <input
				type="text" id="likeouter" name="likeouter" value=""> <input
				type="text" id="likeinput" name="likeinput" value=""> <input
				type="text" id="likemode" name="likemode" value="">
		</form>
	</div>





	<!-- 입력이미지 정보 출력   -->

	<div id="loadicon" style="display: none">
		<img src="data/icon/loadicon.gif" style="margin-left: auto; margin-right: auto; display: block;">
	</div>



	<!--  recom   -->
	<div class="gallery-area pt-30 pb-40" id="recom_result"
		style="display: none;border-bottom:1px solid white">
		
		<div class="container-fluid p-0 fix">
		<h3 style="color:white;text-align: center;"> 추천 결과 </h3><br><br>
			<div class="row">
				<div class="col-xl-3 col-lg-3 col-md-6" id="recom_result0">
					<div class="single-gallery mb-30">
						<div class="gallery-img" id="img0"></div>
						<div class="thumb-content-box">
							<div class="thumb-content">
								<div>
									<div id="img0upperdata">
										<h5 style="color:white"><span>[상의]</span></h5> 
										<input type="text" id="img0upper" name="img0upper" value="" size="50"  style="display:none">
										<div id="img0upperdata_div"></div>
									</div>
									<div id="img0lowerdata">
										<h5 style="color:white"><span>[하의]</span></h5> 
										<input type="text"
											id="img0lower" name="img0lower" value="" size="50"  style="display:none">
										<div id="img0lowerdata_div"></div>
									</div>
									<div id="img0outerdata">
										<h5 style="color:white"><span>[외투]</span></h5> 
										 <input type="text"
											id="img0outer" name="img0outer" value="" size="50"  style="display:none">
										<div id="img0outerdata_div"></div>
									</div>
									<div id="img0fulldata">
										<h5 style="color:white"><span>[전신]</span></h5> 
										 <input type="text"
											id="img0full" name="img0full" value="" size="50"  style="display:none">
										<div id="img0fulldata_div"></div>
									</div>
									<div>
										<button id="img0like" value="" class="like" style="position: absolute; right: 0%">좋아용</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
		
				<div class="col-xl-3 col-lg-3 col-md-6" id="recom_result1">
					<div class="single-gallery mb-30">
						<div class="gallery-img" id="img1"></div>
						<div class="thumb-content-box">
							<div class="thumb-content">
								<div>
									<div id="img1upperdata">
										<h5 style="color:white"><span>[상의]</span></h5> 
										<input type="text" id="img1upper" name="img1upper" value="" size="50"  style="display:none">
										<div id="img1upperdata_div"></div>
									</div>
									<div id="img1lowerdata">
										<h5 style="color:white"><span>[하의]</span></h5> 
										<input type="text"
											id="img1lower" name="img1lower" value="" size="50"  style="display:none">
										<div id="img1lowerdata_div"></div>
									</div>
									<div id="img1outerdata">
										<h5 style="color:white"><span>[외투]</span></h5> 
										 <input type="text"
											id="img1outer" name="img1outer" value="" size="50"  style="display:none">
										<div id="img1outerdata_div"></div>
									</div>
									<div id="img1fulldata">
										<h5 style="color:white"><span>[전신]</span></h5> 
										 <input type="text"
											id="img1full" name="img1full" value="" size="50"  style="display:none">
										<div id="img1fulldata_div"></div>
									</div>
									<div>
										<button id="img1like" value="" class="like" style="position: absolute; right: 0%">좋아용</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-3 col-lg-3 col-md-6" id="recom_result2">
					<div class="single-gallery mb-30">
						<div class="gallery-img" id="img2"></div>
						<div class="thumb-content-box">
							<div class="thumb-content">
								<div>
									<div id="img2upperdata">
										<h5 style="color:white"><span>[상의]</span></h5> 
										<input type="text" id="img2upper" name="img2upper" value="" size="50"  style="display:none">
										<div id="img2upperdata_div"></div>
									</div>
									<div id="img2lowerdata">
										<h5 style="color:white"><span>[하의]</span></h5> 
										<input type="text"
											id="img2lower" name="img2lower" value="" size="50"  style="display:none">
										<div id="img2lowerdata_div"></div>
									</div>
									<div id="img2outerdata">
										<h5 style="color:white"><span>[외투]</span></h5> 
										 <input type="text"
											id="img2outer" name="img2outer" value="" size="50"  style="display:none">
										<div id="img2outerdata_div"></div>
									</div>
									<div id="img2fulldata">
										<h5 style="color:white"><span>[전신]</span></h5> 
										 <input type="text"
											id="img2full" name="img2full" value="" size="50"  style="display:none">
										<div id="img2fulldata_div"></div>
									</div>
										<button id="img2like" value="" class="like" style="position: absolute; right: 0%">좋아용</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


	<div id="sorry" style="display: none">
		<img src="data/icon/sorry.jpg"><br>
		<h3>추천의상이 없습니다</h3>
	</div>


	<!--? Gallery Area Start -->
	<div class="gallery-area pt-300 pb-300" style="margin: auto;">
		<div class="container-fluid p-0 fix">
			<div class="row" id="image_container"></div>
		</div>
	</div>
	<!--  자바 스크립트  -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
		
	</script>


	<script type="text/javascript">
		$('#btn-upload')
				.on(
						'click',
						function() {
					
							$("#recom").hide();
							$("#result").hide();
							$("#recom_result").hide();
							$("#loadicon").show();
							$(".btn-recom").hide();
							$(".cloth_data").hide();
							$('.like').html('좋아용');
							$("#sorry").hide();
							$("#image_container").empty();
							var form = new FormData(document
									.getElementById('form'));
							$
									.ajax({
										url : "/upload.do",
										data : form,
										dataType : 'text',
										processData : false,
										contentType : false,
										type : 'POST',
										success : function(json) {
											//console.log(response);
											$("#loadicon").hide();
											var res = JSON.parse(json)
											var data = JSON.parse(res.data)

											var strDOM = "";
											strDOM += '<div class="col-xl-6 col-lg-6 col-md-6" style="border-right:1px solid white">';
											strDOM += '<br><h3 style="color:white;text-align: center;"> 원본 이미지 </h3><br>';
											strDOM += '<div class="single-gallery mb-30">';
											strDOM += '<div class="gallery-img" id="ogimg" style="background-image: url('
													+ res.ogimg
													+ ');background-size: contain; background-position: center;"></div>';
											strDOM += '<div class="thumb-content-box">	';
											strDOM += '</div>';
											strDOM += '</div>';
											strDOM += '</div>';

											strDOM += '<div class="col-xl-6 col-lg-6 col-md-6">';
											strDOM += '<br><h3 style="color:white;text-align: center;"> 분석 결과 </h3><br>';
											strDOM += '<div class="single-gallery mb-30">';
											strDOM += '<div class="gallery-img" id="afimg" style="background-image: url('
													+ res.afimg
													+ ');background-size: contain; background-position: center;"></div>';
											strDOM += '<div class="thumb-content-box">	';
											if (data.상의 != "") {
												var upper = (data.상의).split("_");
												
												strDOM += '<h5 style="color:white"><span>[상의]</span>'
														 + '</h5>';
												strDOM += '<h7 style="color:white"><span>색상:</span>'
															+ upper[0] + '</h7>';
												strDOM += '<h7 style="color:white"><span>&nbsp 종류:</span>'
															+ upper[1] + '</h7>';
												strDOM += '<h7 style="color:white"><span>&nbsp 질감:</span>'
															+ upper[2] + '</h7>';
												strDOM += '<h7 style="color:white"><span>&nbsp 무늬:</span>'
															+ upper[3] + '</h7><br>';
												strDOM += '<button class="btn-recom" id="upperbt" value="0" style="color:red;">상의 추천</button><br>';
											}
											if (data.하의 != "") {
												var lower = (data.하의).split("_");
												
												strDOM += '<h5 style="color:white"><span>[하의]</span>'
														 + '</h5>';
												strDOM += '<h7 style="color:white"><span>색상:</span>'
															+ lower[0] + '</h7>';
												strDOM += '<h7 style="color:white"><span>&nbsp 종류:</span>'
															+ lower[1] + '</h7>';
												strDOM += '<h7 style="color:white"><span>&nbsp 질감:</span>'
															+ lower[2] + '</h7>';
												strDOM += '<h7 style="color:white"><span>&nbsp 무늬:</span>'
															+ lower[3] + '</h7><br>';
												strDOM += '<button class="btn-recom" id="lowerbt" value="1" style="color:red;">하의 추천</button><br>';
											}
											if (data.전신 != "") {
												var full = (data.전신).split("_");
												
												strDOM += '<h5 style="color:white"><span>[전신]</span>'
														 + '</h5>';
												strDOM += '<h7 style="color:white"><span>색상:</span>'
															+ full[0] + '</h7>';
												strDOM += '<h7 style="color:white"><span>&nbsp 종류:</span>'
															+ full[1] + '</h7>';
												strDOM += '<h7 style="color:white"><span>&nbsp 질감:</span>'
															+ full[2] + '</h7>';
												strDOM += '<h7 style="color:white"><span>&nbsp 무늬:</span>'
															+ full[3] + '</h7><br>';
															
												strDOM += '<button class="btn-recom" id="fullbt" value="3" style="color:red;">전신 추천</button><br>';
											}
											if (data.외투 != "") {
												var outer = (data.외투).split("_");
												
												strDOM += '<h5 style="color:white"><span>[외투]</span>'
														 + '</h5>';
												strDOM += '<h7 style="color:white"><span>색상:</span>'
															+ outer[0] + '</h7>';
												strDOM += '<h7 style="color:white"><span>&nbsp 종류:</span>'
															+ outer[1] + '</h7>';
												strDOM += '<h7 style="color:white"><span>&nbsp 질감:</span>'
															+ outer[2] + '</h7>';
												strDOM += '<h7 style="color:white"><span>&nbsp 무늬:</span>'
															+ outer[3] + '</h7><br>';
												strDOM += '<button class="btn-recom" id="outerbt" value="2" style="color:red;">외투 추천</button><br>';
											}

											strDOM += '</div>';
											strDOM += '</div>';
											strDOM += '</div>';

											var $imageContainer = $("#image_container");
											$imageContainer.append(strDOM);

											$("#afimg").attr('src', res.afimg);
											$("#ogimg").attr('src', res.ogimg);
											$("#filename").attr('value',
													res.afimg);
											$("#recominput_upper").attr(
													'value', data.상의);
											$("#recominput_outer").attr(
													'value', data.외투);
											$("#recominput_full").attr('value',
													data.전신);
											$("#recominput_lower").attr(
													'value', data.하의);
											$("#result").show();
											$("#recom").show();

										},
										error : function(jqXHR) {
											$("#result").hide();
											$("#loadicon").hide();
											console.log('error');
										}
									});
						});

		$(document).on(
				"click",
				".btn-recom",
				function() {
					$('.like').html('좋아용');
					$("#result").hide();
					$("#loadicon").show();
					$("#recom_result").hide();
					$("#recom_result0").hide();
					$("#recom_result1").hide();
					$("#recom_result2").hide();

					$("#recominput").attr('value', $(this).attr('value'));
					$("#sorry").hide();
					var form = new FormData(document.getElementById('form'));
					$.ajax({
						url : "/recom.do",
						data : form,
						dataType : 'text',
						processData : false,
						contentType : false,
						type : 'POST',
						success : function(json) {
							//console.log(response);
							$("#loadicon").hide();
							$("#recom_result").show();
							var myObject = eval('(' + json + ')');

							if (myObject.length != 0) {
								for (let j = 0; j <= 3; j++) {
									$("#img" + j.toString() + "upperdata")
											.hide();
									$("#img" + j.toString() + "lowerdata")
											.hide();
									$("#img" + j.toString() + "outerdata")
											.hide();
									$("#img" + j.toString() + "fulldata")
											.hide();
								}

								for (i in myObject) {
									if (myObject[i]["상의"] != "") {
										
										$("#img" + i.toString() + "upperdata")
												.show(); 
										$("#img" + i.toString() + "upperdata_div").empty();
										var up = myObject[i]["상의"].split("_");
										$("#img" + i.toString() + "upperdata_div").append( '<h7 style="color:white"><span>색상:</span>'+ up[0] + '</h7>');
										$("#img" + i.toString() + "upperdata_div").append( '<h7 style="color:white"><span>&nbsp종류:</span>'+ up[1] + '</h7>');
										$("#img" + i.toString() + "upperdata_div").append( '<h7 style="color:white"><span>&nbsp질감:</span>'+ up[2] + '</h7>');
										$("#img" + i.toString() + "upperdata_div").append( '<h7 style="color:white"><span>&nbsp무늬:</span>'+ up[3] + '</h7>');
									}
									if (myObject[i]["하의"] != "") {
										$("#img" + i.toString() + "lowerdata")
												.show();
										$("#img" + i.toString() + "lowerdata_div").empty();
										var lo = myObject[i]["하의"].split("_");
										$("#img" + i.toString() + "lowerdata_div").append( '<h7 style="color:white"><span>색상:</span>'+ lo[0] + '</h7>');
										$("#img" + i.toString() + "lowerdata_div").append( '<h7 style="color:white"><span>&nbsp종류:</span>'+ lo[1] + '</h7>');
										$("#img" + i.toString() + "lowerdata_div").append( '<h7 style="color:white"><span>&nbsp질감:</span>'+ lo[2] + '</h7>');
										$("#img" + i.toString() + "lowerdata_div").append( '<h7 style="color:white"><span>&nbsp무늬:</span>'+ lo[3] + '</h7>');
										
									}
									if (myObject[i]["외투"] != "") {
										$("#img" + i.toString() + "outerdata")
												.show();
										$("#img" + i.toString() + "outerdata_div").empty();
										var ou = myObject[i]["외투"].split("_");
										$("#img" + i.toString() + "outerdata").append( '<h7 style="color:white"><span>색상:</span>'+ ou[0] + '</h7>');
										$("#img" + i.toString() + "outerdata").append( '<h7 style="color:white"><span>&nbsp종류:</span>'+ ou[1] + '</h7>');
										$("#img" + i.toString() + "outerdata").append( '<h7 style="color:white"><span>&nbsp질감:</span>'+ ou[2] + '</h7>');
										$("#img" + i.toString() + "outerdata").append( '<h7 style="color:white"><span>&nbsp무늬:</span>'+ ou[3] + '</h7>');
										
									}
									if (myObject[i]["전신"] != "") {
										$("#img" + i.toString() + "fulldata")
												.show();
										$("#img" + i.toString() + "fulldata_div").empty();
										var fu = myObject[i]["전신"].split("_");
										$("#img" + i.toString() + "fulldata").append( '<h7 style="color:white"><span>색상:</span>'+ fu[0] + '</h7>');
										$("#img" + i.toString() + "fulldata").append( '<h7 style="color:white"><span>&nbsp종류:</span>'+ fu[1] + '</h7>');
										$("#img" + i.toString() + "fulldata").append( '<h7 style="color:white"><span>&nbsp질감:</span>'+ fu[2] + '</h7>');
										$("#img" + i.toString() + "fulldata").append( '<h7 style="color:white"><span>&nbsp무늬:</span>'+ fu[3] + '</h7>');
										
									}

									$("#img" + i.toString() + "upper").attr(
											'value', myObject[i]["상의"]);
									$("#img" + i.toString() + "lower").attr(
											'value', myObject[i]["하의"]);
									$("#img" + i.toString() + "outer").attr(
											'value', myObject[i]["외투"]);
									$("#img" + i.toString() + "full").attr(
											'value', myObject[i]["전신"]);

									$("#img" + i.toString() + "like").attr(
											'value', myObject[i]["경로"]);

									$("#img" + i.toString()).css(
											'background-image',
											"url(" + myObject[i]["경로"] + ")");

									$("#recom_result" + i.toString()).show();
								}
							} else {
								$("#sorry").show();
								$("#recom_result").hide();
							}

						},
						error : function(jqXHR) {
							$("#recom_result").hide();
							$("#result").hide();
							$("#loadicon").hide();
							console.log('error');
						}
					});
				});

		$('.like')
				.on(
						'click',
						function() {
							console.log($(this).attr('value'));
							$("#likeupper").attr('value', "");
							$("#likelower").attr('value', "");
							$("#likefull").attr('value', "");
							$("#likeouter").attr('value', "");
							console.log($(this).attr('value'));
							$("#likeinput")
									.attr('value', $(this).attr('value'));
							if ($(this).text() == '좋아용') {
								$(this).html('취소');
								$("#likemode").attr('value', "1");
							} else {
								$(this).html('좋아용');
								$("#likemode").attr('value', "0");
							}
							$("#likeupper").attr(
									'value',
									$(
											"#"
													+ $(this).attr('id')
															.substring(0, 4)
															.concat("upper"))
											.attr('value'));
							$("#likelower").attr(
									'value',
									$(
											"#"
													+ $(this).attr('id')
															.substring(0, 4)
															.concat("lower"))
											.attr('value'));
							$("#likefull").attr(
									'value',
									$(
											"#"
													+ $(this).attr('id')
															.substring(0, 4)
															.concat("full"))
											.attr('value'));
							$("#likeouter").attr(
									'value',
									$(
											"#"
													+ $(this).attr('id')
															.substring(0, 4)
															.concat("outer"))
											.attr('value'));

							var form = new FormData(document
									.getElementById('likeform'));
							$.ajax({
								url : "/like.do",
								data : form,
								dataType : 'text',
								processData : false,
								contentType : false,
								type : 'POST',
								success : function(json) {
									console.log(json)
								},
								error : function(jqXHR) {

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
</body>
</html>
