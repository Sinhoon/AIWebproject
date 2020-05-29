<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang=ko>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>로그인</title>
</head>
<body>
<h2>로그인 </h2>
<!--  header  -->
<ul>
	<li><a href="/">홈</a></li>
</ul>

	
<!--  이미지 정보 입력   -->
	<form action="/login.do" id="form" name="form" method="POST" enctype="multipart/form-data">
		<div>
		<label for="id">아이디</label> 
		<input type="text" id="id" name="id" class="btn btn-default btn-lg">
		</div>
		<div>
		<label for="pwd">비밀번호</label> 
		<input type="password" id="pwd" name="pwd" class="btn btn-default btn-lg">
		</div>
		<div>

		<button type="submit">로그인 </button>
	</form>

</body>
</html>