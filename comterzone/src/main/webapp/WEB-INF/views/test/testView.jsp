<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>test</title>
       
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <!-- Bootstrap -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
        <link rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <!-- fontawesome codekey -->
        <script src="https://kit.fontawesome.com/e8cca40fcd.js" crossorigin="anonymous"></script>
        <!-- jquery.cookie -->
        <script src="${pageContext.request.contextPath }/resources/js/src/jquery.cookie.js"></script>
        <!-- lazyload -->
        <script src="${pageContext.request.contextPath }/resources/js/src/lazyload.min.js"></script>
        <!-- jquery-ui -->
        <script src="${pageContext.request.contextPath }/resources/js/src/jquery-ui-1.9.2.custom.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/src/jquery-ui-1.8.17.custom.css">
        <!-- jquery.slides -->
        <script src="${pageContext.request.contextPath }/resources/js/src/jquery.slides.min-3.js"></script>
        <!-- slick -->
        <script src="${pageContext.request.contextPath }/resources/js/src/slick-1.8.0.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/src/slick-1.8.1.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/src/slick-theme-1.8.1.css">
        <!-- nanoscroller -->
        <script src="${pageContext.request.contextPath }/resources/js/src/jquery.nanoscroller.min.js"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/src/jquery.nanoscroller.css">
        <style>
                @media all and (max-width:1650px) {
                        .cpz_category_layer {
                                height: 573px;
                                width: 219px;
                        }

                        .cpz_category_layer.onscroll {
                                height: 573px;
                                width: 219px;
                        }

                        .cpz_category_layer._on {
                                height: 573px;
                                width: 621px;
                        }

                        .cpz_category_layer .nano-content,
                        .cpz_category_layer._on .nano-content {
                                overflow-y: auto
                        }

                        .cpz_category_layer .nano>.nano-pane {
                                background-color: #ececec;
                        }

                        .cpz_category_layer .nano>.nano-pane .nano-slider {
                                background-color: #000;
                        }

                        .cpz_category_layer.cozM .cozM_bg {
                                display: none;
                        }

                        .cpz_lnb_wrap .lnb_menu_box>ul>li:first-child {
                                padding-left: 10px;
                        }

                        .cpz_lnb_wrap .right_commercial>ul .second_commercial {
                                margin-right: 5px;
                        }

                        .cpz_category_layer .nano>.nano-content {
                                overflow-y: auto;
                        }
                }

                @media all and (max-width:1570px) {
                        .leftwing_section {
                                margin-left: -758px
                        }

                        .rightwing_section {
                                margin-left: 649px;
                        }

                        .rightwing_section._minisection {
                                display: block
                        }

                        .cpz_category_layer {
                                height: 548px;
                                width: 219px;
                        }

                        .cpz_category_layer.onscroll {
                                height: 548px;
                                width: 219px;
                        }

                        .cpz_category_layer._on {
                                height: 548px;
                                width: 621px;
                        }

                        .cpz_category_layer .nano-content,
                        .cpz_category_layer._on .nano-content {
                                overflow-y: auto
                        }

                        .cpz_category_layer .nano>.nano-pane {
                                background-color: #ececec;
                        }

                        .cpz_category_layer .nano>.nano-pane .nano-slider {
                                background-color: #000;
                        }

                        .cpz_category_layer.cozM .cozM_bg {
                                display: none;
                        }
                }

                @media all and (max-width:1490px) {
                        .leftwing_section {
                                display: none;
                        }

                        .rightwing_section._minisection {
                                display: block;
                        }

                        .weeklysale_section {
                                display: none;
                        }

                        .cpz_category_layer {
                                height: 430px;
                                width: 219px;
                        }

                        .cpz_category_layer.onscroll {
                                height: 430px;
                                width: 219px;
                        }

                        .cpz_category_layer._on {
                                height: 430px;
                                width: 621px;
                        }

                        .cpz_category_layer .nano-content,
                        .cpz_category_layer._on .nano-content {
                                overflow-y: auto
                        }

                        .cpz_category_layer .nano>.nano-pane {
                                background-color: #ececec;
                        }

                        .cpz_category_layer .nano>.nano-pane .nano-slider {
                                background-color: #000;
                        }

                        .cpz_category_layer.cozM .cozM_bg {
                                display: none;
                        }
                }
        </style>
        <!-- <link rel="stylesheet" href="css/compuzone.css"> -->
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/common.css">
        <script src="${pageContext.request.contextPath }/resources/js/compuzone.js"></script>

        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/searchBar.css">
        <script src="${pageContext.request.contextPath }/resources/js/searchBar.js"></script>
