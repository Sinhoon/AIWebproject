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
<title>유저 추천</title>
</head>
<body>
	<h2>유저 추천</h2>
	
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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js">	
</script>

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


$('.like').on('click', function() {
	$("#likeupper").attr('value',"");
	$("#likelower").attr('value',"");
	$("#likefull").attr('value',"");
	$("#likeouter").attr('value',"");
	$("#likeinput").attr('value', encodeURI($(this).attr('value')));
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