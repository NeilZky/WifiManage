<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="gbk">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>网址导航</title>
<link rel="stylesheet" href="css/sucPagePC.css" />
<link rel="stylesheet" href="css/nivo-slider.css" />
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/jquery.nivo.slider.js" type="text/javascript"></script>
<script src="assets/js/bootstrap.js"></script>
<link href="assets/css/bootstrap.css" rel="stylesheet" />


</head>
<body class="main">
	<div class="div_main">
		<div class="logo">网址导航</div>
		<div class="div_header">
			<div class="div_search">
				<form action="http://www.baidu.com/s" method="get">
					<div >
						<input name="word" type="text" />
					</div>
					<button type="submit">搜索</button>
				</form>
			</div>
		</div>
		<c:if test="${requestScope.sucPageInfo.navPageTypes !=null }">
			<div class="div_tab">

				<c:forEach items="${requestScope.sucPageInfo.navPageTypes}"
					var="item" varStatus="status">
					<c:if test="${status.index ==0}">
						<div class="tab_item" style="background: #2077ba;">${item.name}</div>
					</c:if>

					<c:if test="${status.index ==1}">
						<div class="tab_item" style="background: #2fa4b6;">${item.name}</div>
					</c:if>

					<c:if test="${status.index ==2}">
						<div class="tab_item" style="background: #fd7335;">${item.name}</div>
					</c:if>
				</c:forEach>
				<p class="clear"></p>
			</div>
		</c:if>

		<c:if test="${requestScope.sucPageInfo.navPageTypes !=null }">
			<c:forEach items="${requestScope.sucPageInfo.navPageTypes}"
				var="item" varStatus="status">

				<c:if test="${status.index == 0 }">
					<div class="tab_content">
				</c:if>
				<c:if test="${status.index >0 }">
					<div class="tab_content" style="display: none;">
				</c:if>

				<c:forEach items="${item.navPages}" var="navPage"
					varStatus="navStatus">
					<div class="nav_item">
						<a href="redirect.action?uid=0&linkType=1&id=${navPage.id }">
							<img src="${navPage.photoUrl }" />
							<div class="text-center" style="font-size: 80%;">${navPage.name }</div>
						</a>
					</div>
				</c:forEach>
				<p class="clear"></p>
	</div>
	</c:forEach>
	</c:if>
	<p class="clear"></p>
	<div id="slider" class="scroll_ad">
		<c:forEach items="${requestScope.sucPageInfo.scrollAds}" var="item">
			<a href="redirect.action?uid=0&linkType=2&id=${item.id }"> <img
				src="${item.photoUrl}" alt="" title="${item.content}" />
			</a>
		</c:forEach>
	</div>
	</div>
	<c:set var="caConfig"
		value="${requestScope.sucPageInfo.commonAreaConfig}" />
	<p class="clear"></p>
	<div class="div_footer">
		<p class="clear"></p>
		<div class="div_common_area">
			<c:forEach items="${requestScope.sucPageInfo.commonAreas}" var="item"
				varStatus="status">
				<c:if test="${status.index%3 == 0}">
					<p class="clear"></p>

				</c:if>
				<div class="common_area_item">
					<c:if test="${fn:substring(caConfig.columnState, 0,1) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c1}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 1,2) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c2}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 2,3) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c3}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 3,4) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c4}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 4,5) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c5}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 5,6) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c6}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 6,7) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c7}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 7,8) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c8}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 8,9) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c9}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 9,10) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c10}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 10,11) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c11}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 11,12) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c12}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 12,13) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c13}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 13,14) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c14}</div>
					</c:if>


					<c:if test="${fn:substring(caConfig.columnState, 14,15) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c15}</div>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 15,16) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c16}</div>
					</c:if>


					<c:if test="${fn:substring(caConfig.columnState, 16,17) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c17}</div>
					</c:if>


					<c:if test="${fn:substring(caConfig.columnState, 17,18) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c18}</div>
					</c:if>


					<c:if test="${fn:substring(caConfig.columnState, 18,19) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c19}</div>
					</c:if>


					<c:if test="${fn:substring(caConfig.columnState, 19,20) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c20}</div>
					</c:if>

					<input class="link" style="display: none;"
						value="redirect.action?&linkType=3&id=${item.id }&uid=${item.uid}" />
					<!--  	<a
						href="redirect.action?&linkType=3&id=${item.id }&uid=${item.uid}"
						style="color: black;">-->

					<div class="common_area_item_content">
						<img style="width: 100%;" src="${item.photoUrl}" />
						<div class="title" style="width: 100%; padding-top: 6px; font-size: 10px;">${item.title}</div>
						<div class="description" style="width: 100%; padding-top: 3px; font-size: 8px;">${item.description}</div>
						<div class="amount"
							style="width: 100%; padding-top: 3px; font-size: 9px; color: #fb5821;">￥${item.amount}</div>
					</div>
					<!-- 
					</a>
					 -->
				</div>
			</c:forEach>
			<p class="clear"></p>
		</div>
		<div
			style="height: 1px; margin-top: -1px; clear: both; overflow: hidden;"></div>

	<c:set var="saConfig"
		value="${requestScope.sucPageInfo.sellerConfig}" />

		<div class="div_common_area">

			<c:forEach items="${requestScope.sucPageInfo.sellerAreas}" var="item"
				varStatus="status">
				<c:if test="${status.index%3 == 0}">
					<div
						style="height: 1px; margin-top: -1px; clear: both; overflow: hidden;"></div>
				</c:if>
				<div class="seller_area_item">
				
				 <c:if test="${fn:substring(saConfig.columnState, 0,1) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c1}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 1,2) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c2}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 2,3) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c3}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 3,4) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c4}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 4,5) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c5}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 5,6) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c6}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 6,7) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c7}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 7,8) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c8}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 8,9) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c9}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 9,10) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c10}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 10,11) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c11}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 11,12) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c12}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 12,13) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c13}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 13,14) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c14}</div>
					</c:if>


					<c:if test="${fn:substring(saConfig.columnState, 14,15) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c15}</div>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 15,16) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c16}</div>
					</c:if>


					<c:if test="${fn:substring(saConfig.columnState, 16,17) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c17}</div>
					</c:if>


					<c:if test="${fn:substring(saConfig.columnState, 17,18) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c18}</div>
					</c:if>


					<c:if test="${fn:substring(saConfig.columnState, 18,19) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c19}</div>
					</c:if>


					<c:if test="${fn:substring(saConfig.columnState, 19,20) == '1'}">
						<div class="common_area_item_data" style="display: none;">${item.c20}</div>
					</c:if>
				
					<input class="link" style="display: none;"
						value="redirect.action?uid=${requestScope.sucPageInfo.uid}&linkType=4&id=${item.id }" />

					<div class="common_area_item_content">
						<img style="width: 100%;" src="${item.photoUrl}" />
						<div class="title" style="width: 100%; padding-top: 6px; font-size: 10px;">${item.title}</div>
						<div class="description" style="width: 100%; padding-top: 3px; font-size: 8px;">${item.description}</div>
						<div class="amount"
							style="width: 100%; padding-top: 3px; font-size: 9px; color: #fb5821;">￥${item.amount}</div>
					</div>
				</div>

			</c:forEach>
			<div
				style="height: 1px; margin-top: -1px; clear: both; overflow: hidden;"></div>
		</div>

		<div
			style="height: 1px; margin-top: -1px; clear: both; overflow: hidden;"></div>
	</div>

	<div class="modal fade" id="commonAreaDialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">商品详情</h4>
				</div>
				<div class="modal-body">
					<a id="caLinkurl"> <img class="center-block" id="caImgSrc"
						src="" style="width: 70%"  />
					</a>
					
					<h4 id="caTitle"></h4>
					<h4 id="caDescription"></h4>
					<h4  id="caAmount" style=" color: #fb5821;"></h4>
					
					<c:if test="${fn:substring(caConfig.columnState, 0,1) == '1'}">
						<h4>${caConfig.l1}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 1,2) == '1'}">
						<h4>${caConfig.l2}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 2,3) == '1'}">
						<h4>${caConfig.l3}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 3,4) == '1'}">
						<h4>${caConfig.l4}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 4,5) == '1'}">
						<h4>${caConfig.l5}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 5,6) == '1'}">
						<h4>${caConfig.l6}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 6,7) == '1'}">
						<h4>${caConfig.l7}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 7,8) == '1'}">
						<h4>${caConfig.l8}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 8,9) == '1'}">
						<h4>${caConfig.l9}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 9,10) == '1'}">
						<h4>${caConfig.l10}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 10,11) == '1'}">
						<h4>${caConfig.l11}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 11,12) == '1'}">
						<h4>${caConfig.l12}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 12,13) == '1'}">
						<h4>${caConfig.l13}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 13,14) == '1'}">
						<h4>${caConfig.l14}</h4>
						<p class="dialogDataItem"></p>
					</c:if>


					<c:if test="${fn:substring(caConfig.columnState, 14,15) == '1'}">
						<h4>${caConfig.l15}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(caConfig.columnState, 15,16) == '1'}">
						<h4>${caConfig.l16}</h4>
						<p class="dialogDataItem"></p>
					</c:if>


					<c:if test="${fn:substring(caConfig.columnState, 16,17) == '1'}">
						<h4>${caConfig.l17}</h4>
						<p class="dialogDataItem"></p>
					</c:if>


					<c:if test="${fn:substring(caConfig.columnState, 17,18) == '1'}">
						<h4>${caConfig.l18}</h4>
						<p class="dialogDataItem"></p>
					</c:if>


					<c:if test="${fn:substring(caConfig.columnState, 18,19) == '1'}">
						<h4>${caConfig.l19}</h4>
						<p class="dialogDataItem"></p>
					</c:if>


					<c:if test="${fn:substring(caConfig.columnState, 19,20) == '1'}">
						<h4>${caConfig.l20}</h4>
						<p class="dialogDataItem"></p>
					</c:if>
				</div>
			</div>
		</div>
	</div>
    <div class="modal fade" id="sellerDialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">商品详情</h4>
				</div>
				<div class="modal-body">
					<a id="saLinkurl"> <img class="center-block" id="saImgSrc"
						src="" style="width: 70%" />
					</a>
					<h4 id="saTitle"></h4>
					<h4 id="saDescription"></h4>
					<h4  id="saAmount" style=" color: #fb5821;"></h4>
					
					<c:if test="${fn:substring(saConfig.columnState, 0,1) == '1'}">
						<h4>${saConfig.l1}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 1,2) == '1'}">
						<h4>${saConfig.l2}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 2,3) == '1'}">
						<h4>${saConfig.l3}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 3,4) == '1'}">
						<h4>${saConfig.l4}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 4,5) == '1'}">
						<h4>${saConfig.l5}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 5,6) == '1'}">
						<h4>${saConfig.l6}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 6,7) == '1'}">
						<h4>${saConfig.l7}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 7,8) == '1'}">
						<h4>${saConfig.l8}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 8,9) == '1'}">
						<h4>${saConfig.l9}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 9,10) == '1'}">
						<h4>${saConfig.l10}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 10,11) == '1'}">
						<h4>${saConfig.l11}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 11,12) == '1'}">
						<h4>${saConfig.l12}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 12,13) == '1'}">
						<h4>${saConfig.l13}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 13,14) == '1'}">
						<h4>${saConfig.l14}</h4>
						<p class="dialogDataItem"></p>
					</c:if>


					<c:if test="${fn:substring(saConfig.columnState, 14,15) == '1'}">
						<h4>${saConfig.l15}</h4>
						<p class="dialogDataItem"></p>
					</c:if>

					<c:if test="${fn:substring(saConfig.columnState, 15,16) == '1'}">
						<h4>${saConfig.l16}</h4>
						<p class="dialogDataItem"></p>
					</c:if>


					<c:if test="${fn:substring(saConfig.columnState, 16,17) == '1'}">
						<h4>${saConfig.l17}</h4>
						<p class="dialogDataItem"></p>
					</c:if>


					<c:if test="${fn:substring(saConfig.columnState, 17,18) == '1'}">
						<h4>${saConfig.l18}</h4>
						<p class="dialogDataItem"></p>
					</c:if>


					<c:if test="${fn:substring(saConfig.columnState, 18,19) == '1'}">
						<h4>${saConfig.l19}</h4>
						<p class="dialogDataItem"></p>
					</c:if>


					<c:if test="${fn:substring(saConfig.columnState, 19,20) == '1'}">
						<h4>${saConfig.l20}</h4>
						<p class="dialogDataItem"></p>
					</c:if>
				</div>
			</div>
		</div>
	</div>


