<%@page import="java.util.ArrayList"%>
<%@page import="com.elandjstl.model.vo.Animal"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Animal> list = new ArrayList();
	list.add(new Animal("dog",3,7.3f));
	list.add(new Animal("cat",2,5.1f));
	request.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	${list[0].name }
	${list.get(1).name }
	${list.get(1)['age'] }
	
	${10 + 2 }
	${10 - 2 }
	${10 * 2 }
	${10 / 2 }
	${10 % 2 }
	
	${10 > 2 }
	${10 < 2 }
	${10 >= 2 }
	${10 <= 2 }
	${10 == 2 }
	${10 != 2 }

	${list == null }
	${empty list}
	${not empty list}
</body>
</html>