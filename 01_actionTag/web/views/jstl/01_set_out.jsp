<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set, out 태그이용하기</title>
</head>
<body>
	<h1>core태그 out태그 활용</h1>
	<p>c:out 태그사용하고
	태그 속성 : value, default, escapeXML
	value -> 출력할 값
	default -> 기본값을 설정
	escapeXML -> value에 태그형식(HTML) 해석여부
	</p>
	
	<c:out value="이거출력하자"/>
	<% String msg="오늘 아직 수요일이네요!"; %>
	<c:out value="<%=msg %>"/>
	<c:out value="${'하하하'}"/>
	<h2><c:out value='${"호호호호" }'/></h2>
	<h2>호호호호</h2>
	<c:out value='<h2>이거는 되니</h2>'/>
	<c:out value='<h2>이거는 될까?</h2>' escapeXml="false"/>
	<c:out value="${10==20 }"/>
	<%
		request.setAttribute("hobby", "게임");
		request.setAttribute("name", "호호하하");
	%>
	<br/>
	<c:out value="${hobby }"/>
	<c:out value="${name }" default="현정호"/>
	${name }
	<h3>데이터 변수에 저장하기</h3>
	<p>c:set태그이용
		속성 : var, value, target, scope
		var -> 변수명 *EL로 데이터를 호출
		value -> var에 들어갈 값
		target -> 지정객체
		scope -> 변수저장영역
	</p>
	<c:set var="content" value="이제 곧 쉬는시간!!"/>
	<c:out value='${content }'/>
	<c:out value='${content }'/>
	<c:out value='${content }'/>
	<c:out value='${content }'/>
	<c:out value='${content }'/>
	<c:out value='${content }'/>
	<c:out value='${content }'/>
	<c:out value='${content }'/>
	<c:set var='path' value="<%=request.getContextPath() %>"/>
	<c:set var='path2' value="${pageContext.request.contextPath }"/>
	${path }
	${path2 }
	
	<h3>객체를 한번 저장해보자</h3>
	<c:set var="today" value="<%=new java.util.Date() %>"/>
	<c:out value="${today }"/>
	<c:set var="person" value='<%=new com.usebean.model.vo.Person("진승연",27,"남") %>'/>
	<c:out value="${person.tag }"/>
	<c:out value='${requestScope.person }'/>
	<c:out value='${pageScope.person }'/>
	
	<h4>특정scope에 저장하기</h4>
	<c:set value="19" var="age" scope="request"/>
	<c:set value="20" var="age" scope="session"/>
	<c:set value="21" var="age" scope="application"/>
	<c:out value="${age }"/>
	<c:out value="${sessionScope.age }"/>
	<h4>특정 객체에 값 저장하기</h4>
	<c:out value="${person }"/><br/>
	<c:set target="${person }" property="age" value="33"/>
	<c:out value="${person }"/>
	
	<h4>등록된 변수 삭제</h4>
	<c:remove var="age"/>
	<c:out value="${age }"/>
	
	
</body>
</html>






