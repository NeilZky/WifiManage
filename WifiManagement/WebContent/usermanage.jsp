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

<!-- fonts -->

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
							window.location.href = 'userManage.action';
						});

						$("#addUserBtn")
								.click(
										function() {
											$(':input', '#addUserForm')
													.not(
															':button, :submit, :reset, :hidden')
													.val('').removeAttr(
															'checked')
													.removeAttr('selected');
											$("#warning_add_user_form")
													.html("");
										});

						$("#editUserBtn")
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
											$("#id_update_user_form").val(id);

											var name = $(checkedItems).data(
													"name");
											$("#name_update_user_form").val(
													name);

											var username = $(checkedItems)
													.data("username");
											$("#username_update_user_form")
													.val(username);

											var tel = $(checkedItems).data(
													"tel");
											$("#tel_update_user_form").val(tel);

											var remark = $(checkedItems).data(
													"remark");
											$("#remark_update_user_form").val(
													remark);

											var createDateTime = $(checkedItems)
													.data("create");
											$(
													"#create_date_time_update_user_form")
													.val(createDateTime);

											$('#updateDialog').modal('show')
										});

						$("#closeAddUserDialog").click(function() {
							$("#addUserDialog").css("visibility", "hidden")
						});

						$("#closeUpdateUserDialog").click(function() {
							$("#updateUserDialog").css("visibility", "hidden")
						});

						$("#addUserSubmit")
								.click(
										function() {

											if ($("#name_add_user_form").val() == '') {
												$("#warning_add_user_form")
														.html('请输入姓名');
												return;
											}

											if ($("#username_add_user_form")
													.val() == '') {
												$("#warning_add_user_form")
														.html('请输入用户名');
												return;
											}

											if (!$("#username_add_user_form")
													.val()
													.match(
															/^[a-zA-Z0-9_]{6,18}/)) {
												$("#warning_add_user_form")
														.html(
																'用户名6~18位的数字或字母或下划线');
												return;
											}

											if ($("#type_add_user_form").val() == null) {
												$("#warning_add_user_form")
														.html('请选择用户类型');
												return;
											}

											var telVal = $("#tel_add_user_form")
													.val();
											if (telVal == '') {
												$("#warning_add_user_form")
														.html('请输入手机号');
												return;
											}

											if (!telVal.match(/^[1][0-9]{10}$/)) {
												$("#warning_add_user_form")
														.html('手机号码格式不正确');
												return;
											}

											if ($("#remark_add_user_form")
													.val() == '') {
												$("#warning_add_user_form")
														.html('请输入备注');
												return;
											}

											var userInfo = $("#addUserForm")
													.serialize();
											$.ajax({
														type : 'post',
														url : 'addUser.action',
														data : userInfo,
														cache : false,
														dataType : 'json',
														success : function(data) {
															if (data.code == 2) {
																$(
																		"#warning_add_user_form")
																		.html(
																				data.info);
															}
															if (data.code == 1) {
																window.location.href = data.url;
															}
														}
													});
										});

						
						$("#deleteUsers").click(function() {
							var checkedItems = $(".cbItem:checked");
							if(checkedItems.length ==0) {
								$('#alertDiv').html('请选择要删除的条目');
								$('#alertDialog').modal('show');
								return;
							}
							var deleteUserIDs = new Array();
							$(checkedItems).each(function(i, temp) {
								var id = $(temp).data("id");
								deleteUserIDs.push(id);
									});
							$("#confirmDeleteDialog").modal("show"); 
							return;
							
						});

						$("#confirmDeleteBtn").click(function() {
							$("#confirmDeleteDialog").modal("hide"); 
							var checkedItems = $(".cbItem:checked");
							var deleteUserIDs = new Array();
							$(checkedItems).each(function(i, temp) {
								var id = $(temp).data("id");
								deleteUserIDs.push(id);
									});
							$.ajax({
								type : 'post',
								url : 'deleteUsers',
								data :  { "deleteUserIDs": deleteUserIDs },
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
						
						$("#updateUserSubmit")
						.click(
								function() {

									if ($("#name_update_user_form").val() == '') {
										$("#warning_update_user_form")
												.html('请输入姓名');
										return;
									}



									if ($("#type_update_user_form").val() == null) {
										$("#warning_update_user_form")
												.html('请选择用户类型');
										return;
									}

									var telVal = $("#tel_update_user_form")
											.val();
									if (telVal == '') {
										$("#warning_update_user_form")
												.html('请输入手机号');
										return;
									}

									if (!telVal.match(/^[1][0-9]{10}$/)) {
										$("#warning_update_user_form")
												.html('手机号码格式不正确');
										return;
									}

									if ($("#remark_update_user_form")
											.val() == '') {
										$("#warning_update_user_form")
												.html('请输入备注');
										return;
									}

									var userInfo = $("#updateUserForm")
											.serialize();
									$.ajax({
												type : 'post',
												url : 'updateUser',
												data : userInfo,
												cache : false,
												dataType : 'json',
												success : function(data) {
													if (data.code == 2) {
														$(
																"#warning_update_user_form")
																.html(
																		data.info);
													}
													else if (data.code == 1) {
														window.location.href = data.url;
													} else {
														$(
														"#warning_update_user_form")
														.html(
																"修改失败");
													}
												}
											});
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
					<li><a href="sellerPageCount.action"> <i
							class="icon-dashboard"></i> <span class="menu-text">统计</span>
					</a></li>

					<c:if
						test="${sessionScope.user.type == 1 }">
						<li class="active"><a href="userManage.action"> <i
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
							<div class="table-header">用户列表</div>

							<div class="table-responsive">
								<table id="sample-table-2"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="center"><label> <input
													type="checkbox" class="ace" /> <span class="lbl"></span>
											</label></th>
											<th>姓名</th>
											<th>用户名</th>
											<th class="hidden-480">用户类型</th>
											<th>电话号码</th>
											<th class="hidden-480">备注</th>
											<th class="hidden-480">创建时间</th>

										</tr>

									</thead>

									<tbody>
										<c:forEach var="user" items="${requestScope.users}">
											<tr>
												<td class="center "><label> <input
														type="checkbox" class="ace cbItem" data-id="${user.id}"
														data-name="${user.name}" data-username="${user.username}"
														data-tel="${user.telNumber}" data-remark="${user.remark}"
														data-create="${user.createDateTime}"
														data-type="${user.type}" /> <span class="lbl"></span>
												</label></td>

												<td>${user.name }</td>
												<td>${user.username }</td>
												<td class="hidden-480"><c:choose>
														<c:when test="${user.type == 1}">  
															超级管理员 
 														 </c:when>
														<c:when test="${user.type == 2}">  
															一般管理员 
 														 </c:when>
														<c:when test="${user.type == 3}">  
															商家
 														 </c:when>
														<c:otherwise>
														</c:otherwise>
													</c:choose></td>
												<td>${user.telNumber }</td>
												<td class="hidden-480"><span>${user.remark }</span></td>
												<td class="hidden-480">${user.createDateTime }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<table class="ui-pg-table navtable"
									style="float: left; table-layout: auto; margin-left: 10px; margin-top: 5px">
									<tbody>
										<tr>
											<td class="ui-pg-button ui-corner-all" title=""
												id="addUserBtn" data-original-title="添加"
												data-target="#addDialog" data-toggle="modal">
												<div class="ui-pg-div">
													<span class="ui-icon icon-plus-sign purple"> </span>
												</div>
											</td>
											<td class="ui-pg-button ui-corner-all" title=""
												id="editUserBtn" data-original-title="编辑">
												<div class="ui-pg-div">
													<span class="ui-icon icon-pencil blue"></span>
												</div>
											<td class="ui-pg-button ui-corner-all" title=""
												id="deleteUsers" data-original-title="删除">
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
				}, null, null, null, null, null, {
					"bSortable" : false
				} ]
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
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>

	<div class="modal fade" id="addDialog">
		<div class="modal-dialog">
			<div class="modal-center">

				<div>
					<form id="addUserForm" class="form-horizontal">
						<div class="widget-header">
							<h4 id="dialogTitle">新建用户</h4>

						</div>

						<div class="widget-body">
							<div class="widget-main">
								<div>
									<label id="warning_add_user_form" for="form-field-8"
										style="color: red;"></label>
								</div>
								<div>
									<label for="form-field-8">姓名</label> <input
										class="form-control" name="user.name" id="name_add_user_form"
										placeholder="姓名" />
								</div>

								<div>
									<label for="form-field-8" style="margin-top: 5px">用户名</label> <input
										name="user.username" class="form-control"
										id="username_add_user_form" placeholder="用户名" />
								</div>

								<div>
									<label for="form-field-select-1" style="margin-top: 5px">用户类型</label>
									<select id="type_add_user_form" name="user.type"
										class="form-control">
										<c:if test="${sessionScope.user.type == 1 }">
											<option value="2">一般管理员</option>
										</c:if>
										<c:if test="${sessionScope.user.type == 2 }">
											<option value="3">商家</option>
										</c:if>
									</select>
								</div>
								<div>
									<label for="form-field-8" style="margin-top: 5px">手机号</label> <input
										name="user.telNumber" class="form-control"
										id="tel_add_user_form" placeholder="手机号" />
								</div>
								<div>
									<label for="form-field-8">备注</label> <input name="user.remark"
										class="form-control" id="remark_add_user_form"
										placeholder="备注" />
								</div>

								<div class=" form-actions center modal-footer"
									style="background: white;">

									<button id="addUserSubmit" class="btn btn-info" type="button">
										<i class="icon-ok bigger-110"></i> 提交
									</button>

									<button class="btn btn-info" type="button" data-dismiss="modal">
										<i class="icon-ok bigger-110"></i> 取消
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
						<form id="updateUserForm" class="form-horizontal">
							<div class="widget-header">
								<h4 id="dialogTitle">编辑用户</h4>

							</div>

							<div class="widget-body">
								<div class="widget-main">
									<div>
										<label id="warning_update_user_form" for="form-field-8"
											style="color: red;"></label>
									</div>

									<div>
										<label for="form-field-8">姓名</label> <input
											class="form-control" name="user.name"
											id="name_update_user_form" placeholder="姓名" />
									</div>

									<div>
										<label for="form-field-8" style="margin-top: 5px">用户名</label>
										<input name="user.username" class="form-control"
											placeholder="用户名" disabled="disabled" />
									</div>

									<div>
										<label for="form-field-select-1" style="margin-top: 5px">用户类型</label>
										<select id="type_update_user_form" name="user.type"
											class="form-control">
											<option value="2">一般管理员</option>
											<option value="3">商家</option>
										</select>
									</div>
									<div>
										<label for="form-field-8" style="margin-top: 5px">手机号</label>
										<input name="user.telNumber" class="form-control"
											id="tel_update_user_form" placeholder="手机号" />
									</div>
									<div>
										<label for="form-field-8">备注</label> <input name="user.remark"
											class="form-control" id="remark_update_user_form"
											placeholder="备注" />
									</div>
									<div>
										<label for="form-field-8">创建时间</label> <input
											name="user.remark" class="form-control"
											id="create_date_time_update_user_form" disabled="disabled"
											placeholder="创建时间" />
									</div>


									<div class="clearfix form-actions center"
										style="background: white;">

										<button id="updateUserSubmit" class="btn btn-info"
											type="button">
											<i class="icon-ok bigger-110"></i> 提交
										</button>

										<button class="btn btn-info" type="button"
											data-dismiss="modal">
											<i class="icon-ok bigger-110"></i> 取消
										</button>

										<input id="id_update_user_form" class="form-control"
											name="user.id"
											style="visibility: hidden; width: 0px; height: 0px;" />
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
					<h4 class="modal-title" >警告</h4>
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
