<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이바티스 테스트!!</title>
</head>
<body>
	<h1>기본 마이바티스 insert문 실행하기</h1>
	<a href="${path }/basicInsert">기본 insert문 실행</a>
	<h2>이름을 입력받아 table에 데이터 추가하기</h2>
	<form action="${path }/nameInsert">
		이름<input type="text" name="name">
		<input type="submit" name="입력!">
	</form>
</body>
</html>