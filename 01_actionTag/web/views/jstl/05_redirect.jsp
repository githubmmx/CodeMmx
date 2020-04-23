<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리다이렉트처리하기</title>
</head>
<body>
	<c:set var="addr" 
	value="https://search.naver.com/search.naver?query=코로나"/>
	<c:url var="addr2" 
	value="https://search.naver.com/search.naver">
		<c:param name="query" value="김인술"/>
	</c:url>
	
	<%-- <c:redirect url="http://www.iei.or.kr"/> --%>
	<c:redirect url="${addr2 }"/>

</body>
</html>







