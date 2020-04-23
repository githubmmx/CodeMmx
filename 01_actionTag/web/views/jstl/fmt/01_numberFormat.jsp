<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>숫자 formatting하기</h2>
	<c:set var="numtest" value="1234501987"/>
	<c:set var="numtest2" value="1"/>
	<c:set var="numtest3" value="124.546"/>
	<p>기본출력하기 : <c:out value="${numtest }"/></p>
	<p>fmt기본출력 : <fmt:formatNumber value="${numtest }"/></p>
	기본출력을 할 경우 3자리마다 ,를 출력하게 되어 있음.
	,를 출력하는 속성값 -> groupingUsed -> true/false;
	<p>groupingUsed true : <fmt:formatNumber value='${numtest }' groupingUsed="true"/></p>
	<p>groupingUsed false : <fmt:formatNumber value='${numtest }' groupingUsed="false"/></p>
	
	<h2>화폐표시</h2>
	<p>
		화폐는 기본적으로 톰켓에 설정되어 있는 locale에 따라 결정
		currencySymbol속성을 이용해서 설정할 수도 있음 
		formatNumber type속성을  currency설정
	</p>
	<p>기본 화폐출력 : <fmt:formatNumber value="${numtest }" type="currency"/>원</p>
	<!-- 로케일 설정을 변경 후 출력을 하게되면??? -->
	<fmt:setLocale value="en_US"/>
	<p>로케일 설정 후 : <fmt:formatNumber value="${numtest }" type="currency"/>딸라</p>
	<p>화폐표기 변경 : <fmt:formatNumber groupingUsed="false" currencySymbol="BS" value="${numtest }" type="currency"/></p>
	
	<h2>퍼센트 표시하기</h2>
	<p>
		 type속성 -> percent로 설정
		 value값이 지정 0 ~ 1 0% ~ 100%
	</p>
	<p>퍼센트 출력하기 <fmt:formatNumber value="${numtest2 }" type="percent"/></p>
	<p>퍼센트 출력하기 <fmt:formatNumber value="${numtest2/2 }" type="percent"/></p>
	<p>퍼센트 출력하기 <fmt:formatNumber value="${0.08 }" type="percent"/></p>
	
	<h3>패턴을 지정하여 숫자출력하기</h3>
	<p>
		pattern 0,#
		0 : 패턴에서 지정한 자리에 숫자가 없으면 0으로 표시 *무조건 표시
		# : 패턴에서 지정한 자리에 숫가자 없으면 표지하지 않음
	</p>
	<p>기본출력 : <fmt:formatNumber value="${numtest3 }"/></p>
	<p>패턴1 : <fmt:formatNumber value="${numtest3 }" pattern="0,000,000.00"/></p>
	<p>패턴2 : <fmt:formatNumber value="${numtest3 }" pattern="#,###,####.##"/>
	<p>패턴3 : <fmt:formatNumber value="${numtest3 }" pattern="0,000,000.0000"/></p>
	<p>패턴4 : <fmt:formatNumber value="${numtest3 }" pattern="#,###,####.####"/></p>
	<p>패턴5 : <fmt:formatNumber value="${numtest3 }" pattern="#,###,####.0000"/></p>
	
	<h2>소수점 자리표현하기</h2>
	<p>
		minFractionDigit : 최소소수점 자리수
		maxFractionDigit : 최대 소수점 자리수
	</p>
	<p>최소소수점자리 : <fmt:formatNumber value="${123.112312313 }" minFractionDigits="2" pattern="#,###,####.########"/></p>
	<p>최대소수점 자리 : <fmt:formatNumber value="${numtest3 }" maxFractionDigits="2" pattern="#,###,####.####"/></p>
</body>
</html>











