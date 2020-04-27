<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="animal" class="com.elandjstl.model.vo.Animal" scope="request" />
	
	<jsp:getProperty property="weight" name="animal"/>
	<jsp:getProperty property="name" name="animal"/>
	<jsp:setProperty property="name" name="animal" value="cat"/>
	<jsp:getProperty property="name" name="animal"/>
	
	<jsp:useBean id="chicken" class="com.elandjstl.model.vo.Animal" scope="request" />
	<jsp:getProperty property="weight" name="chicken"/>
	<jsp:setProperty property="weight" name="chicken" value="4"/>
	<jsp:getProperty property="weight" name="chicken"/>
	
	
	
</body>
</html>