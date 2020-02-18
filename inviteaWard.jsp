<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>

<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>体验卡列表</title>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="easyui/demo.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/datepicker.css" />
	<link rel="stylesheet" type="text/css" href="../easyui/pagination.css" />
	<script src="../easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<style>
		html {
			border: 1px solid #95B8E7;
		}

		* {
			margin: 0;
			padding: 0;
		}

		.item1 {
			width: 2.5%
		}

		.item2 {
			width: 15.625%
		}

		.item3 {
			width: 9.74%
		}

		.item4 {
			width: 9.635%
		}

		.item5 {
			width: 12.5%
		}

		.item22{
			width:9.375%
		}

		.item33{
			width:10.42%
		}

		.item44 {
			width: 8.02%
		}

		#xjhd-start {
			width: 120px;
			height: 40px;
			background: #71B2EF;
			border-radius: 4px;
			color: white;
			font-size: 20px;
			text-align: center;
			line-height: 40px;
			cursor: pointer;
		}

		.yqyl-header-p {
			font-size: 16px;
			color: #444444;
			margin-right: 20px
		}

		#yqyl-header-hdmc {
			width: 200px;
			height: 30px;
			border-radius: 4px;
			border: none
		}

		.yqyl-header-input {
			border: 1px solid #d5d5d7;
			border-radius: 4px;
			margin-right: 40px;
			overflow: hidden;
		}

		#zengjuanyuany {
			width: 120px;
			height: 30px;
			border: 1px solid #d5d5d7;
			border-radius: 4px;
			font-size: 14px
		}

		.select_wrap {
			position: relative;
		}

		.triangle_border_down1 {
			display: inline-block;
			width: 0;
			height: 0;
			border-width: 8px 5px 0;
			border-style: solid;
			border-color: #BFBFBF transparent transparent;
			position: absolute;
			right: 5px;
			top: 11px;
		}

		#yqyl-header-hdsjs {
			width: 120px;
			height: 30px;
			border: none;
			font-size: 12px
		}

		#yqyl-header-hdsje {
			width: 120px;
			height: 30px;
			border: none;
			font-size: 12px
		}

		#chaxun {
			width: 80px;
			height: 30px;
			border-radius: 4px;
			background: #71B2EF;
			color: white;
			font-size: 16px;
			text-align: center;
			align-items: center;
			line-height: 30px;
			cursor: pointer;
		}

		#qingchu {
			width: 80px;
			height: 30px;
			border-radius: 4px;
			font-size: 16px;
			text-align: center;
			align-items: center;
			line-height: 30px;
			margin-left: 15px;
			color: #444444;
			border: 1px solid #c8cacc;
			cursor: pointer;
		}

		.table-header th {
			font-size: 14px;
			color: #444444;
			height: 40px;
		}

		.table-body tr td {
			font-size: 14px;
			color: #444444;
			height: 40px;
			text-align: center;
			border-left: 1px dotted #CCCCCC;
			border-bottom: 1px dotted #CCCCCC
		}

		.table-body tr td:last-child {
			flex: 1;
			border-right: 1px dotted #CCCCCC;
			display: flex;
			justify-content: center;
			position: relative
		}

		.table-body tr td:last-child p {
			line-height: 40px;
			color: #71B2EF
		}

		#fhsyj {
			font-size: 16px;
			color: #71B2EF;
			cursor: pointer;
		}

		.yqyl-body-quxiao{
			width:70px;
			height:36px;
			font-size:16px;
			text-align:center;
			line-height:36px;
			border:1px solid #d8d8d9;
			border-radius:4px;
			box-sizing:border-box;
			margin-left:15px;
			cursor: pointer;
		}

		.yqyl-body-queding{
			width:70px;
			height:36px;
			font-size:16px;
			text-align:center;
			line-height:36px;
			background:#71B2EF;
			color:white;
			border-radius:4px;
			margin-left:26px;
			cursor: pointer;
		}

		.xzhd-body-line {
			height: 1px;
			background: #BFBFBF;
			margin-top: 20px
		}

		.xzhd-body-flex {
			width: 100%;
			display: flex;
			align-items: center;
			margin-left: 15px
		}

		.xzhd-body-flex1 {
			width: 100%;
			display: flex;
			margin-left: 15px
		}

		.xzhd-body-input {
			border: 1px solid #BFBFBF;
			overflow: hidden;
			border-radius: 4px;
		}

		#xzhd-body-hdmc {
			width: 380px;
			height: 32px;
			border: none;
			color: #BFBFBF;
			font-size:16px;
			padding-left:20px;
			box-sizing: border-box;
		}

		#xzhd-body-hdsjs {
			width: 175px;
			height: 32px;
			border: none;
			color: #BFBFBF;
			font-size:16px;
			padding-left:20px;
			box-sizing: border-box;
		}

		#xzhd-body-hdsje {
			width: 175px;
			height: 32px;
			border: none;
			color: #BFBFBF;
			font-size:16px;
			padding-left:20px;
			box-sizing: border-box;
		}

		#xzhd-body-fxhd {
			width: 300px;
			min-height: 32px;
			border: none;
			color: #757575;
			line-height: 32px;
			font-size:14px;
			font-size:16px;
			padding-left:20px;
			box-sizing: border-box;
		}

		.xzhd-body-down {
			display: inline-block;
			width: 0;
			height: 0;
			border-left: 7px solid transparent;
			border-right: 7px solid transparent;
			border-top: 10px solid #BFBFBF;
			position: absolute;
			right: 5px;
			top: 11px;
		}

		.xzhd-body-up {
			display: inline-block;
			width: 0;
			height: 0;
			border-left: 7px solid transparent;
			border-right: 7px solid transparent;
			border-bottom: 10px solid #BFBFBF;
			position: absolute;
			right: 5px;
			top: 11px;
		}

		#xzhd-body-lqrhd {
			width: 300px;
			min-height: 32px;
			border: none;
			color: #757575;
			line-height: 32px;
			font-size:16px;
			padding-left:20px;
			box-sizing: border-box;
		}
		.xzhd-body-zstjraduis{
			width:24px;
			height:24px;
			border-radius:50%;
			border:1px solid #BFBFBF;
			box-sizing: border-box;
			display:flex;
			justify-content: center;
			align-items: center;
		}
		#xzhd-body-hdbjpz-img{
			width:120px;
			height:150px;
			border:1px solid #CCCCCC;
			border-radius: 3px;
		}
		#xzhd-body-hdbjpz-upload{
			width:60px;
			height:30px;
			border-radius: 4px;
			background: #71B2EF;
			color:white;
			text-align: center;
			line-height: 30px;
			font-size: 16px;
			margin-left:15px;
			cursor: pointer;
		}
		#xzhd-body-lqanpz-img{
			width:160px;
			height:60px;
			border:1px solid #CCCCCC;
			border-radius: 3px;
		}
		#xzhd-body-lqanpz-upload{
			width:60px;
			height:30px;
			border-radius: 4px;
			background: #71B2EF;
			color:white;
			text-align: center;
			line-height: 30px;
			font-size: 16px;
			margin-left:15px;
			cursor: pointer;
		}
		#xzhd-body-fxwzbt{
			width:680px;
			height:32px;
			border: none;
			color: #BFBFBF;
			font-size:16px;
			padding-left:20px;
			box-sizing: border-box;
		}
		#xzhd-body-fxhdxs{
			width:680px;
			height:160px;
			resize: none;
			border: none;
			color: #BFBFBF;
			padding-left:20px;
			padding-top:10px;
			font-size:16px;
			box-sizing: border-box;
		}
		#xzhd-body-save{
			width:110px;
			height:40px;
			background: #71B2EF;
			text-align: center;
			line-height: 40px;
			color:white;
			border-radius: 4px;
			font-size: 16px;
			cursor: pointer;
		}
		#xzhd-body-quxiao{
			width:110px;
			height:40px;
			text-align: center;
			line-height: 40px;
			border-radius: 4px;
			border:1px solid #BFBFBF;
			font-size: 16px;
			margin-left:15px;
			cursor: pointer;
		}

		.shuju{
			cursor: pointer;
		}
		.youxiao{
			cursor: pointer;
		}
		.chakan{
			cursor: pointer;
		}
		.sj-body-flex{
			width:100%;
			display: flex;
			align-items: center;
		}
		#sj-body-fhsyj{
			font-size:16px;
			color:#71B2EF;
			cursor: pointer;
		}
		.sj-body-line{
			height:1px;
			background:#BFBFBF;
			margin-top:10px
		}
		#sj-body-hdmc{
			font-size:18px;
			color:#444444;
			font-weight: bold
		}
		#sj-body-gd{
			font-size:16px;
			color:#71B2EF
		}
		.sj-body-flex1{
			height:auto;
			display:flex;
			flex-wrap: wrap;
		}

		.sj-body-flex1 div:nth-child(2n){
			margin-left:44px
		}

		.sj-body-flex-p{
			font-size:16px;
			color:#444444;
			margin-right:20px
		}
		.sj-body-input {
			border: 1px solid #BFBFBF;
			overflow: hidden;
			border-radius: 4px;
		}
		#sj-body-yhqmc{
			border:none;
			width:200px;
			height:30px;
		}
		#sj-body-lqsjs{
			width:120px;
			height:30px;
			border:none
		}
		#sj-body-lqsje{
			width:120px;
			height:30px;
			border:none
		}
		#sj-body-zt{
			width: 120px;
			height: 30px;
			border: 1px solid #d5d5d7;
			border-radius: 4px;
			font-size: 14px
		}
		#sj-body-ly{
			width: 120px;
			height: 30px;
			border: 1px solid #d5d5d7;
			border-radius: 4px;
			font-size: 14px
		}
		#sj-body-chaxun{
			width:80px;
			height:30px;
			background:#71B2EF;
			color:white;
			border-radius: 4px;
			text-align: center;
			line-height: 30px;
			font-size:16px;
			margin-left:40px;
			cursor: pointer;
		}
		#sj-body-qingchu{
			width:80px;
			height:30px;
			border:1px solid #d0ced0;
			border-radius: 4px;
			text-align: center;
			line-height: 30px;
			font-size:16px;
			margin-left:15px;
			cursor: pointer;
		}
		#sj-body-dcsj{
			width:100px;
			height:30px;
			background:#71B2EF;
			color:white;
			border-radius: 4px;
			text-align: center;
			line-height: 30px;
			font-size:16px;
			margin-left:220px;
			cursor: pointer;
		}
		.table-body1 tr td {
			font-size: 14px;
			color: #444444;
			height: 40px;
			text-align: center;
			border-left: 1px dotted #CCCCCC;
			border-bottom: 1px dotted #CCCCCC
		}
		#xzhd-body-fxhd-zhankai{
			width:660px;
			height:210px;
			background:white;
			border:1px solid #BFBFBF;
			box-sizing: border-box;
			position:absolute;
			top:100%;
			left:150px;
			z-index: 999;
			padding:0 20px 20px 20px;
			display:flex;
			margin-top:10px
		}

		#xzhd-body-lqrhd-zhankai{
			width:660px;
			height:210px;
			background:white;
			border:1px solid #BFBFBF;
			box-sizing: border-box;
			position:absolute;
			top:100%;
			left:150px;
			z-index: 999;
			padding:0 20px 20px 20px;
			display:flex;
			margin-top:10px
		}

		.xzhd-body-henggang{
			width:16px;
			height:16px;
			border:1px solid #BFBFBF;
			box-sizing: border-box;
		}
		.xzhd-body-henggang img{
			margin-left:-1px;
			margin-top:-1px;
			display:none
		}

		.xzhd-body-henggang1{
			width:16px;
			height:16px;
			border:1px solid #BFBFBF;
			box-sizing: border-box;
		}
		.xzhd-body-henggang1 img{
			margin-left:-1px;
			margin-top:-1px;
			display:none
		}

		.xzhd-body-gouxuan{
			width:16px;
			height:16px;
			border:1px solid #BFBFBF;
			box-sizing: border-box;
		}
		.xzhd-body-gouxuan img{
			margin-left:-1px;
			margin-top:-1px;
			display:none
		}
		.xzhd-body-gouxuan1{
			width:16px;
			height:16px;
			border:1px solid #BFBFBF;
			box-sizing: border-box;
		}
		.xzhd-body-gouxuan1 img{
			margin-left:-1px;
			margin-top:-1px;
			display:none
		}
		.xzhd-body-tbody th{
			font-size:16px;
			height:40px;
		}
		.xzhd-body-tbody1 td{
			font-size:14px;
			height:40px;
			text-align: center;
		}
		.xzhd-body-tbody2 td{
			font-size:14px;
			height:40px;
			text-align: center;
		}
		.xzhd-body-tbody11 td{
			font-size:14px;
			height:40px;
			text-align: center;
		}
		.xzhd-body-tbody22 td{
			font-size:14px;
			height:40px;
			text-align: center;
		}
		.xzhd-body-chacha{
			width:16px;
			height:16px;
			margin-left:22px;
			margin-right:50px
		}
		.xzhd-body-chacha1{
			width:16px;
			height:16px;
			margin-left:22px;
			margin-right:50px
		}
	</style>
