<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<jsp:include page="headerView.jsp">
	<jsp:param value="헤더 제목입니다." name="title"/>
</jsp:include>

<p>본문 컨텐츠 입니다.</p>
</body>
</html>