</head>

<body>


        
                <!-- 고정 lnb-->

                <div class="cpz_inner">
                        <div class="sta">
                                <!-- h1-logo -->
                                <div class="cpz_logo"><a href="http://www.compuzone.co.kr/main/main.htm">
                                                <h1>compuzone</h1>
                                        </a></div>


                                <!-- search_wrap -->
                                <div class="search_wrap">
                                        <div class="search_area search_box">
                                                <input type="text" class="sch_txet" name="HeadSearchKeyword"
                                                        id="HeadSearchKeyword" maxlength="40" autocomplete="off"
                                                        onKeyDown="return clearBg('HeadSearchKeyword');"
                                                        onMouseDown="return clearBg('HeadSearchKeyword');"
                                                        onblur="return_search_txt('HeadSearchKeyword');"
                                                        onKeyPress="if(event.keyCode == '13') searchr('HeadSearchKeyword');"
                                                        value='' style='color:#8e8e8e;'>
                                                <a href="javascript:searchr('HeadSearchKeyword');">
                                                        <div class="sch_btn">검색</div>
                                                </a>
                                        </div>

                                        <!-- autocomplete -->
                                        <div class="search_dropbox jqClsAutoCmpWrap" style="display:none;">
                                                <ul></ul>
                                                <div class="search_bottom">
                                                        <div class="right"><a href="javascript:void(0);"
                                                                        onclick="sch_lyr_cls();">닫기</a></div>
                                                </div>
                                        </div>
                                        <!-- //autocomplete -->

                                        <!-- search_dropbox -->
                                        <div class="search_dropbox jqClsRecentWrap" style='display:none;'>
                                                <div class="jqClsRecentWordWrap listnone">최근 검색 내역이 없습니다.</div>
                                                <div class="search_bottom">
                                                        <div class="left">
                                                                <a href="javascript:void(0);"
                                                                        onclick="del_cook_word('clear','','');"
                                                                        class="search_del">최근 검색어 전체 삭제</a>
                                                        </div>
                                                        <div class="right"><a href="javascript:void(0);"
                                                                        onclick="sch_lyr_cls();">닫기</a></div>
                                                </div>
                                        </div>
                                        <!-- //search_dropbox -->

                                </div>
                                <!-- //search_wrap -->
                                <!-- recommend_wrap -->
                                <div class="recommend_wrap">
                                        <div class="ink_cable_iconbox">
                                                <a href="http://www.compuzone.co.kr/early_cable/early_cable.htm"
                                                        class="" title="케이블검색"><span class="cable_icon"></span></a>
                                                <a href="http://www.compuzone.co.kr/search/search_printer.htm" class=""
                                                        title="잉크토너검색"><span class="ink_icon"></span></a>
                                        </div>
                                        <div class="recommend_list">
                                                <ul>
                                                        <li><a href="//www.compuzone.co.kr/event_zone/eventzone_view.htm?EventNo=25553&bannerid=RecomSearchTerm">서피스★단독혜택</a>
                                                        </li>
                                                        <li><a href="//www.compuzone.co.kr/event_zone/eventzone_view.htm?EventNo=25274&bannerid=RecomSearchTerm">Dark
                                                                        Flash 5월 찬스!</a></li>
                                                        <li><a href="//www.compuzone.co.kr/event_zone/eventzone_view.htm?EventNo=25287&bannerid=RecomSearchTerm">효율UP
                                                                        뉴랜드 스캐너</a></li>
                                                </ul>
                                        </div>
                                </div>
                                <!-- //recommend_wrap -->

                                <!-- sta_rolling_banner -->
                                <div class="sta_rolling_banner">
                                        <div class="top_bnr_container" style="width:100%;height:100%;">
                                                <a href="//www.compuzone.co.kr/event_zone/eventzone_view.htm?EventNo=25299&bannerid=TopRightRollingBanner"
                                                        style="display:none;"><img
                                                                src="http://image5.compuzone.co.kr/img/images/main2014/H/TopRightRollingBanner_59916.jpg"
                                                                alt="우측 상단 배너"></a>
                                                <a href="//www.compuzone.co.kr/event_zone/eventzone_view.htm?EventNo=25237&bannerid=TopRightRollingBanner"
                                                        style="display:none;"><img
                                                                src="http://image5.compuzone.co.kr/img/images/main2014/H/TopRightRollingBanner_59959.jpg"
                                                                alt="우측 상단 배너"></a>
                                                <a href="//www.compuzone.co.kr/event_zone/eventzone_view.htm?EventNo=25359&bannerid=TopRightRollingBanner"
                                                        style="display:none;"><img
                                                                src="http://image5.compuzone.co.kr/img/images/main2014/H/TopRightRollingBanner_60141.jpg"
                                                                alt="우측 상단 배너"></a>
                                                <a href="//www.compuzone.co.kr/event_zone/eventzone_view.htm?EventNo=25130&bannerid=TopRightRollingBanner"
                                                        style="display:none;"><img
                                                                src="http://image5.compuzone.co.kr/img/images/main2014/H/TopRightRollingBanner_59604.jpg"
                                                                alt="우측 상단 배너"></a>
                                                <a
                                                        href="//www.compuzone.co.kr/event_zone/eventzone_view.htm?EventNo=25596&bannerid=TopRightRollingBanner"><img
                                                                src="http://image5.compuzone.co.kr/img/images/main2014/H/TopRightRollingBanner_60788.jpg"
                                                                alt="우측 상단 배너"></a>
                                                <a href="//www.compuzone.co.kr/event_zone/eventzone_view.htm?EventNo=25519&bannerid=TopRightRollingBanner"
                                                        style="display:none;"><img
                                                                src="http://image5.compuzone.co.kr/img/images/main2014/H/TopRightRollingBanner_60557.jpg"
                                                                alt="우측 상단 배너"></a>
                                                <a href="//www.compuzone.co.kr/event_zone/eventzone_view.htm?EventNo=25415&bannerid=TopRightRollingBanner"
                                                        style="display:none;"><img
                                                                src="http://image5.compuzone.co.kr/img/images/main2014/H/TopRightRollingBanner_60352.jpg"
                                                                alt="우측 상단 배너"></a>
                                                <a href="//www.compuzone.co.kr/event_zone/eventzone_view.htm?EventNo=25347&bannerid=TopRightRollingBanner"
                                                        style="display:none;"><img
                                                                src="http://image5.compuzone.co.kr/img/images/main2014/H/TopRightRollingBanner_60166.jpg"
                                                                alt="우측 상단 배너"></a>
                                        </div>
                                        <div class="bnr_paging"><a href="#"
                                                        class="small_rolling_prev head_rolling_prev">이전 배너 보기</a><a
                                                        href="#" class="small_rolling_next head_rolling_next">다음 배너
                                                        보기</a></div>
                                        <input type='hidden' id='top_bnr_rand_num' value='5' />
                                        <!-- include/top_bottom_head.htm 에서 사용 -->
                                </div>
                                <!-- //sta_rolling_banner -->

                        </div>
                        <!-- //sta -->
                </div>
                <!-- //cpz_inner -->

       

</body>

</html>