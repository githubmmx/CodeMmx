
function login() {
	var e = ""
	e = ".." + location.pathname + location.search, "/member/member_join.htm" == location.pathname || "/mypage/consult_list_nomember.htm" == location.pathname ? e = "" : "/online/online_main.htm" == location.pathname && (e = "../online/online_main.htm")
	var t = e,
		n = ""
	n = "www3.compuzone.co.kr" == window.location.host || "m3.compuzone.co.kr" == window.location.host ? "http://" + window.location.host + "/login/login.htm" : "https://" + window.location.host + "/login/login.htm", "/event_zone/eventzone_view.htm" == location.pathname && "?EventNo=15149" == location.search && (t += "&target_section=04")
	var o = document.createElement("form")
	o.setAttribute("method", "POST"), o.setAttribute("action", n), document.body.appendChild(o)
	var i = document.createElement("input")
	i.setAttribute("type", "hidden"), i.setAttribute("name", "base"), i.setAttribute("value", t), o.appendChild(i), o.submit()
}