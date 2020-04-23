<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL사용하기</title>
</head>
<body>
	<h2>기본적인 EL문을 사용하기</h2>
	<p>
		EL표현식은 jsp내장객체에 있는 값을 편리하게 사용할 수 있게 함.
		내장객체에 setAttribute로 저장된 값을 자동으로 key값을 기준으로 
		탐색하여 값을 가져옴.
		자동탐색 작은범위 -> 큰범위로 설정!
	</p>
	<%-- 사용하는 방법 : ${키값||변수명||리터럴 } --%>
	<%
		String name="유병승";
		request.setAttribute("name", name);
		//객체 선언
		com.usebean.model.vo.Person p=new com.usebean.model.vo.Person();
		p.setName("서원");
		p.setAge(33);
		p.setGender("남");
		request.setAttribute("p", p);
		List<com.usebean.model.vo.Person> persons=new ArrayList();
		persons.add(new com.usebean.model.vo.Person("유병승",19,"남"));		
		persons.add(new com.usebean.model.vo.Person("유축복",24,"남"));
		persons.add(new com.usebean.model.vo.Person("유슬기",26,"여"));
		request.setAttribute("persons", persons);
	%>
	<p><%=name %></p>
	<p>${name }</p>
	<p>${"유병승" }</p>	
	<p><%=((com.usebean.model.vo.Person)request.getAttribute("p")).getTag() %></p>
	<p>${p }</p>
	<p>${p.tag }</p>
	<p>${p["age"] }${p["gender"] }</p>
	<p>${persons }</p>
	<h2>리스트 출력하기</h2>
	<p>${persons[0].tag }</p>
	<p>${persons.get(0).age }</p>
	<p>${persons.get(2).tag }</p>
	
	<h2>EL 연산처리</h2>
	<%
		int su=10;
		int su2=20;
		request.setAttribute("su", su);
		request.setAttribute("su2", su2);
	%>
	<p>더하기 연산 : ${su+su2 }</p>
	<p>더하기 연산 : ${19+30 }</p>
	<p>빼기 연산 : ${su-su2 }</p>
	<p>나누기 : ${su/su2 }</p>
	<p>나누기 : ${su div su2 }</p>
	<p>곱하기 : ${su*10 }</p>
	<p>나머지 : ${su%su2 }</p>
	<p>나머지 : ${su mod su2 }</p>
	
	<h4>비교, 논리연산</h4>
	<p>${su>30 }</p>
	<p>${su2<=20 }</p>
	<p>${su le 30 }</p>
	<p>${su gt 30 }</p>
	<%
		String hobby = "LoL";
		request.setAttribute("hobby",hobby);
	%>
	<p>${hobby == "LoL" }</p>>
	<p>${hobby eq "LoL" }</p>>
	<p>${persons[0].tag eq "유병승"}</p>
	<p>${persons[2].tag eq "유촉복" && persosns[0].age==19}
	<p>${persons[2].tag eq "유촉복" && persosns[0].age==19}
	<p>${persons[2].tag eq "김인술" or persosns[0].age==19}
	
	<h4>부정연산</h4>
	<p>${persons[0] != "유병승" }</p>
	<p>${persons[0] ne "유병승" }</p>
	
	<h4>객체의 빈값을 확인</h4>
	<%
		List<String> test = new ArrayList();
	test.add("하하하하하하핳하ㅏㅎ하ㅏ하");
		request.setAttribute("test",test);
	%>
	<p>${test == null }</p>
	<p>}</p>
	<p>${empty test}</p>
	<p>${not empty test }</p>
	<p>${persons[0].age == 19?"미성년이시네요":"성년이시네요" } </p>

</body>
</html>







