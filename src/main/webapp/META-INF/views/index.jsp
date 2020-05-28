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
<title>메인</title>
</head>
<body>
	<h2>메인</h2>
	
<!--  header  -->
<ul>
	<li><a href="/index">홈</a></li>
	<c:if test="${member != null}"><li><a href="/sendView">의상 평가</a></li></c:if>
	<c:if test="${member != null}">
	<li>
		<p>${member.EMP_ID}님 안녕하세요.</p>
	</li>
	</c:if>
	<c:if test="${member != null}"><li><a href="/logout">로그아웃</a></li></c:if>
	<c:if test="${member == null}"><li><a href="/login">로그인</a></li></c:if>
	<c:if test="${member == null}"><li><a href="/regist">회원가입</a></li></c:if>
</ul>
	
