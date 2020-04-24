<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
	    div#student-container{text-align:center;}
	    table#tbl-student{margin:0 auto;border:1px solid; border-collapse:collapse;}
	    table#tbl-student th,table#tbl-student td{
	        border:1px solid;
	        padding:5px;
	        line-height: 2em; /*input태그로 인해 cell이 높이가 길어져 border 두줄현상방지 */
	    }
	    table#tbl-student th{text-align:right;}
	    table#tbl-student td{text-align:l="eft;}
	    table#tbl-student tr:last-of-type td{text-align:center;}
    </style>
</head>
<body>
<div id="student-container">
		<h2>학생정보 검색</h2>
		<p>총 학생수는 ${count }명입니다.</p>
		<form action="${pageContext.request.contextPath }/selectStudent">
			<table id="tbl-student">
				<tr>
					<th>학생번호</th>
					<td>
						<input type="number" name="no" required/>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="검색" />
					</td>
				</tr>
			</table>
		</form>
		<p>조회한 ${param.no }번 학생의 이름은 ${student_name }입니다.
		<table>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>주소</th>
			</tr>
			<tr>
				<%-- <td><c:out value="${student.student_no }"></c:out> </td>
				<td><c:out value="${student.student_name }"></c:out> </td>
				<td><c:out value="${student.student_tel }"></c:out> </td>
				<td><c:out value="${student.student_email }"></c:out> </td>
				<td><c:out value="${student.student_addr }"></c:out> </td> --%>
				<td><c:out value="${student.STUDENT_NO }"></c:out> </td>
				<td><c:out value="${student.STUDENT_NAME }"></c:out> </td>
				<td><c:out value="${student.STUDENT_TEL }"></c:out> </td>
				<td><c:out value="${student.STUDENT_EMAIL }"></c:out> </td>
				<td><c:out value="${student.STUDENT_ADDR }"></c:out> </td>
			</tr>
		</table>
	</div>


</body>
</html>