<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>조건문 사용하기</title>
</head>
<body>
	<h2>if문 사용하기</h2>
	JSTL을 배우기전......
	<%if(20<0){ %>
		<h1>20은 0보다 크다</h1>
	<%} %>
	<p>c:if태그를 이용해서 분기처리를 할 수 있음
	속성 ㅣ test, var
	test -> 조건문이 들어가는 곳if()
	var -> 변수 조건문의 결과(true, false)
	
	</p>
	<%request.setAttribute("name", "최가영"); %>
	<c:if test="${name eq '정세현' }">
		<h1>이것이 맞을까요 출력?? 될까?</h1>
	</c:if>
	
	<h1>로그인 확인하기</h1>
	<c:if test="${param.userId eq 'admin' and param.password eq '1234' }">
		<h2>로그인 성공</h2>
	</c:if>
	
	<c:if test="${param.userId eq 'admin' }">
		<c:if test="${param.password eq '1234' }">
		
		</c:if>
	</c:if>
	
	<%
		List<String> list = new ArrayList();
		list.add("육개장");
		list.add("국수");
		list.add("돈까스");
		list.add("탕슉");
		request.setAttribute("list", list);
	%>
	
	<ul>
		<c:if test="${not empty list }">
			
			<li><c:out value="${list[0] }"></c:out> </li>
			
		</c:if>
		<c:if test="${empty list }">
			<li><c:out value="${'리스트가 없어 임마!' }"></c:out> </li>
		</c:if>
	</ul>
	
	<h3>c:choose 태그 사용하기</h3>
	java의 swith문과 비슷함.
	c:choose
		c:when test="조건"
		c:when test="조건"
		
	<c:choose>
		<c:when test="${list[0] eq '삼계탕' }">
			<h1>삼계탕 굿국 건강해지자~~!</h1>
		</c:when>
		<c:when test="${list[0] eq '육계장' }">
			<h1>축복씨가 저녁으로 먹은 육개장</h1>
		</c:when>
		<c:when test="${list[0] eq '삼계탕' }">
		
			<h1>
			</h1>
		</c:when>
	</c:choose>
	
	<h3>오늘의 식사메뉴~</h3>
	<ul>
		<c:forEach items="${list } var="d"">
			<li><c:out value="${d }"></c:out></li>
		</c:forEach>
	</ul>
	
</body>
</html>






