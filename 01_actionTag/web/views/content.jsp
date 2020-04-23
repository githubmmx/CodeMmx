<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="header.jsp" %>
<!-- 액션태그를 이용하여 처리해보자 -->
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:include page="header.jsp">
	<jsp:param name="title" value="책정보"/>
</jsp:include>

	<%-- <h1><%=title %></h1> --%>
	<table>
		<tr>
			<th>제목</th>
			<th>저자</th>
			<th>가격</th>
		</tr>
		<tr>
			<td>자바란 무엇인가?</td>
			<td>유병승</td>
			<td>100</td>
		</tr>
		<tr>
			<td>오라클 god</td>
			<td>김범신</td>
			<td>1,000,000</td>
		</tr>
	</table>
</body>
</html>





