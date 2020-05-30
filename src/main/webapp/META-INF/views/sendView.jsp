<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="no-js" lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>메인 </title>
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
  <div class="our-info-area pt-170 pb-100 section-bg" data-background="assets/img/gallery/section_bg02.jpg">
    </div>	
	
	
<!--  이미지 정보 입력   -->
	<form id="form" name="form" method="POST" enctype="multipart/form-data">
		<label for="uploadFile">이미지 입력</label> 
		<input type="file"
			id="uploadFile" name="uploadFile"  accept="image/*"
			class="btn btn-default btn-lg"> 
		<div>
		<label for="age">나이</label> 
		<input type="text" id="age" name="age" class="btn btn-default btn-lg">
		</div>
		<div>
		<label for="sex">성별</label> 
		<label><input type="radio" name="sex" value="Female" checked> 여자</label>
     	<label><input type="radio" name="sex" value="male"> 남자</label>
		</div>
		<input type="text" name ="filename"  id="filename" value=""  style="display: none">
		<input type="text" name ="recominput"  id="recominput" value=""  style="display: none">
		<input type="text" name ="recominput_upper"  id="recominput_upper" value=""  style="display: none">
		<input type="text" name ="recominput_lower"  id="recominput_lower" value=""  style="display: none">
		<input type="text" name ="recominput_full"  id="recominput_full" value=""  style="display: none">
		<input type="text" name ="recominput_outer"  id="recominput_outer" value=""  style="display: none">
	</form>
	<button id="btn-upload">사진 업로드</button>
	
	<div id="recom" style="display:none">
		<button class="btn-recom" id="upperbt" value="0">상의 추천</button>
		<button class="btn-recom" id="lowerbt" value="1">하의 추천</button>
		<button class="btn-recom" id="outerbt" value="2">외투 추천</button>
		<button class="btn-recom" id="fullbt" value="3">전신 추천</button>
	</div>

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

<!-- 입력이미지 정보 출력   -->

	<div id="loadicon" style="display: none">
		<img src="data/icon/loadicon.gif">
	</div>

	<div id="result" style="display: none">
		<div>
			<img id="afimg" src="" width="400" height="400">
		</div>

		<div>
			<div id="upper_data" class= "cloth_data">
			 <label for="upper">상의 :</label>
			 <input type="text" id="upper" name="upper" value="" size="50" readonly><br> <br> 
			 </div>
			 <div id="lower_data" class= "cloth_data">
			 <label for="lower">하의:</label> 
			 <input type="text" id="lower" name="lower" value="" size="50" readonly><br> <br>
			 </div>
			 <div id="outer_data" class= "cloth_data">
			 <label for="outer">외투:</label>
			 <input type="text" id="outer" name="outer" value="" size="50" readonly><br><br> 
			 </div>
			 <div id="full_data" class= "cloth_data">
			 <label for="full">전신:</label> 
			 <input type="text" id="full" name="full" value="" size="50" readonly><br> <br>
			 </div>
		</div>

		<div>
			<img id="ogimg" src="" width="400" height="400">
		</div>

	</div>

<!--  추천  결과   -->
	<div id="recom_result" style="display: none">
	
	<div id="recom_result0" style="display: none">
		<div>
			<img id="img0" src="" width="400" height="400">
			<button id="img0like" value="" class="like">좋아용</button>
		</div>
		<div>
			<div id ="img0upperdata">
			<label for="img0upper">상의 :</label> 
			<input type="text" id="img0upper" name="img0upper" value="" size="50"  readonly><br> <br> 
			</div>
			<div id ="img0lowerdata">
			<label for="img0lower">하의:</label> 
			<input type="text" id="img0lower" name="img0lower" value="" size="50"  readonly><br> <br> 
			</div>
			<div id ="img0outerdata">
			<label for="img0outer">외투:</label>
			<input type="text" id="img0outer" name="img0outer" value="" size="50"  readonly><br><br> 
			</div>
			<div id ="img0fulldata">
			<label for="img0full">전신:</label>
			<input type="text" id="img0full" name="img0full" value="" size="50"   readonly>
			</div>
		</div>

		</div>
		
	<div id="recom_result1" style="display: none">
		<div>
			<img id="img1" src="" width="400" height="400">
			<button id="img1like" value="" class="like">좋아용</button>
		</div>
		<div>
			<div id ="img1upperdata">
			<label for="img1upper">상의 :</label> 
			<input type="text" id="img1upper" name="img1upper" value="" size="50" readonly><br> <br> 
			</div>
			<div id ="img1lowerdata">
			<label for="img1lower">하의:</label> 
			<input type="text" id="img1lower" name="img1lower" value="" size="50" readonly><br> <br> 
			</div>
			<div id ="img1outerdata">
			<label for="img1outer">외투:</label>
			<input type="text" id="img1outer" name="img1outer" value="" size="50" readonly><br><br> 
			</div>
			<div id ="img1fulldata">
			<label for="img1full">전신:</label>
			<input type="text" id="img1full" name="img1full" value="" size="50" readonly>
			</div>
		</div>

	</div>
	<div id="recom_result2" style="display: none">
		<div>
			<img id="img2" src="" width="400" height="400">
			<button id="img2like" value="" class="like">좋아용</button>
		</div>
		<div>
			<div id ="img2upperdata">
			<label for="img2upper">상의 :</label> 
			<input type="text" id="img2upper" name="img2upper" value="" size="50" readonly><br> <br> 
			</div>
			<div id ="img2lowerdata">
			<label for="img2lower">하의:</label> 
			<input type="text" id="img2lower" name="img2lower" value="" size="50" readonly><br> <br> 
			</div>
			<div id ="img2outerdata">
			<label for="img2outer">외투:</label>
			<input type="text" id="img2outer" name="img2outer" value="" size="50" readonly><br><br> 
			</div>
			<div id ="img2fulldata">
			<label for="img2full">전신:</label>
			<input type="text" id="img2full" name="img2full" value="" size="50" readonly>
			</div>
		</div>

	</div>
	
	</div>
	
	<div id="sorry" style="display:none">
		<img src="data/icon/sorry.jpg"><br>
		<h3>추천의상이 없습니다
	</div>

