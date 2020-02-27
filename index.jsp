<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	response.addHeader("pragma", "no-cache");
	response.addHeader("cache-control", "no-cache");
	response.addHeader("expires", "0");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>crm后台管理系统</title>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css?v=20190325">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css?v=20191017">
	<link rel="stylesheet" type="text/css" href="easyui/demo.css">
	<style type="text/css">
		a {
			text-decoration: none
		}

		.zh_login {
			width: 56px;
			height: 43px;
			background: url(images/zh_logo.png) no-repeat;
			float: left;
			margin-left: 30px;
			margin-top: 10px;
			margin-right: 25px;
		}

		.zh_name {
			color: #444444;
			float: left;
			font-size: 25px;
			margin-top: 17px;
			font-family: "FangSong";
		}

		.tabs-header,
		.tabs-scroller-left,
		.tabs-scroller-right,
		.tabs-tool,
		.tabs,
		.tabs-panels,
		.tabs li a.tabs-inner,
		.tabs li.tabs-selected a.tabs-inner,
		.tabs-header-bottom .tabs li.tabs-selected a.tabs-inner,
		.tabs-header-left .tabs li.tabs-selected a.tabs-inner,
		.tabs-header-right .tabs li.tabs-selected a.tabs-inner {
			border: none;
		}

		.tabs li.tabs-selected a.tabs-inner {
			border-bottom: inherit;
			color: #0E2D5F;
			background-color: #E0ECFF;
			background: -webkit-linear-gradient(top, #EFF5FF 0, #E0ECFF 100%);
			background: -moz-linear-gradient(top, #EFF5FF 0, #E0ECFF 100%);
			background: -o-linear-gradient(top, #EFF5FF 0, #E0ECFF 100%);
			background: linear-gradient(to bottom, #EFF5FF 0, #E0ECFF 100%);
			background-repeat: repeat-x;
		}

		.information {
			margin-top: 20px;
		}

		.panel-with-icon {
			padding-left: 0px;
		}

		.panel-header,
		.panel-body {
			border-right: 0;
		}

		.layout-expand {
			margin-left: -1px;
		}

		.icon-xp {
			background: url(images/memberconsumptionicon.png) no-repeat;
			background-size: 100% 100%;
		}

		.icon-kbs {
			background: url(images/privatecurriculumicon.png) no-repeat;
			background-size: 100% 100%;
		}

		.icon-tykhx {
			background: url(images/experiencecardicon.png) no-repeat;
			background-size: 100% 100%;
		}

		.icon-khrz {
			background: url(images/self-helpicon.png) no-repeat;
			background-size: 100% 100%;
		}

		.tabs {
			background-color: #E0ECFF;
			background: -webkit-linear-gradient(top, #EFF5FF 0, #E0ECFF 100%);
			background: -moz-linear-gradient(top, #EFF5FF 0, #E0ECFF 100%);
			background: -o-linear-gradient(top, #EFF5FF 0, #E0ECFF 100%);
			background: linear-gradient(to bottom, #EFF5FF 0, #E0ECFF 100%);
			background-repeat: repeat-x;
			border: 1px solid #71B2EE;
			border-bottom: none;
		}

		.tabs-header {
			padding-top: 0px;
		}

		.tabs li.tabs-selected a.tabs-inner {
			border-bottom: inherit;
		}

		.panel-body {
			border-top: none;
		}

		.layout-split-west {
			border-right: none;
		}

		.tabs-container {
			margin-left: 5px;
		}

		.msk {
			position: absolute;
			top: 0;
			width: 100%;
			height: 100%;
			z-index: 9999;
			display: none;
		}

		/*弹框*/
		.leave_sure {
			width: 700px;
			overflow: hidden;
			padding-bottom: 10px;
			background: linear-gradient(180deg, rgba(224, 236, 255, 1),
					rgba(237, 244, 255, 1));
			border: 1px solid rgba(113, 178, 239, 1);
			border-radius: 10px;
			position: absolute;
			top: 5px;
			left: 50%;
			margin-left: -351px;
			background-color: #E0ECFF;
			background: -webkit-linear-gradient(top, #EFF5FF 0, #E0ECFF 100%);
			background: -moz-linear-gradient(top, #EFF5FF 0, #E0ECFF 100%);
			background: -o-linear-gradient(top, #EFF5FF 0, #E0ECFF 100%);
			background: linear-gradient(to bottom, #EFF5FF 0, #E0ECFF 100%);
			background-repeat: repeat-x;
			box-shadow: 7px 7px 20px 0px rgba(107, 107, 107, 0.4);
		}

		#leave_sure2 {
			top: 50%;
			margin-top: -246px;
		}

		.leave_title {
			height: 100px;
			line-height: 100px;
			cursor: move;
		}

		.leave_title img {
			width: 55px;
			height: 55px;
			vertical-align: middle;
			margin-right: 30p;
			float: left;
			margin-top: 22.5px;
			margin-left: 45px;
		}

		.leave_title span {
			font-size: 35px;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(68, 68, 68, 1);
			margin-left: 185px;
		}

		.leave_con {
			margin: 0 auto;
			width: 680px;
			overflow: hidden;
			background: rgba(255, 255, 255, 1);
			border: 1px solid rgba(113, 178, 239, 1);
			box-shadow: 4px 4px 10px 0px rgba(107, 107, 107, 0)
		}

		.leave_con select {
			margin: 35px auto;
			display: block;
			width: 200px;
			height: 35px;
			border-radius: 5px;
		}

		.leave_con_table {
			width: 650px;
			margin: 40px auto 0;
			border: 1px solid #BFBFBF;
			overflow: hidden;
			border-bottom: none;
		}

		.leave_con_item {
			width: 650px;
			height: 100px;
			border-bottom: 1px solid #BFBFBF;
			float: left;
		}

		.leave_con_item .name {
			float: left;
			width: 30%;
			height: 100px;
			line-height: 100px;
			border-right: 1px solid #BFBFBF;
			font-size: 38px;
			color: #444440;
			text-align: center;
		}

		.leave_con_item .name_con {
			float: left;
			width: 69%;
			font-size: 40px;
			color: #444444;
		}

		.leave_con_item .name_con60 {
			overflow: hidden;
			height: 60px;
			margin-top: -4px;
		}

		.leave_con_item .name_con span {
			padding-left: 10px;
		}

		.leave_con_item .name_con input {
			padding-left: 10px;
			height: 100px;
			width: 100%;
			font-size: 40px;
			border: none;
			outline: none
		}

		.leave_con_sure {
			margin: 40px 0;
			overflow: hidden;
		}

		.leave_con_sure span {
			font-size: 30px;
			color: #fff;
		}

		.leave_con_sure .sure {
			width: 150px;
			height: 50px;
			background: rgba(113, 178, 239, 1);
			border-radius: 3px;
			line-height: 50px;
			text-align: center;
			cursor: pointer;
			margin: 0 auto;
		}

		.leave_con_sure .quxiao {
			float: left;
			width: 150px;
			height: 55px;
			background: rgba(255, 151, 0, 1);
			border-radius: 3px;
			line-height: 55px;
			text-align: center;
			margin-left: 60px;
			cursor: pointer;
		}

		.lhsize {
			font-size: 20px !important;
		}

		.lh2 {
			line-height: 28px !important;
			overflow: auto !important;
		}

		.close {
			width: 25px;
			height: 25px;
			line-height: 42px;
			background: url(../images/closebtn.png) no-repeat;
			background-size: 100% 100%;
			text-align: center;
			position: absolute;
			right: 10px;
			top: 10px;
			cursor: pointer;
		}

		.close span {
			font-size: 40px;
			color: #909090;
		}

		.item60 {
			height: 60px;
			width: 92%;
			display: inline-block;
		}

		.item30 {
			height: 60px !important;
			font-size: 30px !important;
		}

		.intoList.active {
			background-color: #FAA262;
			color: #fff;
		}

		.intoList.active input {
			background-color: #FAA262;
			color: #fff;
			border-bottom: 1px solid #fff;
		}

		.intoList.active .checks {
			background-color: #FAA262;
			color: #fff;
			border: 1px solid #fff;
			border-bottom: 1px solid #fff;
		}

		.intoList.active .item {
			border-left: 1px solid #ffffff;
		}
	</style>
</head>

<body class="easyui-layout">
	<div class="msk">
		<div class="leave_sure" id="leave_sure1" style="top: 50%;margin-top: -246px;">
			<div class="leave_title">
				<img src="images/prompticon.png" /><span class="tkTip">选择会所</span>
			</div>
			<div class="leave_con">
				<select name="clubname" id="club">
				</select>
				<div class="leave_con_sure">
					<div class="sure" id="dropsDr">
						<span>确定</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div data-options="region:'north',border:false"
		style="height: 70px; padding: 5px;font-size: 15px;background-color: #fff;" align="right">
		<div class="zh_login"></div>
		<div class="zh_name">中航健身会CRM后台管理系统</div>
		<div class="information">
			<font color="#444444" style="margin-right: 10px;">【当前会所】<span id="clubName"
					style="margin-left: 15px;"></span>
			</font>
			<font color="#444444">【<%=request.getAttribute("realName")%>】<input type="hidden"
					value="<%=request.getAttribute("realName")%>" id="username" /> 【欢迎登录】
			</font><a href="#" onclick="updatePassword()">
				<font color="#444444" style="margin: 0 5px;">【修改密码】</font>
			</a><a href="rest/user/logout">
				<font color="#444444">【退出】</font>
			</a>
		</div>
	</div>
	<div data-options="region:'south',split:true" style="height: 30px;" align="center">Copyright 2017</div>
	<div data-options="region:'west',split:true,iconCls:'icon-folder_up'" title="主菜单" style="width: 180px;">
		<div class="easyui-accordion" data-options="fit:true,border:false">
			<shiro:hasPermission name="1007">
				<div title="前台管理" style="padding: 10px;">
					<div align="left">
						<shiro:hasPermission name="100706">
							<a href="#" onclick="javascript:addTab('入离场','rest/customer/packagemenu/fitnessMenu');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-pj',width:'150px',iconAlign:'left'">入离场</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100703">
							<a href="#" onclick="javascript:addTab('私教日程表','rest/order/orderListPage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-large-clipart',width:'150px',iconAlign:'left'">私教日程表</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="100705">
							<a href="#"
								onclick="javascript:addTab('体验券核销','rest/customerCoupon/customerCouponPackageListPage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-hyk',width:'150px',iconAlign:'left'">体验券核销</a>
						</shiro:hasPermission>
					</div>
				</div>
			</shiro:hasPermission>
			<shiro:hasPermission name="1001">
				<div title="客户管理" style="padding: 10px;">
					<div align="left">
						<shiro:hasPermission name="100104">
							<a href="#" onclick="javascript:addTab('客户详情','rest/customer/card/customerCardList');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-khxq',width:'150px',iconAlign:'left'">客户详情</a>
						</shiro:hasPermission>

						<shiro:hasPermission name="100105">
							<a href="#"
								onclick="javascript:addTab('客户评价','rest/evaluation/evaluationlistpage?id=100105');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-khpjs',width:'150px',iconAlign:'left'">客户评价</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100108">
							<a href="#"
								onclick="javascript:addTab('客户回访','rest/customer/visit/customerVisitList?id=100108');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-khpjs1',width:'150px',iconAlign:'left'">客户回访</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100109">
							<a href="#" onclick="javascript:addTab('电子合同','rest/customerGx/customerStatementListPc');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-tc',width:'150px',iconAlign:'left'">电子合同</a>
						</shiro:hasPermission>

					</div>
				</div>
			</shiro:hasPermission>

			<shiro:hasPermission name="1006">
				<div title="私教管理" style="padding: 10px;">
					<div align="left">
						<shiro:hasPermission name="100601">
							<a href="#" onclick="javascript:addTab('私教员工管理','rest/user/privatemanagement');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-tc2',width:'150px',iconAlign:'left'">私教员工管理</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100602">
							<a href="#"
								onclick="javascript:addTab('私教批量处理','rest/system/coachUpload/privateCoachUpload');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-tc3',width:'150px',iconAlign:'left'">私教批量处理</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100604">
							<a href="#" onclick="javascript:addTab('课时发布浏览','rest/order/courseBrowsePage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-tc4',width:'150px',iconAlign:'left'">课时发布浏览</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100605">
							<a href="#" onclick="javascript:addTab('私教照片审核','rest/user/privatePicture');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-tc5',width:'150px',iconAlign:'left'">私教照片审核</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100606">
							<a href="#"
								onclick="javascript:addTab('私教课程分析表','rest/coach/coursetime/coachCourseReport');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-sjglsjkcfxb',width:'150px',iconAlign:'left'">私教课程分析表</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100603">
							<a href="#" onclick="javascript:addTab('私教上课训练明细','rest/order/coachOrderList');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-sjglsjskxlmx',width:'150px',iconAlign:'left'">私教上课训练明细</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100607">
							<a href="#" onclick="javascript:addTab('扣费接口失败处理','rest/order/reorderpage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-kfsb',width:'150px',iconAlign:'left'">扣费接口失败处理</a>
						</shiro:hasPermission>

					</div>
				</div>
			</shiro:hasPermission>
			<shiro:hasPermission name="1008">
				<div title="团课管理" style="padding: 10px;">
					<div align="left">
						<shiro:hasPermission name="100801">
							<a href="#" onclick="javascript:addTab('团课上传','rest/schedule/scheduleList');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-wz',width:'150px',iconAlign:'left'">团课上传</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100802">
							<a href="#" onclick="javascript:addTab('团操课表核对统计','rest/pageReport/checkCourse');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-tcgltckbhdtj',width:'150px',iconAlign:'left'">团操课表核对统计</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100803">
							<a href="#" onclick="javascript:addTab('课程管理','rest/leagueCurriculum/groupCourseList');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-tcglkcgl',width:'150px',iconAlign:'left'">课程管理</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100804">
							<a href="#" onclick="javascript:addTab('教练管理','rest/leagueCoach/leagueCoachList');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-tcgljlgl',width:'150px',iconAlign:'left'">教练管理</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100805">
							<a href="#"
								onclick="javascript:addTab('排课管理','rest/courseScheduling/courseSchedulingList');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-tcglpkgl',width:'150px',iconAlign:'left'">排课管理</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100806">
							<a href="#" onclick="javascript:addTab('课程表','rest/classScheduling/classSchedulingList');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-tcglkcb',width:'150px',iconAlign:'left'">课程表</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100807">
							<a href="#"
								onclick="javascript:addTab('团课数据分析','rest/curriculumAnalyze/curriculumAnalyzeList');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-tcgltksjfx',width:'150px',iconAlign:'left'">团课数据分析</a>
						</shiro:hasPermission>
					</div>
				</div>
			</shiro:hasPermission>
			<shiro:hasPermission name="1002">
				<div title="营销管理" style="padding: 10px;">
					<div align="left">
						<shiro:hasPermission name="100201">
							<a href="#" onclick="javascript:addTab('邀请有礼','rest/activities/invitationListPage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-yxglyqyl',width:'150px',iconAlign:'left'">邀请有礼</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100202">
							<a href="#" onclick="javascript:addTab('首页海报管理','rest/logo/logoListpage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-hb',width:'150px',iconAlign:'left'">首页海报管理</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100203">
							<a href="#" onclick="javascript:addTab('打卡活动管理','rest/activities/activitiesPage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-hd',width:'150px',iconAlign:'left'">打卡活动管理</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100204">
							<a href="#" onclick="javascript:addTab('分享有礼','rest/shareActivity/shareActivityPage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-yxglfxyl',width:'150px',iconAlign:'left'">分享有礼</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100205">
							<a href="#"
								onclick="javascript:addTab('评论有礼','rest/evaluateActivity/evaluateActivityPage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-yxglpjyl',width:'150px',iconAlign:'left'">评论有礼</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100207">
							<a href="#" onclick="javascript:addTab('体验券管理','rest/coupon/couponListPage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-bm',width:'150px',iconAlign:'left'">体验券管理</a>
						</shiro:hasPermission>
					</div>
				</div>
			</shiro:hasPermission>
			<shiro:hasPermission name="1009">
				<div title="B2B管理" style="padding: 10px;">
					<div align="left">
						<shiro:hasPermission name="100902">
							<a href="#" onclick="javascript:addTab('企业档案','rest/business/archives/archivesPage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-B2Bqyda',width:'150px',iconAlign:'left'">企业档案</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100901">
							<a href="#" onclick="javascript:addTab('申请列表','rest/business/apply/applyPage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-hd2',width:'150px',iconAlign:'left'">申请列表</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100903">
							<a href="#"
								onclick="javascript:addTab('企业消费明细','rest/business/employee/busTradeDetailPage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-B2Bqyxfmx',width:'150px',iconAlign:'left'">企业消费明细</a>
						</shiro:hasPermission>
					</div>
				</div>
			</shiro:hasPermission>
			<shiro:hasPermission name="1003">
				<div title="数据中心" style="padding: 10px;">
					<div align="left">
						<shiro:hasPermission name="100305">
							<a href="#" onclick="javascript:addTab('团操课表核对统计','rest/pageReport/checkCourse');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-dj',width:'150px',iconAlign:'left'">团操课表核对统计</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100310">
							<a href="#" onclick="javascript:addTab('回访概况','rest/customer/visit/visitOverviewList');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'ficon-dj',width:'150px',iconAlign:'left'">回访概况</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100309">
							<a href="#" onclick="javascript:addTab('SPA会员服务记录','rest/records/consumptionRecordList');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-dj1',width:'150px',iconAlign:'left'">SPA会员服务记录</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100311">
							<a href="#" onclick="javascript:addTab('执行日报','rest/report/daliy/daliyReportJsp');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'picon-dj1',width:'150px',iconAlign:'left'">执行日报</a>
						</shiro:hasPermission>
					</div>
				</div>
			</shiro:hasPermission>
			<shiro:hasPermission name="1005">
				<div title="配置中心" style="padding: 10px;">
					<div align="left">
						<shiro:hasPermission name="100502">
							<a href="#"
								onclick="javascript:addTab('数据字典','rest/dictionarytype/dictionarytypelistpage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-upSale',width:'150px',iconAlign:'left'">数据字典</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100501">
							<a href="#" onclick="javascript:addTab('门店配置管理','rest/club/clublistpage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-upSale2',width:'150px',iconAlign:'left'">门店配置管理</a>
							<a href="#" onclick="javascript:addTab('组织机构管理','rest/department/deptpage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-zzjg',width:'150px',iconAlign:'left'">组织机构管理</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100505">
							<a href="#" onclick="javascript:addTab('动作库导入','rest/coach/plan/actionList');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-undo',width:'150px',iconAlign:'left'">动作库导入</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100506">
							<a href="#" onclick="javascript:addTab('系统参数','rest/sysparam/sysparammanage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-pzzxxtcs',width:'150px',iconAlign:'left'">系统参数</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100510">
							<a href="#" onclick="javascript:addTab('动作维护','rest/coach/plan/actionHouseList');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-undo1',width:'150px',iconAlign:'left'">动作维护</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100509">
							<a href="#" onclick="javascript:addTab('方案模板','rest/coach/plan/planUploadList');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-upSale1',width:'150px',iconAlign:'left'">方案模板</a>
						</shiro:hasPermission>
					</div>
				</div>
			</shiro:hasPermission>
			<shiro:hasPermission name="1004">
				<div title="权限管理" style="padding: 10px;">
					<div align="left">
						<shiro:hasPermission name="100401">
							<a href="#" onclick="javascript:addTab('员工管理','rest/user/userlistpage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-large-chart',width:'150px',iconAlign:'left'">员工管理</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100402">
							<a href="#" onclick="javascript:addTab('角色管理','rest/role/rolelistpage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-user',width:'150px',iconAlign:'left'">角色管理</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100403">
							<a href="#" onclick="javascript:addTab('员工权限分配','rest/role/roleuserpage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-fwl1',width:'150px',iconAlign:'left'">员工权限分配</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100406">
							<a href="#" onclick="javascript:addTab('数据权限','rest/dataRule/datarulelistpage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-upSale3',width:'150px',iconAlign:'left'">数据权限</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100407">
							<a href="#" onclick="javascript:addTab('员工端权限','rest/dataRule/userFunctionListPage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-upSale3',width:'150px',iconAlign:'left'">员工端权限</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100404">
							<a href="#"
								onclick="javascript:addTab('客户日志','rest/customerLogReport/getCustomerLogListpage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-khpjs2',width:'150px',iconAlign:'left'">客户日志</a>
						</shiro:hasPermission>
						<shiro:hasPermission name="100405">
							<a href="#" onclick="javascript:addTab('后台日志','rest/syslog/getLogListpage');"
								class="easyui-linkbutton"
								data-options="plain:true,iconCls:'icon-zzjg1',width:'150px',iconAlign:'left'">后台日志</a>
						</shiro:hasPermission>
					</div>
				</div>
			</shiro:hasPermission>
		</div>
	</div>
	</div>
	</div>
	<div data-options="region:'center',iconCls:'icon-home'">
		<div class="easyui-tabs" data-options="fit:true,border:false,plain:true" id="ss">
			<div title="系统介绍" data-options="href:'content.html'" style="padding: 10px"></div>

		</div>
	</div>
	<div id="w" class="easyui-dialog" title="用户信息" data-options="modal:true,closed:true,iconCls:'icon-save'"
		style="width: 440px; height: 200px; padding: 10px;">
		<div style="padding: 10px 60px 20px 60px">
			<form id="userForm" name="userForm" method="post">
				<table align="center">
					<tr>
						<td>旧密码:</td>
						<td><input class="easyui-textbox" type="password" name="password" invalidMessage="最大长度不能超过20!"
								missingMessage="请填写旧密码!" size="22"
								data-options="required:true,validType:'length[1,20]'"></input></td>
					</tr>
					<tr>
						<td>新密码:</td>
						<td><input class="easyui-textbox" type="password" name="password1" invalidMessage="最大长度不能超过20!"
								missingMessage="请填写新密码!" size="22"
								data-options="required:true,validType:'length[1,20]'"></input></td>
					</tr>
					<tr>
						<td></td>
						<td><a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
							&nbsp;&nbsp;&nbsp; <a href="javascript:void(0)" class="easyui-linkbutton"
								onclick="clearForm()">清空</a></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<form action="rest/user/loginAgain" id="login_form" method="post" style="display: none;">
		<div class="form-group">
			<label for="j_username" class="t">用户名：</label><input id="userName" value="" name="userName" type="text"
				class="form-control x319 in" autocomplete="off">
		</div>
		<br>
		<div class="form-group">
			<label for="j_password" class="t">密 码：</label> <input id="passWord" value="" name="passWord" type="password"
				class="password form-control x319 in">
		</div>
		<div class="form-group space">
			<label class="t"></label>
			<button type="button" id="submit_btn" class="btn btn-primary btn-lg">&nbsp;登&nbsp;录&nbsp
			</button>
			&nbsp;&nbsp; <input type="reset" value="&nbsp;重&nbsp;置&nbsp;" class="btn btn-default btn-lg">
		</div>
	</form>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		function addTab(title, url) {
			var tabs = $("#ss").tabs("tabs");
			var length = tabs.length;
			for (var i = 0; i < length; i++) {
				var onetab = tabs[i];
				var titles = onetab.panel('options').tab.text();
				$("#ss").tabs("close", titles);
			}
			$('#ss')
				.tabs(
					'add',
					{
						title: title,
						content: "<iframe name='iframe2' width='100%' height='100%'  id='iframe2' frameborder='0' scrolling='auto'  src='"
							+ url + "'></iframe>",
						closable: false
					});
		}

		function updatePassword() {
			$('#w').dialog({
				title: '修改密码'
			});
			$('#w').dialog('open');

		}
	</script>
	<script src="../easyui/jquery.event.ue.js" type="text/javascript" charset="utf-8"></script>
	<script src="../easyui/jquery.udraggable.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript">
		//查询会所

		var userName = "";
		$
			.ajax({
				type: "get",
				url: "rest/club/getClubInfo",
				success: function (res) {
					console.log(res)
					var data = res.rows;
					for (var i = 0; i < data.length; i++) {
						var item = data[i];
						var str = '<option value ="' + item.clubId + '" clubName="' + item.clubName + '">'
							+ item.clubName + '</option>';
						$('#club').append(str);

					}
					if (data.length > 1) {
						userName = "admin";
						var getclub = localStorage.getItem("club");
						if (getclub == null) {
							$(".msk").show();
							$('.leave_sure').udraggable({
								handle: '.leave_title'
							});
						} else {
							$("#clubName").text(getclub.split("-")[1]);
						}
					} else {
						localStorage.setItem("club", $('select').val()
							+ "-"
							+ $('select').find('option:selected').attr(
								'clubName'));
						var getclub = localStorage.getItem("club");
						$("#clubName").text(getclub.split("-")[1]);
						sessionStorage.removeItem("data");
					}

				},
				error: function () {
					//alert('请求失败');
				}
			});
		$("#dropsDr").on(
			"click",
			function () {
				var data = {
					club: $('select').val(),
					user: userName
				}
				$.ajax({
					type: "post",
					url: "rest/user/updateUserClub",
					contentType: "application/json",
					data: JSON.stringify(data),
					success: function (res) {
						//console.log(JSON.stringify(res))
						$(".msk").hide();
						if (res.status) {
							localStorage.setItem("club", $('select').val()
								+ "-"
								+ $('select').find('option:selected')
									.attr('clubName'));
							$("#clubName").text(
								$('select').find('option:selected')
									.attr('clubName'))
							$('#submit_btn').click();
						}

					},
					error: function () {
						//alert('请求失败');
					}
				});
			})
		//提交表单
		$('#submit_btn').click(function () {
			var getus = sessionStorage.getItem("data");
			var jsonObj = JSON.parse(getus);
			$("#userName").val(jsonObj.username)
			$("#passWord").val(jsonObj.psd)
			document.getElementById("login_form").submit();
			sessionStorage.removeItem("data");
		});
		function submitForm() {
			var url = "rest/user/updatePassword";
			$('#userForm').form('submit', {
				url: url,
				type: "POST",
				success: function (data) {
					$('#w').dialog('close');
					var data = eval('(' + data + ')');
					$.messager.alert('提示', data.msg, 'info');
				}
			});

		}
	</script>
</body>

</html>