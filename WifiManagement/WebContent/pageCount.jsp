<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html lang="en">
<head>
<meta charset="utf-8" />
<title>控制台 - Bootstrap后台管理系统模版Ace下载</title>
<meta name="keywords"
	content="Bootstrap模版,Bootstrap模版下载,Bootstrap教程,Bootstrap中文" />
<meta name="description"
	content="站长素材提供Bootstrap模版,Bootstrap教程,Bootstrap中文翻译等相关Bootstrap插件下载" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- basic styles -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="css/jquery.datetimepicker.css" />


<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

<!-- page specific plugin styles -->

<!-- fonts -->

<!--<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />-->

<!-- ace styles -->

<link rel="stylesheet" href="assets/css/ace.min.css" />
<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />
<link rel="stylesheet" href="assets/css/ace-skins.min.css" />

<!--[if lte IE 8]>
		  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->

<script src="assets/js/ace-extra.min.js"></script>

<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
</head>

<body>
	<div class="navbar navbar-default" id="navbar" style="height: 41px;">
		<script type="text/javascript">
			try {
				ace.settings.check('navbar', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small> <i
						class="icon-leaf"></i> Wifi后台管理
				</small>
				</a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->

			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">



					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="assets/avatars/user.jpg" alt="Jason's Photo" /> <span
							class="user-info"> <small>欢迎</small>
								${sessionScope.user.name}
						</span> <i class="icon-caret-down"></i>
					</a>

						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="updatePwd.html"> <i class="icon-cog"></i> 修改密码
							</a></li>


							<li class="divider"></li>

							<li onclick="showConfirmLogoutDialog()"><a > <i class="icon-off"></i> 注销
							</a></li>
						</ul></li>
				</ul>
				<!-- /.ace-nav -->
			</div>
			<!-- /.navbar-header -->
		</div>
		<!-- /.container -->
	</div>

	<div class="main-container" id="main-container">
		<script type="text/javascript">
			try {
				ace.settings.check('main-container', 'fixed')
			} catch (e) {
			}
		</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>

			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'fixed')
					} catch (e) {
					}
				</script>

				<!-- #sidebar-shortcuts -->
				<ul class="nav nav-list">
					<li ><a href="deviceState.action"> <i
							class="icon-dashboard"></i> <span class="menu-text">设备状态</span>
					</a></li>
					<li class="active"><a href="sellerPageCount.action"> <i
							class="icon-dashboard"></i> <span class="menu-text">统计</span>
					</a></li>

					<c:if
						test="${sessionScope.user.type == 1 }">
						<li><a href="userManage.action"> <i
								class="icon-dashboard"></i> <span class="menu-text">代理商管理</span>
						</a></li>
					</c:if>
					
					
					<c:if
						test="${sessionScope.user.type == 2 }">
						<li><a href="userManage.action"> <i
								class="icon-dashboard"></i> <span class="menu-text">商家管理</span>
						</a></li>
					</c:if>
					
					<c:if test="${sessionScope.user.type == 1 }">
					<li><a href="#" class="dropdown-toggle"> <i
							class="icon-list"></i> <span class="menu-text">基本元素 </span> <b
							class="arrow icon-angle-down"></b>
					</a>
					<ul class="submenu">

								<li><a href="navPageTypeManage.action"> <i
										class="icon-double-angle-right"></i> 栏目管理
								</a></li>

								<li><a href="navPageManage.action"> <i
										class="icon-double-angle-right"></i> 网站管理
								</a></li>

								<li><a href="scrollAd.action"> <i
										class="icon-double-angle-right"></i> 广告管理
								</a></li>


						</ul></li>
					</c:if>
					
					<c:if test="${sessionScope.user.type == 1 || sessionScope.user.type == 2}">
					<li><a href="#" class="dropdown-toggle"> <i
							class="icon-list"></i> <span class="menu-text">代理商商品管理 </span> <b
							class="arrow icon-angle-down"></b>
					</a>
						<ul class="submenu">

								<c:if test="${ sessionScope.user.type == 1}">

								<li><a href="commonAreaConfigList.action"> <i
										class="icon-double-angle-right"></i> 商品扩展属性
								</a></li>

								<li><a href="commonAreaList.action"> <i
										class="icon-double-angle-right"></i> 商品管理
								</a></li>
							</c:if>

							<c:if test="${ sessionScope.user.type == 2}">

								<li><a
									href="commonAreaConfig.action?uid=${sessionScope.user.id}">
										<i class="icon-double-angle-right"></i> 商品扩展属性
								</a></li>

								<li><a href="commonArea.action?uid=${sessionScope.user.id}">
										<i class="icon-double-angle-right"></i> 商品管理
								</a></li>
							</c:if>

						</ul></li>
					</c:if>
					
					<li><a href="#" class="dropdown-toggle"> <i
							class="icon-list"></i> <span class="menu-text">商品管理 </span> <b
							class="arrow icon-angle-down"></b>
					</a>
						<ul class="submenu">
							<c:if
								test="${ sessionScope.user.type == 1 || sessionScope.user.type == 2 }">

								<li><a href="sellerConfigList.action"> <i
										class="icon-double-angle-right"></i>商品扩展属性
								</a></li>

								<li><a href="sellerAreaList.action"> <i
										class="icon-double-angle-right"></i> 商品管理
								</a></li>
							</c:if>

							<c:if test="${ sessionScope.user.type == 3 }">
								<li><a
									href="sellerConfig.action?uid=${sessionScope.user.id}"> <i
										class="icon-double-angle-right"></i> 商品扩展属性
								</a></li>

								<li><a href="sellerArea.action?uid=${sessionScope.user.id}">
										<i class="icon-double-angle-right"></i>商品管理
								</a></li>
							</c:if>
						</ul></li>
				</ul>
				<!-- /.nav-list -->

				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"
						data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>

				<script type="text/javascript">
					try {
						ace.settings.check('sidebar', 'collapsed')
					} catch (e) {
					}
				</script>
			</div>

			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
						try {
							ace.settings.check('breadcrumbs', 'fixed')
						} catch (e) {
						}
					</script>

					<ul class="breadcrumb">
						<li><i class="icon-home home-icon"></i> <a
							href="index.action">首页</a></li>
						<li class="active">全网终端访问统计</li>
					</ul>
					<!-- .breadcrumb -->

				</div>

				<div class="page-content">

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->


							<div class="row">
								<div class="space-6"></div>

								<div class="col-sm-7 infobox-container">
									<div class="infobox infobox-green  ">
										<div class="infobox-chart">
											<span class="sparkline"
												data-values="196,128,202,177,154,94,100,170,224"></span>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number">${requestScope.pcti.pv}</span>
											<div class="infobox-content">今日PV</div>
										</div>
									</div>

									<div class="infobox infobox-blue  ">
										<div class="infobox-chart">
											<span class="sparkline"
												data-values="196,128,202,177,154,94,100,170,224"></span>
										</div>

										<div class="infobox-data">
											<span class="infobox-data-number">${requestScope.pcyi.pv}</span>
											<div class="infobox-content">昨日PV</div>
										</div>

									</div>

									<div class="infobox infobox-pink  ">
										<div class="infobox-chart">
											<span class="sparkline"
												data-values="196,128,202,177,154,94,100,170,224"></span>
										</div>


										<div class="infobox-data">
											<span class="infobox-data-number">${requestScope.pcti.uip}</span>
											<div class="infobox-content">今日UIP</div>
										</div>
									</div>

									<div class="infobox infobox-red  ">
										<div class="infobox-chart">
											<span class="sparkline"
												data-values="196,128,202,177,154,94,100,170,224"></span>
										</div>


										<div class="infobox-data">
											<span class="infobox-data-number">${requestScope.pcyi.uip}</span>
											<div class="infobox-content">昨日UIP</div>
										</div>
									</div>

								</div>


								<!-- /span -->
							</div>
							<!-- /row -->
							<div class="row" style="margin-top: 50px">
								<form id="queryForm" method="post" action="pageCount">
									<div class="col-xs-1">
										<label for="form-field-8">单位</label>
									</div>
									<div class="col-xs-2" style="margin-left: -30px">
										<select name="unitType" class="form-control">
											<option value="1"
												${requestScope.unitType == 1 ?"selected= 'selected'" : ""}>日</option>
											<option value="2"
												${requestScope.unitType == 2 ?"selected= 'selected'" : ""}>周</option>
											<option value="3"
												${requestScope.unitType == 3 ?"selected= 'selected'" : ""}>月</option>
											<option value="4"
												${requestScope.unitType == 4 ?"selected= 'selected'" : ""}>年</option>
											<option value="5"
												${requestScope.unitType == 5 ?"selected= 'selected'" : ""}>自定义</option>
										</select>
									</div>
									<div class="col-xs-2">
										<label for="form-field-8">自定义单位</label>
									</div>
									<div class="col-xs-1" style="margin-left: -50px">
										<select name="unit" class="form-control">
											<option value="1"
												${requestScope.unit == 1 ?"selected= 'selected'" : ""}>1</option>
											<option value="2"
												${requestScope.unit == 2 ?"selected= 'selected'" : ""}>2</option>
											<option value="3"
												${requestScope.unit == 3 ?"selected= 'selected'" : ""}>3</option>
											<option value="4"
												${requestScope.unit == 4 ?"selected= 'selected'" : ""}>4</option>
											<option value="5"
												${requestScope.unit == 5 ?"selected= 'selected'" : ""}>5</option>
											<option value="6"
												${requestScope.unit == 6 ?"selected= 'selected'" : ""}>6</option>
											<option value="7"
												${requestScope.unit == 7 ?"selected= 'selected'" : ""}>7</option>
											<option value="8"
												${requestScope.unit == 8 ?"selected= 'selected'" : ""}>8</option>
											<option value="9"
												${requestScope.unit == 9 ?"selected= 'selected'" : ""}>9</option>
											<option value="10"
												${requestScope.unit == 10 ?"selected= 'selected'" : ""}>10</option>
											<option value="11"
												${requestScope.unit == 11 ?"selected= 'selected'" : ""}>11</option>
											<option value="12"
												${requestScope.unit == 12 ?"selected= 'selected'" : ""}>12</option>
											<option value="13"
												${requestScope.unit == 13 ?"selected= 'selected'" : ""}>13</option>
											<option value="14"
												${requestScope.unit == 14 ?"selected= 'selected'" : ""}>14</option>
											<option value="15"
												${requestScope.unit == 15 ?"selected= 'selected'" : ""}>15</option>
											<option value="16"
												${requestScope.unit == 16 ?"selected= 'selected'" : ""}>16</option>
											<option value="17"
												${requestScope.unit == 17 ?"selected= 'selected'" : ""}>17</option>
											<option value="18"
												${requestScope.unit == 18 ?"selected= 'selected'" : ""}>18</option>
											<option value="19"
												${requestScope.unit == 19 ?"selected= 'selected'" : ""}>19</option>
											<option value="20"
												${requestScope.unit == 20 ?"selected= 'selected'" : ""}>20</option>
											<option value="21"
												${requestScope.unit == 21 ?"selected= 'selected'" : ""}>21</option>
											<option value="22"
												${requestScope.unit == 22 ?"selected= 'selected'" : ""}>22</option>
											<option value="23"
												${requestScope.unit == 23 ?"selected= 'selected'" : ""}>23</option>
											<option value="24"
												${requestScope.unit == 24 ?"selected= 'selected'" : ""}>24</option>
											<option value="25"
												${requestScope.unit == 25 ?"selected= 'selected'" : ""}>25</option>
											<option value="26"
												${requestScope.unit == 26 ?"selected= 'selected'" : ""}>26</option>
											<option value="27"
												${requestScope.unit == 27 ?"selected= 'selected'" : ""}>27</option>
											<option value="28"
												${requestScope.unit == 28 ?"selected= 'selected'" : ""}>28</option>
											<option value="29"
												${requestScope.unit == 29 ?"selected= 'selected'" : ""}>29</option>
											<option value="30"
												${requestScope.unit == 30 ?"selected= 'selected'" : ""}>30</option>
										</select>
									</div>
									<div class="col-xs-1">
										<label for="form-field-8">日期</label>
									</div>
									<div class="col-xs-3" style="margin-left: -30px">
										<input class="form-control" name="date"
											value="${requestScope.date }" id="datepicker" type="text" />
									</div>
									<div class="col-xs-1">
										<button id="queryBtn" class="btn btn-info" type="button">
											<i class="icon-ok bigger-110"></i> 查询
										</button>
									</div>
								</form>
							</div>

							<div class="row" style="margin-top: 20px">

								<div class="col-xs-12">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="lighter">
												<i class="icon-signal"></i> 统计表
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse"> <i
													class="icon-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-4">
												<div id="sales-charts"></div>
											</div>
											<!-- /widget-main -->
										</div>
										<!-- /widget-body -->
									</div>
									<!-- /widget-box -->
								</div>
							</div>
							<div class="row" style="margin-top: 20px">
								<div class="col-xs-12">
									<div class="table-header">PV_UIP信息列表</div>

									<div class="table-responsive">
										<table id="sample-table-2"
											class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th>时段</th>
													<th>PV</th>
													<th>UIP</th>
												</tr>
											</thead>

											<tbody>
												<c:forEach var="temp" items="${requestScope.gridPcs}">
													<tr>
														<td>${temp.recordDate }</td>
														<td>${temp.pv }</td>
														<td>${temp.uip }</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>





									<!-- /row -->

									<!-- PAGE CONTENT ENDS -->
								</div>
								<!-- /.col -->
							</div>
							<!-- /.row -->
						</div>
						<!-- /.page-content -->
					</div>
					<!-- /.main-content -->

				</div>
				<!-- /.main-container-inner -->

				<a href="#" id="btn-scroll-up"
					class="btn-scroll-up btn btn-sm btn-inverse"> <i
					class="icon-double-angle-up icon-only bigger-110"></i>
				</a>
			</div>
			<!-- /.main-container -->

			<!-- basic scripts -->

			<!--[if !IE]> -->


			<!-- <![endif]-->

			<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

			<!--[if !IE]> -->

			<script type="text/javascript">
				window.jQuery
						|| document
								.write("<script src='assets/js/jquery-2.0.3.min.js'>"
										+ "<"+"script>");
			</script>

			<!-- <![endif]-->

			<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
