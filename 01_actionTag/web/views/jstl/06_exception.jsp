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
	<%
		String[] names=null;
	request.setAttribute("names", names);
	%>
	<c:catch var="e">
	<h1>에러발생전!</h1>
		<%=names.length %>
		<h1>에러발생후!</h1>
	</c:catch>
	<h3>난 catch밖에 있는 놈!</h3>
	<h3>${e }</h3>
	
</body>
</html>