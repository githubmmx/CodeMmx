function buy_direct(e, t, o, n, l, r, a, d, i, _, c) {
	var u = 0,
		s = ProductOptionColor = ProductOptionColorCode = "",
		m = "",
		p = "",
		v = 0,
		g = "",
		f = 0
	if("View_Box" == d && !e) return void alert("구매하실 제품을 선택을 해주세요")
	if(534026 == e && $("#last_659482").val()) {
		var y = (document.global_form.add_ProductNo.value, $(".last_659482").val()),
			P = $(".last_ea1").val()
		if(y > P) return void alert("천원으로 1.5TB로 업그레이드 옵션은 본품 수량만큼만 추가 가능합니다.")
	}
	if(null != document.getElementById("last_ea1") && document.getElementById("last_ea1").value) var h = document.getElementById("last_ea1").value,
		I = h.split(","),
		u = I[0]
	if(u > 0 && (o = u), "행사" != t && "N" == r) return alert("해당 제품은 로그인 후 구매 하실 수 있습니다. (한정판매)"), void login()
	if("행사" == t && "N" == r) return alert("행사 제품은 로그인 후 구매 하실 수 있습니다."), void login()
	if(0 != r && +o > +r) return void alert("해당 제품은 일일 구매개수가 " + r + "개로 한정되어 있습니다.")
	var E = "Y"
	if("옵션" == t && (E = ""), "BuyList" == d) {
		for(var w = 0, b = e, x = 0; b > x; x++)
			for(var N = document.getElementById("AddGroupCount_" + x).value, B = 0; N > B; B++) 1 == document.getElementById("GroupNo_" + x + "_" + B).checked && (ProductOption_one = document.getElementById("GroupNo_" + x + "_" + B).value + "|", ProductOptionea_tow = document.getElementById("GroupProductea_" + x + "_" + B).value + "|", 0 == w ? (e = ProductOption_one, o = ProductOptionea_tow) : (s += ProductOption_one, m += ProductOptionea_tow), w++)
		if(w > 0 && (t = "묶음", p = "&OptionCnt=" + w + "&ProductOption=" + s + "&ProductOptionea=" + m), 0 == w) return void alert("구매하실 제품을 선택해주세요")
	}
	if("ProductList" == d) {
		var C = v,
			O = !1,
			k = e,
			N = 0
		if(f = document.getElementById("AddGroupCount_" + i).value, f > 1) {
			for(var x = 0; f > x; x++) 1 == document.getElementById("GroupNo_" + i + "_" + x).checked && (0 == N ? (e = document.getElementById("GroupNo_" + i + "_" + x).value, o = document.getElementById("GroupProductea_" + i + "_" + x).value) : (s += document.getElementById("GroupNo_" + i + "_" + x).value + "|", m += document.getElementById("GroupProductea_" + i + "_" + x).value + "|", C++, O = !0), N++)
			if(1 == O && (p = "&OptionCnt=" + C + "&ProductOption=" + s + "&ProductOptionea=" + m + "&GroupState=" + E, t = "묶음", l = "basket_insert_direct" == l || "option_insert_direct" == l || "option_insert_direct2" == l || "basket_insert_direct2" == l ? "option_insert_direct" : "option_insert"), 0 == N) return void alert("구매 하실 품목을 선택 해주세요")
		} else o = document.getElementById("GroupProductea_" + i + "_0").value
	}
	if("p_new_list" == d && void 0 != document.getElementById("GroupProductCnt_" + i)) {
		var S = document.getElementById("GroupProductCnt_" + i).value,
			C = e = o = 0
		for(x = 0; S > x; x++) void 0 != document.getElementById("SelGroupProductNo_" + i + "_" + x) && document.getElementById("SelGroupProductNo_" + i + "_" + x).checked && (e ? (s += document.getElementById("SelGroupProductNo_" + i + "_" + x).value + "|", m += document.getElementById("SelGroupProductEa_" + i + "_" + x).value + "|") : (e = document.getElementById("SelGroupProductNo_" + i + "_" + x).value, o = document.getElementById("SelGroupProductEa_" + i + "_" + x).value), C++)
		if(C || void 0 != document.getElementById("SelGroupProductNo_" + i) && null != document.querySelector("#SelGroupProductNo_" + i).getAttribute("ProductNo") && (e = document.querySelector("#SelGroupProductNo_" + i).getAttribute("ProductNo"), o = 1, C++), 0 == C) return void alert("구매하실 상품을 선택해 주세요.")
		C--, C && (p = "&OptionCnt=" + C + "&ProductOption=" + s + "&ProductOptionea=" + m + "&GroupState=" + E, t = "묶음", l = "basket_insert_direct" == l || "option_insert_direct" == l || "basket_insert_direct2" == l ? "option_insert_direct" : "option_insert")
	}
	var f = 0
	if("ProductView" == d || "옵션" == t || "행사" == t || "일반" == t || "기획전" == t) {
		var C = v,
			O = !1,
			k = e,
			N = 0
		if(null != document.getElementById("AddPGNoCount") && 0 < document.getElementById("AddPGNoCount").value)
			if(f = document.getElementById("AddPGNoCount").value, void 0 == document.global_form.add_PGNo_ProductNo) {
				if("ProductView" == d) return void alert("구매하실 상품을 선택해주세요")
			} else {
				f = void 0 == document.global_form.add_PGNo_ProductNo.length ? "1" : document.global_form.add_PGNo_ProductNo.length
				var G = ""
				if(f > 0) {
					for(var x = 0; f > x; x++) {
						var T = "N"
						k = void 0 == document.global_form.add_PGNo_ProductNo.length ? document.global_form.add_PGNo_ProductNo.value : document.global_form.add_PGNo_ProductNo[x].value, -1 != k.indexOf("_") && (T = k, tmp_Group_ProductNo = k.split("_"), k = tmp_Group_ProductNo[0]), 0 == N && "ProductView" == d ? (e = k, "N" != T ? (o = $(".last_" + T).val(), g = $("#select_opt_value_" + T).val(), F = $("#select_last_option_no_" + T).val(), $("#select_last_option_minea_" + T).val() > 0 && o < parseInt($("#select_last_option_minea_" + T).val()) && (G && (G += "\n\n"), G += $("#optionProductName_" + T).val() + " / [" + $("#select_opt_value_" + T).val() + "]은 최소 " + $("#select_last_option_minea_" + T).val() + "개 부터 구매 가능합니다."), $("#select_last_option_maxea_" + T).val() > 0 && o > parseInt($("#select_last_option_maxea_" + T).val()) && (G && (G += "\n\n"), G += $("#optionProductName_" + T).val() + " / [" + $("#select_opt_value_" + T).val() + "]은 최대 " + $("#select_last_option_maxea_" + T).val() + "개 까지 구매 가능합니다.")) : (o = $(".last_" + k).val(), g = "", F = ""), X = o) : (s += k + "|", "N" != T ? (o = $(".last_" + T).val(), ProductOptionColor += $("#select_opt_value_" + T).val() + "|", ProductOptionColorCode += $("#select_last_option_no_" + T).val() + "|", $("#select_last_option_minea_" + T).val() > 0 && o < parseInt($("#select_last_option_minea_" + T).val()) && (G && (G += "\n\n"), G += $("#optionProductName_" + T).val() + " / [" + $("#select_opt_value_" + T).val() + "]은 최소 " + $("#select_last_option_minea_" + T).val() + "개 부터 구매 가능합니다."), $("#select_last_option_maxea_" + T).val() > 0 && o > parseInt($("#select_last_option_maxea_" + T).val()) && (G && (G += "\n\n"), G += $("#optionProductName_" + T).val() + " / [" + $("#select_opt_value_" + T).val() + "]은 최대 " + $("#select_last_option_maxea_" + T).val() + "개 까지 구매 가능합니다.")) : (o = $(".last_" + k).val(), ProductOptionColor += "|", ProductOptionColorCode += "|"), m += o + "|"), C++, O = !0, N++
					}
					if("Y" == L) return
					if(1 == O && (p = "&OptionCnt=" + C + "&ProductOption=" + s + "&ProductOptionea=" + m + "&ProductOptionColor=" + ProductOptionColor + "&GroupState=" + E + "&ProductOptionColorCode=" + ProductOptionColorCode, t = "묶음", "basket_insert_direct" == l || "option_insert_direct" == l || "option_insert_direct2" == l || "basket_insert_direct2" == l ? l = "option_insert_direct" : "event_insert" == l || "event_call_insert" == l ? t = "행사" : l = "option_insert"), 0 == N) return void alert("구매 하실 품목을 선택 해주세요")
				} else o = document.getElementById("GroupProductea_" + e + "_0").value
			}
		if(null != document.getElementById("AddGroupCount"))
			if(f = document.getElementById("AddGroupCount").value, void 0 == document.global_form.add_ProductNo);
			else {
				if(void 0 == document.global_form.add_ProductNo.length) var f = "1"
				else var f = document.global_form.add_ProductNo.length
				var L = ""
				if(f > 0) {
					for(var x = 0; f > x; x++) {
						var T = "N"
						k = void 0 == document.global_form.add_ProductNo.length ? document.global_form.add_ProductNo.value : document.global_form.add_ProductNo[x].value, -1 != k.indexOf("_") && (T = k, tmp_Group_ProductNo = k.split("_"), k = tmp_Group_ProductNo[0]), 0 == N && "ProductView" == d ? (e = k, o = document.getElementById("last_" + k).value) : (s += k + "|", "N" != T ? (m += $(".last_" + T).val() + "|", ProductOptionColor += $("#select_opt_value_" + T).val() + "|", ProductOptionColorCode += $("#select_last_option_no_" + T).val() + "|", $("#select_last_option_minea_" + T).val() > 0 && m < parseInt($("#select_last_option_minea_" + T).val()) && (G && (G += "\n\n"), G += $("#optionProductName_" + T).val() + " / [" + $("#select_opt_value_" + T).val() + "]은 최소 " + $("#select_last_option_minea_" + T).val() + "개 부터 구매 가능합니다."), $("#select_last_option_maxea_" + T).val() > 0 && m > parseInt($("#select_last_option_maxea_" + T).val()) && (G && (G += "\n\n"), G += $("#optionProductName_" + T).val() + " / [" + $("#select_opt_value_" + T).val() + "]은 최대 " + $("#select_last_option_maxea_" + T).val() + "개 까지 구매 가능합니다.")) : (m += document.getElementById("last_" + k).value + "|", ProductOptionColor += "|", ProductOptionColorCode += "|"), C++, O = !0), N++
					}
					if("Y" == L) return
					if(1 == O && (p = "&OptionCnt=" + C + "&ProductOption=" + s + "&ProductOptionea=" + m + "&ProductOptionColor=" + ProductOptionColor + "&GroupState=" + E + "&ProductOptionColorCode=" + ProductOptionColorCode, t = "묶음", "basket_insert_direct" == l || "option_insert_direct" == l || "option_insert_direct2" == l || "basket_insert_direct2" == l ? l = "option_insert_direct" : "event_insert" == l || "event_call_insert" == l ? t = "행사" : l = "option_insert"), 0 == N) return void alert("구매 하실 품목을 선택 해주세요")
				} else o = document.getElementById("GroupProductea_" + e + "_0").value
			}
	}
	if(G) return alert(G), !1
	if(null != document.getElementById("AddInkTonerCount") && document.getElementById("AddInkTonerCount").value > 0) {
		for(var A = v, j = !1, D = 0; D < document.getElementById("AddInkTonerCount").value; D++) 1 == document.getElementById("InkToner_" + D).checked && (s += document.getElementById("InkToner_" + D).value + "|", m += "1|", A++, j = !0)
		1 == j && (p = "&OptionCnt=" + A + "&ProductOption=" + s + "&ProductOptionea=" + m + "&GroupState=" + E, t = "옵션", l = "basket_insert_direct" == l || "option_insert_direct" == l || "basket_insert_direct2" == l ? "option_insert_direct" : "option_insert")
	}
	if(("basket_insert_direct" == l || "basket_insert_direct2" == l) && "basket_insert_direct2" == l)
		if("prvcmp" == _) {
			var Y = document.getElementById("DeliveryTime_txt").value.split("~")
			alert("해당 제품은 공급업체 직발송 /별도배송 제품입니다.\n이 제품은 다른 제품과 별도 배송되며 결제 후 " + Y[1] + "일 내에 배송 출발합니다."), l = "basket_insert_direct"
		} else alert("해당 제품은 공급업체 직발송 /별도배송 제품입니다.\n이 제품은 다른 제품과 별도 배송되며 배송기간이 2~5일 소요됩니다."), l = "basket_insert_direct"
	if(("option_insert_direct" == l || "option_insert_direct2" == l) && "option_insert_direct2" == l)
		if("prvcmp" == _) {
			var Y = document.getElementById("DeliveryTime_txt").value.split("~")
			alert("해당 제품은 공급업체 직발송 /별도배송 제품입니다.\n이 제품은 다른 제품과 별도 배송되며 결제 후 " + Y[1] + "일 내에 배송 출발합니다."), l = "option_insert_direct"
		} else alert("해당 제품은 공급업체 직발송 /별도배송 제품입니다.\n이 제품은 다른 제품과 별도 배송되며 배송기간이 2~5일 소요됩니다."), l = "option_insert_direct"
	if(window.sessionStorage && window.history && window.history.pushState) {
		var M = document.location.href
		if(-1 != M.indexOf("product_list.htm") || -1 != M.indexOf("search.htm") || -1 != M.indexOf("eventzone_view.htm")) {
			-1 != M.indexOf("product_list.htm") ? (window.sessionStorage.setItem("sessList", $(".product_list_wrap").html()), window.sessionStorage.setItem("sessStartNum", $("#StartNum").val()), window.sessionStorage.setItem("sessPageNum", $("#PageNum").val())) : -1 != M.indexOf("eventzone_view.htm") ? (window.sessionStorage.setItem("sessEvtList", $("#prd_list").html()), window.sessionStorage.setItem("sessPageIdx", $("#DefPageNo").val()), window.sessionStorage.setItem("EventNo", $("#EventNo").val())) : (window.sessionStorage.setItem("sessSchDivSearch", $("#DivSearchOpt").html()), window.sessionStorage.setItem("sessSchDivOpt", $("#div_opt").html()), window.sessionStorage.setItem("sessSchCateList", $("#search_cateList").html()), window.sessionStorage.setItem("sessStartNum", $("#StartNum").val()), window.sessionStorage.setItem("sessPageNum", $("#PageNum").val()))
			var V = Math.floor((new Date).getTime() / 1e3) + 600
			M.indexOf("sessStrgExp") <= 0 && (-1 != M.indexOf("#") ? M = M.replace(/#/gi, "&sessStrgExp=" + V + "#") : M += (M.split("?")[1] ? "&" : "?") + "sessStrgExp=" + V, window.history.pushState(null, null, M))
		}
	}
	if(n > 0 && !g && !ProductOptionColor) {
		if(!$("#seleted_option_no").val()) return alert("지금 선택하신 제품은 옵션상품입니다."), void("prlist" == _ && (location.href = "../product/product_detail.htm?ProductNo=" + e))
		var z = $("#seleted_option_no").val().split("/"),
			X = "",
			F = "",
			q = "",
			R = ""
		if(z.forEach(function(t, o) {
				if($(".write_option_name_" + e + "_" + t).length) {
					var n = $(".write_option_name_" + e + "_" + t).val()
					if(!n) return q = "Y", !1
				}
				parseInt($(".optionMinEa_" + e + "_" + t).val()) > 0 && parseInt($(".optionMinEa_" + e + "_" + t).val()) > parseInt($(".last_ea_" + e + "_" + t).val()) && (R && (R += "\n\n"), R += $("#optionProductName_" + e + "_" + t).val() + " 은 최소 " + $(".optionMinEa_" + e + "_" + t).val() + "개 부터 구매가능합니다."), parseInt($(".optionMaxEa_" + e + "_" + t).val()) > 0 && parseInt($(".optionMaxEa_" + e + "_" + t).val()) < parseInt($(".last_ea_" + e + "_" + t).val()) && (R && (R += "\n\n"), R += $("#optionProductName_" + e + "_" + t).val() + " 은 최대 " + $(".optionMaxEa_" + e + "_" + t).val() + "개 까지 구매가능합니다."), g ? (g += "|-_-|" + $("#selected_option_name_" + e + "_" + t).val(), n && (g += "/" + n), F += "|-_-|" + t, X += "|-_-|" + $("#last_ea_" + e + "_" + t).val()) : (g = $("#selected_option_name_" + e + "_" + t).val(), n && (g += "/" + n), F = t, X = $("#last_ea_" + e + "_" + t).val())
			}), "Y" == q) return alert("작성형 옵션을 입력해주세요"), !1
		if(R) return alert(R), !1
	}
	if(null != document.getElementById("use_coupon")) var U = document.getElementById("use_coupon").value
	else var U = ""
	var W = ""
	null != document.getElementById("DeliveryPriceType") && (W = document.getElementById("DeliveryPriceType").value)
	var H = "../order/order_function.php?actype=" + l + "&from_where=" + t + "&cProductNo=" + e + "&cProductEa=" + o + "&cColor=" + encodeURIComponent(g) + "&cColorEa=" + X + "&cColorNo=" + F + "&cUseCoupon=" + U + p + "&InputPage=" + _ + "&DeliveryPriceType=" + W
	if(y && (H += "&tenThousandEvtCnt=" + y), "일반" == t || "기획전" == t)
		if("basket_insert_detail" == l) window.open(H, "", "width=1,height=1")
		else if("option_insert_direct" == l) window.open(H, "", "width=1200,height=1000,scrollbars=yes")
	else if(null != document.getElementById("common_iframe"))
		if("basket_insert_detail2" == l)
			if("partsView_Box" == d) document.getElementById("common_iframe").src = H + "&isPage=" + document.getElementById("isPagePartSpec").value + "&orderlayer_parts_x=" + document.getElementById("orderlayer_parts_x").value + "&orderlayer_parts_y=" + document.getElementById("orderlayer_parts_y").value
			else if("iwView_Box" == d) document.getElementById("common_iframe").src = H + "&isPage=" + document.getElementById("isPageIwSpec").value + "&orderlayer_iworks_x=" + document.getElementById("orderlayer_iworks_x").value + "&orderlayer_iworks_y=" + document.getElementById("orderlayer_iworks_y").value
	else if("main" == d) H = H + "&isPage=" + d, document.getElementById("common_iframe").src = H
	else {
		var J = 150,
			K = J / 2,
			Q = document.documentElement.scrollTop,
			Z = document.documentElement.scrollLeft
		0 == Q && (Q = document.body.scrollTop), 0 == Z && (Z = document.body.scrollLeft), document.global_form.orderlayery.value = a.clientY + Q - K - 90 + "px", document.global_form.orderlayerx.value = a.clientX + Z - 270 + "px", document.getElementById("common_iframe").src = H
	} else if("basket_insert_detail3" == l) {
		var J = 150,
			K = J / 2,
			Q = document.documentElement.scrollTop,
			Z = document.documentElement.scrollLeft
		0 == Q && (Q = document.body.scrollTop), 0 == Z && (Z = document.body.scrollLeft), document.global_form.orderlayery.value = a.clientY + Q - K - 90 + "px", document.global_form.orderlayerx.value = a.clientX + Z - 270 + "px", document.getElementById("common_iframe").src = H
	} else document.location.href = H
	else document.location.href = H
	else if("행사" == t) {
		if("event_insert" != l) {
			var H = "../order/order_function.php?actype=event_call_insert&event_sale_no=" + e + p + "&cColor=" + g + "&InputPage=" + _ + "&cProductEa=" + o
			return void(document.location.href = H)
		}
		var J = 150,
			K = J / 2,
			Q = document.documentElement.scrollTop,
			Z = document.documentElement.scrollLeft
		0 == Q && (Q = document.body.scrollTop), 0 == Z && (Z = document.body.scrollLeft), document.global_form.orderlayerx.value = a.clientY + Q - K - 90 + "px", document.global_form.orderlayery.value = a.clientX + Z - 270 + "px"
		var ee = "&cColor=" + g + "&EventSaleReturnBack="
		document.getElementById("common_iframe").src = H + "&event_sale_no=" + e + ee
	} else if("팝업" == t) document.location.href = H + "&after=opener"
	else if("옵션" == t || "묶음" == t)
		if("option_insert_direct" == l) document.location.href = H
		else if(null != document.getElementById("common_iframe")) {
		var J = 150,
			K = J / 2,
			Q = document.documentElement.scrollTop,
			Z = document.documentElement.scrollLeft
		0 == Q && (Q = document.body.scrollTop), 0 == Z && (Z = document.body.scrollLeft), document.global_form.orderlayerx.value = a.clientY + Q - K - 90 + "px", document.global_form.orderlayery.value = a.clientX + Z - 170 + "px", document.getElementById("common_iframe").src = H
	} else document.location.href = H
}

function detail_show(e) {
	var t = parseInt(e)
	t > 0 ? (where_go = "../product/product_detail.htm?ProductNo=" + e + "&opt_chk=Y", window_open(where_go, 1440, 700, "scrollbars=yes,resizable=yes", "")) : alert("제품번호가 정확하지 않습니다!")
}

function detail_show_group(e) {
	var t = parseInt(e)
	t > 0 ? (where_go = "http://www.compuzone.co.kr/pop_page/product_simple_detail.htm?ProductNo=" + e, window_open(where_go, 780, 500, "scrollbars=yes", "")) : alert("제품번호가 정확하지 않습니다!")
}

function detail_show_loop(form_name, num, ele_name) {
	var pre_product_no = eval("document." + form_name + '.elements["' + ele_name + '"][' + num + "].value"),
		split_value = pre_product_no.split("|"),
		product_no = split_value[0]
	detail_show(product_no)
}

function check_all(obj, ele_name) {
	if(void 0 != eval('obj.elements["' + ele_name + '"]')) {
		var len = eval('obj.elements["' + ele_name + '"].length')
		if(void 0 == len) eval('obj.elements["' + ele_name + '"].checked = !obj.elements["' + ele_name + '"].checked')
		else
			for(var i = 0; len > i; i++) eval('obj.elements["' + ele_name + '"][' + i + '].checked = !obj.elements["' + ele_name + '"][' + i + "].checked")
	}
}

function now_allow_adult_layer() {
	var e = '<div id="error_layer" style="z-index:9999;width:778px; padding:20px; height:200px; background-color:#f9f9f9; border:1px solid #e6e6e6; margin:0 auto; border-top:none; display:none;">'
	e += ' <div class="Wbox" style="width:778px; height:auto; border:1px solid #e6e6e6; float:left; background-color:#FFF; padding:10px 0 30px 0;">', e += ' 	<div class="tit" style="width:486px; height:100px; float:left; margin:5px 146px;">', e += " 		<div class='mbr3' style='width:486px; height:100px; background:url(\"https://www.compuzone.co.kr/login_main/img/2013_login.jpg\") no-repeat -477px -1029px; display:block; text-indent:-10000px; margin:15px 0;'>죄송합니다</div>", e += " 	</div>", e += ' 	<div class="okbtn" style="width:778px; height:26px; float:left; margin-top:20px;">', e += " 		<a href='javascript:void(0);' onclick='mov_link(\"../main/main.htm\");'>", e += " 			<div class='btn' style='display:block; width:58px; height:26px; background:url(\"../login_main/img/2013_login.jpg\") no-repeat -259px 0px; margin:0 auto; float:left; margin:0 360px; text-indent:-10000px;'>확인</div>", e += " 		</a>", e += " 	</div>", e += " </div>", e += "</div>"
	var t = $(e)
	$("body").prepend(t)
	var o = document.documentElement && document.documentElement.scrollTop || document.body.scrollTop,
		n = document.documentElement && document.documentElement.scrollLeft || document.body.scrollLeft,
		l = document.body.clientHeight / 2 - $("#error_layer").height() / 2 + o,
		r = document.body.clientWidth / 2 - $("#error_layer").width() / 2 + n
	$("#error_layer").css({
		position: "absolute",
		top: l,
		left: r
	}).show()
}

function mov_link(e) {
	document.location.href = e
}