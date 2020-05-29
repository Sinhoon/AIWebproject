<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang=ko>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>좋아요</title>
</head>
<body>
	<h2>좋아요</h2>
	
<!--  header  -->
<ul>
	<li><a href="/">홈</a></li>
	<c:if test="${member != null}"><li><a href="/sendView">의상 평가</a></li></c:if>
	<c:if test="${member != null}"><li><a href="/like">좋아요 기록</a></li></c:if>
	<c:if test="${member != null}">
	<li>
		<p>${member.EMP_ID}님 안녕하세요.</p>
	</li>
	</c:if>
	<c:if test="${member != null}"><li><a href="/logout">로그아웃</a></li></c:if>
	<c:if test="${member == null}"><li><a href="/login">로그인</a></li></c:if>
	<c:if test="${member == null}"><li><a href="/regist">회원가입</a></li></c:if>
</ul>
	
<div><button id="btn-likerecom"><a href="/userlike">추천 </a></button></div><br>
<div id="image_container"> <!-- 이미지 마크업 생성 공간 --> </div>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">	
</script>

<script type="text/javascript">
	$.ajax({
		url : "/showlike.do",
		dataType : 'text',
		processData : false,
		contentType : false,
		type : 'POST',
		success : function(data) {
			var myObject = eval(data);

			
			for (var i = 0; i < myObject.length; i++) {
				var strDOM = ""; 
				strDOM += '<div class="image_panel">'; 
				strDOM += '<img src=' + myObject[i]["경로"] + ' width="400" height="500">';
				strDOM += '<button  value='+ myObject[i]["경로"] +' class="like">취소</button><br>';
				
				if(myObject[i]["상의"] != "not"){
				strDOM += '<label for="upper">상의 :</label>' ;
				strDOM += '<input type="text" class="upper" name="upper" value='+myObject[i]["상의"]+' size="50" readonly><br> ';
				} 
				if(myObject[i]["하의"] != "not"){
					strDOM += '<label for="lower">하의 :</label>' ;
					strDOM += '<input type="text" class="lower" name="lower" value='+myObject[i]["하의"]+' size="50" readonly><br> ';
				} 
				if(myObject[i]["전신"] != "not"){
					strDOM += '<label for="full">전신 :</label>' ;
					strDOM += '<input type="text" class="full" name="full" value='+myObject[i]["전신"]+' size="50" readonly><br> ';
				} 
				if(myObject[i]["외투"] != "not"){
					strDOM += '<label for="outer">외투 :</label>' ;
					strDOM += '<input type="text" class="outer" name="outer" value='+myObject[i]["외투"]+' size="50" readonly><br> ';
				} 
				
				strDOM += '</div>';
			    // 이미지 컨테이너에 생성한 이미지 패널들을 추가하기
			    var $imageContainer = $("#image_container");
			    $imageContainer.append(strDOM); 
			}   
		},
		error : function(jqXHR) {
			console.log('error');
		}
	});
	
	
	$(document).on("click",".like",function() {
		var cdata =  'cdata='+encodeURI($(this).val());
		var bt = $(this);
		$.ajax({
			url : "/cancellike.do",
			data : cdata,
			dataType : 'text',
			type : 'POST',
			processData : false,
			
			success : function(data) {
				console.log(cdata);
				bt.closest('.image_panel').hide();
				}   
			,
			error : function(jqXHR) {
				console.log('error');
			}
	});
		
	});
	
	

	
</script>