<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<div class="navbar navbar-default" id="navbar">
		<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>

		<div class="navbar-container" id="navbar-container">
			<div class="navbar-header pull-left">
				<a href="#" class="navbar-brand"> <small> <i
						class="icon-leaf"></i> ACE后台管理系统
				</small>
				</a>
				<!-- /.brand -->
			</div>
			<!-- /.navbar-header -->

			<div class="navbar-header pull-right" role="navigation">
				<ul class="nav ace-nav">
					<li class="grey"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i class="icon-tasks"></i> <span
							class="badge badge-grey">4</span>
					</a>

						<ul
							class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i class="icon-ok"></i> 还有4个任务完成
							</li>

							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left">软件更新</span> <span class="pull-right">65%</span>
									</div>

									<div class="progress progress-mini ">
										<div style="width: 65%" class="progress-bar "></div>
									</div>
							</a></li>

							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left">硬件更新</span> <span class="pull-right">35%</span>
									</div>

									<div class="progress progress-mini ">
										<div style="width: 35%"
											class="progress-bar progress-bar-danger"></div>
									</div>
							</a></li>

							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left">单元测试</span> <span class="pull-right">15%</span>
									</div>

									<div class="progress progress-mini ">
										<div style="width: 15%"
											class="progress-bar progress-bar-warning"></div>
									</div>
							</a></li>

							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left">错误修复</span> <span class="pull-right">90%</span>
									</div>

									<div class="progress progress-mini progress-striped active">
										<div style="width: 90%"
											class="progress-bar progress-bar-success"></div>
									</div>
							</a></li>

							<li><a href="#"> 查看任务详情 <i class="icon-arrow-right"></i>
							</a></li>
						</ul></li>

					<li class="purple"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i
							class="icon-bell-alt icon-animated-bell"></i> <span
							class="badge badge-important">8</span>
					</a>

						<ul
							class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i class="icon-warning-sign"></i>
								8条通知</li>

							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left"> <i
											class="btn btn-xs no-hover btn-pink icon-comment"></i> 新闻评论
										</span> <span class="pull-right badge badge-info">+12</span>
									</div>
							</a></li>

							<li><a href="#"> <i
									class="btn btn-xs btn-primary icon-user"></i> 切换为编辑登录..
							</a></li>

							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left"> <i
											class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>
											新订单
										</span> <span class="pull-right badge badge-success">+8</span>
									</div>
							</a></li>

							<li><a href="#">
									<div class="clearfix">
										<span class="pull-left"> <i
											class="btn btn-xs no-hover btn-info icon-twitter"></i> 粉丝
										</span> <span class="pull-right badge badge-info">+11</span>
									</div>
							</a></li>

							<li><a href="#"> 查看所有通知 <i class="icon-arrow-right"></i>
							</a></li>
						</ul></li>

					<li class="green"><a data-toggle="dropdown"
						class="dropdown-toggle" href="#"> <i
							class="icon-envelope icon-animated-vertical"></i> <span
							class="badge badge-success">5</span>
					</a>

						<ul
							class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
							<li class="dropdown-header"><i class="icon-envelope-alt"></i>
								5条消息</li>

							<li><a href="#"> <img src="assets/avatars/avatar.png"
									class="msg-photo" alt="Alex's Avatar" /> <span
									class="msg-body"> <span class="msg-title"> <span
											class="blue">Alex:</span> 不知道写啥 ...
									</span> <span class="msg-time"> <i class="icon-time"></i> <span>1分钟以前</span>
									</span>
								</span>
							</a></li>

							<li><a href="#"> <img src="assets/avatars/avatar3.png"
									class="msg-photo" alt="Susan's Avatar" /> <span
									class="msg-body"> <span class="msg-title"> <span
											class="blue">Susan:</span> 不知道翻译...
									</span> <span class="msg-time"> <i class="icon-time"></i> <span>20分钟以前</span>
									</span>
								</span>
							</a></li>

							<li><a href="#"> <img src="assets/avatars/avatar4.png"
									class="msg-photo" alt="Bob's Avatar" /> <span class="msg-body">
										<span class="msg-title"> <span class="blue">Bob:</span>
											到底是不是英文 ...
									</span> <span class="msg-time"> <i class="icon-time"></i> <span>下午3:15</span>
									</span>
								</span>
							</a></li>

							<li><a href="inbox.html"> 查看所有消息 <i
									class="icon-arrow-right"></i>
							</a></li>
						</ul></li>

					<li class="light-blue"><a data-toggle="dropdown" href="#"
						class="dropdown-toggle"> <img class="nav-user-photo"
							src="assets/avatars/user.jpg" alt="Jason's Photo" /> <span
							class="user-info"> <small>欢迎光临,</small> Jason
						</span> <i class="icon-caret-down"></i>
					</a>

						<ul
							class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
							<li><a href="#"> <i class="icon-cog"></i> 设置
							</a></li>

							<li><a href="#"> <i class="icon-user"></i> 个人资料
							</a></li>

							<li class="divider"></li>

							<li><a href="#"> <i class="icon-off"></i> 退出
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
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script>

		<div class="main-container-inner">
			<a class="menu-toggler" id="menu-toggler" href="#"> <span
				class="menu-text"></span>
			</a>

			<div class="sidebar" id="sidebar">
				<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
					</script>

				<div class="sidebar-shortcuts" id="sidebar-shortcuts">
					<div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
						<button class="btn btn-success">
							<i class="icon-signal"></i>
						</button>

						<button class="btn btn-info">
							<i class="icon-pencil"></i>
						</button>

						<button class="btn btn-warning">
							<i class="icon-group"></i>
						</button>

						<button class="btn btn-danger">
							<i class="icon-cogs"></i>
						</button>
					</div>

					<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
						<span class="btn btn-success"></span> <span class="btn btn-info"></span>

						<span class="btn btn-warning"></span> <span class="btn btn-danger"></span>
					</div>
				</div>
				<!-- #sidebar-shortcuts -->

				<ul class="nav nav-list">
					<li class="active open"><a href="#" class="dropdown-toggle">
							<i class="icon-list"></i> <span class="menu-text">统计</span> <b
							class="arrow icon-angle-down"></b>
					</a>
						<ul class="submenu">
							<li class="active"><a href="#"> <i
									class="icon-double-angle-right"></i>统计页面一
							</a></li>

							<li><a href="#"> <i class="icon-double-angle-right"></i>
									统计页面二
							</a></li>

						</ul></li>

					<c:if
						test="${sessionScope.user.type == 2 || sessionScope.user.type == 1 }">
						<li><a href="userManage.action"> <i
								class="icon-dashboard"></i> <span class="menu-text">用户管理</span>
						</a></li>
					</c:if>
					<li><a href="#" class="dropdown-toggle"> <i
							class="icon-list"></i> <span class="menu-text">页面管理 </span> <b
							class="arrow icon-angle-down"></b>
					</a>
						<ul class="submenu">

							<c:if test="${sessionScope.user.type == 1 }">
								<li><a href="navPageTypeManage.action"> <i
										class="icon-double-angle-right"></i> 普通页面类型管理
								</a></li>

								<li><a href="navPageManage.action"> <i
										class="icon-double-angle-right"></i> 普通页面管理
								</a></li>

								<li><a href="scrollAd.action"> <i
										class="icon-double-angle-right"></i> 广告管理
								</a></li>
							</c:if>

							<c:if
								test="${ sessionScope.user.type == 1  || sessionScope.user.type == 2 }">

								<li><a href="commonAreaConfig.action"> <i
										class="icon-double-angle-right"></i> 商品扩展属性
								</a></li>

								<li><a href="commonArea.action"> <i
										class="icon-double-angle-right"></i> 代理商商品管理
								</a></li>
							</c:if>

							<li><a href="sellerConfig.action"> <i
									class="icon-double-angle-right"></i> 商家页面自定义字段配置
							</a></li>

							<li><a href="sellerArea.action"> <i
									class="icon-double-angle-right"></i> 商品管理
							</a></li>


						</ul></li>

				</ul>
				<!-- /.nav-list -->

				<div class="sidebar-collapse" id="sidebar-collapse">
					<i class="icon-double-angle-left"
						data-icon1="icon-double-angle-left"
						data-icon2="icon-double-angle-right"></i>
				</div>

				<script type="text/javascript">
						try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
					</script>
			</div>

			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<script type="text/javascript">
							try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
						</script>

					<ul class="breadcrumb">
						<li><i class="icon-home home-icon"></i> <a href="#">首页</a></li>
						<li class="active">控制台</li>
					</ul>
					<!-- .breadcrumb -->

					<div class="nav-search" id="nav-search">
						<form class="form-search">
							<span class="input-icon"> <input type="text"
								placeholder="Search ..." class="nav-search-input"
								id="nav-search-input" autocomplete="off" /> <i
								class="icon-search nav-search-icon"></i>
							</span>
						</form>
					</div>
					<!-- #nav-search -->
				</div>

				<div class="page-content">
					<div class="page-header">
						<h1>
							控制台 <small> <i class="icon-double-angle-right"></i> 查看
							</small>
						</h1>
					</div>
					<!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">
							<!-- PAGE CONTENT BEGINS -->

							<div class="alert alert-block alert-success">
								<button type="button" class="close" data-dismiss="alert">
									<i class="icon-remove"></i>
								</button>

								<i class="icon-ok green"></i> 欢迎使用 <strong class="green">
									Ace后台管理系统 <small>(v1.2)</small>
								</strong> ,轻量级好用的后台管理系统模版.
							</div>

							<!-- /row -->

							<div class="hr hr32 hr-dotted"></div>

							<div class="row">
								<div class="col-sm-5">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="lighter">
												<i class="icon-star orange"></i> 热门域名
											</h4>

											<div class="widget-toolbar">
												<a href="#" data-action="collapse"> <i
													class="icon-chevron-up"></i>
												</a>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">
												<table class="table table-bordered table-striped">
													<thead class="thin-border-bottom">
														<tr>
															<th><i class="icon-caret-right blue"></i> 名称</th>

															<th><i class="icon-caret-right blue"></i> 价格</th>

															<th class="hidden-480"><i
																class="icon-caret-right blue"></i> 状态</th>
														</tr>
													</thead>

													<tbody>
														<tr>
															<td>internet.com</td>

															<td><small> <s class="red">$29.99</s>
															</small> <b class="green">$19.99</b></td>

															<td class="hidden-480"><span
																class="label label-info arrowed-right arrowed-in">销售中</span>
															</td>
														</tr>

														<tr>
															<td>online.com</td>

															<td><small> <s class="red"></s>
															</small> <b class="green">$16.45</b></td>

															<td class="hidden-480"><span
																class="label label-success arrowed-in arrowed-in-right">可用</span>
															</td>
														</tr>

														<tr>
															<td>newnet.com</td>

															<td><small> <s class="red"></s>
															</small> <b class="green">$15.00</b></td>

															<td class="hidden-480"><span
																class="label label-danger arrowed">待定</span></td>
														</tr>

														<tr>
															<td>web.com</td>

															<td><small> <s class="red">$24.99</s>
															</small> <b class="green">$19.95</b></td>

															<td class="hidden-480"><span class="label arrowed">
																	<s>无货</s>
															</span></td>
														</tr>

														<tr>
															<td>domain.com</td>

															<td><small> <s class="red"></s>
															</small> <b class="green">$12.00</b></td>

															<td class="hidden-480"><span
																class="label label-warning arrowed arrowed-right">售完</span>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
											<!-- /widget-main -->
										</div>
										<!-- /widget-body -->
									</div>
									<!-- /widget-box -->
								</div>

								<div class="col-sm-7">
									<div class="widget-box transparent">
										<div class="widget-header widget-header-flat">
											<h4 class="lighter">
												<i class="icon-signal"></i> 销售统计
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

							<div class="hr hr32 hr-dotted"></div>

							<div class="row">
								<div class="col-sm-6">
									<div class="widget-box transparent" id="recent-box">
										<div class="widget-header">
											<h4 class="lighter smaller">
												<i class="icon-rss orange"></i> 最近
											</h4>

											<div class="widget-toolbar no-border">
												<ul class="nav nav-tabs" id="recent-tab">
													<li class="active"><a data-toggle="tab"
														href="#task-tab">任务</a></li>

													<li><a data-toggle="tab" href="#member-tab">会员</a></li>

													<li><a data-toggle="tab" href="#comment-tab">评论</a></li>
												</ul>
											</div>
										</div>

										<div class="widget-body">
											<div class="widget-main padding-4">
												<div class="tab-content padding-8 overflow-visible">
													<div id="task-tab" class="tab-pane active">
														<h4 class="smaller lighter green">
															<i class="icon-list"></i> 可拖拽排序列表
														</h4>

														<ul id="tasks" class="item-list">
															<li class="item-orange clearfix"><label
																class="inline"> <input type="checkbox"
																	class="ace" /> <span class="lbl"> 问答</span>
															</label>

																<div class="pull-right easy-pie-chart percentage"
																	data-size="30" data-color="#ECCB71" data-percent="42">
																	<span class="percent">42</span>%
																</div></li>

															<li class="item-red clearfix"><label class="inline">
																	<input type="checkbox" class="ace" /> <span
																	class="lbl"> BUG修复</span>
															</label>

																<div class="pull-right action-buttons">
																	<a href="#" class="blue"> <i
																		class="icon-pencil bigger-130"></i>
																	</a> <span class="vbar"></span> <a href="#" class="red">
																		<i class="icon-trash bigger-130"></i>
																	</a> <span class="vbar"></span> <a href="#" class="green">
																		<i class="icon-flag bigger-130"></i>
																	</a>
																</div></li>

															<li class="item-default clearfix"><label
																class="inline"> <input type="checkbox"
																	class="ace" /> <span class="lbl">添加新的特征</span>
															</label>

																<div
																	class="inline pull-right position-relative dropdown-hover">
																	<button class="btn btn-minier bigger btn-primary">
																		<i class="icon-cog icon-only bigger-120"></i>
																	</button>

																	<ul
																		class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-caret dropdown-close pull-right">
																		<li><a href="#" class="tooltip-success"
																			data-rel="tooltip" title="Mark&nbsp;as&nbsp;done">
																				<span class="green"> <i
																					class="icon-ok bigger-110"></i>
																			</span>
																		</a></li>

																		<li><a href="#" class="tooltip-error"
																			data-rel="tooltip" title="Delete"> <span
																				class="red"> <i class="icon-trash bigger-110"></i>
																			</span>
																		</a></li>
																	</ul>
																</div></li>

															<li class="item-blue clearfix"><label class="inline">
																	<input type="checkbox" class="ace" /> <span
																	class="lbl"> 更新模版脚本</span>
															</label></li>

															<li class="item-grey clearfix"><label class="inline">
																	<input type="checkbox" class="ace" /> <span
																	class="lbl"> 添加新皮肤</span>
															</label></li>

															<li class="item-green clearfix"><label
																class="inline"> <input type="checkbox"
																	class="ace" /> <span class="lbl"> 升级服务端</span>
															</label></li>

															<li class="item-pink clearfix"><label class="inline">
																	<input type="checkbox" class="ace" /> <span
																	class="lbl"> 清理垃圾</span>
															</label></li>
														</ul>
													</div>

													<div id="member-tab" class="tab-pane">
														<div class="clearfix">
															<div class="itemdiv memberdiv">
																<div class="user">
																	<img alt="Bob Doe's avatar"
																		src="assets/avatars/user.jpg" />
																</div>

																<div class="body">
																	<div class="name">
																		<a href="#">Bob Doe</a>
																	</div>

																	<div class="time">
																		<i class="icon-time"></i> <span class="green">20
																			min</span>
																	</div>

																	<div>
																		<span class="label label-warning label-sm">pending</span>

																		<div class="inline position-relative">
																			<button
																				class="btn btn-minier bigger btn-yellow btn-no-border dropdown-toggle"
																				data-toggle="dropdown">
																				<i class="icon-angle-down icon-only bigger-120"></i>
																			</button>

																			<ul
																				class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
																				<li><a href="#" class="tooltip-success"
																					data-rel="tooltip" title="Approve"> <span
																						class="green"> <i
																							class="icon-ok bigger-110"></i>
																					</span>
																				</a></li>

																				<li><a href="#" class="tooltip-warning"
																					data-rel="tooltip" title="Reject"> <span
																						class="orange"> <i
																							class="icon-remove bigger-110"></i>
																					</span>
																				</a></li>

																				<li><a href="#" class="tooltip-error"
																					data-rel="tooltip" title="Delete"> <span
																						class="red"> <i
																							class="icon-trash bigger-110"></i>
																					</span>
																				</a></li>
																			</ul>
																		</div>
																	</div>
																</div>
															</div>

															<div class="itemdiv memberdiv">
																<div class="user">
																	<img alt="Joe Doe's avatar"
																		src="assets/avatars/avatar2.png" />
																</div>

																<div class="body">
																	<div class="name">
																		<a href="#">Joe Doe</a>
																	</div>

																	<div class="time">
																		<i class="icon-time"></i> <span class="green">1
																			hour</span>
																	</div>

																	<div>
																		<span class="label label-warning label-sm">pending</span>

																		<div class="inline position-relative">
																			<button
																				class="btn btn-minier bigger btn-yellow btn-no-border dropdown-toggle"
																				data-toggle="dropdown">
																				<i class="icon-angle-down icon-only bigger-120"></i>
																			</button>

																			<ul
																				class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
																				<li><a href="#" class="tooltip-success"
																					data-rel="tooltip" title="Approve"> <span
																						class="green"> <i
																							class="icon-ok bigger-110"></i>
																					</span>
																				</a></li>

																				<li><a href="#" class="tooltip-warning"
																					data-rel="tooltip" title="Reject"> <span
																						class="orange"> <i
																							class="icon-remove bigger-110"></i>
																					</span>
																				</a></li>

																				<li><a href="#" class="tooltip-error"
																					data-rel="tooltip" title="Delete"> <span
																						class="red"> <i
																							class="icon-trash bigger-110"></i>
																					</span>
																				</a></li>
																			</ul>
																		</div>
																	</div>
																</div>
															</div>

															<div class="itemdiv memberdiv">
																<div class="user">
																	<img alt="Jim Doe's avatar"
																		src="assets/avatars/avatar.png" />
																</div>

																<div class="body">
																	<div class="name">
																		<a href="#">Jim Doe</a>
																	</div>

																	<div class="time">
																		<i class="icon-time"></i> <span class="green">2
																			hour</span>
																	</div>

																	<div>
																		<span class="label label-warning label-sm">pending</span>

																		<div class="inline position-relative">
																			<button
																				class="btn btn-minier bigger btn-yellow btn-no-border dropdown-toggle"
																				data-toggle="dropdown">
																				<i class="icon-angle-down icon-only bigger-120"></i>
																			</button>

																			<ul
																				class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
																				<li><a href="#" class="tooltip-success"
																					data-rel="tooltip" title="Approve"> <span
																						class="green"> <i
																							class="icon-ok bigger-110"></i>
																					</span>
																				</a></li>

																				<li><a href="#" class="tooltip-warning"
																					data-rel="tooltip" title="Reject"> <span
																						class="orange"> <i
																							class="icon-remove bigger-110"></i>
																					</span>
																				</a></li>

																				<li><a href="#" class="tooltip-error"
																					data-rel="tooltip" title="Delete"> <span
																						class="red"> <i
																							class="icon-trash bigger-110"></i>
																					</span>
																				</a></li>
																			</ul>
																		</div>
																	</div>
																</div>
															</div>

															<div class="itemdiv memberdiv">
																<div class="user">
																	<img alt="Alex Doe's avatar"
																		src="assets/avatars/avatar5.png" />
																</div>

																<div class="body">
																	<div class="name">
																		<a href="#">Alex Doe</a>
																	</div>

																	<div class="time">
																		<i class="icon-time"></i> <span class="green">3
																			hour</span>
																	</div>

																	<div>
																		<span class="label label-danger label-sm">blocked</span>
																	</div>
																</div>
															</div>

															<div class="itemdiv memberdiv">
																<div class="user">
																	<img alt="Bob Doe's avatar"
																		src="assets/avatars/avatar2.png" />
																</div>

																<div class="body">
																	<div class="name">
																		<a href="#">Bob Doe</a>
																	</div>

																	<div class="time">
																		<i class="icon-time"></i> <span class="green">6
																			hour</span>
																	</div>

																	<div>
																		<span class="label label-success label-sm arrowed-in">approved</span>
																	</div>
																</div>
															</div>

															<div class="itemdiv memberdiv">
																<div class="user">
																	<img alt="Susan's avatar"
																		src="assets/avatars/avatar3.png" />
																</div>

																<div class="body">
																	<div class="name">
																		<a href="#">Susan</a>
																	</div>

																	<div class="time">
																		<i class="icon-time"></i> <span class="green">yesterday</span>
																	</div>

																	<div>
																		<span class="label label-success label-sm arrowed-in">approved</span>
																	</div>
																</div>
															</div>

															<div class="itemdiv memberdiv">
																<div class="user">
																	<img alt="Phil Doe's avatar"
																		src="assets/avatars/avatar4.png" />
																</div>

																<div class="body">
																	<div class="name">
																		<a href="#">Phil Doe</a>
																	</div>

																	<div class="time">
																		<i class="icon-time"></i> <span class="green">2
																			days ago</span>
																	</div>

																	<div>
																		<span
																			class="label label-info label-sm arrowed-in arrowed-in-right">online</span>
																	</div>
																</div>
															</div>

															<div class="itemdiv memberdiv">
																<div class="user">
																	<img alt="Alexa Doe's avatar"
																		src="assets/avatars/avatar1.png" />
																</div>

																<div class="body">
																	<div class="name">
																		<a href="#">Alexa Doe</a>
																	</div>

																	<div class="time">
																		<i class="icon-time"></i> <span class="green">3天以前</span>
																	</div>

																	<div>
																		<span class="label label-success label-sm arrowed-in">approved</span>
																	</div>
																</div>
															</div>
														</div>

														<div class="center">
															<i class="icon-group icon-2x green"></i> &nbsp; <a
																href="#"> 查看所有会员 &nbsp; <i class="icon-arrow-right"></i>
															</a>
														</div>

														<div class="hr hr-double hr8"></div>
													</div>
													<!-- member-tab -->

													<div id="comment-tab" class="tab-pane">
														<div class="comments">
															<div class="itemdiv commentdiv">
																<div class="user">
																	<img alt="Bob Doe's Avatar"
																		src="assets/avatars/avatar.png" />
																</div>

																<div class="body">
																	<div class="name">
																		<a href="#">Bob Doe</a>
																	</div>

																	<div class="time">
																		<i class="icon-time"></i> <span class="green">6
																			min</span>
																	</div>

																	<div class="text">
																		<i class="icon-quote-left"></i> Lorem ipsum dolor sit
																		amet, consectetur adipiscing elit. Quisque commodo
																		massa sed ipsum porttitor facilisis &hellip;
																	</div>
																</div>

																<div class="tools">
																	<div class="inline position-relative">
																		<button
																			class="btn btn-minier bigger btn-yellow dropdown-toggle"
																			data-toggle="dropdown">
																			<i class="icon-angle-down icon-only bigger-120"></i>
																		</button>

																		<ul
																			class="dropdown-menu dropdown-only-icon dropdown-yellow pull-right dropdown-caret dropdown-close">
																			<li><a href="#" class="tooltip-success"
																				data-rel="tooltip" title="Approve"> <span
																					class="green"> <i class="icon-ok bigger-110"></i>
																				</span>
																			</a></li>

																			<li><a href="#" class="tooltip-warning"
																				data-rel="tooltip" title="Reject"> <span
																					class="orange"> <i
																						class="icon-remove bigger-110"></i>
																				</span>
																			</a></li>

																			<li><a href="#" class="tooltip-error"
																				data-rel="tooltip" title="Delete"> <span
																					class="red"> <i
																						class="icon-trash bigger-110"></i>
																				</span>
																			</a></li>
																		</ul>
																	</div>
																</div>
															</div>

															<div class="itemdiv commentdiv">
																<div class="user">
																	<img alt="Jennifer's Avatar"
																		src="assets/avatars/avatar1.png" />
																</div>

																<div class="body">
																	<div class="name">
																		<a href="#">Jennifer</a>
																	</div>

																	<div class="time">
																		<i class="icon-time"></i> <span class="blue">15
																			min</span>
																	</div>

																	<div class="text">
																		<i class="icon-quote-left"></i> Lorem ipsum dolor sit
																		amet, consectetur adipiscing elit. Quisque commodo
																		massa sed ipsum porttitor facilisis &hellip;
																	</div>
																</div>

																<div class="tools">
																	<div class="action-buttons bigger-125">
																		<a href="#"> <i class="icon-pencil blue"></i>
																		</a> <a href="#"> <i class="icon-trash red"></i>
																		</a>
																	</div>
																</div>
															</div>

															<div class="itemdiv commentdiv">
																<div class="user">
																	<img alt="Joe's Avatar"
																		src="assets/avatars/avatar2.png" />
																</div>

																<div class="body">
																	<div class="name">
																		<a href="#">Joe</a>
																	</div>

																	<div class="time">
																		<i class="icon-time"></i> <span class="orange">22
																			min</span>
																	</div>

																	<div class="text">
																		<i class="icon-quote-left"></i> Lorem ipsum dolor sit
																		amet, consectetur adipiscing elit. Quisque commodo
																		massa sed ipsum porttitor facilisis &hellip;
																	</div>
																</div>

																<div class="tools">
																	<div class="action-buttons bigger-125">
																		<a href="#"> <i class="icon-pencil blue"></i>
																		</a> <a href="#"> <i class="icon-trash red"></i>
																		</a>
																	</div>
																</div>
															</div>

															<div class="itemdiv commentdiv">
																<div class="user">
																	<img alt="Rita's Avatar"
																		src="assets/avatars/avatar3.png" />
																</div>

																<div class="body">
																	<div class="name">
																		<a href="#">Rita</a>
																	</div>

																	<div class="time">
																		<i class="icon-time"></i> <span class="red">50
																			min</span>
																	</div>

																	<div class="text">
																		<i class="icon-quote-left"></i> Lorem ipsum dolor sit
																		amet, consectetur adipiscing elit. Quisque commodo
																		massa sed ipsum porttitor facilisis &hellip;
																	</div>
																</div>

																<div class="tools">
																	<div class="action-buttons bigger-125">
																		<a href="#"> <i class="icon-pencil blue"></i>
																		</a> <a href="#"> <i class="icon-trash red"></i>
																		</a>
																	</div>
																</div>
															</div>
														</div>

														<div class="hr hr8"></div>

														<div class="center">
															<i class="icon-comments-alt icon-2x green"></i> &nbsp; <a
																href="#"> See all comments &nbsp; <i
																class="icon-arrow-right"></i>
															</a>
														</div>

														<div class="hr hr-double hr8"></div>
													</div>
												</div>
											</div>
											<!-- /widget-main -->
										</div>
										<!-- /widget-body -->
									</div>
									<!-- /widget-box -->
								</div>
								<!-- /span -->

								<div class="col-sm-6">
									<div class="widget-box ">
										<div class="widget-header">
											<h4 class="lighter smaller">
												<i class="icon-comment blue"></i> 会话
											</h4>
										</div>

										<div class="widget-body">
											<div class="widget-main no-padding">
												<div class="dialogs">
													<div class="itemdiv dialogdiv">
														<div class="user">
															<img alt="Alexa's Avatar"
																src="assets/avatars/avatar1.png" />
														</div>

														<div class="body">
															<div class="time">
																<i class="icon-time"></i> <span class="green">4秒钟前</span>
															</div>

															<div class="name">
																<a href="#">Alexa</a>
															</div>
															<div class="text">大家好啊</div>

															<div class="tools">
																<a href="#" class="btn btn-minier btn-info"> <i
																	class="icon-only icon-share-alt"></i>
																</a>
															</div>
														</div>
													</div>

													<div class="itemdiv dialogdiv">
														<div class="user">
															<img alt="John's Avatar" src="assets/avatars/avatar.png" />
														</div>

														<div class="body">
															<div class="time">
																<i class="icon-time"></i> <span class="blue">38秒以前</span>
															</div>

															<div class="name">
																<a href="#">John</a>
															</div>
															<div class="text">框架很好用嘛</div>

															<div class="tools">
																<a href="#" class="btn btn-minier btn-info"> <i
																	class="icon-only icon-share-alt"></i>
																</a>
															</div>
														</div>
													</div>

													<div class="itemdiv dialogdiv">
														<div class="user">
															<img alt="Bob's Avatar" src="assets/avatars/user.jpg" />
														</div>

														<div class="body">
															<div class="time">
																<i class="icon-time"></i> <span class="orange">2分钟以前</span>
															</div>

															<div class="name">
																<a href="#">Bob</a> <span
																	class="label label-info arrowed arrowed-in-right">admin</span>
															</div>
															<div class="text">欢迎大家使用ACE后台管理系统.</div>

															<div class="tools">
																<a href="#" class="btn btn-minier btn-info"> <i
																	class="icon-only icon-share-alt"></i>
																</a>
															</div>
														</div>
													</div>

													<div class="itemdiv dialogdiv">
														<div class="user">
															<img alt="Jim's Avatar" src="assets/avatars/avatar4.png" />
														</div>

														<div class="body">
															<div class="time">
																<i class="icon-time"></i> <span class="grey">3分钟以前</span>
															</div>

															<div class="name">
																<a href="#">Jim</a>
															</div>
															<div class="text">大家多提提BUG</div>

															<div class="tools">
																<a href="#" class="btn btn-minier btn-info"> <i
																	class="icon-only icon-share-alt"></i>
																</a>
															</div>
														</div>
													</div>

													<div class="itemdiv dialogdiv">
														<div class="user">
															<img alt="Alexa's Avatar"
																src="assets/avatars/avatar1.png" />
														</div>

														<div class="body">
															<div class="time">
																<i class="icon-time"></i> <span class="green">4分钟以前</span>
															</div>

															<div class="name">
																<a href="#">Alexa</a>
															</div>
															<div class="text">继续支持ACE后台系统</div>

															<div class="tools">
																<a href="#" class="btn btn-minier btn-info"> <i
																	class="icon-only icon-share-alt"></i>
																</a>
															</div>
														</div>
													</div>
												</div>

												<form>
													<div class="form-actions">
														<div class="input-group">
															<input placeholder="Type your message here ..."
																type="text" class="form-control" name="message" /> <span
																class="input-group-btn">
																<button class="btn btn-sm btn-info no-radius"
																	type="button">
																	<i class="icon-share-alt"></i> 发送
																</button>
															</span>
														</div>
													</div>
												</form>
											</div>
											<!-- /widget-main -->
										</div>
										<!-- /widget-body -->
									</div>
									<!-- /widget-box -->
								</div>
								<!-- /span -->
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

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

	<!-- <![endif]-->

	<!--[if IE]>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<![endif]-->

	<!--[if !IE]> -->

	<script type="text/javascript">
			window.jQuery || document.write("<script src='assets/js/jquery-2.0.3.min.js'>"+"<"+"script>");
		</script>

	<!-- <![endif]-->

	<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");
