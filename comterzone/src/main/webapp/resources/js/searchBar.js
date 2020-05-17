 // 검색어 제거
 function clearBg(el) {
    // var IsEventSearch = document.search_form.IsEventSearch.value;

    // if (IsEventSearch == "1") {
    //     document.search_form.SearchEventAction.value = document.search_form.action;
    //     document.search_form.SearchEventText.value = $("#" + el).val();
    //     document.search_form.SearchEventTarget.value = document.search_form.target;

    //     document.search_form.SearchProductKey.value = "";
    //     $("#" + el).val("");
    //     document.search_form.IsEventSearch.value = "";
    //     $("#" + el).css("color", "");
    // }


    // $("#" + el).removeClass("blue11").addClass("txt");
    // document.search_form.target = '_self';
    // document.search_form.action = "../search/search.htm";
    var jqClsAutoCmpWrap = ".jqClsAutoCmpWrap";
    var jqClsRecentWrap = ".jqClsRecentWrap";
    // if (el == 'fixedSearchKeyword') {
    //     jqClsAutoCmpWrap = ".jqClsAutoCmpWrapFixed";
    //     jqClsRecentWrap = ".jqClsRecentWrapFixed";
    // }
    // 검색어 관련 레이어
    if ($(".ui-autocomplete").is(":visible")) {
        $(jqClsAutoCmpWrap).show();
    } else {
        $(jqClsRecentWrap).show();
    }

    // // 새로 정의된 최근 검색어 치환
    // if ($("#tmpNewCookSchWord").val()) cook_list.replace($("#tmpNewCookSchWord").val());


}


 // 이벤트 광고 문구 복구
 function return_search_txt(el) {
    // if ($("#" + el).val() == "") {
    //     $("#" + el).removeClass("txt").addClass("blue11");
    //     document.search_form.SearchProductKey.value = "";
    //     $("#" + el).val(document.search_form.SearchEventText.value);
    //     document.search_form.IsEventSearch.value = "1";
    //     document.search_form.action = document.search_form.SearchEventAction.value;
    //     document.search_form.target = document.search_form.SearchEventTarget.value;
    // }


}



// 검색 시작
function searchr(el) {
    // if ($("#SearchProductKeyView").val() == '') {
    //     $("#SearchProductKeyView").val($('#' + el).val());
    // }
    // if (!cook_list) var cook_list = new cookieList("_coz_recent_word"); // 최근 검색어
    // if ($("#SearchProductKeyView").val()) {
    //     var spKey = specialCharTest($("#SearchProductKeyView").val());
    //     $("#SearchProductKeyView").val(spKey);
    //     cook_list.add(spKey);
    // }
    // $.cookie("search_SearchText", "", { expires: -1 });
    // if ($("#SearchProductKeyEvtNo").val()) {
    //     document.location.href = "../event_zone/eventzone_view.htm?EventNo=" + $("#SearchProductKeyEvtNo").val();
    // }
    // else {
    //     //post시 브라우져 인코딩이 유니코드의 경우 한글이 깨져 encodeURI를 해준다 단 받는 페이지에서
    //     //rawurldecode($SearchProductKey);와 iconv("utf-8","CP949",$SearchProductKey);로 변환해줘야 한다.
    //     //search/search.htm search_list.php페이지에 있음
    //     if (document.search_form.IsEventSearch.value == "1") {
    //         document.search_form.submit();
    //     } else {
    //         // 중복 검색 방지
    //         if (document.search_form.SearchProductKeyView.value != document.getElementById("TmpSearchProductKeyView").value) {
    //             document.search_form.SearchProductKey.value = encodeURI(document.search_form.SearchProductKeyView.value.replace(/ /gi, "+"));
    //             document.location.href = "../search/search.htm?Seargbl=" + document.search_form.Seargbl.value + "&hidden_Txt=" + document.search_form.hidden_Txt.value + "&IsEventSearch=" + encodeURI(document.search_form.IsEventSearch.value) + "&SearchProductKey=" + document.search_form.SearchProductKey.value;
    //             document.getElementById("TmpSearchProductKeyView").value = document.search_form.SearchProductKeyView.value;
    //         }
    //     }
    // }


}


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


// 검색어 레이어 제거
function sch_lyr_cls(){
    $(".search_dropbox").hide();
}