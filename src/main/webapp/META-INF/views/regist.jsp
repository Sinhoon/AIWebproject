<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang=ko>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>회원 가입</title>
</head>
<body>
<h2>회원 가입</h2>
<!--  header  -->
<ul>
	<li><a href="/">홈</a></li>
</ul>



<!--  이미지 정보 입력   -->
	<form action="/regist.do" id="form" name="form" method="POST" enctype="multipart/form-data">
		<div>
		<label for="id">아이디</label> 
		<input type="text" id="id" name="id" class="btn btn-default btn-lg">
		</div>
		<div>
		<label for="pwd">비밀번호</label> 
		<input type="password" id="pwd" name="pwd" class="btn btn-default btn-lg">
		</div>
		<div>
		<label for="age">나이</label> 
		<input type="text" id="age" name="age" class="btn btn-default btn-lg">
		</div>
		<div>
		<label for="sex">성별</label> 
		<label><input type="radio" name="sex" value="f" checked> 여자</label>
     	<label><input type="radio" name="sex" value="m"> 남자</label>
		</div>
		<button type="submit">회원 가입 </button>
	</form>

</body>
</html>