</body>
<script type="text/javascript">
	$('#slider').nivoSlider({
		effect : 'random', //Specify sets like: 'fold,fade,sliceDown'
		animSpeed : 500, //Slide transition speed
		pauseTime : 3000,
		startSlide : 0, //Set starting Slide (0 index)
		directionNav : false, //Next & Prev
		directionNavHide : true, //Only show on hover
		pauseOnHover : false, //Stop animation while hovering
		controlNav : false
	});

	$(document).ready(function() {
		$(".tab_item").click(function() {
			var index = $(".tab_item").index(this);
			$(".tab_content").css("display", "none");
			$($(".tab_content")[index]).css("display", "");

		});
		$(".common_area_item").click(function() {
			var datas = $(this).children(".common_area_item_data");
			var dialogData = $("#commonAreaDialog").find(".dialogDataItem");
			var length = $(datas).length;
			if (datas == null) {
				return;
			}
			var imgSrc = $(this).find("img").attr("src");
			$("#caImgSrc").attr("src", imgSrc);
			var href = $(this).find(".link").val();
			$("#caLinkurl").attr("href", href);
			
			for (var i = 0; i < length; i++) {
				var value = $(datas[i]).html();
				$(dialogData[i]).html(value);
			}
			$("#caTitle").html($(this).find(".title").html());
			$("#caDescription").html($(this).find(".description").html());
			$("#caAmount").html($(this).find(".amount").html());
			$("#commonAreaDialog").modal("show");
		});
		
		$(".seller_area_item").click(function() {
			var datas = $(this).children(".common_area_item_data");
			var dialogData = $("#sellerDialog").find(".dialogDataItem");
			var length = $(datas).length;
			if (datas == null) {
				return;
			}
			var imgSrc = $(this).find("img").attr("src");
			$("#saImgSrc").attr("src", imgSrc);
			var href = $(this).find(".link").val();
			$("#saLinkurl").attr("href", href);
			
			for (var i = 0; i < length; i++) {
				var value = $(datas[i]).html();
				$(dialogData[i]).html(value);
			}
			$("#saTitle").html($(this).find(".title").html());
			$("#saDescription").html($(this).find(".description").html());
			$("#saAmount").html($(this).find(".amount").html());
			$("#sellerDialog").modal("show");
		});
	});
</script>
</html>
