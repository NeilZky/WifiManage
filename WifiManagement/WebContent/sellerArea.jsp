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
											$("#addDialog").css(
													"visibility", "visible")
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
											var tds = $(checkedItems).parent().parent().parent().find("td");
											var editInputs = $("#updateDialog").find("input");
											for(var i = 1; i <tds.length; i++)
											{	
												if($(editInputs[i-1]).attr("type")!="file") {
													$(editInputs[i-1]).val($(tds[i]).html());
												}
											}
											$("#id_update_form").val(id);
											$("#updateDialog").modal("show");
										});

						$("#closeaddTypeDialog").click(function() {
							$("#addDialog").css("visibility", "hidden")
						});

						$("#closeupdateDialog").click(function() {
							$("#updateDialog").css("visibility", "hidden")
						});

						$("#addSubmit")
								.click(
										function() {
											var valid = true;
											$.each($("#addForm").find(":input"), function(i,temp) {
													if( $(this).attr("id") != "addSubmit" && $(temp).val().trim() == ""){
														if(valid) {
															$('#warning_add_form').html('请填写完整信息');
															valid = false;
														}
													}
												}
											);
											if(valid) {
												$("#addForm").submit();
											}
										});

						
						$("#deleteBtn").click(function() {
							var checkedItems = $(".cbItem:checked");
							if(checkedItems.length ==0) {
								$('#alertDiv').html('请选择要删除的条目');
								$('#alertDialog').modal('show');
								return;
							}
							$('#confirmDeleteDialog').modal('show');
						});

						
						$("#confirmDeleteBtn").click(function() {
							var checkedItems = $(".cbItem:checked");
							var deleteIDs = new Array();
							$(checkedItems).each(function(i, temp) {
								var id = $(temp).data("id");
								deleteIDs.push(id);
									});
							$.ajax({
								type : 'post',
								url : 'deleteSellerAreas',
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
										$('#alertDialog').modal('show');									}
								}
							});
						});
						
						$("#updateSubmit")
						.click(
								function() {

									var valid = true;
									$.each($("#updateForm").find(":input"), function(i,temp) {
											if( $(this).attr("id") != "updateSubmit" && $(temp).val().trim() == ""){
												if(valid) {
													alert('请填写完整信息');
													valid = false;
												}
											}
										}
									);
									if(valid) {
										$("#updateForm").submit();
									}								
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

							<li onclick="showConfirmLogoutDialog()"><a> <i
									class="icon-off"></i> 注销
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
					
					<li class="active open"><a href="#" class="dropdown-toggle"> <i
							class="icon-list"></i> <span class="menu-text">商品管理 </span> <b
							class="arrow icon-angle-down"></b>
					</a>
						<ul class="submenu">
							<c:if
								test="${ sessionScope.user.type == 1 || sessionScope.user.type == 2 }">

								<li><a href="sellerConfigList.action"> <i
										class="icon-double-angle-right"></i>商品扩展属性
								</a></li>

								<li class="active"><a href="sellerAreaList.action"> <i
										class="icon-double-angle-right"></i> 商品管理
								</a></li>
							</c:if>

							<c:if test="${ sessionScope.user.type == 3 }">
								<li><a
									href="sellerConfig.action?uid=${sessionScope.user.id}"> <i
										class="icon-double-angle-right"></i> 商品扩展属性
								</a></li>

								<li class="active"><a href="sellerArea.action?uid=${sessionScope.user.id}">
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

			<div class="main-content" style="overflow-x: auto;">
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

						<li>商品管理</li>
					</ul>
					<!-- .breadcrumb -->
				</div>

				<div  style="margin-left: 20px;margin-top: 10px;">
				
					<a href="connect.action?action=previewSellerArea&uid=${requestScope.uid}" target="_blank" class="btn btn-info">
  						预览电脑版
					</a>
					<a href="connect.action?action=previewSellerArea&uid=${requestScope.uid}&browserType=1" target="_blank" class="btn btn-info">
  						预览手机版
					</a>
					<a href="saveSellerAreaRelease.action?uid=${requestScope.uid}" class="btn btn-info">
  						保存
					</a>
					
					<a href="cancelSellerAreaRelease.action?uid=${requestScope.uid}" class="btn btn-info">
  						取消
					</a>
				</div>

				<div class="page-content">

					<div class="row">
						<div class="col-xs-12">
							<div class="table-header">商家页面列表</div>

							<div class="table-responsive">
								<table id="sample-table-2"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="center"><label> <input
													type="checkbox" class="ace" /> <span class="lbl"></span>
											</label></th>
											<th>标题</th>
											<th>描述</th>
											<th>图片</th>
											<th>金额</th>
											<th>链接</th>
											<c:if test="${requestScope.state[0] }">
												<th>${requestScope.config.l1}</th>
											</c:if>
											<c:if test="${requestScope.state[1] }">
												<th>${requestScope.config.l2}</th>
											</c:if>
											<c:if test="${requestScope.state[2] }">
												<th>${requestScope.config.l3}</th>
											</c:if>
											<c:if test="${requestScope.state[3] }">
												<th>${requestScope.config.l4}</th>
											</c:if>
											<c:if test="${requestScope.state[4] }">
												<th>${requestScope.config.l5}</th>
											</c:if>
											<c:if test="${requestScope.state[5] }">
												<th>${requestScope.config.l6}</th>
											</c:if>
											<c:if test="${requestScope.state[6] }">
												<th>${requestScope.config.l7}</th>
											</c:if>
											<c:if test="${requestScope.state[7] }">
												<th>${requestScope.config.l8}</th>
											</c:if>
											<c:if test="${requestScope.state[8] }">
												<th>${requestScope.config.l9}</th>
											</c:if>
											<c:if test="${requestScope.state[9] }">
												<th>${requestScope.config.l10}</th>
											</c:if>

											<c:if test="${requestScope.state[10] }">
												<th>${requestScope.config.l11}</th>
											</c:if>
											<c:if test="${requestScope.state[11] }">
												<th>${requestScope.config.l12}</th>
											</c:if>
											<c:if test="${requestScope.state[12] }">
												<th>${requestScope.config.l13}</th>
											</c:if>
											<c:if test="${requestScope.state[13] }">
												<th>${requestScope.config.l14}</th>
											</c:if>
											<c:if test="${requestScope.state[14] }">
												<th>${requestScope.config.l15}</th>
											</c:if>

											<c:if test="${requestScope.state[15] }">
												<th>${requestScope.config.l16}</th>
											</c:if>

											<c:if test="${requestScope.state[16] }">
												<th>${requestScope.config.l17}</th>
											</c:if>

											<c:if test="${requestScope.state[17] }">
												<th>${requestScope.config.l18}</th>
											</c:if>

											<c:if test="${requestScope.state[18] }">
												<th>${requestScope.config.l19}</th>
											</c:if>

											<c:if test="${requestScope.state[19] }">
												<th>${requestScope.config.l20}</th>
											</c:if>
												<th>点击量</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="temp" items="${requestScope.datas}">
											<tr>
												<td class="center "><label> <input
														type="checkbox" class="ace cbItem" data-id="${temp.id}"
														data-linkurl="${temp.linkUrl}" data-title="${temp.title}"
														data-description="${temp.description}"
														data-amount="${temp.amount}"
														data-photourl="${temp.photoUrl}" /> <span class="lbl"></span>
												</label></td>
												<td>${temp.title }</td>
												<td>${temp.description }</td>
												<td><img style="width: 40px;height=40px;"
													src="${temp.photoUrl }" /></td>
												<td>${temp.amount }</td>
												<td>${temp.linkUrl }</td>
												<c:if test="${requestScope.state[0] }">
													<td>${temp.c1}</td>
												</c:if>

												<c:if test="${requestScope.state[1] }">
													<td>${temp.c2}</td>
												</c:if>

												<c:if test="${requestScope.state[2] }">
													<td>${temp.c3}</td>
												</c:if>

												<c:if test="${requestScope.state[3] }">
													<td>${temp.c4}</td>
												</c:if>

												<c:if test="${requestScope.state[4] }">
													<td>${temp.c5}</td>
												</c:if>

												<c:if test="${requestScope.state[5] }">
													<td>${temp.c6}</td>
												</c:if>

												<c:if test="${requestScope.state[6] }">
													<td>${temp.c7}</td>
												</c:if>
												<c:if test="${requestScope.state[7] }">
													<td>${temp.c8}</td>
												</c:if>
												<c:if test="${requestScope.state[8] }">
													<td>${temp.c9}</td>
												</c:if>
												<c:if test="${requestScope.state[9] }">
													<td>${temp.c10}</td>
												</c:if>
												<c:if test="${requestScope.state[10] }">
													<td>${temp.c11}</td>
												</c:if>
												<c:if test="${requestScope.state[11] }">
													<td>${temp.c12}</td>
												</c:if>
												<c:if test="${requestScope.state[12] }">
													<td>${temp.c13}</td>
												</c:if>
												<c:if test="${requestScope.state[13] }">
													<td>${temp.c14}</td>
												</c:if>
												<c:if test="${requestScope.state[14] }">
													<td>${temp.c15}</td>
												</c:if>
												<c:if test="${requestScope.state[15] }">
													<td>${temp.c16}</td>
												</c:if>
												<c:if test="${requestScope.state[16] }">
													<td>${temp.c17}</td>
												</c:if>
												<c:if test="${requestScope.state[17] }">
													<td>${temp.c18}</td>
												</c:if>
												<c:if test="${requestScope.state[18] }">
													<td>${temp.c19}</td>
												</c:if>
												<c:if test="${requestScope.state[19] }">
													<td>${temp.c20}</td>
												</c:if>
												<td><a
													href="linkCount.action?id=${temp.id}&uid=${temp.userId}&linkType=4&name=${temp.title }&photoUrl=${temp.photoUrl }&linkUrl=${temp.linkUrl}&fatherPage.name=商品管理&fatherPage.action=sellerArea.action">详情</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<table class="ui-pg-table navtable"
									style="float: left; table-layout: auto; margin-left: 10px; margin-top: 5px">
									<tbody>
										<tr>
											<td class="ui-pg-button ui-corner-all" title=""
												id="addTypeBtn" data-original-title="添加"
												data-target="#addDialog" data-toggle="modal">
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
				}, null ,null,null,null
				 <c:forEach var="temp" items="${requestScope.state}"  >
		 		<c:if test="${temp }">
		 		,null
		 		</c:if>
			 </c:forEach>
				]
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

	<div id="confirmDeleteDialog" class="modal fade " tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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


	<div class="modal fade" id="updateDialog">
		<div class="modal-dialog">
			<div class="modal-center">

				<div class="widget-box">
					<form id="updateForm" class="form-horizontal"
						action="updateSellerArea" enctype="multipart/form-data"
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
									<label for="form-field-8">标题</label> <input
										class="form-control" name="ca.title" id="name_add_form"
										placeholder="请输入标题" />
								</div>

								<div>
									<label for="form-field-8">描述</label> <input
										class="form-control" name="ca.description" id="name_add_form"
										placeholder="请输入描述" />
								</div>

								<div>
									<label for="form-field-8">图片地址</label> <input
										class="form-control" name="fileUpload" id="name_add_form"
										type="file" />
								</div>

								<div>
									<label for="form-field-8">金额</label> <input
										class="form-control" name="ca.amount" id="name_add_form"
										placeholder="请输入金额" />
								</div>

								<div>
									<label for="form-field-8">链接地址</label> <input
										class="form-control" name="ca.linkUrl" id="name_add_form"
										placeholder="请输入链接地址" />
								</div>

								<c:if test="${requestScope.state[0] }">
									<div>
										<label for="form-field-8">${requestScope.config.l1}</label> <input
											class="form-control" name="ca.c1"
											placeholder="请输入${requestScope.config.l1}" />
									</div>
								</c:if>


								<c:if test="${requestScope.state[1] }">
									<div>
										<label for="form-field-8">${requestScope.config.l2}</label> <input
											class="form-control" name="ca.c2"
											placeholder="请输入${requestScope.config.l2}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[2] }">
									<div>
										<label for="form-field-8">${requestScope.config.l3}</label> <input
											class="form-control" name="ca.c3"
											placeholder="请输入${requestScope.config.l3}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[3] }">
									<div>
										<label for="form-field-8">${requestScope.config.l4}</label> <input
											class="form-control" name="ca.c4"
											placeholder="请输入${requestScope.config.l4}" />
									</div>
								</c:if>


								<c:if test="${requestScope.state[4] }">
									<div>
										<label for="form-field-8">${requestScope.config.l5}</label> <input
											class="form-control" name="ca.c5"
											placeholder="请输入${requestScope.config.l5}" />
									</div>
								</c:if>


								<c:if test="${requestScope.state[5] }">
									<div>
										<label for="form-field-8">${requestScope.config.l6}</label> <input
											class="form-control" name="ca.c6"
											placeholder="请输入${requestScope.config.l6}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[6] }">
									<div>
										<label for="form-field-8">${requestScope.config.l7}</label> <input
											class="form-control" name="ca.c7"
											placeholder="请输入${requestScope.config.l7}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[7] }">
									<div>
										<label for="form-field-8">${requestScope.config.l8}</label> <input
											class="form-control" name="ca.c8"
											placeholder="请输入${requestScope.config.l8}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[8] }">
									<div>
										<label for="form-field-8">${requestScope.config.l9}</label> <input
											class="form-control" name="ca.c9"
											placeholder="请输入${requestScope.config.l9}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[9] }">
									<div>
										<label for="form-field-8">${requestScope.config.l10}</label> <input
											class="form-control" name="ca.c10"
											placeholder="请输入${requestScope.config.l10}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[10] }">
									<div>
										<label for="form-field-8">${requestScope.config.l11}</label> <input
											class="form-control" name="ca.c11"
											placeholder="请输入${requestScope.config.l11}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[11] }">
									<div>
										<label for="form-field-8">${requestScope.config.l12}</label> <input
											class="form-control" name="ca.c12"
											placeholder="请输入${requestScope.config.l12}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[12] }">
									<div>
										<label for="form-field-8">${requestScope.config.l13}</label> <input
											class="form-control" name="ca.c13"
											placeholder="请输入${requestScope.config.l13}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[13] }">
									<div>
										<label for="form-field-8">${requestScope.config.l14}</label> <input
											class="form-control" name="ca.c14"
											placeholder="请输入${requestScope.config.l14}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[14] }">
									<div>
										<label for="form-field-8">${requestScope.config.l15}</label> <input
											class="form-control" name="ca.c15"
											placeholder="请输入${requestScope.config.l15}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[15] }">
									<div>
										<label for="form-field-8">${requestScope.config.l16}</label> <input
											class="form-control" name="ca.c16"
											placeholder="请输入${requestScope.config.l16}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[16] }">
									<div>
										<label for="form-field-8">${requestScope.config.l17}</label> <input
											class="form-control" name="ca.c17"
											placeholder="请输入${requestScope.config.l17}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[17] }">
									<div>
										<label for="form-field-8">${requestScope.config.l18}</label> <input
											class="form-control" name="ca.c18"
											placeholder="请输入${requestScope.config.l18}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[18] }">
									<div>
										<label for="form-field-8">${requestScope.config.l19}</label> <input
											class="form-control" name="ca.c19"
											placeholder="请输入${requestScope.config.l19}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[19] }">
									<div>
										<label for="form-field-8">${requestScope.config.l20}</label> <input
											class="form-control" name="ca.c20"
											placeholder="请输入${requestScope.config.l20}" />
									</div>
								</c:if>

								<div class="clearfix form-actions center"
									style="background: white;">

									<button id="updateSubmit" class="btn btn-info" type="button">
										<i class="icon-ok bigger-110"></i> 提交
									</button>
									<input id="id_update_form" class="form-control" name="ca.id"
										style="visibility: hidden;" />
									<input type="hidden"  style="height: 0px;width: 0px;" name="uid" value="${requestScope.uid}"/>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>


	<div class="modal fade" id="addDialog">
		<div class="modal-dialog">
			<div class="modal-center">
				<form id="addForm" class="form-horizontal" action="addSellerArea"
					enctype="multipart/form-data" method="post">
					<div class="widget-box">
						<div class="widget-header">
							<h4 id="dialogTitle">新建公共模块链接</h4>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								<div>
									<label id="warning_add_form" for="form-field-8"
										style="color: red;"></label>
								</div>
								<div>
									<label for="form-field-8">标题</label> <input
										class="form-control" name="ca.title" id="name_add_form"
										placeholder="请输入标题" />
								</div>

								<div>
									<label for="form-field-8">描述</label> <input
										class="form-control" name="ca.description" id="name_add_form"
										placeholder="请输入描述" />
								</div>

								<div>
									<label for="form-field-8">图片地址</label> <input
										class="form-control" name="fileUpload" id="name_add_form"
										type="file" />
								</div>

								<div>
									<label for="form-field-8">金额</label> <input
										class="form-control" name="ca.amount" id="name_add_form"
										placeholder="请输入金额" />
								</div>

								<div>
									<label for="form-field-8">链接地址</label> <input
										class="form-control" name="ca.linkUrl" id="name_add_form"
										placeholder="请输入链接地址" />
								</div>

								<c:if test="${requestScope.state[0] }">
									<div>
										<label for="form-field-8">${requestScope.config.l1}</label> <input
											class="form-control" name="ca.c1"
											placeholder="请输入${requestScope.config.l1}" />
									</div>
								</c:if>


								<c:if test="${requestScope.state[1] }">
									<div>
										<label for="form-field-8">${requestScope.config.l2}</label> <input
											class="form-control" name="ca.c2"
											placeholder="请输入${requestScope.config.l2}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[2] }">
									<div>
										<label for="form-field-8">${requestScope.config.l3}</label> <input
											class="form-control" name="ca.c3"
											placeholder="请输入${requestScope.config.l3}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[3] }">
									<div>
										<label for="form-field-8">${requestScope.config.l4}</label> <input
											class="form-control" name="ca.c4"
											placeholder="请输入${requestScope.config.l4}" />
									</div>
								</c:if>


								<c:if test="${requestScope.state[4] }">
									<div>
										<label for="form-field-8">${requestScope.config.l5}</label> <input
											class="form-control" name="ca.c5"
											placeholder="请输入${requestScope.config.l5}" />
									</div>
								</c:if>


								<c:if test="${requestScope.state[5] }">
									<div>
										<label for="form-field-8">${requestScope.config.l6}</label> <input
											class="form-control" name="ca.c6"
											placeholder="请输入${requestScope.config.l6}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[6] }">
									<div>
										<label for="form-field-8">${requestScope.config.l7}</label> <input
											class="form-control" name="ca.c7"
											placeholder="请输入${requestScope.config.l7}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[7] }">
									<div>
										<label for="form-field-8">${requestScope.config.l8}</label> <input
											class="form-control" name="ca.c8"
											placeholder="请输入${requestScope.config.l8}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[8] }">
									<div>
										<label for="form-field-8">${requestScope.config.l9}</label> <input
											class="form-control" name="ca.c9"
											placeholder="请输入${requestScope.config.l9}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[9] }">
									<div>
										<label for="form-field-8">${requestScope.config.l10}</label> <input
											class="form-control" name="ca.c10"
											placeholder="请输入${requestScope.config.l10}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[10] }">
									<div>
										<label for="form-field-8">${requestScope.config.l11}</label> <input
											class="form-control" name="ca.c11"
											placeholder="请输入${requestScope.config.l11}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[11] }">
									<div>
										<label for="form-field-8">${requestScope.config.l12}</label> <input
											class="form-control" name="ca.c12"
											placeholder="请输入${requestScope.config.l12}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[12] }">
									<div>
										<label for="form-field-8">${requestScope.config.l13}</label> <input
											class="form-control" name="ca.c13"
											placeholder="请输入${requestScope.config.l13}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[13] }">
									<div>
										<label for="form-field-8">${requestScope.config.l14}</label> <input
											class="form-control" name="ca.c14"
											placeholder="请输入${requestScope.config.l14}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[14] }">
									<div>
										<label for="form-field-8">${requestScope.config.l15}</label> <input
											class="form-control" name="ca.c15"
											placeholder="请输入${requestScope.config.l15}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[15] }">
									<div>
										<label for="form-field-8">${requestScope.config.l16}</label> <input
											class="form-control" name="ca.c16"
											placeholder="请输入${requestScope.config.l16}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[16] }">
									<div>
										<label for="form-field-8">${requestScope.config.l17}</label> <input
											class="form-control" name="ca.c17"
											placeholder="请输入${requestScope.config.l17}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[17] }">
									<div>
										<label for="form-field-8">${requestScope.config.l18}</label> <input
											class="form-control" name="ca.c18"
											placeholder="请输入${requestScope.config.l18}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[18] }">
									<div>
										<label for="form-field-8">${requestScope.config.l19}</label> <input
											class="form-control" name="ca.c19"
											placeholder="请输入${requestScope.config.l19}" />
									</div>
								</c:if>

								<c:if test="${requestScope.state[19] }">
									<div>
										<label for="form-field-8">${requestScope.config.l20}</label> <input
											class="form-control" name="ca.c20"
											placeholder="请输入${requestScope.config.l20}" />
									</div>
								</c:if>
								<input type="hidden"  style="height: 0px;width: 0px;" name="uid" value="${requestScope.uid}"/>
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
