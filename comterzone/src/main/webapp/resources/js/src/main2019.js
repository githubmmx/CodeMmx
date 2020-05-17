	var is_main_load = false; //로딩 체크
	var weekly_start_pos = 0; //fix 4 product 1/3
	var main_rolling_bottom_pos = 0; // main rolling bottom pos
	var best_cate_pos = 0; //category section top
	var brandshop_pos = 0; //brandshop top
	var best_cate_nav_height = 0; //category nav height
	var array_best_cate_area = []; //bestcate_area top array
	var bgColorArr = ['#ce3a3a','#f29e3b','#78b939','#02d6a2','#2ea6c0','#3a7ccd','#484fd6','#7c3dd1','#aa4ac2','#c34991'];
	var previdx = ''; //active state category
	var contsCatePage = "../include/main2019_contents_category.php";

	function switch_cate_nav(scroll_pos){
		var is_on = false;
		$.each(array_best_cate_area, function(i, value){
			if(scroll_pos + 200 > value.pos){
				var btn = $('#banner'+ value.id);
				is_on = true;
				change_category(btn);
			}
			if(is_on)return;
		});
	}

  function setClock(i) {
    var time_value = timeStamp * 1000 + i;
    var now = new Date();
    now.setTime(time_value);

    var nowDate = now.getDay();
    var Hours = now.getHours();
    var Minutes = now.getMinutes();
    var Seconds = now.getSeconds();
    // 23:59:59

    var leftDate = 0;
    if (nowDate >= 4) {// 목 ~ 수 주기
    	leftDate = 10 - nowDate;
    }else {
    	leftDate = 3 - nowDate;
    }
    var leftHour = 23 - Hours;
    var leftMin = 59 - Minutes;
    var leftSec = 59 - Seconds;
    var time_h1_val = time_h2_val = time_m1_val = time_m2_val = time_s1_val = time_s2_val = time_d1_val = 0;

		// 일
		if(leftDate < 10){
			time_d1_val = "0"+leftDate;
		}else{
			time_d1_val = leftDate;
		}

		// 시간
		if(leftHour < 10){
			time_h1_val = "0"+leftHour;
		}else{
			time_h1_val = leftHour;
		}

		// 분
		if(leftMin < 10){
			time_m1_val = "0"+leftMin;
		}else{
			time_m1_val = leftMin;
		}

		// 초
		if(leftSec < 10){
			time_s1_val = "0"+leftSec;
		}else{
			time_s1_val = leftSec;
		}

		if(leftDate < 0){
			time_d1_val = time_h1_val = time_m1_val = time_s1_val = "00";
		}

		// 출력
		var limit_date = time_d1_val + '일';
		var limit_time = $('<i>', {'text': time_h1_val + ':' + time_m1_val + ':' + time_s1_val});

		$('.time').empty();
		$('.time').append(limit_date);
		$('.time').append(limit_time);

		if($('.chart').attr('data-percent') == undefined){
			if(leftDate > 3){
				$('.chart').attr('data-percent', '40');
			}else{
				$('.chart').attr('data-percent', '75');
			}
		}

    // 재호출
	  i = i + 1000;
	  setTimeout("setClock(" + i + ")", 1000);
	}

	function init_chart(){
		$('.chart').easyPieChart({
	    animate: 2500,
	    barColor: '#ff3131',
	    scaleColor: false,
	    trackColor: '#fff',
	    lineCap: 'squre',
	    size: 242,
	    lineWidth: 3,
	    trackWidth: 1,
	    onStep: function(from, to, percent) {
	      var val = percent * 360 / 100;
	      $(this.el).find('.percent').css('transform','rotate('+val+'deg)');
	    }
	  });
	}

	function animate_main_banner(slide){
		var slide_div = slide.find($('div[class*="detailbx"]'));
	 	var slide_class = slide_div.attr('class'); //class 이름
		if(slide_class.indexOf('first_detailbx') > -1){
			slide_div.addClass('first_title_up');
	 	}else{
			slide_div.addClass('second_title_up');
	 	}
	}

	function go_to_slide(bnr_id){
		var slide = $('div[banner-id="'+bnr_id+'"]:not(.slick-cloned)');
		var slide_i = slide.attr('data-slick-index');
		$('.cpz_slidegrid').slick('slickGoTo', slide_i);
	}

	function action_gnb_bnr(ty){
		if(ty == 'open'){
			$('#topline').hide();
			$('.width_bnr_img').css('margin-top', '115px');
			$('.topline_bnr_open').show();
		}else if(ty == 'close'){
			
//			$('#topline').find('a').off('click');
//			$('#topline').find('a').on('click', function(){
//				
//			});
			set_cookie_gnb();
			
		}
	}

	function close_gnb_bnr(){
		$('.topline_bnr').show();
		$('.width_bnr_img').css('margin-top', '45px');
		$('.topline_bnr_open').hide();
	}

	function set_cookie_gnb(){
		$('.topline_bnr').hide();
		$('.topline_bnr_open').hide();
		evt_banner_cls('topline');
		$(".leftwing_section,.rightwing_section").removeClass('line_bnr');
		$("#jqIdMainRgtCircleBnr").removeClass('floating_line_bnr');
	}

	function change_mpl_list(obj){
		var sub_position = $(obj).attr('banner-id');

		$('.hotpd_teb').find('a').removeClass('active');
		$(obj).addClass('active');

		$('.hotpd_imgbox:visible').hide();
		$('div[banner-id="'+ sub_position +'"]').show();
	}

	function order_display(){
		document.getElementById("orderlayer").style.visibility='hidden';
		return;
	}

	function change_category(btn){
		var i = $(btn).attr('item-data');
		$(btn).css('backgroundColor',bgColorArr[i%10]);
		$(btn).addClass('active');
	}

	function get_user_set_category(){
		$('.bestcate_list').empty();
		$.ajax({
			url: contsCatePage,
			type: 'post',
			dataType: 'html',
			data: {
				"actype": 'get_user_set_category'
			},
			success: function(html){
				$('.bestcate_list').append(html);
			}
		});
		get_category_list();
	}

	function get_category_list(){
		$('.bestcate_icon_nav > a').remove();
		$.ajax({
			url: contsCatePage,
			type: 'post',
			dataType: 'html',
			data: {
				"actype": 'get_category_list'
			},
			success: function(html){
				$(".bestcate_setting").before(html);
				get_category_banner();
			}
		});
	}

	function get_category_banner(){
		$.ajax({
			url: contsCatePage,
			type: 'post',
			dataType: 'html',
			data: {
				"actype": 'get_category_banner',
				"TopName" : ['','main', 'main.htm']
			},beforeSend:function(){
				$('.loading_view').show();
			},
			success: function(html){
				$('.bestcate_area').remove();
				$('.loading_view').hide();
				$(".best_category_section").append(html);
			},
			complete: function(){
				$("#category_nav").show();
				init_category_rolling();
			}
		});
	}

	function init_category_rolling(){
		//카테고리 - 롤링
		$('.category_rolling').each(function(){
			var i = $(this).attr('banner-id');
			$(this).slick({
		 		slide : 'li',
		 		slidesToShow : 1,
		 		slidesToScroll : 1,
		 		autoplay : true,
		 		autoplaySpeed : 4500,
		 		speed : 500,
		 		infinite : true,
		 		arrows : true,
		 		prevArrow : $('.cate_roll_prev'+i),
		 		nextArrow : $('.cate_roll_next'+i)
		 	}).on('beforeChange', function(event, slick, currentSlide, nextSlide){
		 		$(slick.$slides[nextSlide]).find('.tit_box').removeClass('tit_box');
		 	}).on('afterChange', function(event, slick, currentSlide){
		 		var caption_class = $(slick.$slides[currentSlide]).find('span:not(.tit_box)').attr('class');
		 		var bg_class = caption_class.split(' ')[1];
		 		$(slick.$nextArrow).parent().parent().attr('class', 'bestcate_rolling ' + bg_class);
		 		$(slick.$slides[currentSlide]).find('.caption > span').addClass('tit_box');
		 	});
		});

		best_cate_pos = $("#category_section").offset().top;
    brandshop_pos = $("#brandshop").offset().top;
    best_cate_nav_height = $('#category_nav').outerHeight();
    array_best_cate_area = [];
    $('.bestcate_area').each(function(){
    	var nav_id = $(this).attr('id').replace('category', '');
			var cate_pos = $(this).offset().top;
			array_best_cate_area.push({'id' : nav_id, 'pos' : cate_pos});
		});
		//lovejin90
		if(array_best_cate_area.length > 0){
			$('#banner'+ array_best_cate_area[0].id).css('backgroundColor',bgColorArr[0]);
			$(".bestcate_icon").on('mouseenter',function(){
				$(this).addClass('active bestcate_bgcolor'+ ($(this).attr('item-data')%10) );
			});
			$(".bestcate_icon").on('mouseleave',function(){
				if($(this).attr('banner-id') == previdx){
					$(this).removeClass('bestcate_bgcolor'+ ($(this).attr('item-data')%10) );
				}else{
					$(this).removeClass('active bestcate_bgcolor'+ ($(this).attr('item-data')%10) );
				}
			});
		}

		if($.cookie('main_scroll_y')){
			window.scrollTo(0, $.cookie('main_scroll_y'));
			$.removeCookie('main_scroll_y', {path:'/'});
		}
	}

	function set_category(){
		var str_category = '';
		var array_count = [];
		$('input[class="settingchk"]').each(function(){
			if($(this).is(':checked')){
				if(str_category){
					str_category += '|';
				}
				str_category += $(this).val();
				array_count[$(this).val()] = 'Y';
			}
			else{
				array_count[$(this).val()] = 'N';
			}
		});

		if(!str_category){
			alert('카테고리를 한 개 이상 선택해주세요!');
			return;
		}

		//노출 카운트 체크
		$.ajax({
			url: contsCatePage,
			type: 'post',
			data: {
				"actype": 'save_category_count',
				"array_count" : array_count
			}
		});

		bnrSetCookie('user_set_category', str_category, 365);
		$('.bestcate_setting_layer').hide();
		window.scrollTo(0, $('#category_section').offset().top - 90);
		get_user_set_category();
	}

	function init_category(){
		$.removeCookie('user_set_category', {path:'/'});
		$('.bestcate_setting_layer').hide();
		get_user_set_category();
		window.scrollTo(0, $('#category_section').offset().top - 90);
	}

	function change_board(ty){
		if(ty == 'notice'){
			$('.event_on').removeClass('on');
			$('.event_board').hide();

			$('.notice_on').addClass('on');
			$('.notice_board').show();

			$('.notice_more').attr('onclick', "document.location.href='../community/community_coznews_list.htm';");
		}else if(ty == 'event'){
			$('.notice_on').removeClass('on');
			$('.notice_board').hide();

			$('.event_on').addClass('on');
			$('.event_board').show();

			$('.notice_more').attr('onclick', "document.location.href='../event_zone/eventzone_win_list.htm';");
		}
	}

	function move_category(div){
		var cate_top =  $(div).offset().top - 90;
		window.scrollTo(0, cate_top);
	}

	function alert_category(check_id){
		$("#" + check_id).prop('checked', true);
		$("#alert_" + check_id).show();
		setTimeout(function(){
			$("#alert_" + check_id).hide();
		}, 1000);
	}

	function go_url(url){
		var y_pos = $(window).scrollTop();
		bnrSetCookie('main_scroll_y', y_pos, 1);
		document.location.href = url;
	}

	function close_mouse_infopop(){
		bnrSetCookie('mouse_infopop_cook', 'bnr_cls_one', 1000);
		$('.mouse_infopop_div').hide();
	}

	// use popup_layer - start
	function closeWin(){
		if (document.getElementById("Lchkbox").checked ){
			setCookie( "maindiva" + $("#main_layer_popup_no").val(), "done" , 1 );
		}
		$("#divpop").slideUp(1000);
	}
	function HideWin(){
		$("#divpop").hide(1000);
	}
	// use popup_layer - end

  $(document).ready(function(){
    $( ".sortable" ).sortable({
    	items : 'li:not(.li-block)',
    	cancel:".li-block"
    });

    $( ".sortable" ).disableSelection();

    var mpl_id = Math.round(Math.random()*3);
    $('a[banner-id="MainProductList'+ mpl_id +'"]').trigger('click');

    //메인 롤링
    $('.cpz_slidegrid').slick({
	 		slide : ".cpz_slidegrid_col",
	 		slidesToShow : 2,
	 		slidesToScroll : 1,
	 		useTransform:true,
	 		lazyload : 'ondemand',
	 		autoplay : true,
	 		infinite : true,
	 		autoplaySpeed : 5000,
	 		speed : 300,
	 		arrows : true,
	 		prevArrow : $('.btn_main_prev'),
	 		nextArrow : $('.btn_main_next')
	 	}).on('beforeChange', function(event, slick, currentSlide, nextSlide){
	 		var next_slide_div = $(slick.$slides[nextSlide]).find($('div[class*="detailbx"]'));
	 		var next_slide_class = next_slide_div.attr('class'); //class 이름

	 		var step2_idx = parseInt(nextSlide + 1);
		 	var step2_slide =  $(slick.$slideTrack).find('div[data-slick-index="'+step2_idx+'"]');
	 		var step2_slide_div = step2_slide.find($('div[class*="detailbx"]'));
	 		var step2_slide_class = step2_slide_div.attr('class'); //class 이름

	 		if(next_slide_class.indexOf('first_detailbx') > -1){
	 			next_slide_div.removeClass('first_title_up');
		 	}else{
	 			next_slide_div.removeClass('second_title_up');
		 	}

	 		if(step2_slide_class.indexOf('first_detailbx') > -1){
	 			step2_slide_div.removeClass('first_title_up');
		 	}else{
	 			step2_slide_div.removeClass('second_title_up');
		 	}
	 	}).on('afterChange', function(event, slick, currentSlide){
	 		var current_slide = $(slick.$slides[currentSlide]);
	 		var next_idx = parseInt(currentSlide + 1);
	 		var next_slide =  $(slick.$slideTrack).find('div[data-slick-index="'+next_idx+'"]');

	 		animate_main_banner(current_slide);
	 		animate_main_banner(next_slide);
	 	});
	 	
	 	var startMainBnrId = Math.floor(Math.random() * 25) + 1;
		if($('div[banner-id="59054"]').length > 0){
			startMainBnrId = $('div[banner-id="59054"]').attr('data-slick-index');
		}
	 	
	 	$('.cpz_slidegrid').slick('slickGoTo', startMainBnrId);

	 	$('#main_roll_area').on('mouseenter', function(){
	 		$('.mainslide_warrow').show();
	 	}).on('mouseleave', function(){
	 		$('.mainslide_warrow').hide();
	 	})

	 	//위클리 특가
	 	$('.weekly_roll').slick({
	 		slide : 'li',
	 		slidesToShow : 1,
	 		slidesToScroll : 1,
	 		autoplay : true,
	 		autoplaySpeed : 2000,
	 		speed : 800,
	 		infinite : true,
	 		fade : true,
	 		arrows : true,
	 		prevArrow : $('.weekly_roll_prev'),
	 		nextArrow : $('.weekly_roll_next')
	 	});

	 	//중앙우측롤링
	 	$('.rollingbnrr_col').slick({
	 		slide : 'a',
	 		slidesToShow : 1,
	 		slidesToScroll : 1,
	 		autoplay : true,
	 		autoplaySpeed : 3000,
	 		lazyload: 'ondemand',
	 		speed : 600,
	 		infinite : true,
	 		arrows : false,
	 		dots : false
	 	}).on('afterChange', function(event, slick, currentSlide){
	 		$('.rollBtn > li').removeClass('active');
	 		$('.rollBtn > li').eq(currentSlide).addClass('active');
	 	});

	 	//기획전
	 	$('.exc_event_bnr').on('init', function(slick){
	 		$(slick.target.children).css('overflow-y', 'visible');
	 		$(slick.target.children).find('.slick-track').css('padding', '10px 0 10px 0');
	 	}).slick({
	 		slide : 'li',
	 		slidesToShow : 4,
	 		slidesToScroll : 1,
	 		speed : 300,
	 		lazyload: 'ondemand',
	 		useTransform:false,
	 		infinite : true,
	 		arrows : true,
	 		prevArrow : $('.mee_bnr_prev'),
	 		nextArrow : $('.mee_bnr_next')
	 	});

	 	//회원별 맞춤 서비스(추천 제품)
	 	$('.recommend_bnr').slick({
	 		slide : 'li',
	 		slidesToShow : 1,
	 		slidesToScroll : 1,
	 		speed : 300,
	 		infinite : true,
	 		arrows : true,
	 		lazyload: 'ondemand',
	 		prevArrow : $('.msp_bnr_prev'),
	 		nextArrow : $('.msp_bnr_next')
	 	}).find('img').css('display', 'inline');
    weekly_start_pos = $('#main_five_fixbnr').offset().top + ($('#main_five_fixbnr').height() / 3);
		
		main_rolling_bottom_pos = $('.cpz_slidegrid').offset().top + $('.cpz_slidegrid').height();
		
    //위클리 특가 - 파이 차트 애니메이션
    $(window).scroll(function(){
    	var pos = $(this).scrollTop();
    	
    	if(pos < main_rolling_bottom_pos){
    		$('.cpz_slidegrid').slick('slickPlay');
    	}else{
    		$('.cpz_slidegrid').slick('slickPause');    		
    	}
    	
    	if(pos > weekly_start_pos && !is_main_load){
    		init_chart();
    		get_user_set_category();
    		is_main_load = true;
    	}
    	
    	if(best_cate_pos > 0 && pos + 91 > best_cate_pos && (pos + best_cate_nav_height + 100) < brandshop_pos){
    		if(!$('#category_nav').hasClass('_navfixed')){
		    	$('#category_nav').addClass('_navfixed');
		    }
		    $.each(array_best_cate_area,function(i,value){
		    	if( pos+ 200 > value.pos ){
		    		var prevbtn = $('#banner'+ previdx);
						$(prevbtn).removeClass('active');
						$(prevbtn).css('backgroundColor','');

						var btn = $('#banner'+ value.id);
						$(btn).css('backgroundColor',bgColorArr[i%10]);
						$(btn).addClass('active');

						previdx = (value.id =='')? array_best_cate_area[0].id :value.id;
			    }
		    });
      }else{
      	if(array_best_cate_area.length > 0){
	      	previdx = array_best_cate_area[0].id;
	      }
      	$('#category_nav').removeClass('_navfixed');
      }
    });

  	$("img.lazyload").lazyload();

    //위클리 특가 - 남은 시간
    if($('.weeklysale_section').is(':visible')){
			setClock(0);
		}
  });
