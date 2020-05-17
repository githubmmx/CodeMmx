
	$(document).ready(function(){
		// 카테고리 메뉴 함수 호출 소스 재 사용
		var defCateLyrSrc = $("#defCateBtn").next(".cpz_category_layer").html(); // 기본 메뉴 카테고리
		var fixedCateLyrObj = $("#fixedCateBtn").next(".cpz_category_layer"); // 고정 메뉴 카테고리
		if (typeof fixedCateLyrObj.html() !== "undefined" && fixedCateLyrObj.html().length <= 0) {
			fixedCateLyrObj.html(defCateLyrSrc);
		}

		$(".catebnr_imgbx img").lazyload();
		// use top_body - start
		// 검색폼에 입력
			var target_input = $("#HeadSearchKeyword");
			var tg = target_input.target;

		var chk_short = true;
		//우측 날개윙 초기화
		InitRightWingSize();
		$(document).bind("keydown keyup", function(e) {
			if( $("#top_fix_head").hasClass('on') ){
				target_input = $("#fixedSearchKeyword");
			}else{
				target_input = $("#HeadSearchKeyword");
			}
			var key = (e.keyCode) ? e.keyCode : e.which;
			tg = e.target;
			if (e.type == "keyup") {
				// 검색어
				if (tg.name == "HeadSearchKeyword" || tg.name == "fixedSearchKeyword") {
					var $listItems = $(".search_dropbox").filter(":visible").find("li");
					var $selected = $listItems.filter(".auto_cmp_focus"), $current;

					if (key == 40 || key == 38) {
						// 자동완성 비활성화
//						target_input.autocomplete("option", "disabled", true);

						// 위 아래 key 입력시 검색어 선택
						$listItems.removeClass("auto_cmp_focus");
						if (key == 40) {
							// Down key
							if (!$selected.length || $selected.is(':last-child')) {
								$current = $listItems.eq(0);
							} else {
								$current = $selected.next();
						  }
						} else if (key == 38) {
							// Up key
							if (!$selected.length || $selected.is(':first-child')) {
								$current = $listItems.last();
							} else {
								$current = $selected.prev();
							}
						}
						$current.addClass('auto_cmp_focus');
						target_input.val($current.attr("pm_term"));
					} else if (key == 13) {
						if (typeof ($selected.attr("pm_term")) != "undefined") {
							target_input.val($selected.attr("pm_term"));
							$("#SearchProductKeyEvtNo").val($selected.attr("pm_evt"));
							searchr();
							return false;
						} else {
							searchr();
						}
					} else {
						// 자동완성 활성화
//						target_input.autocomplete("option", "disabled", false);
					}

					if (!target_input.val().length) {
						sch_lyr_cls();
						if (tg.name == "HeadSearchKeyword"){
							$(".jqClsRecentWrap").show();
						}else if(tg.name == "fixedSearchKeyword"){
							$(".jqClsRecentWrapFixed").show();
						}
					}
				}
			}

			if(tg.tagName == "INPUT" ||  tg.tagName == "TEXTAREA") return true;

			var specific = key >= 8 && key <= 46; // backspace ~ delete 등 special key
			if (!specific) specific = key >= 112 && key <= 123; // f1 ~ f12 등 function key
			var mac_commad_key = (navigator.platform.match(/mac|iphone|ipod|ipad/gi)) ? true : false;

			if(e.type == "keydown") {
				if (tg.name == "SearchProductKeyView") clearBg();


				if(specific || (mac_commad_key && (key == 224 || key == 17 || key == 91 || key == 93))) { // 맥 커맨드 키코드
					chk_short = false;
					return true;
				}
				if(!specific && chk_short) {
					target_input.focus().select();
				}
				if(e.ctrlKey && e.keyCode == 86){
					target_input.focus().select();
				}
			} else {
				if(specific) {
					chk_short = true;
				}
			}
		});

		$("input, textarea").bind("blur", function(e) {
			chk_short = true;
		});

		$(document).bind('click', function(e) {
			// 자동 or 수동 클릭 여부
			if (e.originalEvent !== undefined) {
		  	if(!$(e.target).parents(".search_box").length && !$(e.target).parent(".jqClsSchLi").length) {
		  		sch_lyr_cls();
		  	}
		  }
		});

		// 상단 서브메뉴가 존재하는 메뉴 마우스 오버시
		$(".menuCtgr_li").find("a").mouseenter(function(){ $(this).siblings(".menuCtgrLayer").show(); });
		$(".menuCtgrLayer").mouseenter(function(){ $(this).show(); });
		$(".menuCtgr_li").mouseleave(function(){ $(this).find(".menuCtgrLayer").hide(); });

		// 자동완성
		var AutoCompleteResult = StopAutoCompleteValue = "";
		$("#HeadSearchKeyword, #fixedSearchKeyword").autocomplete({
			delay:0,
			source: function (request, response) {
				// 2017-10-19_ne0j0ys_한글 키보드 영문 변환 으로 완성형이 되기 전에 ajax가 끝나기 때문에 지속적인 검색으로 변경함
				// if (!AutoCompleteResult.length && StopAutoCompleteValue && request.term.indexOf(StopAutoCompleteValue)==0 && StopAutoCompleteValue.length <= request.term.length) {
				if (0) {
				}
				else{
					var pm = { "actype" : "getAutoComplete", "SchQuery": request.term };
					$.getJSON("../include/top_ajax_function.php", pm, function(data) {
						AutoCompleteResult = data;
						StopAutoCompleteValue = request.term;

						// 새로운 레이아웃에 연관검색어 넣기
						var data_len = data.length;
						var res_resp = "";
						if (data_len > 10) data_len = 10;
						for (var i = 0; i < data_len; i++) {
							var resp_term = data[i].label;
							request.term = specialCharTest(request.term);
							var re_exp = new RegExp(request.term, "gi"); // 변수에 담긴 문자열 치환
							resp_term = resp_term.replace(re_exp, "<strong>" + request.term + "</strong>");
							res_resp += "<li pm_term=\"" + data[i].label + "\" pm_evt=\"" + data[i].evtno + "\"><a href=\"javascript:void(0);\" onclick=\"sch_cook_word('" + data[i].label + "','" + data[i].evtno + "');\">" + resp_term + "</a> <button class=\"link\"></button></li>";
						}

						sch_lyr_cls();
						/*
						if (res_resp) {
							$(".jqClsAutoCmpWrap > ul").html(res_resp);
							$(".jqClsAutoCmpWrap").show();
						} else {
							$(".jqClsRecentWrap").show();
						}
						*/
						if (res_resp) {
							if (tg.name == "HeadSearchKeyword"){
								$(".jqClsAutoCmpWrap > ul").html(res_resp);
								$(".jqClsAutoCmpWrap").show();
							}else if(tg.name == "fixedSearchKeyword"){
								$(".jqClsAutoCmpWrapFixed > ul").html(res_resp);
								$(".jqClsAutoCmpWrapFixed").show();
							}
						} else {
							if (tg.name == "HeadSearchKeyword"){
								$(".jqClsRecentWrap").show();
							}else if(tg.name == "fixedSearchKeyword"){
								$(".jqClsRecentWrapFixed").show();
							}
						}
						response(AutoCompleteResult);
						$(".ui-menu-item").hide();
						$(".ui-autocomplete").css({
							"width" : 0,
							"height" : 0,
							"z-index" : 1
						});
					});
				}
			},
			minLength: 2,
			select: function( event, ui ) {
				/*
				if (event.keyCode == 40 || event.keyCode == 38) return false;

				$(this).val( ui.item.label );
				$("#SearchProductKeyEvtNo").val( ui.item.evtno );
				searchr();
				*/
				return false;
			},
			focus : function(event, ui) { return false; }
		});
		// use top_body - end

		// use top_body_login - start
		// 마이페이지 마우스 오버
		$(".arrowDown").mouseenter(function(){ $(".dropdown").show(); $(".dropdown2, #directpop_2").hide();  });
		$(".dropdown").mouseenter(function(){ $(this).show(); });
		// 상담센터 마우스 오버
		//$(".arrowDown2").mouseenter(function(){ $(".dropdown2").show();  $(".dropdown, #directpop_2").hide(); });
		//$(".dropdown2").mouseenter(function(){ $(this).show(); });

		// 공통
		$(".ie_none_layer").mouseenter(function(){ $(".info_layer").hide();});
		$(".inner_wrap").mouseleave(function(){ $(".dropdown, .dropdown2").hide(); });
		// use top_body_login - end

		// 다이렉트콜 관련
		$('.jqClsTglDCPop').mouseenter(function(){ $("#directpop_2").show(); });
		$('.gnb').mouseleave(function(){ $("#directpop_2").hide(); });
		$('#directpop_2').mouseleave(function(){ $("#directpop_2").hide(); });

		// use top_body - start
		//  top 롤링 배너
		$(".sta_rolling_banner").slides({ container: "top_bnr_container", next: "head_rolling_next", prev: "head_rolling_prev", pagination: false, generatePagination: false, effect: "slide", start : $('#top_bnr_rand_num').val(), play: 5000, hoverPause : true });
		$(".head_rolling_prev, .head_rolling_next").css("display","");
		// 좌측 롤링
		$(".left_wing_rolling").slides({ container: "left_wing_rolling_item", next: "left_rolling_next", prev: "left_rolling_prev", pagination: false, generatePagination: false, effect: "slide", play: 3000});
		// 우측 최근 본 상품 롤링
		$(".goods_rolling_banner").slides({ container: "goods_rolling_container", next: "goods_rolling_next", prev: "goods_rolling_prev", pagination: false, generatePagination: false, effect: "slide"});

		//급상승 검색어 슬라이더
		$(".pwords_slider").slick({
			autoplay : true,
			autoplaySpeed :2000,
			arrows : false,
			dots: false,
    	vertical:true,
    	draggable : false,
    	adaptiveHeight: true
		});
		//급상승 검색어 슬라이더
		$(".pwords_slider_flxed").slick({
			autoplay : true,
			autoplaySpeed :2000,
			arrows : false,
			dots: false,
    	vertical:true,
    	draggable : false,
    	adaptiveHeight: true
		});
		$(".nano").nanoScroller({alwaysVisible:true});

		$(".cpz_open_btn").bind('click',function(){
			if($(this).hasClass('on')){
				$('.cpz_category_layer').removeClass('_on');
				$(".second_cate_area").hide();
				$(".BigDivLi > a").removeClass('active');
				$(".MediumDivLi > a").removeClass('active');
				$(".cpz_open_btn").removeClass('on');
				$('.cpz_category_layer').removeClass('onscroll');
			}else{
				$('.cpz_open_btn').addClass('on');
				$('.cpz_category_layer').addClass('onscroll');
			}
		});

		$(".cate_close_btn").bind('click',function(){
			$('.cpz_category_layer').removeClass('_on');
			$(".second_cate_area").hide();
			$(".BigDivLi > a").removeClass('active');
			$(".MediumDivLi > a").removeClass('active');
			$(".cpz_open_btn").removeClass('on');
			$('.cpz_category_layer').removeClass('onscroll');
		});

		$(".cpz_category_layer").bind("mouseleave",function(){
			$(".BigDivLi > a").removeClass('active');
			$(this).find('.witharrow').removeClass('active');
			$(".second_cate_area").hide();
			$('.'+$(this).attr('id')).show();
			$('.cpz_category_layer').removeClass('_on');
		});

		// 카테고리 마우스오버 이벤트
		$(".BigDivLi").bind("mouseenter",function(){
			$(".cpz_category_layer").removeClass("cozM");
			$(".BigDivLi > a").removeClass('active');
			$(this).find('.witharrow').addClass('active');
			$(".second_cate_area").hide();
			$(".BigDivLi_gamezone").hide();
			$('.'+$(this).attr('id')).show();
			$('.cpz_category_layer').addClass('_on');
		});

		$(".MediumDivLi").bind("mouseenter",function(){
			$(".MediumDivLi > a").removeClass('active');
			$(this).find('.witharrow').addClass('active');
			$(".third_cate_area").hide();
			$('.'+$(this).attr('id')).show();

		});

		$(".witharrow").bind("mouseenter",function(){
			console.log("enter");
			$(this).parents(".second_border").css("border-right","1px solid #ddd");
		});
		$(".witharrow").bind("mouseleave",function(){
			console.log("leave");
			$(this).parents(".second_border").css("border","0");
		});



		$(".hide_submenu").bind("mouseenter",function(){
			$(".cpz_category_layer").removeClass("cozM");
			$(".BigDivLi > a").removeClass('active');
			$(".second_cate_area").hide();
			$('.'+$(this).attr('id')).show();
			$('.cpz_category_layer').removeClass('_on');
		});

		$(".exclusive_area").bind("mouseenter",function(){
			$(".BigDivLi > a").removeClass('active');
			$(".cpz_category_layer").removeClass("cozM");
			$(this).find('.witharrow').addClass('active');
			$(".second_cate_area").hide();
			$(".BigDivLi_gamezone").show();
			$('.cpz_category_layer').addClass('_on');
		});
		//코즈몰
		$(".cozmall_area").bind("mouseenter",function(){
			$(".cpz_category_layer").addClass("cozM");
			$(".second_cate_area").hide();
			$('.BigDivLi_cozmall').show();
			$('.cpz_category_layer').addClass('_on');
		});
		$(".cpz_category_layer").bind("mouseleave",function(){
			$(".cpz_category_layer").removeClass("cozM");
			$(".second_cate_area").hide();
		});

		// 카테고리 마우스오버 이벤트

		// 이용후기 레이어 노출???????
		$("#forusedLayer").bind("mouseenter",function(){
			$(".layerpop").css("display","none");
			$(".iworks").css("display","");
		});
		// 이용후기 레이어 숨김??????????
		$("#forusedLayer").bind("mouseleave",function(){
			$(".iworks").css("display","none");
		});
		// 다이렉트콜 레이어 노출
		$("#direct_call_rgt").bind("mouseenter",function(){
			$(".directpop").hide();
			$(".direct_call_lyr").show();
		});
		$("#direct_call_rgt").bind("mouseleave",function(){
			$(".directpop, .direct_call_lyr").hide();
		});

		//메인 스크롤 상단 고정 스크립트
		if($("#line").length > 0){
			var osTop = $("#line").offset().top;

			$(window).scroll(function(){
				var position = $(window).scrollTop();
				if(position < osTop){
					$("#top_fix_head").removeClass('on');
					$("#rightwing_section").removeClass("_fixed");
					$(".pwords_slider_flxed").slick('slickNext');
				}else{
					$("#top_fix_head").addClass('on');
					$("#rightwing_section").addClass("_fixed");
				}
			});
		}

		$(window).resize(function(){
			InitRightWingSize();
		});

		//상담센터 우측 날개 롤링
	  $(".counselling_ul").slick({
			autoplay : true,
			autoplaySpeed :3000,
			arrows : true,
			prevArrow: '.cscenter_prev',
			nextArrow: '.cscenter_next',
			dots: false,
			vertical:false,
			draggable : false,
			variableWidth: true,
			adaptiveHeight: true
		});
		
		//나의담당자 마우스오버
		$("#my_manager_info").bind("mouseenter",function(){
			if($("#isManagerShow").val() == 'N'){
				$.ajax({
					dataType:"json",
					async : false,
			  	url: "../include/top_ajax_function.php?actype=getChgCsStaffInfo",
			  	success:function(data){
						if(data.StaffNo != ''){
							$(".managerpop > .mymanager > .msg > span").text(data.ChargePart); //상단 텍스트
							$(".managerpop > .mymanager > .name").text(data.StaffName); 
							$(".managerpop > .mymanager > .photo > img").attr('src' , '//image3.compuzone.co.kr/img/staff/'+data.StaffNo+'_150.jpg');
							$(".managerpop > .mymanager > .csinfo > dl > .csinfo_tel").text(data.PartTel); 
							$(".managerpop > .mymanager > .csinfo > dl > .csinfo_lunchtime").text(data.StaffLunchTime); 
							$(".managerpop > .mymanager > .csinfo > dl > .csinfo_email").text(data.StaffEmail); 
							if(data.StaffVaction == 'Y'){
								$(".managerpop > .manager_btn > #manager_vaction > #manager_v_name").text(data.StaffName); 
								$(".managerpop > .manager_btn > #manager_vaction").show();
							}
							$(".cateList > ul").empty();
							$html = "";
							$(data.ProfArr).each(function(){
								$html += '<li class="cho">'+$(this)[0]+'</li>';
							});
							$html += '<li>컴퓨터·부품</li>';
							$(".cateList > ul").append($html);
							$("#isManagerShow").val("Y");
						}
					}
				});
			}
		});
	}); // end jQuery

	function InitRightWingSize(){
		if($(window).width() < 1570){
			if( !$("#rightwing_section").hasClass('_minisection')){
				ToggleRightWingBox('out');
			}
		}else{
			ToggleRightWingBox('in');
		}
	}

	function ToggleRightWingBox(tp){
		if(tp == 'out'){
			$("#rightwing_section").addClass('_minisection');
			$("#miniwing").show();
			$("#rightwing_wrap").hide();
			$.cookie("ToggleRightWingBox", 0, { expires: 1, path:"/" });
		}else{
			if($(window).width() >= 1570){
				$("#rightwing_section").removeClass('_minisection');
			}
			$("#miniwing").hide();
			$("#rightwing_wrap").show();
			$.cookie("ToggleRightWingBox", 1, { expires: 1, path:"/" });
		}
	}

	// use top_body - start
	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setDate(todayDate.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";"
	}

	function getCookie(name) {
		var nameOfCookie = name + "=";
		var x = 0;
		while (x <= document.cookie.length) {
			var y = (x + nameOfCookie.length);
			if (document.cookie.substring(x, y) == nameOfCookie) {
				if ((endOfCookie = document.cookie.indexOf(";", y)) == -1) {
					endOfCookie = document.cookie.length;
				}
				return unescape(document.cookie.substring(y, endOfCookie));
			}
			x = document.cookie.indexOf(" ", x) + 1;
			if (x == 0)
				break;
		}
		return "";
	}

	// 검색어 제거
	function clearBg(el) {
		var IsEventSearch = document.search_form.IsEventSearch.value;
		if (IsEventSearch == "1") {
			document.search_form.SearchEventAction.value = document.search_form.action;
			document.search_form.SearchEventText.value = $("#"+el).val();
			document.search_form.SearchEventTarget.value = document.search_form.target;

			document.search_form.SearchProductKey.value = "";
			$("#"+el).val("");
			document.search_form.IsEventSearch.value = "";
			$("#"+el).css("color","");
		}
		$("#"+el).removeClass("blue11").addClass("txt");
		document.search_form.target = '_self';
		document.search_form.action = "../search/search.htm";
		var jqClsAutoCmpWrap = ".jqClsAutoCmpWrap";
		var jqClsRecentWrap = ".jqClsRecentWrap";
		if(el == 'fixedSearchKeyword') {
			jqClsAutoCmpWrap = ".jqClsAutoCmpWrapFixed";
			jqClsRecentWrap = ".jqClsRecentWrapFixed";
		}
		// 검색어 관련 레이어
		if ($(".ui-autocomplete").is(":visible")) {
			$(jqClsAutoCmpWrap).show();
		} else {
			$(jqClsRecentWrap).show();
		}

		// 새로 정의된 최근 검색어 치환
		if ($("#tmpNewCookSchWord").val()) cook_list.replace($("#tmpNewCookSchWord").val());
	}

	// 이벤트 광고 문구 복구
	function return_search_txt(el){
		if($("#"+el).val() == ""){
			$("#"+el).removeClass("txt").addClass("blue11");
			document.search_form.SearchProductKey.value = "";
			$("#"+el).val(document.search_form.SearchEventText.value) ;
			document.search_form.IsEventSearch.value = "1";
			document.search_form.action = document.search_form.SearchEventAction.value;
			document.search_form.target = document.search_form.SearchEventTarget.value;
		}
	}

	// 서브페이지 전체보기 - 카테고리 메뉴로 변경되면서 필요한 부분 2013-02-17 leesb999
	function menu_view(){
		var this_Display = $("#view_Cate").css("display");
		var sele_num = parseInt(0) + 1;
	//	$("#all_category_div").slideToggle("fast");
		$(".AllBrand").removeClass("menuCtgr_2_ON");
		$(".AllBrand").addClass("menuCtgr_2");
		$(".allbrand_menu").css("display","none");
		if(this_Display == "block"){
			$("#view_Cate").css("display","none");
			//카테고리 + - 표시 변경
			//$("#all_cate_li").removeClass("menuCtgr_1_ON");
			//$("#all_cate_li").addClass("menuCtgr_1");
		}else{
			$("#view_Cate").slideDown("fast");
		}
	}

	// 2016-06-13_ne0j0ys_https -> http의 경우 한글 깨짐으로 인하여 url encode 진행함..
	function recom_word_link(sch_key){
		var enc_key = encodeURI(sch_key);
		document.location.href = "../search/search.htm?SearchProductKey="+enc_key+"&bannerid=RecomSearchTerm";
	}

	$.cookie("search_PcType","",{path:"/online"});
	$.cookie("search_BigDivNo","",{path:"/online"});

	//영타 한글로 변환하는 스크립트
	var e2k = (function() {
		var en_h = "rRseEfaqQtTdwWczxvg";
		var reg_h = "[" + en_h + "]";
		var en_b = {k:0,o:1,i:2,O:3,j:4,p:5,u:6,P:7,h:8,hk:9,ho:10,hl:11,y:12,n:13,nj:14,np:15,nl:16,b:17,m:18,ml:19,l:20};
		var reg_b = "hk|ho|hl|nj|np|nl|ml|k|o|i|O|j|p|u|P|h|y|n|b|m|l";
		var en_f = {"":0,r:1,R:2,rt:3,s:4,sw:5,sg:6,e:7,f:8,fr:9,fa:10,fq:11,ft:12,fx:13,fv:14,fg:15,a:16,q:17,qt:18,t:19,T:20,d:21,w:22,c:23,z:24,x:25,v:26,g:27};
		var reg_f = "rt|sw|sg|fr|fa|fq|ft|fx|fv|fg|qt|r|R|s|e|f|a|q|t|T|d|w|c|z|x|v|g|";
		var reg_exp = new RegExp("("+reg_h+")("+reg_b+")(("+reg_f+")(?=("+reg_h+")("+reg_b+"))|("+reg_f+"))","g");

		var replace = function(str,h,b,f) {
			return String.fromCharCode(en_h.indexOf(h) * 588 + en_b[b] * 28 + en_f[f] + 44032);
		};
		return (function(str) {
			return str.replace(reg_exp,replace);
		});
	})();

	// 검색 시작
	function searchr(el){
		if($("#SearchProductKeyView").val() == ''){
			$("#SearchProductKeyView").val($('#'+el).val());
		}
		if (!cook_list) var cook_list = new cookieList("_coz_recent_word"); // 최근 검색어
		if ($("#SearchProductKeyView").val()) {
			var spKey = specialCharTest($("#SearchProductKeyView").val());
			$("#SearchProductKeyView").val(spKey);
			cook_list.add(spKey);
		}
		$.cookie("search_SearchText","",{ expires: -1 });
		if( $("#SearchProductKeyEvtNo").val() ){
			document.location.href = "../event_zone/eventzone_view.htm?EventNo=" + $("#SearchProductKeyEvtNo").val();
		}
		else{
			//post시 브라우져 인코딩이 유니코드의 경우 한글이 깨져 encodeURI를 해준다 단 받는 페이지에서
			//rawurldecode($SearchProductKey);와 iconv("utf-8","CP949",$SearchProductKey);로 변환해줘야 한다.
			//search/search.htm search_list.php페이지에 있음
			if(document.search_form.IsEventSearch.value == "1"){
				document.search_form.submit();
			}else{
				// 중복 검색 방지
				if(document.search_form.SearchProductKeyView.value != document.getElementById("TmpSearchProductKeyView").value){
					document.search_form.SearchProductKey.value = encodeURI(document.search_form.SearchProductKeyView.value.replace(/ /gi,"+"));
					document.location.href = "../search/search.htm?Seargbl="+document.search_form.Seargbl.value+"&hidden_Txt="+document.search_form.hidden_Txt.value+"&IsEventSearch="+encodeURI(document.search_form.IsEventSearch.value)+"&SearchProductKey="+document.search_form.SearchProductKey.value;
					document.getElementById("TmpSearchProductKeyView").value = document.search_form.SearchProductKeyView.value;
				}
			}
		}
	}
	// use top_body - end

	// use top_body_login - start
	function sub_view(etype){
		if(etype=="Y"){
			document.getElementById("mypage_sub").style.display="";
		}else{
			document.getElementById("mypage_sub").style.display="none";
		}
	}
	// use top_body_login - end

	// 다이렉트 콜 신청
	function direct_call_req(arg){
		$.post('../commfaq/qna_function.php',{'actype':'getDirectCallState','CallType':arg},function (ret_data){
			if (ret_data == '0') {
				alert('죄송합니다.\n다이렉트콜 신청 중 오류가 발생하였습니다.\n잠시 후 다시 시도해주시기 바랍니다.');
				return;
			} else {
				if (confirm(ret_data)) {
					$.post('../commfaq/qna_function.php',{'actype':'reqDirectCall','CallType':arg},function (ret_data){
						if (ret_data == '0') {
							alert('죄송합니다.\n다이렉트콜 신청 중 오류가 발생하였습니다.\n잠시 후 다시 시도해주시기 바랍니다.');
							return;
						} else {
							alert('정상적으로 신청되었습니다.\n답변 예상 시간 : '+ret_data);
							$('.directpop, .direct_call_lyr').hide();
						}
					});
				}
			}
		});
	}

	/**
		2017-10-11_ne0j0ys_최근 검색어 관련
	*/
	// 쿠키 배열 처리
	var cookieList = function (cook_name){
		var exist_cook = ($.cookie(cook_name)) ? $.cookie(cook_name) : "";
		var _items = exist_cook ? exist_cook.split("^") : new Array();

		return {
			"add"	: function (cVal){
				cVal = encodeURIComponent(cVal);
				_items.unshift(cVal);
				$.cookie(cook_name, _items.join('^'), {expires:30, path:'/'});
			},
			"remove" : function (cVal){
				var idx = exist_cook.indexOf(cVal);
				if (idx != -1) {
					var itemCnt = _items.length;
					var tmpCook = '';
					for( i = 0 ; i < itemCnt ; i++ ){
						if( _items[i] == cVal ){
							continue;
						}
						if( tmpCook ){ tmpCook += '^'; }
						tmpCook += _items[i];
					}
					$.cookie(cook_name, tmpCook, {expires:30, path:'/'});
					$("#tmpNewCookSchWord").val(tmpCook);
				}
			},
			"replace" : function (cVal){
				$.cookie(cook_name, cVal, {expires:30, path:'/'});
			},
			"clear" : function (){
				_items = null;
				$.removeCookie(cook_name, {path:'/'});
			},
			"items" : function (){
				return _items;
			}
		}
	}

	// 검색어 삭제
	function del_cook_word(arg, word, idx){
		if (arg == "clear") {
			$("#tmpNewCookSchWord").val("");
			cook_list.clear();
			$(".jqClsSchUl").replaceWith("<div class=\"listnone\">최근 검색 내역이 없습니다.</div>");
		} else {
			$(".jqClsSchLi_" + idx).remove();
			cook_list.remove(word);
			if (!$(".jqClsSchLi").length) {
				$(".jqClsSchUl").replaceWith("<div class=\"listnone\">최근 검색 내역이 없습니다.</div>");
			}
		}
	}
	// 검색어 선택
	function sch_cook_word(word,evtno){
		if( evtno ){
			document.location.href = "../event_zone/eventzone_view.htm?EventNo=" + evtno;
		}
		else{
			clearBg();
			$("#SearchProductKeyView").val(word);
			searchr();
		}
	}

	//급상승 검색어에서 검색
	function sch_rank_word(word,rank){
		$("#SearchProductKeyView").val(word);
		if(document.search_form.SearchProductKeyView.value != document.getElementById("TmpSearchProductKeyView").value){
			document.search_form.SearchProductKey.value = encodeURI(document.search_form.SearchProductKeyView.value.replace(/ /gi,"+"));
			document.location.href = "../search/search.htm?Seargbl="+document.search_form.Seargbl.value+"&hidden_Txt="+document.search_form.hidden_Txt.value+"&IsEventSearch="+encodeURI(document.search_form.IsEventSearch.value)+"&SearchProductKey="+document.search_form.SearchProductKey.value+"&IsSoaring=Y&SKL_Rank="+rank;
			document.getElementById("TmpSearchProductKeyView").value = document.search_form.SearchProductKeyView.value;
		}
	}

	// 검색어 레이어 제거
	function sch_lyr_cls(){
		$(".search_dropbox").hide();
	}

	// 최근 검색어
	var cook_list = new cookieList("_coz_recent_word");
	// use right_menu_body - end

	// 특수문자 검증
	function specialCharTest(str){
		var retStr = str;
		//var specialRegExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
		// 아이웍스 네이밍 변경에 따른 하이픈(\-) 예외처리	newcozlch	2019-08-12 오후 2:23:10
		var specialRegExp = /[\{\}\[\]\/?,;:|\)*~`!^_+<>@\#$%&\\\=\(\'\"]/gi;

	  if (specialRegExp.test(str)) {
	 		retStr = str.replace(specialRegExp, "");
	  }
	  return retStr;
	}

	function couponClose(){
		$(".bonus").hide();
		$.cookie("noAlertCoupon", 1, { expires: 7, path:"/" });
	}

	// 급상승 검색어 탭
	function pwordsTab(el){
		$(".pwords_tab").removeClass('on');
		$(".fixed_pwords_tab").removeClass('on');
		$("."+el).addClass('on');
		$(".pwords_list").removeClass('on');
		$("."+el).addClass('on');

	}
	
	//나의담당자 리스트 노출
	function getChgCsStaff(){
		$.ajax({
	  	url: "../include/top_ajax_function.php?actype=getChgCsStaff",
	  	success:function(html){
				$("#staff_info_box").html(html);
				$("#staff_chg_dimmed").show();
				TabChgCsStaff();
  		}
		});
	}
	
	//나의담당자 레이어 닫기
	function closeChgCsStaff(){
		$("#staff_chg_dimmed").hide();
		$("#staff_info_box").empty();
	}
	
	//나의담당자 탭변경 
	function TabChgCsStaff(){
		$('.top_tabcontent > div').hide();
		$('.top_tabnav a').click(function () {
			$('.top_tabcontent > div').hide().filter(this.hash).fadeIn();
			$('.top_tabnav a').removeClass('active');
			$(this).addClass('active');
			return false;
		}).filter(':eq(0)').click();
	}
	
	//나의담당자 변경
	function ActChgCsStaff(staffName){
		// 동명이인 처리 : 이름에 2 제거
		//if($Staff_Name=='db 이름')
		//	$Staff_Name = '노출 이름';
		if(staffName == "") return;
		if(staffName=='김민성') staffName = '김민성2';
		if(confirm("담당자를 변경하시겠습니까?")){
			$.ajax({
				dataType:"json",
				async : false,
				url: "../mypage/mypage_function.php?actype=select_charger&staff_name="+staffName+"&fromPage=topPage",
				success:function(data){
					getChgCsStaffInfo(staffName);
					alert('변경되었습니다.');
					closeChgCsStaff();
				},
				error:function(request,status,error){
				 	closeChgCsStaff();
				}
			});
		}
	}
	//담당자 변경후 봐꿔치기하기 
	function getChgCsStaffInfo(StaffName){
		$.ajax({
			dataType:"json",
			async : false,
			url: "../include/top_ajax_function.php?actype=getChgCsStaffInfo&StaffName="+StaffName,
			success:function(data){
				if(data.StaffNo != ''){
					$(".managerpop > .mymanager > .msg > span").text(data.ChargePart); //상단 텍스트
					$(".managerpop > .mymanager > .name").text(data.StaffName); 
					$(".managerpop > .mymanager > .photo > img").attr('src' , '//image3.compuzone.co.kr/img/staff/'+data.StaffNo+'_150.jpg');
					$(".managerpop > .mymanager > .csinfo > dl > .csinfo_tel").text(data.PartTel); 
					$(".managerpop > .mymanager > .csinfo > dl > .csinfo_lunchtime").text(data.StaffLunchTime); 
					$(".managerpop > .mymanager > .csinfo > dl > .csinfo_email").text(data.StaffEmail); 
					$(".cateList > ul").empty();
					$html = "";
					$(data.ProfArr).each(function(){
						$html += '<li class="cho">'+$(this)[0]+'</li>';
					});
					$html += '<li>컴퓨터·부품</li>';
					$(".cateList > ul").append($html);
				}
			},
			error:function(request,status,error){
				console.log(error);
			}
		});		
	}
	