</script>
<![endif]-->

	<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
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

	<!-- ace scripts -->

	<script src="assets/js/ace-elements.min.js"></script>
	<script src="assets/js/ace.min.js"></script>

	<!-- inline scripts related to this page -->

	<script type="text/javascript">
			jQuery(function($) {
			
			
				var d1 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d1.push([i, Math.sin(i)]);
				}
			
				var d2 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.5) {
					d2.push([i, Math.cos(i)]);
				}
			
				var d3 = [];
				for (var i = 0; i < Math.PI * 2; i += 0.2) {
					d3.push([i, Math.tan(i)]);
				}
				
			
				var sales_charts = $('#sales-charts').css({'width':'100%' , 'height':'220px'});
				$.plot("#sales-charts", [
					{ label: "Domains", data: d1 },
					{ label: "Hosting", data: d2 },
					{ label: "Services", data: d3 }
				], {
					hoverable: true,
					shadowSize: 0,
					series: {
						lines: { show: true },
						points: { show: true }
					},
					xaxis: {
						tickLength: 0
					},
					yaxis: {
						ticks: 10,
						min: -2,
						max: 2,
						tickDecimals: 3
					},
					grid: {
						backgroundColor: { colors: [ "#fff", "#fff" ] },
						borderWidth: 1,
						borderColor:'#555'
					}
				});
			
			
			})
		</script>
	<div style="display: none">
		<script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
			language='JavaScript' charset='gb2312'></script>
	</div>
</body>
</html>