</head>

<body>
	<div class="yqyl-body">
		<div style="width:100%">
			<p id="xjhd-start">新建活动</p>
		</div>
		<div style="width:100%;display:flex;align-items:center;margin:20px 0">
			<p class="yqyl-header-p">活动名称</p>
			<div class="yqyl-header-input">
				<input id="yqyl-header-hdmc" type="text">
			</div>
			<p class="yqyl-header-p">活动状态</p>
			<span class="select_wrap" style="margin-right: 40px;">
				<select name="visitstatus" id="zengjuanyuany">
					<option value="" selected="selected">全部</option>
					<option value="1">活动中</option>
					<option value="2">未开始</option>
					<option value="3">已结束</option>
				</select>
				<em class="triangle_border_down1"></em>
			</span>
			<p class="yqyl-header-p">活动时间</p>
			<div class="yqyl-header-input" style='margin-right:7px'>
				<input id="yqyl-header-hdsjs" type="text" placeholder="开始日期">
			</div>
			<div style="width:5px;height:2px;background:#c7c6c9;margin-right:7px">
			</div>
			<div class="yqyl-header-input">
				<input id="yqyl-header-hdsje" type="text" placeholder="结束日期">
			</div>
		</div>
		<div style="width:100%;display:flex">
			<div id="chaxun">查询</div>
			<div id="qingchu">清除</div>
		</div>
		<table style='border-collapse: collapse;width: 100%;table-layout:fixed;margin-top:20px'>
			<tbody>
				<tr class="table-header" style="background:#f8fafb">
					<th class="item1">序号</th>
					<th class="item2">活动名称</th>
					<th class="item2">活动时间</th>
					<th class="item3">分享人数</th>
					<th class="item3">领取人数</th>
					<th class="item3">使用人数</th>
					<th class="item4">状态</th>
					<th class="item5">操作</th>
				</tr>
			</tbody>
			<tbody class="table-body">
				<tr>
					<td class="item1">1</td>
					<td class="item2">情人双人健身月卡</td>
					<td class="item2">2020.02.11-2020.02.28</td>
					<td class="item3">514</td>
					<td class="item3">245</td>
					<td class="item3">200</td>
					<td class="item4">活动中</td>
					<td>
						<p class="shuju">数据</p>
						<p>|</p>
						<p class="chakan">查看</p>
						<p>|</p>
						<p class="youxiao">有效</p>
						<div
							style="position:absolute;top:0;left:-275px;width:370px;height:110px;background:white;z-index: 999;padding:20px 20px 0 23px;box-sizing: border-box;display:none">
							<div style="display:flex;justify-content: center;padding-bottom:10px">
								<div style="line-height: 36px;">是否立即结束活动？</div>
								<div class="yqyl-body-queding"
									>
									确定</div>
								<div class="yqyl-body-quxiao"
									>
									取消</div>
							</div>
							<div style="height:1px;background:#BFBFBF;"></div>
							<div style="font-size: 14px;color:#FF0000;margin-top:10px">结束后活动停止，已领取的优惠券还能继续使用！</div>
						</div>
					</td>
				</tr>
				<tr>
					<td class="item1">1</td>
					<td class="item2">情人双人健身月卡</td>
					<td class="item2">2020.02.11-2020.02.28</td>
					<td class="item3">514</td>
					<td class="item3">245</td>
					<td class="item3">200</td>
					<td class="item4">活动中</td>
					<td>
						<p class="shuju">数据</p>
						<p>|</p>
						<p class="chakan">查看</p>
						<p>|</p>
						<p class="youxiao">有效</p>
						<div
							style="position:absolute;top:0;left:-275px;width:370px;height:110px;background:white;z-index: 999;padding:20px 20px 0 23px;box-sizing: border-box;display:none">
							<div style="display:flex;justify-content: center;padding-bottom:10px">
								<div style="line-height: 36px;">是否立即结束活动？</div>
								<div class="yqyl-body-queding"
									>
									确定</div>
								<div class="yqyl-body-quxiao"
									>
									取消</div>
							</div>
							<div style="height:1px;background:#BFBFBF;"></div>
							<div style="font-size: 14px;color:#FF0000;margin-top:10px">结束后活动停止，已领取的优惠券还能继续使用！</div>
						</div>
					</td>
				</tr>
				<tr>
					<td class="item1">1</td>
					<td class="item2">情人双人健身月卡</td>
					<td class="item2">2020.02.11-2020.02.28</td>
					<td class="item3">514</td>
					<td class="item3">245</td>
					<td class="item3">200</td>
					<td class="item4">活动中</td>
					<td>
						<p class="shuju">数据</p>
						<p>|</p>
						<p class="chakan">查看</p>
						<p>|</p>
						<p class="youxiao">有效</p>
						<div
							style="position:absolute;top:0;left:-275px;width:370px;height:110px;background:white;z-index: 999;padding:20px 20px 0 23px;box-sizing: border-box;display:none">
							<div style="display:flex;justify-content: center;padding-bottom:10px">
								<div style="line-height: 36px;">是否立即结束活动？</div>
								<div class="yqyl-body-queding"
									>
									确定</div>
								<div class="yqyl-body-quxiao"
									>
									取消</div>
							</div>
							<div style="height:1px;background:#BFBFBF;"></div>
							<div style="font-size: 14px;color:#FF0000;margin-top:10px">结束后活动停止，已领取的优惠券还能继续使用！</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div style="width:100%;margin-top:22px">
			<p style="font-size:16px">共20条，每页15条</p>
		</div>

	</div>

	<div class="xzhd-body" style="display:none">
		<div style="width:100%">
			<div id="fhsyj">返回上一级</div>
		</div>
		<div class="xzhd-body-line"></div>
		<div style="font-size:18px;color:#444444;margin:20px 0 0 15px;">活动信息</div>
		<div class="xzhd-body-line"></div>
		<div class="xzhd-body-flex" style="margin-top:24px">
			<p style="font-size:16px;margin-right:86px">活动名称</p>
			<div class="xzhd-body-input">
				<input id="xzhd-body-hdmc" placeholder="请填写活动名称" type="text">
			</div>
		</div>
		<div class="xzhd-body-flex" style="margin-top:24px">
			<p style="font-size:16px;margin-right:86px">活动时间</p>
			<div class="xzhd-body-input">
				<input id="xzhd-body-hdsjs" placeholder="开始时间" type="text">
			</div>
			<div style="color:#CCCCCC;margin:0 10px">--</div>
			<div class="xzhd-body-input">
				<input id="xzhd-body-hdsje" placeholder="结束时间" type="text">
			</div>
		</div>

		<div class="xzhd-body-flex" style="margin-top:24px;position: relative;">
			<p style="font-size:16px;margin-right:86px">分享获得</p>
			<div class="xzhd-body-input" style="position:relative">
				<div id="xzhd-body-fxhd">
					<p>请选择要分享的优惠券</p>
				</div>
				<div class="xzhd-body-down" id="xzhd-body-down11" style="top:42%"></div>
			</div>
			<div id="xzhd-body-fxhd-zhankai" style="display:none">
				<div style="width:200px;margin-top:10px">
					<div style="display:flex;align-items:center;">
						<div class="xzhd-body-henggang">
							<img src="image/codeallset_btn.png" alt="">
						</div>
						<p style="font-size:16px;color:#444444;margin:0 46px 0 14px;">CRM优惠券</p>
						<img id="crm-rightget" style="display:none" src="image/right_get.png" alt="">
						<img id="crm-rightnone" src="image/right_none.png" alt="">
					</div>
					<div style="display:flex;align-items:center;margin-top:24px">
						<div class="xzhd-body-henggang">
							<img src="image/codeallset_btn.png" alt="">
						</div>
						<p style="font-size:16px;color:#444444;margin:0 49px 0 14px;">有赞优惠券</p>
						<img id="crm-rightget" style="display:none" src="image/right_get.png" alt="">
						<img id="crm-rightnone" src="image/right_none.png" alt="">
					</div>
				</div>
				<table style="border-collapse: collapse;flex:1;table-layout:fixed;">
					<tbody class="xzhd-body-tbody">
						<tr>
							<th></th>
							<th>优惠券名称</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>库存</th>
						</tr>
					</tbody>
					<tbody class="xzhd-body-tbody1" style="display:none">
						<tr>
							<td>
								<div class="xzhd-body-gouxuan">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>50元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>
								<div class="xzhd-body-gouxuan">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>100元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>
								<div class="xzhd-body-gouxuan">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>200元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>
								<div class="xzhd-body-gouxuan">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>500元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
					</tbody>
					<tbody class="xzhd-body-tbody2" style="display:none">
						<tr>
							<td>
								<div class="xzhd-body-gouxuan">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>500元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>
								<div class="xzhd-body-gouxuan">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>200元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>
								<div class="xzhd-body-gouxuan">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>100元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>
								<div class="xzhd-body-gouxuan">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>50元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="xzhd-body-flex" style="margin-top:24px;position: relative;">
			<p style="font-size:16px;margin-right:70px">领取人获得</p>
			<div class="xzhd-body-input" style="position:relative">
				<div id="xzhd-body-lqrhd">
					<p>请选择领取人可获得的优惠券</p>
				</div>
				<div class="xzhd-body-down" id="xzhd-body-down22" style="top:42%"></div>
			</div>
			<div id="xzhd-body-lqrhd-zhankai" style="display:none">
				<div style="width:200px;margin-top:10px">
					<div style="display:flex;align-items:center;">
						<div class="xzhd-body-henggang1">
							<img src="image/codeallset_btn.png" alt="">
						</div>
						<p style="font-size:16px;color:#444444;margin:0 46px 0 14px;">CRM优惠券</p>
						<img id="crm-rightget" style="display:none" src="image/right_get.png" alt="">
						<img id="crm-rightnone" src="image/right_none.png" alt="">
					</div>
					<div style="display:flex;align-items:center;margin-top:24px">
						<div class="xzhd-body-henggang1">
							<img src="image/codeallset_btn.png" alt="">
						</div>
						<p style="font-size:16px;color:#444444;margin:0 49px 0 14px;">有赞优惠券</p>
						<img id="crm-rightget" style="display:none" src="image/right_get.png" alt="">
						<img id="crm-rightnone" src="image/right_none.png" alt="">
					</div>
				</div>
				<table style="border-collapse: collapse;flex:1;table-layout:fixed;">
					<tbody class="xzhd-body-tbody">
						<tr>
							<th></th>
							<th>优惠券名称</th>
							<th>开始时间</th>
							<th>结束时间</th>
							<th>库存</th>
						</tr>
					</tbody>
					<tbody class="xzhd-body-tbody11" style="display:none">
						<tr>
							<td>
								<div class="xzhd-body-gouxuan1">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>50元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>
								<div class="xzhd-body-gouxuan1">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>100元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>
								<div class="xzhd-body-gouxuan1">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>200元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>
								<div class="xzhd-body-gouxuan1">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>500元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
					</tbody>
					<tbody class="xzhd-body-tbody22" style="display:none">
						<tr>
							<td>
								<div class="xzhd-body-gouxuan1">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>500元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>
								<div class="xzhd-body-gouxuan1">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>200元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>
								<div class="xzhd-body-gouxuan1">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>100元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
						<tr>
							<td>
								<div class="xzhd-body-gouxuan1">
									<img src="image/codeallset_btn.png" alt="">
								</div>
							</td>
							<td>50元优惠券</td>
							<td>2020-02-11</td>
							<td>2020-02-28</td>
							<td>1000</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="xzhd-body-flex" style="margin-top:24px">
			<p style="font-size:16px;margin-right:82px">赠送条件</p>
			<div class="xzhd-body-zstjraduis">
				<p style="width:14px;height:14px;border-radius:50%;background:#71B2EF;display:none"></p>
			</div>
			<p style="margin:0 36px 0 15px;font-size:14px">使用送</p>
			<div class="xzhd-body-zstjraduis">
				<p style="width:14px;height:14px;border-radius:50%;background:#71B2EF;display:none"></p>
			</div>
			<p style="margin:0 36px 0 15px;font-size:14px">领取送</p>
			<div class="xzhd-body-zstjraduis">
				<p style="width:14px;height:14px;border-radius:50%;background:#71B2EF;display:none"></p>
			</div>
			<p style="margin:0 36px 0 15px;font-size:14px">分享送</p>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:54px">活动背景配置</p>
			<div id="xzhd-body-hdbjpz-img"></div>
			<div id="xzhd-body-hdbjpz-upload">上传</div>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:54px">领取按钮配置</p>
			<div id="xzhd-body-lqanpz-img"></div>
			<div id="xzhd-body-lqanpz-upload">上传</div>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:54px">分享文字标题</p>
			<div class="xzhd-body-input">
				<input id="xzhd-body-fxwzbt" placeholder="请填写分享活动描述"/>
			</div>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:54px">分享活动描述</p>
			<div class="xzhd-body-input">
				<textarea id="xzhd-body-fxhdxs" placeholder="请对活动分享进行描述"></textarea>
			</div>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p id="xzhd-body-save">保存</p>
			<p id="xzhd-body-quxiao">返回</p>
		</div>
	</div>

	<div class="sj-body" style="display:none">
		<div class='sj-body-flex'>
			<p id="sj-body-fhsyj">返回上一级</p>
		</div>
		<div class="sj-body-line"></div>
		<div class='sj-body-flex' style="margin-top:10px;justify-content: space-between;">
			<p id="sj-body-hdmc">活动名称：情人双人健身月卡</p>
			<div style="display:flex;align-items: center;"><p id="sj-body-gd">更多</p><img style="width:13px;height:7px;margin-left:7px" src="image/more_unfold.png" alt=""></div>
		</div>
		<div class="sj-body-flex1">
			<div style="width:800px;margin-top:22px">
				<p style="font-size:16px;color:#444444;font-weight: bold;">500元优惠券C</p>
				<div style="display:flex;height:90px;background:#F5F5F5;margin-top:10px;justify-content: space-around;align-items: center;">
					<div style="text-align: center;">
						<p style="font-size:14px">已发放</p>
						<p style="font-size:14px;margin-top:18px">150</p>
					</div>
					<div style="text-align: center;">
						<p style="font-size:14px">已领取</p>
						<p style="font-size:14px;margin-top:18px">50</p>
					</div>
					<div style="text-align: center;">
						<p style="font-size:14px">已使用</p>
						<p style="font-size:14px;margin-top:18px">34</p>
					</div>
				</div>
			</div>
			<div style="width:800px;margin-top:22px">
				<p style="font-size:16px;color:#444444;font-weight: bold;">500元优惠券C</p>
				<div
					style="display:flex;height:90px;background:#F5F5F5;margin-top:10px;justify-content: space-around;align-items: center;">
					<div style="text-align: center;">
						<p style="font-size:14px">已发放</p>
						<p style="font-size:14px;margin-top:18px">150</p>
					</div>
					<div style="text-align: center;">
						<p style="font-size:14px">已领取</p>
						<p style="font-size:14px;margin-top:18px">50</p>
					</div>
					<div style="text-align: center;">
						<p style="font-size:14px">已使用</p>
						<p style="font-size:14px;margin-top:18px">34</p>
					</div>
				</div>
			</div>
			<div style="width:800px;margin-top:22px">
				<p style="font-size:16px;color:#444444;font-weight: bold;">500元优惠券C</p>
				<div
					style="display:flex;height:90px;background:#F5F5F5;margin-top:10px;justify-content: space-around;align-items: center;">
					<div style="text-align: center;">
						<p style="font-size:14px">已发放</p>
						<p style="font-size:14px;margin-top:18px">150</p>
					</div>
					<div style="text-align: center;">
						<p style="font-size:14px">已领取</p>
						<p style="font-size:14px;margin-top:18px">50</p>
					</div>
					<div style="text-align: center;">
						<p style="font-size:14px">已使用</p>
						<p style="font-size:14px;margin-top:18px">34</p>
					</div>
				</div>
			</div>
		</div>
		<div class="sj-body-flex" style="margin-top:30px">
			<p class="sj-body-flex-p">优惠券名称</p>
			<div class="sj-body-input">
				<input id="sj-body-yhqmc" type="text">
			</div>
			<p class="sj-body-flex-p" style="margin-left:38px">领取时间</p>
			<div class="sj-body-input">
				<input id="sj-body-lqsjs" type="text" placeholder="开始日期">
			</div>
			<div style="margin:0 10px">-</div>
			<div class="sj-body-input">
				<input id="sj-body-lqsje" type="text" placeholder="结束日期">
			</div>
			<p class="sj-body-flex-p" style="margin-left:38px">状态</p>
			<span class="select_wrap">
				<select name="visitstatus" id="sj-body-zt">
					<option value="" selected="selected">全部</option>
					<option value="1">已使用</option>
					<option value="2">未使用</option>
				</select>
				<em class="triangle_border_down1"></em>
			</span>
			<p class="sj-body-flex-p" style="margin-left:38px">来源</p>
			<span class="select_wrap">
				<select name="visitstatus" id="sj-body-ly">
					<option value="" selected="selected">全部</option>
					<option value="1">新客</option>
					<option value="2">老客</option>
				</select>
				<em class="triangle_border_down1"></em>
			</span>
			<p id="sj-body-chaxun">查询</p>
			<p id="sj-body-qingchu">清除</p>
			<p id="sj-body-dcsj">导出数据</p>
		</div>

		<table style='border-collapse: collapse;width: 100%;table-layout:fixed;margin-top:20px'>
			<tbody>
				<tr class="table-header" style="background:#f8fafb">
					<th class="item1">序号</th>
					<th class="item22">会员姓名</th>
					<th class="item22">手机号码</th>
					<th class="item33">优惠券名称</th>
					<th class="item22">分享时间</th>
					<th class="item22">领取时间</th>
					<th class="item22">使用时间</th>
					<th class="item22">会员性质</th>
					<th class="item44">状态</th>
					<th class="item44">来源</th>
				</tr>
			</tbody>
			<tbody class="table-body1">
				<tr>
					<td class="item1">1</td>
					<td class="item22">王小娟</td>
					<td class="item22">15218943782</td>
					<td class="item33">500元优惠券C</td>
					<td class="item22">2020-02-11</td>
					<td class="item22">2020-02-11</td>
					<td class="item22">2020-02-11</td>
					<td class="item22">老客</td>
					<td class="item44">已使用</td>
					<td class="item44">CRM</td>
				</tr>
				<tr>
					<td class="item1">1</td>
					<td class="item22">王小娟</td>
					<td class="item22">15218943782</td>
					<td class="item33">500元优惠券C</td>
					<td class="item22">2020-02-11</td>
					<td class="item22">2020-02-11</td>
					<td class="item22">2020-02-11</td>
					<td class="item22">老客</td>
					<td class="item44">已使用</td>
					<td class="item44">CRM</td>
				</tr>
				<tr>
					<td class="item1">1</td>
					<td class="item22">王小娟</td>
					<td class="item22">15218943782</td>
					<td class="item33">500元优惠券C</td>
					<td class="item22">2020-02-11</td>
					<td class="item22">2020-02-11</td>
					<td class="item22">2020-02-11</td>
					<td class="item22">老客</td>
					<td class="item44">已使用</td>
					<td class="item44">CRM</td>
				</tr>
			</tbody>
		</table>

		<div class="sj-body-flex" style="margin-top:24px">
			<p style="font-size:16px;color:#444444">共416条，每页10条</p>
		</div>
	</div>
