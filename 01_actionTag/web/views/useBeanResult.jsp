<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean 활용하기</title>
</head>
<body>
	<h2>useBean 표준태그활용하기 - 객체 조작하기 -</h2>
	<jsp:useBean id="person" 
	class="com.usebean.model.vo.Person"
	scope="request"/>
	<!-- usebean태그는 서블릿에서 보낸 key값과 동일한 id명을 가지고 있으면
	서블릿에 세팅한값을 그대로 가져올 수 있음 -->
	
	<!-- usebean의 값은 jsp:getProperty로 가져옴 -->
	<jsp:getProperty name="person" property="tag"/>
	<jsp:getProperty name="person" property="age"/>
	<jsp:getProperty name="person" property="gender"/>
	
	<jsp:useBean id="p" class="com.usebean.model.vo.Person" 
	scope="request"/>
	<!-- 생성된 useBean에 값을 넣으려면 setProperty를 이용함. -->
	<h2>setProperty이용 값넣기</h2>
	<jsp:setProperty name="p" property="name" value="김인술"/>
	<jsp:setProperty name="p" property="age" value="33"/>
	<jsp:setProperty name="p" property="gender" value="남"/>
	
	<jsp:getProperty name="p" property="tag"/>
	<jsp:getProperty name="p" property="age"/>
	<jsp:getProperty name="p" property="gender"/>
	
	<h2>클라이언트가 보낸 param</h2>
	<jsp:setProperty property="name" name="p" param="name"/>
	<jsp:setProperty property="age" name="p" param="age"/>
	<jsp:setProperty property="gender" name="p" param="gender"/>
	
</body>
</html>