<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리 페이지</title>
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
    <!-- <script src="https://kit.fontawesome.com/e8cca40fcd.js" crossorigin="anonymous"></script> -->
    <!-- jquery.cookie -->
    <!-- <script src="js/src/jquery.cookie.js"></script> -->
    <!-- lazyload -->
    <!-- <script src="js/src/lazyload.min.js"></script> -->
    <!-- jquery-ui -->
    <!-- <script src="js/src/jquery-ui-1.9.2.custom.min.js"></script>]
    <link rel="stylesheet" href="css/src/jquery-ui-1.8.17.custom.css"> -->
    <!-- jquery.slides -->
    <!-- <script src="js/src/jquery.slides.min-3.js"></script> -->
    <!-- slick -->
    <!-- <script src="js/src/slick-1.8.0.js"></script>
    <link rel="stylesheet" href="css/src/slick-1.8.1.css">
    <link rel="stylesheet" href="css/src/slick-theme-1.8.1.css"> -->
    <!-- nanoscroller -->
    <!-- <script src="js/src/jquery.nanoscroller.min.js"></script>
    <link rel="stylesheet" href="css/src/jquery.nanoscroller.css"> -->
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

    <link rel="stylesheet" href="${path}/resources/css/admin.css">
    <link rel="stylesheet" href="${path}/resources/css/src/adminWidth.css">


</head>




<body>


    <div id="wrap" class="">
        <div id="header">
        </div><!-- //header -->
        <hr class="layout" />
        <div id="container">
            <!--  class="snbHidden" -->
            <div id="sidebar">

                <!-- LNB Start -->
                <div class="snbArea">
                    <ul id="snb">
                        <li class="depth1 expandable ">
                            <a id="" href="javascript:void(0)" targetframe="F">
                                상품관리 </a>
                            <ul>
                                <li class="">
                                    <a id="" href="${path }/admin/addProduct">
                                        상품 등록 </a>
                                </li>
                                <li class="">
                                    <a id="" href="" m>
                                        상품 목록 </a>
                                </li>
                                <li class="">
                                    <a id="" href="">
                                        상품분류 관리 </a>
                                </li>
                                <li class="">
                                    <a id="" href="" m>
                                        메인진열 관리 </a>
                                </li>
                            </ul>
                        </li>
                        <li class="depth1 expandable ">
                            <a id="" href="#none">
                                주문관리 </a>
                            <ul>
                                <li class="">
                                    <a id="" href="">
                                        전체주문목록 </a>
                                </li>
                                <li class="">
                                    <a id="" href="">
                                        배송 관리 </a>
                                </li>
                                <li class="">
                                    <a id="" href="">
                                        취소/교환/반품/환불 </a>
                                </li>
                            </ul>
                        </li>

                    </ul>


                </div>

                <!-- LNB End -->

            </div>

            <hr class="layout" />

            <!-- Content Start -->
            <!-- [ content ] -->
            <div id="content">
                <div class="gridSet nowrap">
                    <div class="grid">
                        <div class="dashArea">
                            <div class="mTitle">
                                <h2>오늘 매출 현황</h2>
                                <span class="desc">(05월 18일 15:10 기준)</span>
                                <span class="cManual eSmartMode" code="MN"></span>
                            </div>
                            <div class="mDashSales">
                                <a href="" class="item order">
                                    <strong class="title">주문 <span id="orderCount" class="count">(**건)</span></strong>
                                    <span class="data">
                                        <strong id="orderPrice" class="value">**</strong>
                                        <span class="unit">원</span>
                                    </span>
                                </a>
                                <a href="" class="item payment">
                                    <strong class="title">결제 <span id="payedCount" class="count">(**건)</span></strong>
                                    <span class="data">
                                        <strong id="payedPrice" class="value">**</strong>
                                        <span class="unit">원</span>
                                    </span>
                                </a>
                                <a href="" class="item refund">
                                    <strong class="title">환불 <span id="refundCount" class="count">(**건)</span></strong>
                                    <span class="data">
                                        <strong id="refundPrice" class="value">**</strong>
                                        <span class="unit">원</span>
                                    </span>
                                </a>
                            </div>

                            <div class="mTitle">
                                <h2>주문현황</h2>
                                <span class="desc">(최근 1개월 기준)</span>
                            </div>
                            <div class="gridSet">
                                <div class="mDashStatus order">
                                    <a href="" id="no_pay_cnt" class="item">
                                        <strong class="title">입금전</strong>
                                        <span class="count">**</span>
                                    </a>
                                </div>
                                <div class="mDashStatus order">
                                    <a href="" id="is_shipped_f" class="item">
                                        <strong class="title">배송준비중</strong>
                                        <span class="count">**</span>
                                    </a>
                                </div>
                                <div class="mDashStatus order">
                                    <a href="" id="is_shipped_w" class="item">
                                        <strong class="title">배송대기</strong>
                                        <span class="count">**</span>
                                    </a>
                                </div>
                                <div class="mDashStatus order">
                                    <a href="" id="is_shipped_m" class="item">
                                        <strong class="title">배송중</strong>
                                        <span class="count">**</span>
                                    </a>
                                </div>
                            </div>

                            <div class="mTitle">
                                <h2>취소 / 교환 / 반품 / 환불현황</h2>
                                <span class="desc">(최근 1개월 기준)</span>
                            </div>
                            <div class="gridSet">
                                <div class="mDashStatus cs">
                                    <a href="" id="cancel_count" class="item">
                                        <strong class="title">취소</strong>
                                        <span class="count">**</span>
                                    </a>
                                </div>
                                <div class="mDashStatus cs">
                                    <a href="" id="change_count" class="item">
                                        <strong class="title">교환</strong>
                                        <span class="count">**</span>
                                    </a>
                                </div>
                                <div class="mDashStatus cs">
                                    <a href="" id="return_count" class="item">
                                        <strong class="title">반품</strong>
                                        <span class="count">**</span>
                                    </a>
                                </div>
                                <div class="mDashStatus cs">
                                    <a href="" id="before_refund" class="item">
                                        <strong class="title">환불</strong>
                                        <span class="count">**</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
    </div>

    <script>
        $(function(){
            $("#snb > li > a").on("click",function(){
                console.log($(this).next().css("display"));
                let ul = $(this).next().css("display");
                if(ul == 'none'){
                    $(this).next().css("display","block");
                }else{
                    $(this).next().css("display","none");
                }
                
            })
        });
    </script>


</body>

</html>