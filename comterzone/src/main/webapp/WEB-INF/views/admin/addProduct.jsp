<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html
    PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko">
<head>

<title>Admin</title>
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.9/dist/css/bootstrap-select.min.css">
		<!-- Popper JS -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		<!-- fontawesome codekey -->
		<script src="https://kit.fontawesome.com/e8cca40fcd.js"
			crossorigin="anonymous"></script>
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
		<script src="${path }/resources/js/service/HuskyEZCreator.js"></script>
		<link rel="stylesheet" href="${path }/resources/css/admin.css">
			<link rel="stylesheet"
				href="${path }/resources/css/src/adminWidth.css">
</head>

<body>

	<div id="wrap" class="">

		<hr class="layout" />
		<div id="container">
			<!--  class="snbHidden" -->
			<div id="sidebar">

				<!-- LNB Start -->
				<div class="snbArea">
					<ul id="snb">
						<li class="depth1 expandable "><a id="" href="#none"
							targetframe="F"> 상품관리 </a>
							<ul>
								<li class=""><a id="" href=""> 상품 등록 </a></li>
								<li class=""><a id="" href="" m> 상품 목록 </a></li>
								<li class=""><a id="" href=""> 상품분류 관리 </a></li>
								<li class=""><a id="" href="" m> 메인진열 관리 </a></li>
							</ul></li>
						<li class="depth1 expandable "><a id="" href="#none">
								주문관리 </a>
							<ul>
								<li class=""><a id="" href=""> 전체주문목록 </a></li>
								<li class=""><a id="" href=""> 배송 관리 </a></li>
								<li class=""><a id="" href=""> 취소/교환/반품/환불 </a></li>
							</ul></li>

					</ul>


				</div>
			</div>




			<style>
#content * {
	/* border: 1px dotted black;
                   box-sizing: border-box; */
	
}

.addProductHead {
	width: 1280px;
	height: 50px;
	background-color: #8b93a9;
}

.addProductHead>span {
	font-size: 16px;
	color: white;
	height: 30px;

	/* text-align: center; */
}

.addProductBody {
	padding: 30px 20px;
	width: 1480px;
	height: auto;
}

.aPBRow>.aPBCol1 {
	display: flex;
	border: 1px solid #DEDEDE;
	padding: 10px 15px;
	font-size: 14px;
	height: 53px;
	width: 189px;
	background-color: #f3f3f3;
}

.aPBRow>.aPBCol2 {
	display: flex;
	align-items: flex-end;
	border: 1px solid #DEDEDE;
	padding: 10px 15px;
	font-size: 14px;
	height: 53px;
	width: 1048px;
	background-color: white;
}

.aPBRow label>span {
	font-size: 12px;
}

.aPBRow>.aPBCol2 .input-L {
	width: 500px;
	height: 32px;
}

.aPBRow>.aPBCol2 .input-M {
	width: 150px;
	height: 32px;
}

.aPBRow>.aPBCol2 a {
	display: inline-block;
	line-height: 28px;
	font-size: 13px;
	width: 74px;
	height: 28px;
	padding-left: 10px;
	border: 1px solid #98989b;
}

.aPBRow>.aPBCol2 label {
	margin-left: 10px;
	align-self: center;
}

.aPBRow>.aPBCol2 a {
	margin-left: 10px;
	align-self: center;
}

