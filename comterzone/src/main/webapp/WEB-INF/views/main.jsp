<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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
    <script src="resources/js/src/jquery.cookie.js"></script>
    <!-- lazyload -->
    <script src="resources/js/src/lazyload.min.js"></script>
    <!-- jquery-ui -->
    <script src="resources/js/src/jquery-ui-1.9.2.custom.min.js"></script>]
    <link rel="stylesheet" href="resources/css/src/jquery-ui-1.8.17.custom.css">
    <!-- jquery.slides -->
    <script src="resources/js/src/jquery.slides.min-3.js"></script>
    <!-- slick -->
    <script src="resources/js/src/slick-1.8.0.js"></script>
    <link rel="stylesheet" href="resources/css/src/slick-1.8.1.css">
    <link rel="stylesheet" href="resources/css/src/slick-theme-1.8.1.css">
    <!-- nanoscroller -->
    <script src="resources/js/src/jquery.nanoscroller.min.js"></script>
    <link rel="stylesheet" href="resources/css/src/jquery.nanoscroller.css">
    <style>
        @media screen and (min-width: 576px) {
            .container-fluid {
                width: 1336px;
            }
        }

        @media screen and (min-width: 768px) {
            .container-fluid {
                width: 1336px;
            }
        }

        @media screen and (min-width: 992px) {
            .container-fluid {
                width: 1336px;
            }
        }

        @media screen and (min-width: 1400px) {
            .container-fluid {
                width: 1336px;
            }
        }

        body,
        input,
        textarea,
        select,
        button,
        table {
            font-family: '맑은고딕', malgun gothic, '돋움', Dotum, AppleGothic, sans-serif;
            font-size: 12px;
        }

        header {
            border: 2px solid red;
            box-sizing: border-box;
            height: 150px;
        }

        section {
            border: 2px solid green;
            box-sizing: border-box;
            height: 500px
        }

        footer {
            border: 2px solid blue;
            box-sizing: border-box;

            height: 200px;
        }
    </style>
    <!-- top_menu -->
    <link rel="stylesheet" href="resources/css/top_menu.css">
    <script src="resources/js/top_menu.js"></script>
    <!-- category_menu -->
    <link rel="stylesheet" href="resources/css/category_menu.css">

    <script src="resources/js/compuzone.js"></script>
</head>

<body>

    <style>
        /* Common */
body,p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,input,textare a,button,select{margin:0;padding:0}
body,input,textarea,select,button,table{font-family:'맑은고딕',malgun gothic,'돋움',Dotum,AppleGothic,sans- serif;font-size:12px}
img,fieldset,button{border:0}
ul,ol{list-style:none}
em,address{font-style:normal}
button,label{cursor:pointer}

