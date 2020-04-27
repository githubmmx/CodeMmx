<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.elandjstl.model.vo.Animal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	
	String str = "예제 문자";

	request.setAttribute("name", "choi");
	
	List<String> list = new ArrayList();
	list.add("바나나");
	list.add("사과");
	list.add("귤");
	request.setAttribute("list", list);
	
	String color = "white, black, blue";
	request.setAttribute("color", color);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코어 태그</title>
</head>
<body>
	<h1>Out Set</h1>
	
	
	
	<c:out value="출력"></c:out>
	<c:out value="<%=str %>"></c:out>
	<c:out value="${'el문자' }"></c:out>
	<c:out value="<h3>태그문자</h3>"></c:out>
	<c:out value="<h3>태그문자</h3>" escapeXml="false"></c:out>
	<c:out value="${10 == 10 }" ></c:out>
	<c:out value="${na}" default="jin"></c:out>
	
	<c:set var="speaker" value="jbl"></c:set>
	<c:out value="${speaker }"></c:out>
	<c:set var="animal" value='<%=new Animal("dog",3,5.2f) %>'></c:set>
	<c:out value="${animal.name }"></c:out>
	
	<c:set var="age" value="1" scope="request"></c:set>
	<c:set var="age" value="2" scope="session"></c:set>
	<c:set var="age" value="3" scope="application"></c:set>
	<c:out value="${age }"></c:out>
	<c:out value="${sessionScope.age }"></c:out>
	<c:out value="${applicationScope.age }"></c:out>
	
	<c:set target="${animal }" property="name" value="cat"></c:set>
	<c:out value="${animal.name }"></c:out>
	
	<c:remove var="speaker"/>
	<c:out value="${speaker }" default="변수없음"></c:out>
	
	<h1>if문 choose문 foreach문 forTokens문</h1>
	
	
	
	
	
	<c:if test="${name == 'choi' }">
		이름은 choi 이다.
	</c:if>
	<c:if test="${list.size() == 0}">
		list는 비어있습니다.
	</c:if>
	
	<c:choose>
		<c:when test="${name == 'cho' }">
			이름은 cho이다.
		</c:when>
		<c:when test="${name == 'chi' }">
			이름은 chi이다.
		</c:when>
		<c:otherwise>
			잘모르겠습니다.
		</c:otherwise>
	</c:choose>
	
	<c:forEach begin="0"  end="1"  step="1" items="${list }" var="item" varStatus="vs">
		<c:if test="${vs.first }">
			첫번째 아이템
		</c:if>
		<c:out value="${item }  ${vs.index}"></c:out>
		<c:if test="${vs.last}">
			마지막 아이템
		</c:if>
	</c:forEach>
	
	<c:forTokens items="${color }" delims="," var="item" varStatus="vs">
		<c:if test="${vs.first }">
			첫번째 아이템
		</c:if>
		<c:out value="${item } ${vs.index}"></c:out>
		<c:if test="${vs.last }">
			마지막 아이템
		</c:if>
	</c:forTokens>
	
	<h1>import</h1>
	
	<c:import url="importView.jsp" var="page">
		<c:param name="title" value="import페이지 입니다."></c:param>
	</c:import>
	${page }
	
	
	
	<h1>리다이렉트</h1>
	<c:set var="naver" value="http://www.naver.com"></c:set>
	<c:url var="daum" value="http://www.daum.net">
		<c:param name="query" value="milk"></c:param>
	</c:url>
	
	<%-- <c:redirect url="${daum }"></c:redirect> --%>
	
	
	
	<h1>예외처리</h1>
	<c:catch var="e">
		<c:out value="${list.get(3) }"></c:out>
	</c:catch>
	<c:out value="${e }"></c:out>
	
</body>
</html>