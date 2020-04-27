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
	<h2>전체 학생 조회</h2>
	<table>
		<tr>
			<th>학생전화번호</th>
			<th>학생이메일</th>
			<th>학생주소</th>
			<th>등록일</th>
		</tr>
		<c:if test="${not empty list }">
			<c:forEach items="${list }" var="l">
				<tr>
					<%-- <td><c:out value="${l.student_no }"></c:out> </td>
					<td><c:out value="${l.student_name }"></c:out> </td>
					<td><c:out value="${l.student_tel }"></c:out> </td>
					<td><c:out value="${l.student_email }"></c:out> </td>
					<td><c:out value="${l.student_addr }"></c:out> </td>
					<td><c:out value="${l.reg_date }"></c:out> </td> --%>
					<td><c:out value="${l['STUDENT_NO'] }"></c:out> </td>
					<td><c:out value="${l['STUDENT_NAME'] }"></c:out> </td>
					<td><c:out value="${l['STUDENT_TEL'] }"></c:out> </td>
					<td><c:out value="${l['STUDENT_EMAIL'] }"></c:out> </td>
					<td><c:out value="${l['STUDENT_ADDR'] }"></c:out> </td>
					<td><c:out value="${l['REG_DATE'] }"></c:out> </td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty list }">
			<tr>
				<td colspan="6">등록된 학생이 없습니다. </td>
			</tr>
		</c:if>
	</table>

</body>
</html>