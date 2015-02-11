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

<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#refresh").click(function() {
							window.location.href = 'navPageManage.action';
						});

						$("#addTypeBtn")
								.click(
										function() {
											$(':input', '#addForm')
													.not(
															':button, :submit, :reset, :hidden')
													.val('').removeAttr(
															'checked')
													.removeAttr('selected');
											$("#warning_add_form")
													.html("");
											$("#addDialog").modal('show');
										});

						$("#editBtn")
								.click(
										function() {
											var checkedItems = $(".cbItem:checked");
											if (checkedItems.length == 0
													|| checkedItems.length > 1) {
												$('#alertDiv').html('请选择一条数据进行编辑');
												$('#alertDialog').modal('show');
												return;
											}
											var id = $(checkedItems).data("id");
											$("#id_update_form").val(id);

											var name = $(checkedItems).data("name");
											$("#name_update_form").val(name);
											var type = $(checkedItems).data("navPageTypeId");
											$("#type_update_form").val(type);
											var linkUrl = $(checkedItems).data("linkUrl");
											$("#linkurl_update_form").val(linkUrl);
											$("#updateDialog").modal("show");
										});

						$("#addSubmit")
								.click(
										function() {

											if ($("#name_add_form").val() == '') {
												$("#warning_add_form")
														.html('请输入名称');
												return;
											}
											if ($("#photourl_add_form").val() == '') {
												$("#warning_add_form")
														.html('请选择图片');
												return;
											}
											if ($("#linkurl_add_form").val() == '') {
												$("#warning_add_form")
														.html('请填写链接地址');
												return;
											}
											$("#addForm").submit();
										});

						
						$("#deleteBtn").click(function() {
							var checkedItems = $(".cbItem:checked");
							if(checkedItems.length ==0) {
								$('#alertDiv').html('请选择要删除的条目');
								$('#alertDialog').modal('show');
								return;
							}
							$("#confirmDeleteDialog").modal("show");
						});

						$("#confirmDeleteBtn")
						.click(	function() {
							var checkedItems = $(".cbItem:checked");
							var deleteIDs = new Array();
							$(checkedItems).each(function(i, temp) {
								var id = $(temp).data("id");
								deleteIDs.push(id);
									});
							$.ajax({
								type : 'post',
								url : 'deleteNavPages',
								data :  { "deleteIDs": deleteIDs },
								dataType: "json",  
								cache : false,
								traditional: true, 
								dataType : 'json',
								success : function(data) {
									if (data.code == 2) {
										alert(data.info);
									} 
									else if (data.code == 1) {
										window.location.href = data.url;
									} else {
										$('#alertDiv').html('删除失败');
										$('#alertDialog').modal('show');
									}
								}
							});

						});
						
						$("#updateSubmit")
						.click(
								function() {

									if ($("#name_update_form").val() == '') {
										$("#warning_update_form")
												.html('请输入名称');
										return;
									}
									
									if ($("#photourl_update_form").val() == '') {
										$("#warning_update_form")
												.html('请选择图片');
										return;
									}
									
									if ($("#linkurl_update_form").val() == '') {
										$("#warning_update_form")
												.html('请输入链接地址');
										return;
									}
									
									$("#updateForm").submit();

								});
						
					});
