<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int su=Integer.parseInt(request.getParameter("su1"));
	int su2=Integer.parseInt(request.getParameter("su2"));
	int result=0;
	for(int i=su;i<su2;i++){
		result+=i;
	}
	request.setAttribute("result", result);
%>
<jsp:forward page="calcResult.jsp">
	<jsp:param value="10" name="restTime"/>
</jsp:forward>
