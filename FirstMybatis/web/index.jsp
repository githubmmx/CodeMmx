<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${pageContext.request.contextPath }/enrollStudent">학생등록</a>
<a href="${pageContext.request.contextPath }/enrollStudentMap">학생등록(map)</a>
<a href="${pageContext.request.contextPath }/selectCount">학생수 조회하기</a>
<a href="${pageContext.request.contextPath }/selectList">학생 리스트 조회</a>
<a href="${pageContext.request.contextPath }/selectMap">학생 리스트 조회(Map)</a>
</body>
</html>