<!--  자바 스크립트  -->

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">
		
	</script>



	<script type="text/javascript">
		$('#btn-upload').on('click', function() {
			$("#recom").hide();
			$("#result").hide();
			$("#recom_result").hide();
			$("#loadicon").show();
			$(".btn-recom").hide();
			$(".cloth_data").hide();
			$('.like').html('좋아용');
			$("#sorry").hide();

			var form = new FormData(document.getElementById('form'));
			$.ajax({
				url : "/upload.do",
				data : form,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(json) {
					
					for (let i = 0; i <= 3; i++)
					{
						$("#img"+i.toString()+"upper").attr('value', "");
						$("#img"+i.toString()+"lower").attr('value', "");
						$("#img"+i.toString()+"outer").attr('value', "");
						$("#img"+i.toString()+"full").attr('value',  "");
						$("#img"+i.toString()).attr('src', "");
						$("#recom_result"+i.toString()).hide();

					}
					
					//console.log(response);
					$("#loadicon").hide();
					var res = JSON.parse(json)
					var data = JSON.parse(res.data)

					$("#upper").attr('value', data.상의);
					$("#lower").attr('value', data.하의);
					$("#outer").attr('value', data.외투);
					$("#full").attr('value', data.전신);
					
					if (data.전신 != ""){
						$("#fullbt").show();
						$("#full_data").show();
					}
					if (data.외투 != ""){
						$("#outerbt").show();
						$("#outer_data").show();
					}
					if (data.상의 != ""){
						$("#upperbt").show();
						$("#upper_data").show();
					}
					if (data.하의 != ""){
						$("#lowerbt").show();
						$("#lower_data").show();
					}
					
					$("#afimg").attr('src', res.afimg);
					$("#ogimg").attr('src', res.ogimg);
					$("#filename").attr('value', res.afimg);
					$("#recominput_upper").attr('value', data.상의);
					$("#recominput_outer").attr('value', data.외투);
					$("#recominput_full").attr('value', data.전신);
					$("#recominput_lower").attr('value', data.하의);
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
		
		$('.btn-recom').on('click', function() {
			$('.like').html('좋아용');
			$("#result").hide();
			$("#loadicon").show();
			$("#recom_result").hide();
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
					
					if (myObject.length != 0){
						for (let j = 0; j <= 3; j++)
						{
							$("#img"+j.toString()+"upperdata").hide();
							$("#img"+j.toString()+"lowerdata").hide();
							$("#img"+j.toString()+"outerdata").hide();
							$("#img"+j.toString()+"fulldata").hide();
						}
						
						for (i in myObject)
						{
							if (myObject[i]["상의"] != ""){
								$("#img"+i.toString()+"upperdata").show();
							}
							if (myObject[i]["하의"] != ""){
								$("#img"+i.toString()+"lowerdata").show();
							}
							if (myObject[i]["외투"] != ""){
								$("#img"+i.toString()+"outerdata").show();
							}
							if (myObject[i]["전신"] != ""){
								$("#img"+i.toString()+"fulldata").show();
							}
							
							$("#img"+i.toString()+"upper").attr('value', myObject[i]["상의"]);
							$("#img"+i.toString()+"lower").attr('value', myObject[i]["하의"]);
							$("#img"+i.toString()+"outer").attr('value', myObject[i]["외투"]);
							$("#img"+i.toString()+"full").attr('value', myObject[i]["전신"]);
							$("#img"+i.toString()).attr('src', myObject[i]["경로"]);
							$("#img"+i.toString()+"like").attr('value', myObject[i]["경로"]);
							$("#recom_result"+i.toString()).show();
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
		});
		
		
		$('.like').on('click', function() {
			$("#likeupper").attr('value',"");
			$("#likelower").attr('value',"");
			$("#likefull").attr('value',"");
			$("#likeouter").attr('value',"");
			$("#likeinput").attr('value', $(this).attr('value'));
			if($(this).text() == '좋아용'){
				$(this).html('취소');
				$("#likemode").attr('value', "1");
			}else {
				$(this).html('좋아용');
				$("#likemode").attr('value', "0");
			}
			$("#likeupper").attr('value', $("#"+$(this).attr('id').substring( 0, 4 ).concat("upper")).attr('value'));
			$("#likelower").attr('value', $("#"+$(this).attr('id').substring( 0, 4 ).concat("lower")).attr('value'));
			$("#likefull").attr('value', $("#"+$(this).attr('id').substring( 0, 4 ).concat("full")).attr('value'));
			$("#likeouter").attr('value', $("#"+$(this).attr('id').substring( 0, 4 ).concat("outer")).attr('value'));

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
