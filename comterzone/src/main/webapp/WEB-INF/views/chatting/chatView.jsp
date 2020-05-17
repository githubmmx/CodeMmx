<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅창</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
	#clients-container{
		margin-left:30px;
	}
	#clients-container>h4{
		margin-left:25px;
	}
	#clients-container ul>li{
		list-style-type:none;
		color:green;
		font-weight:bolder;
		font-size:20px;
		margin-bottom:5px;
	}
</style>
</head>
<body>
	<input type="text" id="msg"/><button id="sendBtn">전송</button>
	<div style="display:flex;">
		<div id="msg-container">
		</div>
		<div id="clients-container">
			<h4 id="client-count"></h4>
			<ul id="clients">
			</ul>
		</div>
	</div>
	<script>
		//소켓서버와 연결하기!
		const websocket=new WebSocket("ws://localhost:9090${pageContext.request.contextPath}/chatting");
		let receiver="";
		//접속후 실행되는 onopen 함수구현하기
		websocket.onopen=function(data){
			console.log(data);
			//클라이언트에게 나의 접속정보를 자동으로 보내게함
			//서버에서 세션을 관리하게 하기위함
			websocket.send(JSON.stringify(new SocketMessage("new","${loginMember.userId}","","")));			
		}
		websocket.onmessage=function(data){
			const msg=JSON.parse(data.data);
			switch(msg.type){			
				case "msg" : addMessage(msg);break;
				case "info" : infoMessage(msg);break;
				case "curClient" : printClients(msg);break;
			}
		}
		function printClients(msg){
			console.log(msg.msg);//접속자수를 받음
			const clients=msg.msg.split(",");
			console.log(clients,clients.length);
			console.log($("#client-count"));
			$("#client-count").html("현재 접속자 "+(clients.length-1));
			$.each(clients,function(i,item){
				if(item!=""){
					console.log(item);
					let li=$("<li>").html(item);
					li.click(function(){
						$("#clients>li").css("backgroundColor","white");
						$(this).css("backgroundColor","lightgray");
						receiver=$(this).text();
					});
					i==0?$("#clients").html(li):$("#clients").append(li);
				}
			});
		}
		function infoMessage(msg){
			$("#msg-container").append("<h3>"+msg.msg+"</h3>");
		}
		function addMessage(msg){
			$("#msg-container").append("<p>"+msg.sender+" : "+msg.msg+"</p>");
		}
		function SocketMessage(type,sender,receiver,msg){
			this.type=type;
			this.sender=sender;
			this.receiver=receiver;
			this.msg=msg;
		}
		$(function(){
			$("#sendBtn").click(function(){
				const msg=$("#msg").val();
				if(msg.trim().length==0){
					alert("전송할 내용이 없습니다.");
					return;
				}else{
					websocket.send(JSON.stringify(new SocketMessage("msg","${loginMember.userId}",receiver,msg)));
					$("#clients>li").css("backgroundColor","white");
					receiver="";					
				}
			});
		});
		
		
		
		
		
	</script>
</body>
</html>




