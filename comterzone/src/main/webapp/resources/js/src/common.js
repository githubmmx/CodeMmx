function NumberFormat(e) {
	var t = 0,
		n = ""
	for(0 > e ? (n = "" + -1 * parseInt(e), t = ("" + -1 * parseInt(e)).length) : (n = "" + e, t = ("" + e).length); t > 0 && (t -= 3, !(0 >= t));) n = n.substring(0, t) + "," + n.substring(t, n.length)
	return 0 > e && (n = "-" + n), n
}

function NotNumberFormat(e) {
	for(var e = "" + e, t = e.split(","), n = "", o = 0; o <= t.length - 1; o++) n += t[o]
	return n
}

function window_open(e, t, n, o, i) {
	iXPos = (window.screen.width - t) / 2, iYPos = (window.screen.height - n) / 2, child_win = "0" == t && "0" == n ? i ? window.open(e, i) : window.open(e, "ChildWin") : i ? window.open(e, i, "width=" + t + ",height=" + n + "," + o + ", left=" + iXPos + ", top=" + iYPos) : window.open(e, "", "width=" + t + ",height=" + n + "," + o + ", left=" + iXPos + ", top=" + iYPos)
}

function window_open_form(e, t, n, o, i, a) {
	iXPos = (window.screen.width - n) / 2, iYPos = (window.screen.height - o) / 2, child_win_form = a ? window.open("about:blank", a, "width=" + n + ",height=" + o + "," + i + ", left=" + iXPos + ", top=" + iYPos) : window.open("about:blank", "", "width=" + n + ",height=" + o + "," + i + ", left=" + iXPos + ", top=" + iYPos), e.target = a, e.action = t, e.submit()
}

function checkNull(e, t) {
	var n = e.value,
		o = n.replace(/(^\s*)|(\s*$)/gi, "")
	return "" == o || null == o ? (alert(t + "을(를) 입력해주세요"), e.focus(), !1) : !0
}

function keyCheck(e) {
	var t = event.keyCode
	return t >= 48 && 57 >= t || 13 == t ? !0 : !1
}

function Trim(e) {
	for(; - 1 != e.indexOf(" ");) e = e.replace(" ", "")
	return e
}

function Exists(e, t) {
	return Trim(e.value) ? !0 : (alert(t + "을(를) 입력해주세요"), e.focus(), !1)
}

function errChar(e) {
	if(e >= "0" && "9" >= e) return !1
	if(e >= "a" && "z" >= e) return !1
	if(e >= "A" && "Z" >= e) return !1
	var t = escape(e)
	if(6 == t.length) {
		var n = t.substring(1, 6)
		if(n >= "uA000" && "uDFFFF" >= n) return !1
	}
	return !0
}

function errStandard(e) {
	for(var t, n = 0; n < e.length; n++)
		if(t = e.substring(n, n + 1), errChar(t)) return !0
	return !1
}

