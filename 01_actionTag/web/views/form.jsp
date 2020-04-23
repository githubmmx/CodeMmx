<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=request.getContextPath() %>/views/useBeanResult.jsp">
		이름 <input type="text" name="name"/>
		나이 <input type="text" name="age"/>
		성별<input type="text" name="gender"/>
		<input type="submit" value="전송"/>
	</form>
	<br>
	
	<form action="result.jsp">
		<input type="number" name="su1" min="0">
		<input type="number" name="su2" min="0">
		<input type="submit" value="계산하기!">
	</form>
	


</body>
</html>



