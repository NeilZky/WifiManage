<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<meta charset="gbk">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>网址导航</title>
<link rel="stylesheet" href="css/sucPagePC.css" />
<link rel="stylesheet" href="css/nivo-slider.css" />
<script src="js/jquery-1.11.2.min.js" type="text/javascript"></script>
<script src="js/jquery.nivo.slider.js" type="text/javascript"></script>
</head>
<body>
	<div class="div_main">
		<div class="logo">网址导航</div>
		<div class="div_header">
			<div class="div_search">
				<div class="col-xs-1"></div>
				<form action="http://m.baidu.com/s?from=1010024a" method="get">
					<div class="col-xs-8">
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

				<div class="tab_row">
					<c:forEach items="${item.navPages}" var="navPage"
						varStatus="navStatus">
						<c:if test="${navStatus.index < 6}">
							<div class="nav_item">
								<a href="redirect.action?uid=0&linkType=1&id=${navPage.id }">
									<img src="${navPage.photoUrl }" />
									<div class="text-center" style="font-size: 80%;">${navPage.name }</div>
								</a>
							</div>
						</c:if>
					</c:forEach>
						<p class="clear"></p>
					
				</div>

				<div class="tab_row">
					<c:forEach items="${item.navPages}" var="navPage"
						varStatus="navStatus">
						<c:if test="${navStatus.index >5 && navStatus.index <12 }">
							<div class="nav_item">
								<a href="redirect.action?uid=0&linkType=1&id=${navPage.id }">
									<img src="${navPage.photoUrl }" />
									<div class="text-center" style="font-size: 80%;">${navPage.name }</div>
								</a>
							</div>
						</c:if>
					</c:forEach>
						<p class="clear"></p>
				</div>

				<div class="tab_row">
					<c:forEach items="${item.navPages}" var="navPage"
						varStatus="navStatus">
						<c:if test="${navStatus.index >  11}">
							<div class="nav_item">
								<a href="redirect.action?uid=0&linkType=1&id=${navPage.id }">
									<img src="${navPage.photoUrl }" />
									<div class="text-center" style="font-size: 80%;">${navPage.name }</div>
								</a>
							</div>
						</c:if>
					</c:forEach>
						<p class="clear"></p>
				</div>
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
	<div class="div_footer">
		<div class="div_common_area">
			<c:forEach items="${requestScope.sucPageInfo.commonAreas}" var="item"
				varStatus="status">
				<c:if test="${status.index%3 == 0}">
					<div style="clear: both;"> </div>
				</c:if>
				<div class="common_area_item">
					<a
						href="redirect.action?&linkType=3&id=${item.id }&uid=${item.uid}"
						style="color: black;">
						<div class="common_area_item_content">
							<img style="width: 100%;" src="${item.photoUrl}" />
							<div style="width: 100%; padding-top: 6px; font-size: 10px;">${item.title}</div>
							<div style="width: 100%; padding-top: 3px; font-size: 8px;">${item.description}</div>
							<div
								style="width: 100%; padding-top: 3px; font-size: 9px; color: #fb5821;">￥${item.amount}</div>
						</div>
					</a>
				</div>
			</c:forEach>
			<p class="clear"></p>
		</div>
		<div
			style="height: 1px; margin-top: -1px; clear: both; overflow: hidden;"></div>
		
			<div class="div_common_area">

			<c:forEach items="${requestScope.sucPageInfo.sellerAreas}" var="item"
				varStatus="status">
				<c:if test="${status.index%3 == 0}">
					<div
						style="height: 1px; margin-top: -1px; clear: both; overflow: hidden;"></div>
				</c:if>
				<div class="common_area_item">
					<a
						href="redirect.action?uid=${requestScope.sucPageInfo.uid}&linkType=4&id=${item.id }"
						style="color: black;">
						<div class="common_area_item_content">
							<img style="width: 100%;" src="${item.photoUrl}" />
							<div style="width: 100%; padding-top: 6px; font-size: 10px;">${item.title}</div>
							<div style="width: 100%; padding-top: 3px; font-size: 8px;">${item.description}</div>
							<div
								style="width: 100%; padding-top: 3px; font-size: 9px; color: #fb5821;">￥${item.amount}</div>
						</div>
					</a>
				</div>

			</c:forEach>
			<div
				style="height: 1px; margin-top: -1px; clear: both; overflow: hidden;"></div>
		</div>
		
		<div
			style="height: 1px; margin-top: -1px; clear: both; overflow: hidden;"></div>
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
	});
</script>
</html>
