<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>유저 추천</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="manifest" href="site.webmanifest">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

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
    <div class="preloader d-flex align-items-center justify-content-center">
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
                <div class="menu-wrapper d-flex align-items-center justify-content-between">
                    <!-- Logo -->
                    <div class="logo">
                        <a href="index.html"><img src="assets/img/logo/logo.png" alt=""></a>
                    </div>
                    <!-- Main-menu -->
                    <div class="main-menu f-right d-none d-lg-block">
                        <nav>	
                            <ul id="navigation">
							<li><a href="/">홈</a></li>
							<c:if test="${member != null}"><li><a href="/sendView">트렌드 추천</a></li></c:if>
							<c:if test="${member != null}"><li><a href="/like">유저 취향 추천</a></li></c:if>

							<c:if test="${member != null}"><li><a href="/logout">로그아웃</a></li></c:if>
							<c:if test="${member == null}"><li><a href="/login">로그인</a></li></c:if>
							<c:if test="${member == null}"><li><a href="/regist">회원가입</a></li></c:if>
							<c:if test="${member != null}">
							<li>
								<a href="/">${member.EMP_ID}님 </a>
							</li>
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
                              <h2>추천 목록</h2>
                          </div>
                      </div>
                  </div>
                  <div class="lode-more-btn text-center pt-60 pb-100">
                          <a href="/like" class="btn">좋아요 목록</a>
                   </div>
              </div>
          </div> 
      </div>
	        <!-- Hero End -->
        <!--? Gallery Area Start -->
        <div class="gallery-area pt-30 pb-40">
            <div class="container-fluid p-0 fix">
                <div class="row" id ="image_container">
                    	
                </div>
            </div>
        </div>
        <!-- Gallery Area End -->
    </main>   

	<div style="display:none">
	<form id="likeform" name="likeform" method="POST" enctype="multipart/form-data">
		<input type="text" id="likeupper" name="likeupper" value="">
		<input type="text" id="likelower" name="likelower" value="">
		<input type="text" id="likefull" name="likefull" value="">
		<input type="text" id="likeouter" name="likeouter" value="">
		<input type="text" id="likeinput" name="likeinput" value="">
		<input type="text" id="likemode" name="likemode" value="">
	</form>
	</div>
	
	<div id="loadicon" style="display: none">
		<img src="data/icon/loadicon.gif">
	</div>
	
<!--  추천  결과   -->	

	<div id="sorry" style="display:none">
		<img src="data/icon/sorry.jpg"><br>
		<h3>추천의상이 없습니다</h3>
	</div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">	
</script>
 <!-- JS here -->
<!-- All JS Custom Plugins Link Here here -->
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
<script type="text/javascript">
$("#loadicon").show();
$.ajax({
	url : "/userlike.do",
	dataType : 'text',
	type : 'POST',
	success : function(json) {
		//console.log(response);
		$("#loadicon").hide();
		$("#recom_result").show();

		var myObject = eval( json );	

		if (myObject.length != 0){
			for (var i = 0; i < myObject.length; i++) {
			
				var strDOM = ""; 
				strDOM += '<div class="col-xl-3 col-lg-3 col-md-6">'; 
				strDOM += '<div class="single-gallery mb-30">'; 
				strDOM += '<div class="gallery-img" style="background-image: url('+  myObject[i]["경로"] +');"></div>'; 
				strDOM += '<div class="thumb-content-box">	'; 
				
				if(myObject[i]["상의"] != ""){
					strDOM += '<h5><span>상의:</span>'+myObject[i]["상의"]+'</h5>' ;
				} 
				if(myObject[i]["하의"] != ""){
					strDOM += '<h5><span>하의:</span>'+myObject[i]["하의"]+'</h5>' ;
				} 
				if(myObject[i]["전신"] != ""){
					strDOM += '<h5><span>전신:</span>'+myObject[i]["전신"]+'</h5>' ;
				} 
				if(myObject[i]["외투"] != ""){
					strDOM += '<h5><span>외투:</span>'+myObject[i]["외투"]+'</h5>' ;
				} 

				strDOM += '<div value='+ myObject[i]["외투"] +' class="outer">';
				strDOM += '<div value='+ myObject[i]["전신"] +' class="full">';
				strDOM += '<div value='+ myObject[i]["상의"] +' class="upper">';
				strDOM += '<div value='+ myObject[i]["하의"] +' class="lower">';
				strDOM += '<button  value='+ myObject[i]["경로"] +' class="like" style="color:red;">좋아요</button>';
				strDOM += '</div></div></div></div>';

				strDOM += '</div>';
				strDOM += '</div>';
				strDOM += '</div>';
				
				var $imageContainer = $("#image_container");
			    $imageContainer.append(strDOM); 
			}
		}
		else{
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


$(document).on("click",".like",function() {
	$("#likeupper").attr('value',"");
	$("#likelower").attr('value',"");
	$("#likefull").attr('value',"");
	$("#likeouter").attr('value',"");
	$("#likeinput").attr('value', encodeURI($(this).attr('value')));
	if($(this).html() == '좋아요'){
		$(this).html('취소');
		$("#likemode").attr('value', "1");
	}else {
		$(this).html('좋아요');
		$("#likemode").attr('value', "0");
	}
	//$("#likeupper").attr('value', $("#"+$(this).attr('id').substring( 0, 4 ).concat("upper")).attr('value'));
	//$("#likelower").attr('value', $("#"+$(this).attr('id').substring( 0, 4 ).concat("lower")).attr('value'));
	//$("#likefull").attr('value', $("#"+$(this).attr('id').substring( 0, 4 ).concat("full")).attr('value'));
	//$("#likeouter").attr('value', $("#"+$(this).attr('id').substring( 0, 4 ).concat("outer")).attr('value'));
	$("#likeupper").attr('value', $(this).closest('.upper').attr('value'));
	$("#likelower").attr('value', $(this).closest('.lower').attr('value'));
	$("#likefull").attr('value',  $(this).closest('.full').attr('value'));
	$("#likeouter").attr('value', $(this).closest('.outer').attr('value'));
	
	var form = new FormData(document.getElementById('likeform'));
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

