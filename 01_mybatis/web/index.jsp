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
</body>
</html>