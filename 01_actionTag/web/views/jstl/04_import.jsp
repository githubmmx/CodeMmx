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
	<p>
		
	</p>
	<c:import var="page" url="03_foreach.jsp">
		<c:param name="title" value="이건 import"></c:param>
	</c:import>
	<c:import var="page1" url="../header.jsp">
		<c:param name="title" value="이건 import"></c:param>
	</c:import>
	${page }
	${page }
	${page }
	${page }
	${page }
	${page }
	${page }
	${page }
	${page }
	${page }
	${page1 }
</body>
</html>