.recom-sz {
	color: #97989B;
}
</style>

			<form action="">



				<div id="content">

					<h1>상품 등록</h1>

					<div id="" class="d-flex align-items-center addProductHead ">
						<span class="d-block ml-3">기본 정보</span>
					</div>
					<div id="" class="addProductBody">
						<ul>
							<li>
								<div class="w-100 d-flex aPBRow">
									<div class="aPBCol1">
										<label for="" class="font-weight-bold">카테고리<span
											class="text-primary">(필수)</span>
										</label>
									</div>
									<div class="aPBCol2">

										<div id="cateCon">
											<c:if test="${categorys != null && categorys.size() > 0 }">
												<c:forEach items="${categorys }" var="category"
													varStatus="i">
														
															<select id="level${i.index }" list="data${i.index }">
														</select>
														
														<datalist id="data${i.index }"> 
														<c:forEach items="${category.getValue()}" var="item" varStatus="k">
															<option value="${k.index }" >${k.index }</option>
														</c:forEach> 
														</datalist>

														
														
														
														
												</c:forEach>
											</c:if>
										</div>

									</div>


								</div>

							</li>
							<li>
								<div class="w-100 d-flex aPBRow">
									<div class="aPBCol1">
										<label for="" class="font-weight-bold">상품명<span
											class="text-primary">(필수)</span>
										</label>
									</div>
									<div class="aPBCol2">
										<input id="" class="input-L" type="text"
											placeholder="예시) 라이젠 CPU"> <label class="" for="">[<strong
												class="text-primary">0</strong>/250]
										</label>
									</div>


								</div>

							</li>
							<li>
								<div class="w-100 d-flex aPBRow">
									<div class="aPBCol1">
										<label for="" class="font-weight-bold">판매가<span
											class="text-primary">(필수)</span>
										</label>
									</div>
									<div class="aPBCol2">
										<input id="" class="input-M" type="number" placeholder="">
											<label class="" for=""><strong class="text-primary"></strong>원</label>
									</div>


								</div>

							</li>
							<li>
								<div class="w-100 d-flex aPBRow">
									<div class="aPBCol1">
										<label for="" class="font-weight-bold">자체 상품코드<span
											class="text-primary"></span>
										</label>
									</div>
									<div class="aPBCol2">
										<input id="" class="input-M" type="number" placeholder="">
											<a href=""><span style="">중복확인</span></a> <label class=""
											for="">[<strong class="text-primary">0</strong>/40]
										</label>
									</div>


								</div>

							</li>
							<li>
								<div class="w-100 d-flex aPBRow">
									<div class="aPBCol1" style="height: auto;">
										<label for="" class="font-weight-bold">상품 상세설명<span
											class="text-primary"></span>
										</label>
									</div>
									<div class="aPBCol2" style="height: auto;">
										<textarea name="ir1" id="ir1" rows="10" cols="100">
                                    </textarea>
									</div>


								</div>

							</li>
							<li>
								<div class="w-100 d-flex aPBRow">
									<div class="aPBCol1" style="height: auto;">
										<label for="" class="font-weight-bold">이미지<span
											class="text-primary"></span>
										</label>
									</div>
									<div class="aPBCol2" style="height: auto;">
										<div style="padding-right: 15px;">
											<span>대표이미지</span>
											<div
												style="width: 268px; height: 268px; border: 1px solid #DEDEDE; position: relative;">
												<input type="file"
													style="width: 100%; height: 100%; opacity: 0;"> <i
													style="pointer-events: none; position: absolute; left: 134px; top: 134px; transform: translateX(-50%) translateY(-50%);"
													class="fas fa-plus"></i>
											</div>
											<span class="recom-sz">- 권장 사이즈 : 500px * 500px</span>
										</div>
										<div
											style="width: 741.33px; height: 350.67px; border-left: 1px solid #DEDEDE; padding-left: 15px;">
											<span style="display: block; margin-bottom: 10px;">추가
												이미지[<strong class="text-primary">1</strong>/20]
											</span>
											<div
												style="width: 100px; height: 100px; border: 1px solid #DEDEDE; position: relative;">
												<input type="file"
													style="width: 100%; height: 100%; opacity: 0;"> <i
													style="pointer-events: none; position: absolute; left: 50px; top: 50px; transform: translateX(-50%) translateY(-50%);"
													class="fas fa-plus"></i>
											</div>
											<span style="display: block;" class="recom-sz">- 권장이미지
												: 500px * 500px / 1M 이하 / gif, png, jpg(jpeg) / 20개까지 추가 가능
											</span>
										</div>
									</div>


								</div>

							</li>
						</ul>
					</div>




				</div>
		</div>
	</div>

	</form>



	<script>
		// 스마트 에디터
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1",
			sSkinURI : "${path}/resources/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});

		$(function() {
			$("#snb > li > a").on("click", function() {
				console.log($(this).next().css("display"));
				let ul = $(this).next().css("display");
				if (ul == 'none') {
					$(this).next().css("display", "block");
				} else {
					$(this).next().css("display", "none");
				}

			});
			
			
			
			
		});
		
	</script>
</body>

</html>