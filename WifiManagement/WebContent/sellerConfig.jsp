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

<link rel="stylesheet" href="assets/css/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet" href="assets/css/chosen.css" />
<link rel="stylesheet" href="assets/css/datepicker.css" />
<link rel="stylesheet" href="assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="assets/css/daterangepicker.css" />
<link rel="stylesheet" href="assets/css/colorpicker.css" />

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
					
					<li class="active"><a href="#" class="dropdown-toggle"> <i
							class="icon-list"></i> <span class="menu-text">商品管理 </span> <b
							class="arrow icon-angle-down"></b>
					</a>
						<ul class="submenu">
							<c:if
								test="${ sessionScope.user.type == 1 || sessionScope.user.type == 2 }">

								<li class="active"><a href="sellerConfigList.action"> <i
										class="icon-double-angle-right"></i>商品扩展属性
								</a></li>

								<li><a href="sellerAreaList.action"> <i
										class="icon-double-angle-right"></i> 商品管理
								</a></li>
							</c:if>

							<c:if test="${ sessionScope.user.type == 3 }">
								<li class="active"><a
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
						<li><i class="icon-home home-icon"></i> <a href="index.action">主页</a>
						</li>

						<li>商家页面自定义字段配置</li>
					</ul>
					<!-- .breadcrumb -->

				</div>

				<div class="page-content">
					<div class="page-header">
						<h1>商家页面自定义字段配置</h1>
					</div>
					<!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->
							<form id="formData" class="form-horizontal" role="form">

								<div class="space-4"></div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性1 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5 " name="input.L1"
											value="${requestScope.configInfo.l1}" 
											<c:if test="${requestScope.configInfo.enableL1 == false}">		
															disabled="disabled"
												</c:if> />
											 <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL1" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL1 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性 2</label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L2"
											value="${requestScope.configInfo.l2}"  
											<c:if test="${requestScope.configInfo.enableL2 == false}">		
															disabled="disabled"
												</c:if> 
											/> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL2" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL2 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性3 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L3"
											value="${requestScope.configInfo.l3}" 
											<c:if test="${requestScope.configInfo.enableL3 == false}">		
															disabled="disabled"
												</c:if> 
											/> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL3" id="id-disable-check" 
												<c:if test="${requestScope.configInfo.enableL3 == true}">		
															checked="checked"
												</c:if> />
											 <span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性4 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L4"
											value="${requestScope.configInfo.l4}"
											<c:if test="${requestScope.configInfo.enableL4 == false}">		
															disabled="disabled"
												</c:if> 
											/>
											  <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL4" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL4 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性5</label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L5"
											value="${requestScope.configInfo.l5}" 
											<c:if test="${requestScope.configInfo.enableL5 == false}">		
															disabled="disabled"
												</c:if> 
											/>
											<span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL5" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL5 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性6 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L6"
											value="${requestScope.configInfo.l6}" 
											<c:if test="${requestScope.configInfo.enableL6 == false}">		
															disabled="disabled"
												</c:if> 
											/>
											 <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL6" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL6 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性7 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L7"
											value="${requestScope.configInfo.l7}" 
											<c:if test="${requestScope.configInfo.enableL7 == false}">		
															disabled="disabled"
												</c:if> 
											/>
											 <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL7" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL7 == true}">		
															checked="checked"
												</c:if> /><span
												class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性8 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L8"
											value="${requestScope.configInfo.l8}" 
											<c:if test="${requestScope.configInfo.enableL8 == false}">		
															disabled="disabled"
												</c:if> 
											/> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL8" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL8 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性9 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L9"
											value="${requestScope.configInfo.l9}"
											<c:if test="${requestScope.configInfo.enableL9 == false}">		
															disabled="disabled"
												</c:if> 
											 /> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL9" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL9 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性10 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L10"
											value="${requestScope.configInfo.l10}" 
											<c:if test="${requestScope.configInfo.enableL10 == false}">		
															disabled="disabled"
												</c:if> 
											/> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL11" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL10 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性11 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L11"
											value="${requestScope.configInfo.l11}"
											<c:if test="${requestScope.configInfo.enableL11 == false}">		
															disabled="disabled"
												</c:if> 
											 /> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL11" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL11 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性12 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L12"
											value="${requestScope.configInfo.l12}" 
											<c:if test="${requestScope.configInfo.enableL12 == false}">		
															disabled="disabled"
												</c:if> 
											/> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL12" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL12 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性13 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L13"
											value="${requestScope.configInfo.l13}"
											<c:if test="${requestScope.configInfo.enableL13 == false}">		
															disabled="disabled"
												</c:if> 
											 /> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL13" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL13 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性14 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L14"
											value="${requestScope.configInfo.l14}" 
											<c:if test="${requestScope.configInfo.enableL14 == false}">		
															disabled="disabled"
												</c:if> 
											/> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL14" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL14 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性15 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L15"
											value="${requestScope.configInfo.l15}" 
											<c:if test="${requestScope.configInfo.enableL15 == false}">		
															disabled="disabled"
												</c:if> 
											/> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL15" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL15 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性16 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L16"
											value="${requestScope.configInfo.l16}"
											<c:if test="${requestScope.configInfo.enableL16 == false}">		
															disabled="disabled"
												</c:if> 
											 /> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL16" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL16 == true}">		
															checked="checked"
												</c:if> /><span
												class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性17 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L17"
											value="${requestScope.configInfo.l17}"
											<c:if test="${requestScope.configInfo.enableL17 == false}">		
															disabled="disabled"
												</c:if> 
											 /> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL17" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL17 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性18 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L18"
											value="${requestScope.configInfo.l18}"
											<c:if test="${requestScope.configInfo.enableL18 == false}">		
															disabled="disabled"
												</c:if> 
											 /> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL18" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL18 == true}">		
															checked="checked"
												</c:if> /><span
												class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性19 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L19"
											value="${requestScope.configInfo.l19}" 
											<c:if test="${requestScope.configInfo.enableL19 == false}">		
															disabled="disabled"
												</c:if> 
											/> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL19" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL19 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right"
										for="form-input-readonly"> 自定义属性20 </label>

									<div class="col-sm-9">
										<input type="text" class="col-xs-10 col-sm-5" name="input.L20"
											value="${requestScope.configInfo.l20}" 
											<c:if test="${requestScope.configInfo.enableL20 == false}">		
															disabled="disabled"
												</c:if> 
											/> <span
											class="help-inline col-xs-12 col-sm-7"> <label
											class="middle"> <input class="ace" type="checkbox"
												name="input.enableL20" id="id-disable-check"
												<c:if test="${requestScope.configInfo.enableL20 == true}">		
															checked="checked"
												</c:if> />
												<span class="lbl"> 是否启用</span>
										</label>
										</span>
									</div>
								</div>
								<input type="hidden"  style="height: 0px;width: 0px;" name="uid" value="${requestScope.uid}"/>
								<div class="clearfix center form-actions">
									<div>
										<button id="btn_submit" class="btn btn-info center"
											type="button">
											<i class="icon-ok bigger-110"></i> 提交
										</button>
									</div>
								</div>
							</form>
						</div>
						<!-- /row -->

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

	<!--[if lte IE 8]>
		  <script src="assets/js/excanvas.min.js"></script>
		<![endif]-->

	<script src="assets/js/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="assets/js/jquery.ui.touch-punch.min.js"></script>
	<script src="assets/js/chosen.jquery.min.js"></script>
	<script src="assets/js/fuelux/fuelux.spinner.min.js"></script>
	<script src="assets/js/date-time/bootstrap-datepicker.min.js"></script>
	<script src="assets/js/date-time/bootstrap-timepicker.min.js"></script>
	<script src="assets/js/date-time/moment.min.js"></script>
	<script src="assets/js/date-time/daterangepicker.min.js"></script>
	<script src="assets/js/bootstrap-colorpicker.min.js"></script>
	<script src="assets/js/jquery.knob.min.js"></script>
	<script src="assets/js/jquery.autosize.min.js"></script>
	<script src="assets/js/jquery.inputlimiter.1.3.1.min.js"></script>
	<script src="assets/js/jquery.maskedinput.min.js"></script>
	<script src="assets/js/bootstrap-tag.min.js"></script>

	<!-- ace scripts -->

	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->

	<script type="text/javascript">
		jQuery(function($) {
			$('input:checkbox').on('click', function() {
				var inp = $(this).parent().parent().prev(":input");
				if ($(this).is(':checked')) {
					$(inp).removeAttr('disabled');
				} else {
					$(inp).attr('disabled', 'disabled');
				}
			});

			$('#btn_submit').on('click', function() {
				var formData = $("#formData").serialize();
				$.ajax({
					type : 'post',
					url : 'updateSellerConfig',
					data : formData,
					cache : false,
					dataType : 'json',
					success : function(data) {
						if (data.code == 2) {
							$('#alertDiv').html(data.info);
							$('#alertDialog').modal('show');
						} else if (data.code == 1) {
							window.location.href = data.url;
						} else {
							$('#alertDiv').html('修改失败');
							$('#alertDialog').modal('show');
						}
					}
				});
			});

			$(".chosen-select").chosen();
			$('#chosen-multiple-style').on('click', function(e) {
				var target = $(e.target).find('input[type=radio]');
				var which = parseInt(target.val());
				if (which == 2)
					$('#form-field-select-4').addClass('tag-input-style');
				else
					$('#form-field-select-4').removeClass('tag-input-style');
			});

			$('[data-rel=tooltip]').tooltip({
				container : 'body'
			});
			$('[data-rel=popover]').popover({
				container : 'body'
			});

			$('textarea[class*=autosize]').autosize({
				append : "\n"
			});
			$('textarea.limited').inputlimiter({
				remText : '%n character%s remaining...',
				limitText : 'max allowed : %n.'
			});

			$.mask.definitions['~'] = '[+-]';
			$('.input-mask-date').mask('99/99/9999');
			$('.input-mask-phone').mask('(999) 999-9999');
			$('.input-mask-eyescript').mask('~9.99 ~9.99 999');
			$(".input-mask-product").mask("a*-999-a999", {
				placeholder : " ",
				completed : function() {
					alert("You typed the following: " + this.val());
				}
			});

			$("#input-size-slider").css('width', '200px').slider(
					{
						value : 1,
						range : "min",
						min : 1,
						max : 8,
						step : 1,
						slide : function(event, ui) {
							var sizing = [ '', 'input-sm', 'input-lg',
									'input-mini', 'input-small',
									'input-medium', 'input-large',
									'input-xlarge', 'input-xxlarge' ];
							var val = parseInt(ui.value);
							$('#form-field-4').attr('class', sizing[val]).val(
									'.' + sizing[val]);
						}
					});

			$("#input-span-slider").slider(
					{
						value : 1,
						range : "min",
						min : 1,
						max : 12,
						step : 1,
						slide : function(event, ui) {
							var val = parseInt(ui.value);
							$('#form-field-5').attr('class', 'col-xs-' + val)
									.val('.col-xs-' + val);
						}
					});

			$("#slider-range")
					.css('height', '200px')
					.slider(
							{
								orientation : "vertical",
								range : true,
								min : 0,
								max : 100,
								values : [ 17, 67 ],
								slide : function(event, ui) {
									var val = ui.values[$(ui.handle).index() - 1]
											+ "";

									if (!ui.handle.firstChild) {
										$(ui.handle)
												.append(
														"<div class='tooltip right in' style='display:none;left:16px;top:-6px;'><div class='tooltip-arrow'></div><div class='tooltip-inner'></div></div>");
									}
									$(ui.handle.firstChild).show().children()
											.eq(1).text(val);
								}
							}).find('a').on('blur', function() {
						$(this.firstChild).hide();
					});

			$("#slider-range-max").slider({
				range : "max",
				min : 1,
				max : 10,
				value : 2
			});

			$("#eq > span").css({
				width : '90%',
				'float' : 'left',
				margin : '15px'
			}).each(function() {
				// read initial values from markup and remove that
				var value = parseInt($(this).text(), 10);
				$(this).empty().slider({
					value : value,
					range : "min",
					animate : true

				});
			});

			$('#id-input-file-1 , #id-input-file-2').ace_file_input({
				no_file : 'No File ...',
				btn_choose : 'Choose',
				btn_change : 'Change',
				droppable : false,
				onchange : null,
				thumbnail : false
			//| true | large
			//whitelist:'gif|png|jpg|jpeg'
			//blacklist:'exe|php'
			//onchange:''
			//
			});

			$('#id-input-file-3').ace_file_input({
				style : 'well',
				btn_choose : 'Drop files here or click to choose',
				btn_change : null,
				no_icon : 'icon-cloud-upload',
				droppable : true,
				thumbnail : 'small'//large | fit
				//,icon_remove:null//set null, to hide remove/reset button
				/**,before_change:function(files, dropped) {
					//Check an example below
					//or examples/file-upload.html
					return true;
				}*/
				/**,before_remove : function() {
					return true;
				}*/
				,
				preview_error : function(filename, error_code) {
					//name of the file that failed
					//error_code values
					//1 = 'FILE_LOAD_FAILED',
					//2 = 'IMAGE_LOAD_FAILED',
					//3 = 'THUMBNAIL_FAILED'
					//alert(error_code);
				}

			}).on('change', function() {
				//console.log($(this).data('ace_input_files'));
				//console.log($(this).data('ace_input_method'));
			});

			//dynamically change allowed formats by changing before_change callback function
			$('#id-file-format')
					.removeAttr('checked')
					.on(
							'change',
							function() {
								var before_change
								var btn_choose
								var no_icon
								if (this.checked) {
									btn_choose = "Drop images here or click to choose";
									no_icon = "icon-picture";
									before_change = function(files, dropped) {
										var allowed_files = [];
										for (var i = 0; i < files.length; i++) {
											var file = files[i];
											if (typeof file === "string") {
												//IE8 and browsers that don't support File Object
												if (!(/\.(jpe?g|png|gif|bmp)$/i)
														.test(file))
													return false;
											} else {
												var type = $.trim(file.type);
												if ((type.length > 0 && !(/^image\/(jpe?g|png|gif|bmp)$/i)
														.test(type))
														|| (type.length == 0 && !(/\.(jpe?g|png|gif|bmp)$/i)
																.test(file.name))//for android's default browser which gives an empty string for file.type
												)
													continue;//not an image so don't keep this file
											}

											allowed_files.push(file);
										}
										if (allowed_files.length == 0)
											return false;

										return allowed_files;
									}
								} else {
									btn_choose = "Drop files here or click to choose";
									no_icon = "icon-cloud-upload";
									before_change = function(files, dropped) {
										return files;
									}
								}
								var file_input = $('#id-input-file-3');
								file_input.ace_file_input('update_settings', {
									'before_change' : before_change,
									'btn_choose' : btn_choose,
									'no_icon' : no_icon
								})
								file_input.ace_file_input('reset_input');
							});

			$('#spinner1').ace_spinner({
				value : 0,
				min : 0,
				max : 200,
				step : 10,
				btn_up_class : 'btn-info',
				btn_down_class : 'btn-info'
			}).on('change', function() {
				//alert(this.value)
			});
			$('#spinner2').ace_spinner({
				value : 0,
				min : 0,
				max : 10000,
				step : 100,
				touch_spinner : true,
				icon_up : 'icon-caret-up',
				icon_down : 'icon-caret-down'
			});
			$('#spinner3').ace_spinner({
				value : 0,
				min : -100,
				max : 100,
				step : 10,
				on_sides : true,
				icon_up : 'icon-plus smaller-75',
				icon_down : 'icon-minus smaller-75',
				btn_up_class : 'btn-success',
				btn_down_class : 'btn-danger'
			});

			$('.date-picker').datepicker({
				autoclose : true
			}).next().on(ace.click_event, function() {
				$(this).prev().focus();
			});
			$('input[name=date-range-picker]').daterangepicker().prev().on(
					ace.click_event, function() {
						$(this).next().focus();
					});

			$('#timepicker1').timepicker({
				minuteStep : 1,
				showSeconds : true,
				showMeridian : false
			}).next().on(ace.click_event, function() {
				$(this).prev().focus();
			});

			$('#colorpicker1').colorpicker();
			$('#simple-colorpicker-1').ace_colorpicker();

			$(".knob").knob();

			//we could just set the data-provide="tag" of the element inside HTML, but IE8 fails!
			var tag_input = $('#form-field-tags');
			if (!(/msie\s*(8|7|6)/.test(navigator.userAgent.toLowerCase()))) {
				tag_input.tag({
					placeholder : tag_input.attr('placeholder'),
					//enable typeahead by specifying the source array
					source : ace.variable_US_STATES,//defined in ace.js >> ace.enable_search_ahead
				});
			} else {
				//display a textarea for old IE, because it doesn't support this plugin or another one I tried!
				tag_input.after(
						'<textarea id="' + tag_input.attr('id') + '" name="'
								+ tag_input.attr('name') + '" rows="3">'
								+ tag_input.val() + '</textarea>').remove();
				//$('#form-field-tags').autosize({append: "\n"});
			}

			/////////
			$('#modal-form input[type=file]').ace_file_input({
				style : 'well',
				btn_choose : 'Drop files here or click to choose',
				btn_change : null,
				no_icon : 'icon-cloud-upload',
				droppable : true,
				thumbnail : 'large'
			})

			//chosen plugin inside a modal will have a zero width because the select element is originally hidden
			//and its width cannot be determined.
			//so we set the width after modal is show
			$('#modal-form').on('shown.bs.modal', function() {
				$(this).find('.chosen-container').each(function() {
					$(this).find('a:first-child').css('width', '210px');
					$(this).find('.chosen-drop').css('width', '210px');
					$(this).find('.chosen-search input').css('width', '200px');
				});
			})
			/**
			//or you can activate the chosen plugin after modal is shown
			//this way select element becomes visible with dimensions and chosen works as expected
			$('#modal-form').on('shown', function () {
				$(this).find('.modal-chosen').chosen();
			})
			 */

		});
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