a{text-decoration:none}
a:hover,a:active,a:focus{text-decoration:underline}
a:link { text-decoration: none; color: #6b6b6b; }
a:visited { text-decoration: none; color: #6b6b6b; }
a:hover { text-decoration: underline; color: #6b6b6b; }
a:active { text-decoration: none; color: #6b6b6b; }


/* Layout */
#wrap{width:100%;}
.cpz_inner{width:1300px; margin:0 auto; position:relative; display:block; } /* 카테고리 그룹 영역 좌측 카테고리 스크롤 위치 틀어짐으로 인한 style 추가 191115 bom :: overflow:hidden; */



/*  */
.blind{overflow:hidden;position:absolute;width:1px;height:1px;margin:-1px;padding:0;border:0;line-height:0;white-space:normal;word-wrap:break-word;word-break:break-all;clip:rect(0,0,0,0)}
.blind:before{display:block;width:0;height:0;font-size:0;content:'\00a0'}
caption.blind{position:static;margin:-1px 0 0;*height:0}
caption.blind:before{display:none}
caption .blind{position:static}
caption .blind:before{display:none}



</style>

    <header class="container-fluid">
        <!-- cpz_gnb -->
        <div class="cpz_gnb">
            <!-- cpz_gnb_list -->
            <div class="cpz_gnb_list">
                    <div class="left">
                            <ul class="gateway">
                                    <li class="compuzone">컴터존</li>
                            </ul>
                    </div>
                    <div class="right">
                            <ul>
                                    <li><a href="javascript:login();">로그인</a></li>
                                    <li><a href="https://www.compuzone.co.kr/member/member_kind.htm"
                                                    title="회원가입">회원가입</a></li>
                                    <li>
                                            <a
                                                    href="https://www.compuzone.co.kr/login/login.htm?base=https://www.compuzone.co.kr/mypage/mypage_main.htm">마이페이지<span
                                                            class="down_arrow"></span></a>
                                            <span class="mapage_menu">
                                                    <ul>
                                                            <li><a href="https://www.compuzone.co.kr/login/login.htm?base=https://www.compuzone.co.kr/mypage/order_list.htm">주문/배송
                                                                            조회</a></li>
                                                            <li><a href="https://www.compuzone.co.kr/login/login.htm?base=../mypage/as_list.htm">A/S·반품조회</a>
                                                            </li>
                                                            <li><a href="https://www.compuzone.co.kr/login/login.htm?base=../mypage/my_point.htm?TabType=buy">적립금·쿠폰</a>
                                                            </li>
                                                            <li><a href="https://www.compuzone.co.kr/login/login.htm?base=../mypage/consult_list_nomember.htm">비회원
                                                                            상담</a></li>
                                                            <li><a href="https://www.compuzone.co.kr/login/login.htm?base=https://www.compuzone.co.kr/mypage/mypage_main.htm?open_info=Y">정보관리</a>
                                                            </li>
                                                    </ul>
                                            </span>
                                    </li>
                                    <li><a href="http://www.compuzone.co.kr/bsk/basket_main.htm">장바구니</a></li>
                            </ul>
                    </div>
            </div>
            <!-- //cpz_gnb_list -->
    </div>
    <!-- //cpz_gnb -->




    <!-- 기본 lnb-->
    <div class="cpz_lnb_wrap">
        <div class="cpz_inner">
                <!--카테고리 전체보기 아이콘 -->
                <div class="cpz_cate_all">
                        <button type="button" class="cpz_open_btn" id="defCateBtn">
                                <!--카테고리 전체보기 아이콘 클릭시 on 클래스 추가 -->
                                <span class="blind">통합 카테고리 보기</span>
                                <span class="cpz_ico_menu"><em class="l1">&nbsp;</em></span>
                        </button>
                        <div class="cpz_category_layer " style=""><span class="cozM_bg"></span><button
                                        class="cate_close_btn"></button>
                                <div class="nano">
                                        <div class="nano-content">
                                                <div class="category_set_area">
                                                        <div class="first_cate_area">
                                                                <ul class="f_cate_list">
                                                                        <li class="BigDivLi" id="BigDivLi_1"><a
                                                                                        href="/product/productB_new_list.htm?BigDivNo=1"
                                                                                        class="witharrow ">데스크탑</a>
                                                                        </li>

                                                                        <div class="second_cate_area BigDivLi_1"
                                                                                style="display:none;"><span
                                                                                        class="cate_divide_line"></span><strong>데스크탑</strong>
                                                                                <div class="s_cate_list">
                                                                                        <ul
                                                                                                class="second_border">
                                                        
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1002">
                                                                                                        <a href="/product/recommend_list.htm"
                                                                                                                class=" ">추천조립PC</a>
                                                                                                        <!-- <div
                                                                                                                class="third_cate_area MediumDivLi_1002">
                                                                                                                <ul
                                                                                                                        class="t_cate_list">
                                                                                                                        <li><a href="/product/recommend_list.htm?rtq=3423_60230"
                                                                                                                                        class="">사무용추천PC</a>
                                                                                                                        </li>
                                                                                                                        <li><a href="/product/recommend_list.htm?rtq=3423_60241"
                                                                                                                                        class="">게이밍추천PC
                                                                                                                                        (i3/라이젠3)</a>
                                                                                                                        </li>
                                                                                                                        <li><a href="/product/recommend_list.htm?rtq=3423_60242"
                                                                                                                                        class="">게이밍추천PC
                                                                                                                                        (i5/라이젠5)</a>
                                                                                                                        </li>
                                                                                                                        <li><a href="/product/recommend_list.htm?rtq=3423_60243"
                                                                                                                                        class="">게이밍추천PC
                                                                                                                                        (i7/라이젠7)</a>
                                                                                                                        </li>
                                                                                                                        <li><a href="/product/recommend_list.htm?rtq=3423_60244"
                                                                                                                                        class="">게이밍추천PC
                                                                                                                                        (i9/라이젠9)</a>
                                                                                                                        </li>
                                                                                                                        <li><a href="/product/recommend_list.htm?rtq=3423_60245"
                                                                                                                                        class="">이미지/영상편집</a>
                                                                                                                        </li>
                                                                                                                </ul>
                                                                                                                <span
                                                                                                                        class="t_cate_commercial"><span
                                                                                                                                onclick="javascript:location.href='http://www.compuzone.co.kr/event_zone/eventzone_view.htm?EventNo=25578'">INTEL
                                                                                                                                방송용
                                                                                                                                PC<br></span></span><span
                                                                                                                        class="t_cate_commercial"><span
                                                                                                                                onclick="javascript:location.href='http://www.compuzone.co.kr/event_zone/eventzone_view.htm?EventNo=25579'">AMD
                                                                                                                                방송용
                                                                                                                                PC<br></span></span>
                                                                                                        </div> -->
                                                                                                </li>
                                                                                               
                                                                                        </ul>
                                                                                        
                                                                                </div>
                                                                        </div>

                                                                        <li class="BigDivLi" id="BigDivLi_2"><a
                                                                                        href="/product/productB_new_list.htm?BigDivNo=2"
                                                                                        class="witharrow ">노트북</a>
                                                                        </li>
                                                                        <div class="second_cate_area BigDivLi_2"
                                                                                style="display:none;"><span
                                                                                        class="cate_divide_line"></span><strong>노트북</strong>
                                                                                <div class="s_cate_list">
                                                                                        <ul
                                                                                                class="second_border">
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1007">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=2&MediumDivNo=1007"
                                                                                                                class="">삼성전자</a>
                                                                                                        
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1205">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=2&MediumDivNo=1205"
                                                                                                                class=" ">LG전자</a>
                                                                                                        
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1076">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=2&MediumDivNo=1076"
                                                                                                                class=" ">애플</a>
                                                                                                        
                                                                                                </li>
                                                                                               
                                                                                                
                                                                                        </ul>
                                                                                        
                                                                                </div>
                                                                        </div>
                                                                        
                                                                        <li class="BigDivLi" id="BigDivLi_4"><a
                                                                                        href="/product/productB_new_list.htm?BigDivNo=4"
                                                                                        class="witharrow ">컴퓨터
                                                                                        부품</a></li>
                                                                        <div class="second_cate_area BigDivLi_4"
                                                                                style="display:none;"><span
                                                                                        class="cate_divide_line"></span><strong>컴퓨터
                                                                                        부품</strong>
                                                                                <div class="s_cate_list">
                                                                                        <ul
                                                                                                class="second_border">
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1012">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=4&MediumDivNo=1012"
                                                                                                                class=" ">CPU</a>
                                                                                                        
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1013">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=4&MediumDivNo=1013"
                                                                                                                class=" ">메인보드</a>
                                                                                                       
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1014">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=4&MediumDivNo=1014"
                                                                                                                class=" ">메모리</a>
                                                                                                        
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1276">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=4&MediumDivNo=1276"
                                                                                                                class=" ">SSD</a>
                                                                                                        
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1015">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=4&MediumDivNo=1015"
                                                                                                                class=" ">HDD</a>
                                                                                                        
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1016">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=4&MediumDivNo=1016"
                                                                                                                class=" ">그래픽카드</a>
                                                                                                        
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1017">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=4&MediumDivNo=1017"
                                                                                                                class=" ">ODD</a>
                                                                                                       
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1147">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=4&MediumDivNo=1147"
                                                                                                                class=" ">케이스</a>
                                                                                                        
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1148">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=4&MediumDivNo=1148"
                                                                                                                class=" ">파워</a>
                                                                                                       
                                                                                                </li>
                                                                                                
                                                                                        </ul>
                                                                                        
                                                                                </div>
                                                                        </div>
                                                                       
                                                                        <li class="BigDivLi" id="BigDivLi_5"><a
                                                                                        href="/product/productB_new_list.htm?BigDivNo=5"
                                                                                        class="witharrow ">모니터</a>
                                                                        </li>
                                                                        <div class="second_cate_area BigDivLi_5"
                                                                                style="display:none;"><span
                                                                                        class="cate_divide_line"></span><strong>모니터</strong>
                                                                                <div class="s_cate_list">
                                                                                        <ul
                                                                                                class="second_border">
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1023">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=5&MediumDivNo=1023"
                                                                                                                class=" ">19형
                                                                                                                이하
                                                                                                                모니터</a>
                                                                                                        
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1025">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=5&MediumDivNo=1025"
                                                                                                                class=" ">20~22형
                                                                                                                모니터</a>
                                                                                                        
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1027">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=5&MediumDivNo=1027"
                                                                                                                class=" ">23~25형
                                                                                                                모니터</a>
                                                                                                        
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1219">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=5&MediumDivNo=1219"
                                                                                                                class=" ">27~31형
                                                                                                                모니터</a>
                                                                                                        
                                                                                                </li>
                                                                                                <li class="MediumDivLi"
                                                                                                        id="MediumDivLi_1228">
                                                                                                        <a href="/product/product_list.htm?BigDivNo=5&MediumDivNo=1228"
                                                                                                                class=" ">32형
                                                                                                                이상
                                                                                                                모니터</a>
                                                                                                        
                                                                                                </li>
                                                                                                
                                                                                                
                                                                                                
                                                                                        </ul>
                                                                                        
                                                                                </div>
                                                                        </div>
                                                                        
                                                                        
                                                                </ul>
                                                                </li>
                                                                </li>
                                                                
                                                        </div>
                                                </div>
                                        </div>
                                </div>
                        </div>
                </div>
                <!-- ### 카테고리 펼침 (대분류+중분류+소분류) 끝 ### -->
                <!-- lnb_menu_box -->
                <div class="lnb_menu_box">
                        <ul>
                                <li><a href="http://www.compuzone.co.kr/hotsale/hotsale.htm">파격할인</a></li>
                                <li><a href="http://www.compuzone.co.kr/online/online_main.htm">온라인견적</a></li>
                                <!-- <li class="add_arrow"><a href="javascript:void(0);">조립PC</a>
                                        <span class="lnb_dropbox">
                                                <ul class="dropbox_list menuCtgrLayer">
                                                        <li><a href="http://www.compuzone.co.kr/product/recommend_list.htm">추천조립PC</a>
                                                        </li>
                                                        <li><a href="http://www.compuzone.co.kr/estimate/compatibility.htm">조립PC견적</a>
                                                        </li>
                                                </ul>
                                        </span>
                                </li> -->
                                <li><a href="http://www.compuzone.co.kr/community/community_main.htm">커뮤니티</a>
                                </li>
                        </ul>
                </div><!-- //lnb_menu_box" -->

                <!-- right_commercial -->
                <div class="right_commercial">
                        <ul>
                                


                                <!-- popular_words_area -->
                                <li class="popular_words_area">
                                        <div id="" class="pwords_slide">
                                                <div class="pwords_rank">
                                                        <div class="pwords_rank_cont">
                                                                <div class=""
                                                                        style="max-width: 100%; margin: 0px auto;">
                                                                        <div class=""
                                                                                style="width: 100%; overflow: hidden; position: relative; height: 45px;">

                                                                                <ul class="pwords_rank_lst pwords_slider"
                                                                                        id="pwords_slider"
                                                                                        style="width: auto; position: relative; ">

                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('10900k','1')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">1.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">10900k</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>1</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('10700k','2')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">2.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">10700k</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>15</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('2070 super','3')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">3.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">2070
                                                                                                                super</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>121</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('z490','4')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">4.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">z490</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>32</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('CRAS C710','5')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">5.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">CRAS
                                                                                                                C710</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>78</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('10세대','6')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">6.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">10세대</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>65</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('10900','7')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">7.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">10900</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('2080 super','8')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">8.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">2080
                                                                                                                super</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('10400','9')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">9.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">10400</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>21</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('10700','10')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">10.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">10700</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('인텔 10세대','11')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">11.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">인텔
                                                                                                                10세대</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>131</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('코어10세대','12')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">12.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">코어10세대</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>648</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('i9-10900k','13')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">13.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">i9-10900k</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('코멧레이크','14')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">14.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">코멧레이크</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>803</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('ddr3','15')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">15.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">ddr3</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>372</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('재난지원금','16')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">16.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">재난지원금</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>105</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('인텔','17')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">17.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">인텔</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('초특가','18')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">18.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">초특가</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>108</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('led 후레쉬','19')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">19.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">led
                                                                                                                후레쉬</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li class="pwords_rank_item slide_li"
                                                                                                style="">
                                                                                                <a href="javascript:sch_rank_word('미니앰프','20')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">20.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">미니앰프</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                </ul>
                                                                        </div>
                                                                </div>
                                                        </div>
                                                </div>

                                                <!-- pwords_lyrbox -->
                                                <div class="pwords_lyrbox" style="">
                                                        <div class="pwords_lyr_cont">
                                                                <strong>급상승 검색어</strong>
                                                                <ul class="pwords_lyr_tab">
                                                                        <li class="pwords_tab pwords_tab_1 on"
                                                                                onclick="pwordsTab('pwords_tab_1')">
                                                                                <button type="button" class=""
                                                                                        role="tab"
                                                                                        style="border-right:none;"
                                                                                        onclick="pwordsTab('pwords_tab_1')"><span
                                                                                                class="rank_tab_tx">1~10위</span></button>
                                                                        </li>
                                                                        <li class="pwords_tab pwords_tab_2"
                                                                                onclick="pwordsTab('pwords_tab_2')">
                                                                                <button type="button" class=""
                                                                                        role="tab"><span
                                                                                                class="rank_tab_tx"
                                                                                                onclick="pwordsTab('pwords_tab_2')">11~20위</span></button>
                                                                        </li>
                                                                </ul>
                                                                <div class="pwords_lyr_scont">
                                                                        <div class="pwords_lyr_panel pwords_tab pwords_tab_1 on"
                                                                                role="tabpanel">
                                                                                <ul class="pwords_rank_lst">
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('10900k','1')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">1.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">10900k</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>1</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('10700k','2')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">2.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">10700k</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>15</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('2070 super','3')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">3.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">2070
                                                                                                                super</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>121</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('z490','4')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">4.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">z490</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>32</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('CRAS C710','5')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">5.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">CRAS
                                                                                                                C710</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>78</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('10세대','6')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">6.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">10세대</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>65</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('10900','7')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">7.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">10900</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('2080 super','8')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">8.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">2080
                                                                                                                super</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('10400','9')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">9.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">10400</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>21</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('10700','10')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">10.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">10700</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                </ul>
                                                                        </div>
                                                                        <div class="pwords_lyr_panel pwords_tab pwords_tab_2"
                                                                                role="tabpanel">
                                                                                <ul class="pwords_rank_lst">
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('인텔 10세대','11')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">11.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">인텔
                                                                                                                10세대</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>131</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('코어10세대','12')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">12.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">코어10세대</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>648</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('i9-10900k','13')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">13.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">i9-10900k</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('코멧레이크','14')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">14.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">코멧레이크</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>803</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('ddr3','15')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">15.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">ddr3</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>372</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('재난지원금','16')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">16.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">재난지원금</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>105</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('인텔','17')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">17.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">인텔</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('초특가','18')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">18.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">초특가</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class="pwords_rank_up"><i>108</i>↑</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('led 후레쉬','19')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">19.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">led
                                                                                                                후레쉬</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                        <li
                                                                                                class="pwords_rank_item">
                                                                                                <a href="javascript:sch_rank_word('미니앰프','20')"
                                                                                                        class="pwords_rank_link">
                                                                                                        <span
                                                                                                                class="pwords_rank_num">20.</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_tx">미니앰프</span>
                                                                                                        <span
                                                                                                                class="pwords_rank_state">
                                                                                                                <span
                                                                                                                        class=" pwords_rank_new">NEW</span>
                                                                                                        </span>
                                                                                                </a>
                                                                                        </li>
                                                                                </ul>
                                                                        </div>
                                                                </div>
                                                        </div>
                                                </div><!-- //pwords_lyrbox -->
                                        </div><!-- //pwords_rank-->

                                </li><!-- //popular_words_area -->
                        </ul>
                </div>
        </div>
</div><!-- //기본 lnb-->


    

    </header>

    <section class="container-fluid">

    </section>

    <footer class="container-fluid p-0">

        <style>
            #companyMenu a{
                text-decoration: none;
                color: black;
            }
        </style>
        <div id="companyMenu" class="d-flex w-100 mt-3"
        style="border-bottom: 1px solid #e5e5e5;height: 40px;">
            <a class="d-block mr-2" href="">회사소개</a>
            <a class="d-block mr-2" href="">이용약관</a>
            <a class="d-block mr-2" href="">입점문의</a>
            <a class="d-block mr-2" href="">개인정보처리방침</a>
            <a class="d-block mr-2" href="">협력사</a>
            <a class="d-block mr-2" href="">광고안내</a>
            <a class="d-block " href="">찾아오시는길</a>
        </div>
        <div id="companyInfo" class="mt-3">
            <span>㈜<b>컴터존</b> 대표이사 : 홍길동 | 사업자등록번호 ㅣ 106-81-83458 </span><button style="background-color: white; border: 1px solid #e5e5e5;">사업자정보확인</button><br>
            <span>서울특별시 용산구 원효로 58길 1 | 이메일주소 무단수집거부 : coz_help@comterzone.co.kr | 호스팅 제공자 : ㈜컴터존 | 개인정보책임관리자 : 홍길동</span><br>
            <span>통신판매업신고 : 용산 제 00417호 ｜ 분쟁조정기관 : 소비자보호원, 전자거래분쟁중재위원회｜ 에스크로 구매안전 서비스 이용가능</span><button style="background-color: white; border: 1px solid #e5e5e5;">자세히보기</button><br>
            <span>[방문상담·구매·A/S] 용산점: 서울시 용산구 원효로 58길 1/가산점:서울시 금천구 가산로 9길 87</span><button style="background-color: white; border: 1px solid #e5e5e5;">영업시간 안내</button><br>
            <span>[택배A/S접수] 서울시 용산구 원효로2가 50번지 ｜ [고객센터] 1588-8377 (팩스번호 02-718-8276)</span><button style="background-color: white; border: 1px solid #e5e5e5;">1:1문의하기</button><br>
        </div>
    </footer>


</body>

</html>