function CheckExceptString(e) {
	var t = /[`!@#$%^&*(){}\[\]_=+;:\'\"|\\,?]/gi,
		n = !0
	if(e) {
		var o = e.split(",")
		for(idcount = o.length, i = 0; i < idcount; i++)
			if(null != document.getElementById(o[i])) {
				var a = document.getElementById(o[i]).value
				if(t.test(a)) {
					alert("특수문자는 입력할 수 없습니다."), n = !1
					break
				}
			}
	}
	return n
}

function IsEngNum(e) {
	if(!Trim(e.value)) return !1
	var t, n
	for(t = 0; t < Byte(e.value); t++)
		if(n = e.value.charAt(t), !(n >= 0 && 9 >= n || n >= "a" && "z" >= n || n >= "A" && "Z" >= n)) return !1
	return !0
}

function IsNum(e) {
	if(!Trim(e.value)) return !1
	var t, n
	for(t = 0; t < Byte(e.value); t++)
		if(n = e.value.charAt(t), !(n >= 0 && 9 >= n)) return !1
	return !0
}

function Byte(e) {
	var t, n = 0
	for(t = 0; t < e.length; t++) val = escape(e.charAt(t)).length, 6 == val && n++, n++
		return n
}

function GotoPageNum(e, t, n) {
	var o = e.goToPageNum.value
	o = +parseInt(o), o = Math.abs(o), o || (o = 1), o > n && (o = n)
	var i = (o - 1) * t
	e.PageNum.value = o, e.StartNum.value = i, e.target = "", e.submit()
}

function GotoPage(e, t, n) {
	e.PageNum.value = Math.abs(parseInt(t)), e.StartNum.value = Math.abs(parseInt(n)), e.target = "", e.submit()
}

function GotoPageScript(e, t, n) {
	document.getElementById("PageNum").value = Math.abs(parseInt(t)), document.getElementById("StartNum").value = Math.abs(parseInt(n)), e()
}

function GotoPageTarget(e, t, n, o) {
	e.PageNum.value = Math.abs(parseInt(t)), e.StartNum.value = Math.abs(parseInt(n)), e.action = o, e.target = "", e.submit()
}

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

function login_nonmember() {
	var e = ""
	e = ".." + location.pathname + location.search, "/member/member_join.htm" == location.pathname || "/mypage/consult_list_nomember.htm" == location.pathname ? e = "" : "/online/online_main.htm" == location.pathname && (e = "../online/online_main.htm")
	var t = e,
		n = ""
	n = "www3.compuzone.co.kr" == window.location.host || "m3.compuzone.co.kr" == window.location.host ? "http://" + window.location.host + "/login/login.htm" : "cozmanager.compuzone.co.kr" == window.location.host || "m.compuzone.co.kr" == window.location.host ? "https://" + window.location.host + "/login/login.htm" : "https://www.compuzone.co.kr/login/login.htm"
	var o = document.createElement("form")
	o.setAttribute("method", "POST"), o.setAttribute("action", n), document.body.appendChild(o)
	var i = document.createElement("input")
	i.setAttribute("type", "hidden"), i.setAttribute("name", "base"), i.setAttribute("value", t), o.appendChild(i), o.submit()
}

function login_page() {
	var e = ""
	e = ".." + location.pathname + location.search, "/member/member_join.htm" == location.pathname || "/mypage/consult_list_nomember.htm" == location.pathname ? e = "" : "/online/online_main.htm" == location.pathname && (e = "../online/online_main.htm")
	var t = e,
		n = ""
	n = "www3.compuzone.co.kr" == window.location.host || "m3.compuzone.co.kr" == window.location.host ? "http://" + window.location.host + "/login/login.htm" : "cozmanager.compuzone.co.kr" == window.location.host || "m.compuzone.co.kr" == window.location.host ? "https://" + window.location.host + "/login/login.htm" : "https://www.compuzone.co.kr/login/login.htm"
	var o = document.createElement("form")
	o.setAttribute("method", "POST"), o.setAttribute("action", n), document.body.appendChild(o)
	var i = document.createElement("input")
	i.setAttribute("type", "hidden"), i.setAttribute("name", "base"), i.setAttribute("value", t), o.appendChild(i), o.submit()
}

//function common_smspop(e, t) {
//	if("www3.compuzone.co.kr" != window.location.host) var n = window.location.hostname,
//		o = "https://" + n,
//		i = o + "/mypage/mypage_staff.htm",
//		a = o + "/include/charger_smsPop.htm?Staff_Name=" + e
//	else var i = "../mypage/mypage_staff.htm",
//		a = "../include/charger_smsPop.htm?Staff_Name=" + e "n" == e ? (alert("회원전용 서비스입니다."), "" == t && login()) : "" == e ? (alert("담당자가 없습니다. 담당자를 선택해주세요."), document.location.href = i) : t ? window_open(a + "&mypage_as=" + t, 350, 643, "scrollbars=yes,resizable=yes", "Csms") : window_open(a, 350, 643, "scrollbars=yes,resizable=yes", "Csms")
//}

function multi_check(e) {
	var t, n = ""
	if(null != e.length)
		for(t = 0; t < e.length; t++) e[t].checked && (n = n + e[t].value + ",")
	else 1 == e.checked && (n = e.value)
	return "" == n ? n : (-1 != n.lastIndexOf(",") && (n = n.substr(0, n.lastIndexOf(","))), n)
}

function checkbox_all_check(bChecked, form_name, ele_name) {
	if(void 0 != eval("document." + form_name + '.elements["' + ele_name + '"]')) {
		var checkbox_ea = eval("document." + form_name + '.elements["' + ele_name + '"].length')
		if(void 0 == checkbox_ea)
			if(checkbox_ea = 1, bChecked)
				for(var i = 0; checkbox_ea > i; i++) eval("document." + form_name + '.elements["' + ele_name + '"].checked=true')
			else
				for(var i = 0; checkbox_ea > i; i++) eval("document." + form_name + '.elements["' + ele_name + '"].checked=false')
		else if(bChecked)
			for(var i = 0; checkbox_ea > i; i++) eval("document." + form_name + '.elements["' + ele_name + '"][' + i + "].checked=true")
		else
			for(var i = 0; checkbox_ea > i; i++) eval("document." + form_name + '.elements["' + ele_name + '"][' + i + "].checked=false")
	}
}

function AllCheckBox(f, AllCheckBoxName, CheckBoxName) {
	if(void 0 != eval("f." + CheckBoxName))
		if(void 0 == eval("f." + CheckBoxName + ".length") ? CheckBoxLength = 1 : CheckBoxLength = eval("f." + CheckBoxName + ".length"), 0 == eval("f." + AllCheckBoxName + ".checked") ? CheckType = !1 : CheckType = !0, CheckBoxLength > 1)
			for(i = 0; i < CheckBoxLength; i++) eval("f." + CheckBoxName + "[i].checked = " + CheckType)
		else eval("f." + CheckBoxName + ".checked = " + CheckType)
}

function disp_div_show(e, t, n) {
	help_divwid = parseInt(document.getElementById(e).style.width, 10), document.body.clientWidth > help_divwid + t + 15 ? (document.getElementById(e).style.left = parseInt(document.documentElement.scrollLeft) + parseInt(t) + 10 + "px", document.getElementById(e).style.top = parseInt(document.documentElement.scrollTop) + parseInt(document.body.scrollTop) + parseInt(n) + "px") : (document.getElementById(e).style.left = parseInt(document.documentElement.scrollLeft) + parseInt(t) - (parseInt(help_divwid) + 10) + "px", document.getElementById(e).style.top = parseInt(document.documentElement.scrollTop) + parseInt(n) + "px"), document.getElementById(e).style.visibility = "visible"
}

function disp_div_hide(e) {
	document.getElementById(e).style.visibility = "hidden"
}

function SearchStaffPop(e, t) {
	window_open("../pop_page/staff_search.htm?selectName=" + e + "&formName=" + t, 180, 200, "scrollbars=yes", "searchStaff")
}

function SearchStaffPopID(e) {
	window_open("../pop_page/staff_search2.htm?elementid=" + e, 180, 200, "scrollbars=yes", "searchStaff2")
}

function SearchMakerPop(e, t, n) {
	window_open("../pop_page/maker_search.htm?formName=" + e + "&selectNo_Name=" + t + "&selectName_Name=" + n, 250, 500, "scrollbars=yes", "searchMakerPop")
}

function SearchOnePop(e, t) {
	window_open("../m_common/id_search.htm?selectName=" + e + "&formName=" + t, 180, 200, "scrollbars=yes", "searchID")
}

function win_calendar(e, t, n, o, i, a, r, c) {
	c || (c = "left=50, top=50, width=240, height=230, scrollbars=0,status=0,resizable=0"), window_open("../calender/calendar.skin.php?fld=" + e + "&fld2=" + t + "&fld3=" + n + "&cur_date=" + o + i + a + "&delimiter=" + r, 200, 230, "", "winCalendar")
}

function popupCenter() {
	if(document.layers) var e = screen.width / 2 - outerWidth / 2,
		t = screen.height / 2 - outerHeight / 2
	else var e = screen.width / 2 - document.body.offsetWidth / 2,
		t = -75 + screen.height / 2 - document.body.offsetHeight / 2
	self.moveTo(e, t)
}

function LayerCenterOpen(e, t, n) {
	var o = t.body.clientHeight / 2 - (e.height() / 2 + t.body.scrollTop),
		i = t.body.clientWidth / 2 - (e.width() / 2 + t.body.scrollLeft)
	e.css({
		display: "block",
		top: o - n,
		left: i
	}).fadeIn()
}

function wrapWindowByMask(e, t, n) {
	var o = $(t).height(),
		i = $(n).width()
	e.css({
		width: i,
		height: o,
		display: "block",
		opacity: "0.8"
	})
}

function TrimTo(e) {
	return e.replace(/^\s\s*/, "").replace(/\s\s*$/, "")
}

function PopupAutoResize() {
	window.resizeTo(100, 100)
	var e = parseInt(document.body.scrollWidth),
		t = parseInt(document.body.scrollHeight),
		n = screen.width - 50,
		o = screen.height - 50,
		i = 0
	alert(e + "===" + t), navigator.userAgent.indexOf("MSIE 6") > 0 ? i = 60 : navigator.userAgent.indexOf("MSIE 7") > 0 ? i = 80 : navigator.userAgent.indexOf("Firefox") > 0 ? i = 50 : navigator.userAgent.indexOf("Opera") > 0 ? i = 30 : navigator.userAgent.indexOf("Netscape") > 0 ? i = -2 : navigator.userAgent.indexOf("Chrome") > 0 && (i = 20), e > n && (window.document.body.scroll = "yes", e = n), t > o - i && (window.document.body.scroll = "yes", e += 19, t = o - i), window.resizeTo(e + 10, t + i)
}

function jsCutStr(e, t) {
	var n = e,
		o = 0,
		a = e.length,
		r = ""
	for(i = 0; i < a; i++) {
		if(o += chr_byte(e.charAt(i)), o == t - 1) {
			2 == chr_byte(e.charAt(i + 1)) ? (n = e.substring(0, i + 1), r = "...") : (i + 2 != a && (r = "..."), n = e.substring(0, i + 2))
			break
		}
		if(o == t) {
			i + 1 != a && (r = "..."), n = e.substring(0, i + 1)
			break
		}
	}
	return n + r
}

function chr_byte(e) {
	return escape(e).length > 4 ? 2 : 1
}

function toggle(e, t) {
	if(!document.getElementById) return False
	for(i = 1; i <= 10; i++) temp = document.getElementById(e + i), null != temp && (i == t ? temp.style.display = "" : temp.style.display = "none")
}

function checkLastDay(e, t, n, o) {
	var i = document.getElementById(t),
		a = document.getElementById(n)
	if("Y" == o) var r = e,
		c = a.value
	else var r = a.value,
		c = e
	if(void 0 != a && void 0 != i) {
		var l = i.value,
			s = 32 - new Date(r, c - 1, 32).getDate(),
			m = 0
		i.options.length = m
		for(var h = 1; s >= h; h++) m = 10 > h ? "0" + h : h, i.options[i.options.length] = new Option(m, m)
		var d = l > s ? s : l
		i.selectedIndex = d - 1
	}
}

function MM_findObj(e, t) {
	var n, o, i
	for(t || (t = document), (n = e.indexOf("?")) > 0 && parent.frames.length && (t = parent.frames[e.substring(n + 1)].document, e = e.substring(0, n)), !(i = t[e]) && t.all && (i = t.all[e]), o = 0; !i && o < t.forms.length; o++) i = t.forms[o][e]
	for(o = 0; !i && t.layers && o < t.layers.length; o++) i = MM_findObj(e, t.layers[o].document)
	return !i && t.getElementById && (i = t.getElementById(e)), i
}

function MM_showHideLayers() {
	var e, t, n, o = MM_showHideLayers.arguments
	for(e = 0; e < o.length - 2; e += 3) null != (n = MM_findObj(o[e])) && (t = o[e + 2], n.style && (n = n.style, t = "show" == t ? "visible" : "hide" == t ? "hidden" : t), n.visibility = t)
}

function MM_swapImgRestore() {
	var e, t, n = document.MM_sr
	for(e = 0; n && e < n.length && (t = n[e]) && t.oSrc; e++) t.src = t.oSrc
}

function MM_preloadImages() {
	var e = document
	if(e.images) {
		e.MM_p || (e.MM_p = [])
		var t, n = e.MM_p.length,
			o = MM_preloadImages.arguments
		for(t = 0; t < o.length; t++) 0 != o[t].indexOf("#") && (e.MM_p[n] = new Image, e.MM_p[n++].src = o[t])
	}
}

function MM_swapImage() {
	var e, t, n = 0,
		o = MM_swapImage.arguments
	for(document.MM_sr = [], e = 0; e < o.length - 2; e += 3) null != (t = MM_findObj(o[e])) && (document.MM_sr[n++] = t, t.oSrc || (t.oSrc = t.src), t.src = o[e + 2])
}

function open_searchaddress(e, t, n, o, i) {
	window_open("../common/search_address.htm?openerzip1=" + e + "&openerzip2=" + t + "&openertxt1=" + n + "&openertxt2=" + o + "&openerinfo=" + i, 750, 730, "scrollbars=yes", "SchAddr")
}
var child_win = null,
	child_win_form = null