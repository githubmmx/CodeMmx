<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, com.usebean.model.vo.Person" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반복문 사용하기</title>
</head>
<body>
	<h2>태그를 이용하여 반복문 처리하기</h2>
	<p>
		c:forEach 태그를 이용
		배열, 리스트, map 순회처리
		기본 반복문 1..10 출력
		속성 : items, var, varStatus ->배열,리스트,map 반복문
		items : 반본문에 처리된 배열, 리스트, map
		var : 0인덱스부터 마지막인덱스까지 값을 보관하는 변수
		varStatus : 반복문의 상태를 저장하는 객체, index값, 반복횟수 등
		
		begin : 시작
		end : 끝
		step : 증감범위
		var : 출력되는 값을 저장하는 변수
	</p>

	<%
		String[] names={"유병승", "최진호","서원","김인술","현정호","진승연"};
		request.setAttribute("names", names);
		List<Person> list=new ArrayList();
		list.add(new Person("김상학",27,"남"));
		list.add(new Person("김범god",27,"남"));
		list.add(new Person("정세현",26,"여"));
		list.add(new Person("김미연",28,"여"));
		request.setAttribute("list", list);
		
	%>
	<ul>
		<c:forEach var="n" items='${names }' varStatus="vs">
			<c:if test="${vs.first}">
				<li>${vs.index } ${vs.count } <c:out value="${n }"></c:out></li>
			</c:if>
			<c:if test="${vs.last}">
				<li>${vs.index } ${vs.count } <c:out value="${n }"></c:out></li>
			</c:if>
		</c:forEach> 
	</ul>
	<table>
		<tr>
			<th>이름</th>
			<th>나이</th>
			<th>성별</th>
		</tr>
		<c:forEach items='${list }' var='p'>
			<tr>
				<td><c:out value='${p.tag }'/></td>
				<td><c:out value="${p.age }"/></td>
				<td><c:out value="${p.gender }"/></td>	
			</tr>
		</c:forEach>
	</table>
	
	<h2>내가 가진 아이템출력하기</h2>
	<ul>
		<c:forEach items="${paramValues.item }" var="i">
			<li><c:out value="${ i}"/></li>
		</c:forEach>
	</ul>
	<h2>기본반복문 처리</h2>
	<c:forEach begin="1" end="10" step="1" var='i'>
		<p><c:out value='${i }'/></p>
	</c:forEach>
	
	<h2>forTokens태그이용하기</h2>
	<p>
		java의 StringTokenizer와 비슷함.
		속성 : var, items, delims
	</p>
	<%
		String hobby="게임,독서,꽃꽂이,운동";
		request.setAttribute("hobby", hobby);
		String program="c.c#,c++,java.javascript.html,oracle,spring";
		request.setAttribute("program", program);
	%>
	<c:forTokens items="${hobby}" var="h" delims=",">
		<c:if test='${h eq "운동" }'>
			<p>${h }</p>
		</c:if>
	</c:forTokens>
	
	<c:forTokens items="${program }" var="p" delims=",.">
		<p>${p }</p>
	</c:forTokens>
	
	
</body>
</html>





