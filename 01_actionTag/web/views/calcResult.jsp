<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<h2>계산결과 : <%=request.getAttribute("result") %></h2>
 	<h2>파라미터값확인 : <%=request.getParameter("restTime") %></h2>
 	<h2>계산결과 : ${result}</h2>
 	<h2>파라미터 : ${param.restTime}</h2>
</body>
</html>