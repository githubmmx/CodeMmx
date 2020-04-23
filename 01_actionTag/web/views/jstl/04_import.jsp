<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>import사용하기</title>
</head>
<body>
	<h2>import태그 사용하기</h2>
	<p>c:import태그
		현재페이지에 다른페이지를 불러오는 태그
		<%-- <%@ include %> <jsp:include> --%>
		c:import태그는 불러온 페이지를 변수에 대입
		그 불러온 페이지를 출력하려면 변수를 호출
	</p>
	<c:import var="page" url="03_foreach.jsp">
		<c:param name="title" value="이건 import"/>
	</c:import>
	<c:import var="page1" url="../header.jsp">
		<c:param name="title" value="이건 import"/>
	</c:import>
	${page1 }
	${page }
	${page }
	${page }
	${page }
	${page }
	${page }
	${page }
	${page1 }
	<aside>
		${page1 }
	</aside>
</body>
</html>