</script>
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
							<li><a href="updatePwd.html"> <i class="icon-cog"></i> 修改密码
							</a></li>


							<li class="divider"></li>

							<li onclick="showConfirmLogoutDialog()"><a> <i class="icon-off"></i> 注销
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
					<li class="active open"><a href="#" class="dropdown-toggle"> <i
							class="icon-list"></i> <span class="menu-text">基本元素 </span> <b
							class="arrow icon-angle-down"></b>
					</a>
					<ul class="submenu">

								<li><a href="navPageTypeManage.action"> <i
										class="icon-double-angle-right"></i> 栏目管理
								</a></li>

								<li class="active"><a href="navPageManage.action"> <i
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

						<li>网站管理</li>
					</ul>
					<!-- .breadcrumb -->

				</div>
				<div  style="margin-left: 20px;margin-top: 10px;">
				
					<a href="connect.action?action=previewNavPage" target="_blank" class="btn btn-info">
  						<span>预览电脑版</span>
					</a>
					<a href="connect.action?action=previewNavPage&browserType=1" target="_blank" class="btn btn-info">
  						<span>预览手机版</span>
					</a>
					<a href="saveNavPageRelease.action" class="btn btn-info">
  						  						<span>保存</span>
  						
					</a>
					
					<a href="cancelNavPagePreview.action" class="btn btn-info">
  						<span>取消</span>
  						
					</a>
				</div>
				
				<div class="page-content">

					<div class="row">
						<div class="col-xs-12">
							<div class="table-header">网站列表</div>

							<div class="table-responsive">
								<table id="sample-table-2"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="center"><label> <input
													type="checkbox" class="ace" /> <span class="lbl"></span>
											</label></th>
											<th>名称</th>
											<th>图片</th>
											<th>类型</th>
											<th>链接地址</th>
											<th>点击量</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="temp" items="${requestScope.navPages}">
											<tr>
												<td class="center "><label> <input
														type="checkbox" class="ace cbItem" data-id="${temp.id}"
														data-name="${temp.name}"
														data-navPageTypeName="${temp.navPageType.name}"
														data-nav-page-type-id="${temp.navPageType.id}"
														data-link-Url="${temp.linkUrl}" /> <span
														class="lbl"></span>
												</label></td>
												<td>${temp.name }</td>
												<td><img style="height: 40px; width: 40px;"
													src="${temp.photoUrl }" /></td>
												<td>${temp.navPageType.name }</td>
												<td>${temp.linkUrl }</td>
												<td><a
													href="linkCount.action?id=${temp.id}&linkType=1&name=${temp.name }&photoUrl=${temp.photoUrl }&typeName=${temp.navPageType.name}&linkUrl=${temp.linkUrl}&fatherPage.name=普通页面管理&fatherPage.action=navPageManage.action">详情</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<table class="ui-pg-table navtable"
									style="float: left; table-layout: auto; margin-left: 10px; margin-top: 5px">
									<tbody>
										<tr>
											<td class="ui-pg-button ui-corner-all" title=""
												data-original-title="添加" data-target="#addDialog"
												data-toggle="modal">
												<div class="ui-pg-div">
													<span class="ui-icon icon-plus-sign purple"> </span>
												</div>
											</td>
											<td class="ui-pg-button ui-corner-all" title="" id="editBtn"
												data-original-title="编辑">
												<div class="ui-pg-div">
													<span class="ui-icon icon-pencil blue"></span>
												</div>
											<td class="ui-pg-button ui-corner-all" title=""
												id="deleteBtn" data-original-title="删除">
												<div class="ui-pg-div">
													<span class="ui-icon icon-trash red"></span>
												</div>
											</td>
											<td class="ui-pg-button ui-corner-all" title=""
												id="refresh_grid-table" data-original-title="刷新">
												<div class="ui-pg-div">
													<span id="refresh" class="ui-icon icon-refresh green"></span>
												</div>
											</td>
										</tr>
									</tbody>
								</table>



							</div>
							<!-- /span -->

						</div>
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
				}, null ,null,null,null]
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
	<div class="modal fade" id="addDialog">
		<div class="modal-dialog">
			<div class="modal-center">

				<div class="widget-box">
					<form id="addForm" class="form-horizontal" class="form-horizontal"
						action="addNavPage" enctype="multipart/form-data" method="post">
						<div class="widget-header">
							<h4 id="dialogTitle">新建导航链接</h4>
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
		</div>
	</div>
	
	<div class="modal fade" id="updateDialog">
		<div class="modal-dialog">
			<div class="modal-center">
					<div class="widget-box">
						<form id="updateForm" class="form-horizontal"
							class="form-horizontal" class="form-horizontal"
							action="updateNavPage" enctype="multipart/form-data"
							method="post">
							<div class="widget-header">
								<h4 id="dialogTitle">修改链接</h4>
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
				</div>
				</div>
	
	<div id="alertDialog" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">警告</h4>
					<div id="alertDiv" class="modal-body"></div>
				</div>
			</div>
		</div>
	</div>

	<div id="confirmDeleteDialog" class="modal fade bs-example-modal-lg"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">警告</h4>
					<div id="alertDiv" class="modal-body">确定要删除吗？</div>
				</div>
				<div class="modal-footer">
					<button id="confirmDeleteBtn" class="btn btn-info" type="button">
						<i class="icon-ok bigger-110"></i> 提交
					</button>

					<button class="btn btn-info" type="button" data-dismiss="modal">
						<i class="icon-ok bigger-110"></i> 取消
					</button>
				</div>
			</div>
		</div>
	</div>

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
</html>