</body>

<script>
	$('.youxiao').click(function () {
		$(this).parent().children('div').show()
	})

	$('.yqyl-body-quxiao').click(function () {
		$(this).parent().parent().hide()
	})

	$('.xzhd-body-zstjraduis').click(function(){
		$('.xzhd-body-zstjraduis').css('border-color', '#BFBFBF')
		$('.xzhd-body-zstjraduis').children().hide()
		$(this).css('border-color','#71B2EF')
		$(this).children().show()
	})

	$('#xjhd-start').click(function(){
		$('.xzhd-body').show()
		$('.yqyl-body').hide()
	})

	$('#fhsyj').click(function(){
		$('.xzhd-body').hide()
		$('.yqyl-body').show()
	})

	$('#sj-body-fhsyj').click(function(){
		$('.yqyl-body').show()
		$('.sj-body').hide()
	})

	$('.shuju').click(function(){
		$('.yqyl-body').hide()
		$('.sj-body').show()
	})

	$('#xzhd-body-fxhd').click(function(){
		if($('#xzhd-body-fxhd-zhankai').is(':hidden')){
			$('#xzhd-body-fxhd-zhankai').show()
			$('#xzhd-body-down11').attr('class','xzhd-body-up')
		}
	})

	$('#xzhd-body-lqrhd').click(function(){
		if($('#xzhd-body-lqrhd-zhankai').is(':hidden')){
			$('#xzhd-body-lqrhd-zhankai').show()
			$('#xzhd-body-down22').attr('class', 'xzhd-body-up')
		}
	})

	$('.xzhd-body-henggang').click(function () {
			$('.xzhd-body-henggang').children().hide()
			$('.xzhd-body-henggang').parent().children('#crm-rightget').hide()
			$('.xzhd-body-henggang').parent().children('#crm-rightnone').show()
			if ($(this).children().is(':hidden')) {
				$(this).children().show()
				$(this).parent().children('#crm-rightget').show()
				$(this).parent().children('#crm-rightnone').hide()

				if ($(this).parent().children('p').html() == 'CRM优惠券') {
					$('.xzhd-body-tbody1').show()
					$('.xzhd-body-tbody2').hide()
				} else if ($(this).parent().children('p').html() == '有赞优惠券') {
					$('.xzhd-body-tbody1').hide()
					$('.xzhd-body-tbody2').show()
				}

			} else {
				$(this).children().hide()
			}
		})

	$('.xzhd-body-henggang1').click(function () {
			$('.xzhd-body-henggang1').children().hide()
			$('.xzhd-body-henggang1').parent().children('#crm-rightget').hide()
			$('.xzhd-body-henggang1').parent().children('#crm-rightnone').show()
			if ($(this).children().is(':hidden')) {
				$(this).children().show()
				$(this).parent().children('#crm-rightget').show()
				$(this).parent().children('#crm-rightnone').hide()

				if ($(this).parent().children('p').html() == 'CRM优惠券') {
					$('.xzhd-body-tbody11').show()
					$('.xzhd-body-tbody22').hide()
				} else if ($(this).parent().children('p').html() == '有赞优惠券') {
					$('.xzhd-body-tbody11').hide()
					$('.xzhd-body-tbody22').show()
				}

			} else {
				$(this).children().hide()
			}
		})

	$('.xzhd-body-gouxuan').click(function(){
		if($(this).children().is(':hidden')){
			$(this).children().show()
			gouxuan()
		}else{
			$(this).children().hide()
			var str2 = $(this).parent().parent().children().eq(1).html()
			for (var i = 0; i < $('.xzhd-body-henggang').length; i++) {
				if ($('.xzhd-body-henggang').eq(i).children().is(":visible")) {
					var str1 = $('.xzhd-body-henggang').eq(i).parent().children('p').html()
				}
			}

			for(var j=0;j<$('#xzhd-body-fxhd').children().length;j++){
				if(str1+str2 == $('#xzhd-body-fxhd').children().eq(j).children('p').html().split('/')[0]+ $('#xzhd-body-fxhd').children().eq(j).children('p').html().split('/')[1]){
					$('#xzhd-body-fxhd').children().eq(j).remove()
					//console.log(111111111)
				}
			}
		}
	})

	$('.xzhd-body-gouxuan1').click(function () {
			if ($(this).children().is(':hidden')) {
				$(this).children().show()
				gouxuan1()
			} else {
				$(this).children().hide()
				var str2 = $(this).parent().parent().children().eq(1).html()
				for (var i = 0; i < $('.xzhd-body-henggang1').length; i++) {
					if ($('.xzhd-body-henggang1').eq(i).children().is(":visible")) {
						var str1 = $('.xzhd-body-henggang1').eq(i).parent().children('p').html()
					}
				}

				for (var j = 0; j < $('#xzhd-body-lqrhd').children().length; j++) {
					if (str1 + str2 == $('#xzhd-body-lqrhd').children().eq(j).children('p').html().split('/')[0] + $('#xzhd-body-lqrhd').children().eq(j).children('p').html().split('/')[1]) {
						$('#xzhd-body-lqrhd').children().eq(j).remove()
						//console.log(111111111)
					}
				}
			}
		})

	$('#xzhd-body-down11').click(function(){
		if($('#xzhd-body-fxhd-zhankai').is(':visible')){
			$('#xzhd-body-fxhd-zhankai').hide()
			$(this).attr('class','xzhd-body-down')
		}
	})

	$('#xzhd-body-down22').click(function () {
			if ($('#xzhd-body-lqrhd-zhankai').is(':visible')) {
				$('#xzhd-body-lqrhd-zhankai').hide()
				$(this).attr('class', 'xzhd-body-down')
			}
		})

	function chacha(){
		$('.xzhd-body-chacha').click(function () {
			
			$(this).parent().remove()
			var str = $(this).parent().children('p').html()
			for (var i = 0; i < $('.xzhd-body-henggang').length; i++) {
				if ($('.xzhd-body-henggang').eq(i).children().is(":visible")) {
					var str1 = $('.xzhd-body-henggang').eq(i).parent().children('p').html()
				}
			}
			//console.log(str)
			
			for (var j = 0; j < $('.xzhd-body-gouxuan').length; j++) {
				var str2 = $('.xzhd-body-gouxuan').eq(j).parent().parent().children().eq(1).html()
				//console.log(str1+str2)
				if (str == str1 +'/'+ str2) {
					//$('.xzhd-body-gouxuan').eq(j).click()
					for(var p=0;p<$('.xzhd-body-henggang').length;p++){
						if($('.xzhd-body-henggang').eq(p).children().is(':visible')){
							if(p==0){
								if(j<=3){
									$('.xzhd-body-gouxuan').eq(j).click()
								}
							}else if(p == 1){
								if (j >3) {
									$('.xzhd-body-gouxuan').eq(j).click()
								}
							}
						}
					}
					
				}
			}
		})
	}
	
	function chacha1() {
			$('.xzhd-body-chacha1').click(function () {

				$(this).parent().remove()
				var str = $(this).parent().children('p').html()
				for (var i = 0; i < $('.xzhd-body-henggang1').length; i++) {
					if ($('.xzhd-body-henggang1').eq(i).children().is(":visible")) {
						var str1 = $('.xzhd-body-henggang1').eq(i).parent().children('p').html()
					}
				}
				//console.log(str)

				for (var j = 0; j < $('.xzhd-body-gouxuan1').length; j++) {
					var str2 = $('.xzhd-body-gouxuan1').eq(j).parent().parent().children().eq(1).html()
					//console.log(str1+str2)
					if (str == str1 + '/' + str2) {
						//$('.xzhd-body-gouxuan1').eq(j).click()
						for (var p = 0; p < $('.xzhd-body-henggang1').length; p++) {
							if ($('.xzhd-body-henggang1').eq(p).children().is(':visible')) {
								if (p == 0) {
									if (j <= 3) {
										$('.xzhd-body-gouxuan1').eq(j).click()
									}
								} else if (p == 1) {
									if (j > 3) {
										$('.xzhd-body-gouxuan1').eq(j).click()
									}
								}
							}
						}

					}
				}
			})
		}

	function gouxuan(){
		for(var k=0;k< $('#xzhd-body-fxhd').children().length;k++){
			if ($('#xzhd-body-fxhd').children().eq(k).html() == '请选择要分享的优惠券'){
				$('#xzhd-body-fxhd').children().eq(k).remove()
			}
		}
		
		var str = ''
		var str1 = ''
		var str2 = ''
		for(var i=0;i<$('.xzhd-body-henggang').length;i++){
			if($('.xzhd-body-henggang').eq(i).children().is(":visible")){
				str1 = $('.xzhd-body-henggang').eq(i).parent().children('p').html()
			}
		}
		for(var j=0;j<$('.xzhd-body-gouxuan').length;j++){
			if($('.xzhd-body-gouxuan').eq(j).children().is(":visible")){
				//var str = ($('#xzhd-body-fxhd').html())
				console.log(j)
				str2 = $('.xzhd-body-gouxuan').eq(j).parent().parent().children().eq(1).html()
				str += `<div style="display:flex;align-items:center;justify-content:space-between;font-size:16px"><p>`+ str1 +'/'+ str2 +`</p><img class="xzhd-body-chacha" src="image/classdel_btn.png"></div>`
			}
		}
		$('#xzhd-body-fxhd').html(str)
		$('.xzhd-body-chacha').unbind()
		chacha()
	}
	
	function gouxuan1() {
			for (var k = 0; k < $('#xzhd-body-lqrhd').children().length; k++) {
				if ($('#xzhd-body-lqrhd').children().eq(k).html() == '请选择领取人可获得的优惠券') {
					$('#xzhd-body-lqrhd').children().eq(k).remove()
				}
			}

			var str = ''
			var str1 = ''
			var str2 = ''
			for (var i = 0; i < $('.xzhd-body-henggang1').length; i++) {
				if ($('.xzhd-body-henggang1').eq(i).children().is(":visible")) {
					str1 = $('.xzhd-body-henggang1').eq(i).parent().children('p').html()
				}
			}
			for (var j = 0; j < $('.xzhd-body-gouxuan1').length; j++) {
				if ($('.xzhd-body-gouxuan1').eq(j).children().is(":visible")) {
					//var str = ($('#xzhd-body-lqrhd').html())
					console.log(j)
					str2 = $('.xzhd-body-gouxuan1').eq(j).parent().parent().children().eq(1).html()
					str += `<div style="display:flex;align-items:center;justify-content:space-between;font-size:16px"><p>` + str1 + '/' + str2 + `</p><img class="xzhd-body-chacha1" src="image/classdel_btn.png"></div>`
				}
			}
			$('#xzhd-body-lqrhd').html(str)
			$('.xzhd-body-chacha1').unbind()
			chacha1()
		}
</script>

</html>