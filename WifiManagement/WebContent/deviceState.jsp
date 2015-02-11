<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Wifi后台管理</title>

<!-- basic styles -->

<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="assets/css/font-awesome.min.css" />

<!--[if IE 7]>
		  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
		<![endif]-->

<!-- page specific plugin styles -->

<!-- fonts 
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />
-->



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
<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>


<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

<!--[if lt IE 9]>
		<script src="assets/js/html5shiv.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->

</head>

<body>
	<div class="navbar navbar-default" id="navbar">
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
							<li><a href="updatePwd.html"> <i class="icon-cog"></i>
									修改密码
							</a></li>


							<li class="divider"></li>

							<li><a onclick="showConfirmLogoutDialog()"><i
									class="icon-off"></i> 注销 </a></li>
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
					<li class="active"><a href="deviceState.action"> <i
							class="icon-dashboard"></i> <span class="menu-text">设备状态</span>
					</a></li>
					<li><a href="sellerPageCount.action"> <i
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
						<li><i class="icon-home home-icon"></i> <a href="index.html">主页</a>
						</li>
					</ul>
					<!-- .breadcrumb -->
				</div>

				<div class="page-content">

					<div class="row">
						<div class="col-xs-12">
							<div class="table-header">设备状态列表</div>

							<div class="table-responsive">
								<table id="sample-table-2"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th>设备号</th>
											<th>商家</th>
											<th>在线用户</th>
											<th>是否在线</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="temp" items="${requestScope.deviceStateInfos}">
											<tr>
												<td>${temp.deviceState.deviceId }</td>
												<td>${temp.deviceState.user.name }</td>
												<td>${temp.deviceState.count }</td>
												<td><c:if test="${temp.offline }">
														离线
													</c:if> <c:if test="${temp.offline == false }">
														在线
													</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>



							</div>
							<!-- /span -->

						</div>
					</div>
				</div>

				<div id="addDialog" class="col-xs-12 col-sm-4"
					style="margin-top: 10px; visibility: hidden;">

					<div class="widget-box">
						<form id="addForm" class="form-horizontal" class="form-horizontal"
							action="addNavPage" enctype="multipart/form-data" method="post">
							<div class="widget-header">
								<h4 id="dialogTitle">新建导航链接</h4>

								<div class="widget-toolbar">
									<a href="#" data-action="collapse"> <i
										class="icon-chevron-up"></i>
									</a> <a href="#" id="closeaddTypeDialog"> <i
										class="icon-remove"></i>
									</a>
								</div>
							</div>

							<div class="widget-body">
								<div class="widget-main">
									<div>
										<label id="warning_add_form" for="form-field-8"
											style="color: red;"></label>
									</div>
									<div>
										<label for="form-field-8">名称</label> <input
											class="form-control" name="navPage.name" id="name_add_form"
											placeholder="名称" />
									</div>
									<div>
										<label for="form-field-8">图片</label> <input
											class="form-control" name="fileUpload" type="file"
											id="photourl_add_form" placeholder="请选择图片" />
									</div>

									<div>
										<label for="form-field-select-1" style="margin-top: 5px">链接类型</label>
										<select id="type_add_form" name="navPage.navPageType.id"
											class="form-control">
											<c:forEach var="temp" items="${requestScope.navPageTypes}">
												<option value="${temp.id }">${temp.name }</option>
											</c:forEach>
										</select>
									</div>

									<div>
										<label for="form-field-8">链接地址</label> <input
											class="form-control" name="navPage.linkUrl"
											id="linkurl_add_form" placeholder="链接地址" />
									</div>

									<div class="clearfix form-actions center"
										style="background: white;">
										<button id="addSubmit" class="btn btn-info" type="button">
											<i class="icon-ok bigger-110"></i> 提交
										</button>

									</div>
								</div>
							</div>
						</form>
					</div>
				</div>

				<div id="updateDialog" class="col-xs-12 col-sm-4"
					style="margin-top: 10px; visibility: hidden;">

					<div class="widget-box">
						<form id="updateForm" class="form-horizontal"
							class="form-horizontal" class="form-horizontal"
							action="updateNavPage" enctype="multipart/form-data"
							method="post">
							<div class="widget-header">
								<h4 id="dialogTitle">修改链接</h4>

								<div class="widget-toolbar">
									<a href="#" data-action="collapse"> <i
										class="icon-chevron-up"></i>
									</a> <a href="#" id="closeupdateDialog"> <i class="icon-remove"></i>
									</a>
								</div>
							</div>

							<div class="widget-body">
								<div class="widget-main">
									<div>
										<label id="warning_update_form" for="form-field-8"
											style="color: red;"></label>
									</div>

									<div>
										<label for="form-field-8">名称</label> <input
											class="form-control" name="navPage.name"
											id="name_update_form" placeholder="名称" />
									</div>

									<div>
										<label for="form-field-8">图片</label> <input
											class="form-control" name="fileUpload" type="file"
											id="photourl_update_form" placeholder="请选择图片" />
									</div>

									<div>
										<label for="form-field-select-1" style="margin-top: 5px">链接类型</label>
										<select id="type_update_form" name="navPage.navPageType.id"
											class="form-control">
											<c:forEach var="temp" items="${requestScope.navPageTypes}">
												<option value="${temp.id }">${temp.name }</option>
											</c:forEach>
										</select>
									</div>

									<div>
										<label for="form-field-8">链接地址</label> <input
											class="form-control" name="navPage.linkUrl"
											id="linkurl_update_form" placeholder="链接地址" />
									</div>

									<div class="clearfix form-actions center"
										style="background: white;">

										<button id="updateSubmit" class="btn btn-info" type="button">
											<i class="icon-ok bigger-110"></i> 提交
										</button>
										<input id="id_update_form" class="form-control"
											name="navPage.id" style="visibility: hidden;" />
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>

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

	<!--[if  	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>!IE]> -->



	<!-- <![endif]-->

	<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

	<!--[if !IE]> -->

	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='assets/js/jquery-2.0.3.min.js'>"
								+ "<"+"/script>");
	</script>

	<!-- <![endif]-->
	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

	<script type="text/javascript">
		if ("ontouchend" in document)
			document
					.write("<script src='assets/js/jquery.mobile.custom.min.js'>"
							+ "<"+"/script>");
	</script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/typeahead-bs2.min.js"></script>

	<!-- page specific plugin scripts -->

	<script src="assets/js/jquery.dataTables.min.js"></script>
	<script src="assets/js/jquery.dataTables.bootstrap.js"></script>

	<!-- ace scripts -->

	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->

	<script type="text/javascript">
		jQuery(function($) {
			var oTable1 = $('#sample-table-2').dataTable({
				"aoColumns" : [ {
					"bSortable" : false
				}, {
					"bSortable" : false
				}, null ,null]
			});

			$('table th input:checkbox').on(
					'click',
					function() {
						var that = this;
						$(this).closest('table').find(
								'tr > td:first-child input:checkbox').each(
								function() {
									this.checked = that.checked;
									$(this).closest('tr').toggleClass(
											'selected');
								});

					});

			$('[data-rel="tooltip"]').tooltip({
				placement : tooltip_placement
			});
			function tooltip_placement(context, source) {
				var $source = $(source);
				var $parent = $source.closest('table')
				var off1 = $parent.offset();
				var w1 = $parent.width();

				var off2 = $source.offset();
				var w2 = $source.width();

				if (parseInt(off2.left) < parseInt(off1.left)
						+ parseInt(w1 / 2))
					return 'right';
				return 'left';
			}
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
					<button id="confirmLogoutDialog" class="btn btn-info" type="button"
						onclick="logout()">
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
</html>