<![endif]-->

			<script type="text/javascript">
				if ("ontouchend" in document)
					document
							.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
									+ "<"+"script>");
			</script>
			<script src="assets/js/bootstrap.min.js"></script>
			<script src="assets/js/typeahead-bs2.min.js"></script>

			<!-- page specific plugin scripts -->

			<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->

			<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
			<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
			<script src="assets/js/jquery.slimscroll.min.js"></script>
			<script src="assets/js/jquery.easy-pie-chart.min.js"></script>
			<script src="assets/js/jquery.sparkline.min.js"></script>
			<script src="assets/js/flot/jquery.flot.min.js"></script>
			<script src="assets/js/flot/jquery.flot.pie.min.js"></script>
			<script src="assets/js/flot/jquery.flot.resize.min.js"></script>
			<script src="js/jquery.datetimepicker.js"></script>

			<!-- ace scripts -->

			<script src="assets/js/ace-elements.min.js"></script>
			<script src="assets/js/ace.min.js"></script>

			<!-- inline scripts related to this page -->




			<script type="text/javascript">
				jQuery(function($) {

					var d1 = [];
					var d2 = [];
					
					<c:forEach items="${requestScope.gridPcs}" var="temp" varStatus="status">
							<c:if test="${!status.last}">
								d1.push([${status.index  + 1},${temp.pv}]);
								d2.push([${status.index + 1},${temp.uip}]);
							</c:if>
					</c:forEach>

					var sales_charts = $('#sales-charts').css({
						'width' : '100%',
						'height' : '220px'
					});
					$.plot("#sales-charts", [ {
						label : "PV",
						data : d1
					}, {
						label : "UIP",
						data : d2
					} ], {
						hoverable : true,
						shadowSize : 0,
						series : {
							lines : {
								show : true
							},
							points : {
								show : true
							}
						},
						xaxis : {
							tickLength : 0,
							min:0,
							tickDecimals : 0
							
						},
						yaxis : {
							ticks : 10,
							min : 0,
							tickDecimals : 0
						},
						grid : {
							backgroundColor : {
								colors : [ "#fff", "#fff" ]
							},
							borderWidth : 1,
							borderColor : '#555'
						}
					});


				})
			</script>

			<div id="confirmLogoutDialog" class="modal fade " tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title">警告</h4>
							<div id="alertDiv" class="modal-body">确定要注销吗？</div>
						</div>
						<div class="modal-footer">
							<button id="confirmLogoutDialog" class="btn btn-info"
								type="button" onclick="logout()">
								<i class="icon-ok bigger-110"></i> 确定
							</button>

							<button class="btn btn-info" type="button" data-dismiss="modal">
								<i class="icon-ok bigger-110"></i> 取消
							</button>
						</div>
					</div>
				</div>
			</div>

	<script type="text/javascript">
		
	    function showConfirmLogoutDialog(){
	    	$("#confirmLogoutDialog").modal("show");
	    }
	
		function logout(){
			window.location.href = 'logout.action';
		}
	</script>
</body>
<script>
  $('#datepicker').datetimepicker({
		yearOffset:0,
		lang:'ch',
		timepicker:false,
		format:'Y-m-d',
		formatDate:'Y/m/d',
	});


  $(document)
	.ready(
			function() {
				$("#queryBtn").click(function() {
					if($("#datepicker").val().trim()=='') {
						alert("请选择日期");
						return;
					}
					
					$("#queryForm").submit();
				});
				
			}
	);
  </script>

</html>
