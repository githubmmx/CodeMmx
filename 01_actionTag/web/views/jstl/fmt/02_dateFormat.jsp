<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날짜 포멧팅하기</title>
</head>
<body>
	<h2>날짜 출력하기</h2>
	<c:set var="today" value="<%=new java.util.Date() %>"/>
	<p>기본출력 : <c:out value="${today }"/><p>
	<p>fmt기본출력 : <fmt:formatDate value="${today }"/></p>
	<p>type속성을 이용하면 시간, 날짜, 둘다 표현</p>
	<p>fmt시간출력 : <fmt:formatDate type="time" value="${today }"/></p>
	<p>fmt날짜/시간출력 : 
	<fmt:formatDate type="both" value="${today }"/></p>
	<h3>기본제공 style적용하기(날짜)</h3>
	<p>fmt dateStyle - short : 
	<fmt:formatDate type="both" dateStyle="short" value="${today }"/></p>
	<p>fmt dateStyle - long : 
	<fmt:formatDate type="both" dateStyle="long" value="${today }"/></p>
	<p>fmt dateStyle - full : 
	<fmt:formatDate type="both" dateStyle="full" value="${today }"/></p>
	<h3>패턴을 이용한 방식</h3>
	<p>fmt 패턴이용하기 : 
	<fmt:formatDate type="date" pattern="yy-MM-dd E요일" value="${today }"/></p>
	
	<h3>시간표현하기</h3>
	<p>fmt timeStyle - short : 
	<fmt:formatDate type="time" timeStyle="short" value="${today }"/></p>
	<p>fmt timeStyle - medium : 
	<fmt:formatDate type="time" timeStyle="medium" value="${today }"/></p>
	<p>fmt timeStyle - long : 
	<fmt:formatDate type="time" timeStyle="long" value="${today }"/></p>
	<p>fmt timeStyle - full : 
	<fmt:formatDate type="time" timeStyle="full" value="${today }"/></p>
	<h3>패턴으로 출력하기</h3>
	<p>fmt timeStyle - pattern : 
	<fmt:formatDate type="time" pattern="a hh시mm분ss초" value="${today }"/></p>
	
	<h3>시간설정 변경하기</h3>
	<fmt:timeZone value="GMT">
		<fmt:formatDate type="both" dateStyle="full" timeStyle="full" 
		value="${today }"/>
	</fmt:timeZone><br>
	<fmt:timeZone value="GMT+9">
		<fmt:formatDate type="both" dateStyle="full" timeStyle="full" 
		value="${today }"/>
	</fmt:timeZone><br>
	<fmt:setLocale value="en_US"/>
	<fmt:formatDate type="both" pattern="E" 
		value="${today }"/>
		
	<h1>function태그 이용하기</h1>
	<p>fn:함수명(매개변수,매개변수)</p>
	<c:set var="test" value="How are You?"/>
	<p>${test }</p>
	<p>${fn:toUpperCase(test) }</p>
	<p>${fn:indexOf(test,"are") }</p>
		
</body>
</html>





