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
	<link rel="stylesheet" type="text/css" href="easyui/pagination.css" />
	<script src="easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/moment.min.js"></script>
	
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
			width: 13.02%
		}
	
		.item3 {
			width: 5.677%
		}
	
		.item4 {
			width: 10.885417%
		}
	
		.item22 {
			width: 9.375%
		}
	
		.item33 {
			width: 10.42%
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
			font-size: 14px;
			padding-left: 14px;
			box-sizing: border-box;
			-webkit-appearance: none
		}
	
		#sj-body-slelctyhjmc {
			width: 120px;
			height: 30px;
			border: 1px solid #d5d5d7;
			border-radius: 4px;
			font-size: 14px;
			padding-left: 13px;
			box-sizing: border-box;
			-webkit-appearance: none
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
	
		.triangle_border_down2 {
			display: inline-block;
			width: 0;
			height: 0;
			border-width: 8px 5px 0;
			border-style: solid;
			border-color: #BFBFBF transparent transparent;
			position: absolute;
			right: 5px;
			top: 3px;
		}
	
		#yqyl-header-hdsjs {
			width: 120px;
			height: 30px;
			border: none;
			font-size: 12px;
			padding-left: 13px;
			box-sizing: border-box;
		}
	
		#yqyl-header-hdsje {
			width: 120px;
			height: 30px;
			border: none;
			font-size: 12px;
			padding-left: 14px;
			box-sizing: border-box;
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
	
		.yqyl-body-quxiao {
			width: 70px;
			height: 36px;
			font-size: 16px;
			text-align: center;
			line-height: 36px;
			border: 1px solid #d8d8d9;
			border-radius: 4px;
			box-sizing: border-box;
			margin-left: 15px;
			cursor: pointer;
		}
	
		.yqyl-body-queding {
			width: 70px;
			height: 36px;
			font-size: 16px;
			text-align: center;
			line-height: 36px;
			background: #71B2EF;
			color: white;
			border-radius: 4px;
			margin-left: 26px;
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
			font-size: 16px;
			padding-left: 20px;
			box-sizing: border-box;
			color: #444444
		}
	
		#xzhd-body-zdlqrs {
			width: 100px;
			height: 32px;
			border: none;
			font-size: 16px;
			padding-left: 20px;
			box-sizing: border-box;
			color: #444444
		}
	
		#xzhd-body-hblqsl {
			width: 100px;
			height: 32px;
			border: none;
			font-size: 16px;
			padding-left: 20px;
			box-sizing: border-box;
			color: #444444
		}
	
		#xzhd-body-hdsjs {
			width: 175px;
			height: 32px;
			border: none;
			font-size: 16px;
			padding-left: 20px;
			box-sizing: border-box;
			color: #444444
		}
	
		#xzhd-body-hdsje {
			width: 175px;
			height: 32px;
			border: none;
			font-size: 16px;
			padding-left: 20px;
			box-sizing: border-box;
			color: #444444
		}
	
		#xzhd-body-fxhd {
			width: 500px;
			min-height: 32px;
			border: none;
			line-height: 32px;
			font-size: 14px;
			font-size: 16px;
			padding-left: 20px;
			box-sizing: border-box;
			color: #444444
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
			line-height: 32px;
			font-size: 16px;
			padding-left: 20px;
			box-sizing: border-box;
			color: #444444
		}
	
		.xzhd-body-zstjraduis {
			width: 24px;
			height: 24px;
			border-radius: 50%;
			border: 1px solid #BFBFBF;
			box-sizing: border-box;
			display: flex;
			justify-content: center;
			align-items: center;
		}
	
		#xzhd-body-hdbjpz-img {
			width: 120px;
			height: 150px;
			border: 1px solid #CCCCCC;
			border-radius: 3px;
		}
	
		#xzhd-body-hdbjpz-upload {
			width: 60px;
			height: 30px;
			border-radius: 4px;
			background: #71B2EF;
			color: white;
			text-align: center;
			line-height: 30px;
			font-size: 16px;
			margin-left: 15px;
			cursor: pointer;
		}
	
		#xzhd-body-fxanpz-img {
			width: 160px;
			height: 60px;
			border: 1px solid #CCCCCC;
			border-radius: 3px;
			display: flex;
			justify-content: center;
			align-items: center;
		}
	
		#xzhd-body-fxanpz-upload {
			width: 60px;
			height: 30px;
			border-radius: 4px;
			background: #71B2EF;
			color: white;
			text-align: center;
			line-height: 30px;
			font-size: 16px;
			margin-left: 15px;
			cursor: pointer;
		}
	
		#xzhd-body-fxhyljt-img {
			width: 150px;
			height: 120px;
			border: 1px solid #CCCCCC;
			border-radius: 3px;
		}
	
		#xzhd-body-fxhyljt-upload {
			width: 60px;
			height: 30px;
			border-radius: 4px;
			background: #71B2EF;
			color: white;
			text-align: center;
			line-height: 30px;
			font-size: 16px;
			margin-left: 15px;
			cursor: pointer;
		}
	
		#xzhd-body-lqhdbjpz-img {
			width: 120px;
			height: 150px;
			border: 1px solid #CCCCCC;
			border-radius: 3px;
		}
	
		#xzhd-body-lqhdbjpz-upload {
			width: 60px;
			height: 30px;
			border-radius: 4px;
			background: #71B2EF;
			color: white;
			text-align: center;
			line-height: 30px;
			font-size: 16px;
			margin-left: 15px;
			cursor: pointer;
		}
	
		#xzhd-body-lqanpz-img {
			width: 160px;
			height: 60px;
			border: 1px solid #CCCCCC;
			border-radius: 3px;
			display: flex;
			justify-content: center;
			align-items: center;
		}
	
		#xzhd-body-lqanpz-upload {
			width: 60px;
			height: 30px;
			border-radius: 4px;
			background: #71B2EF;
			color: white;
			text-align: center;
			line-height: 30px;
			font-size: 16px;
			margin-left: 15px;
			cursor: pointer;
		}
	
		#xzhd-body-fxwzbt {
			width: 680px;
			height: 32px;
			border: none;
			color: #444444;
			font-size: 16px;
			padding-left: 20px;
			box-sizing: border-box;
		}
	
		#xzhd-body-fxhdxs {
			width: 680px;
			height: 160px;
			resize: none;
			border: none;
			color: #444444;
			padding-left: 20px;
			padding-top: 10px;
			font-size: 16px;
			box-sizing: border-box;
		}
	
		#xzhd-body-save {
			width: 110px;
			height: 40px;
			background: #71B2EF;
			text-align: center;
			line-height: 40px;
			color: white;
			border-radius: 4px;
			font-size: 16px;
			cursor: pointer;
		}
	
		#xzhd-body-quxiao {
			width: 110px;
			height: 40px;
			text-align: center;
			line-height: 40px;
			border-radius: 4px;
			border: 1px solid #BFBFBF;
			font-size: 16px;
			margin-left: 15px;
			cursor: pointer;
		}
	
		.shuju {
			cursor: pointer;
		}
	
		.youxiao {
			cursor: pointer;
		}
	
		.chakan {
			cursor: pointer;
		}
	
		.sj-body-flex {
			width: 100%;
			display: flex;
			align-items: center;
			height:auto;
			flex-wrap: wrap;
		}
	
		#sj-body-fhsyj {
			font-size: 16px;
			color: #71B2EF;
			cursor: pointer;
		}
	
		.sj-body-line {
			height: 1px;
			background: #BFBFBF;
			margin-top: 10px
		}
	
		#sj-body-hdmc {
			font-size: 18px;
			color: #444444;
			font-weight: bold
		}
	
		#sj-body-gd {
			font-size: 16px;
			color: #71B2EF;
			cursor: pointer;
		}
	
		.sj-body-flex1 {
			height: 143px;
			display: flex;
			flex-wrap: wrap;
			overflow: hidden;
		}
	
		/* @media (max-device-width: 1228px) and (min-device-width: 1867px){
			.sj-body-flex1 .sj-body-flex111:nth-child(2n+1){
				margin-left:0
			}
		}

		@media (max-device-width: 1867px) and (min-device-width: 2132px){
			.sj-body-flex1 .sj-body-flex111:nth-child(3n+1){
				margin-left:0
			}
		}

		@media (max-device-width: 2132px){
			.sj-body-flex1 .sj-body-flex111:nth-child(4n+1){
				margin-left:0
			}
		} */

		/* .sj-body-flex1 .sj-body-flex111:nth-child(3n+1) {
			margin-left: 0
		} */
	
		.sj-body-flex1 .sj-body-flex111 {
			margin-right: 44px
		}
	
		/* .sj-body-flex1 div:nth-child(2n){
				margin-left:44px
			} */
	
		.sj-body-flex-p {
			font-size: 16px;
			color: #444444;
			margin-right: 20px;
		}
	
		.sj-body-input {
			border: 1px solid #BFBFBF;
			overflow: hidden;
			border-radius: 4px;
		}
	
		#sj-body-yhqmc {
			border: none;
			width: 200px;
			height: 30px;
		}
	
		#sj-body-lqsjs {
			width: 120px;
			height: 30px;
			border: none;
			padding-left: 13px;
			box-sizing: border-box;
	
		}
	
		#sj-body-lqsje {
			width: 120px;
			height: 30px;
			border: none;
			padding-left: 13px;
			box-sizing: border-box;
		}
	
		#sj-body-zt {
			width: 120px;
			height: 30px;
			border: 1px solid #d5d5d7;
			border-radius: 4px;
			font-size: 14px;
			padding-left: 13px;
			box-sizing: border-box;
			-webkit-appearance: none
		}
	
		#sj-body-ly {
			width: 120px;
			height: 30px;
			border: 1px solid #d5d5d7;
			border-radius: 4px;
			font-size: 14px;
			padding-left: 13px;
			box-sizing: border-box;
			-webkit-appearance: none
		}
	
		#sj-body-chaxun {
			width: 80px;
			height: 30px;
			background: #71B2EF;
			color: white;
			border-radius: 4px;
			text-align: center;
			line-height: 30px;
			font-size: 16px;
			margin-left: 40px;
			cursor: pointer;
			display: inline-block;
		}
	
		#sj-body-qingchu {
			width: 80px;
			height: 30px;
			border: 1px solid #d0ced0;
			border-radius: 4px;
			text-align: center;
			line-height: 30px;
			font-size: 16px;
			margin-left: 15px;
			cursor: pointer;
			display: inline-block;
		}
	
		#sj-body-dcsj {
			width: 100px;
			height: 30px;
			background: #71B2EF;
			color: white;
			border-radius: 4px;
			text-align: center;
			line-height: 30px;
			font-size: 16px;
			margin-left: 220px;
			cursor: pointer;
			display: inline-block;
		}
	
		.table-body1 tr td {
			font-size: 14px;
			color: #444444;
			height: 40px;
			text-align: center;
			border-left: 1px dotted #CCCCCC;
			border-bottom: 1px dotted #CCCCCC
		}
	
		#xzhd-body-fxhd-zhankai {
			width: 660px;
			height: 210px;
			background: white;
			border: 1px solid #BFBFBF;
			box-sizing: border-box;
			position: absolute;
			top: 100%;
			left: 150px;
			z-index: 999;
			padding: 0 0 20px 20px;
			display: flex;
			margin-top: 10px;
		}
	
		#xzhd-body-lqrhd-zhankai {
			width: 660px;
			height: 210px;
			background: white;
			border: 1px solid #BFBFBF;
			box-sizing: border-box;
			position: absolute;
			top: 100%;
			left: 150px;
			z-index: 999;
			padding: 0 20px 20px 20px;
			display: flex;
			margin-top: 10px
		}
	
		.xzhd-body-henggang {
			width: 16px;
			height: 16px;
			border: 1px solid #BFBFBF;
			box-sizing: border-box;
		}
	
		.xzhd-body-henggang img {
			margin-left: -1px;
			margin-top: -1px;
			display: none
		}
	
		.xzhd-body-henggang1 {
			width: 16px;
			height: 16px;
			border: 1px solid #BFBFBF;
			box-sizing: border-box;
		}
	
		.xzhd-body-henggang1 img {
			margin-left: -1px;
			margin-top: -1px;
			display: none
		}
	
		.xzhd-body-gouxuan {
			width: 16px;
			height: 16px;
			border: 1px solid #BFBFBF;
			box-sizing: border-box;
		}
	
		.xzhd-body-gouxuan img {
			margin-left: -1px;
			margin-top: -1px;
			display: none
		}
	
		.xzhd-body-gouxuan1 {
			width: 16px;
			height: 16px;
			border: 1px solid #BFBFBF;
			box-sizing: border-box;
		}
	
		.xzhd-body-gouxuan1 img {
			margin-left: -1px;
			margin-top: -1px;
			display: none
		}
	
		.xzhd-body-tbody th {
			font-size: 16px;
			height: 40px;
		}
	
		.xzhd-body-tbody1 td {
			font-size: 14px;
			height: 40px;
			text-align: center;
		}
	
		.xzhd-body-tbody2 td {
			font-size: 14px;
			height: 40px;
			text-align: center;
		}
	
		.xzhd-body-tbody11 td {
			font-size: 14px;
			height: 40px;
			text-align: center;
		}
	
		.xzhd-body-tbody22 td {
			font-size: 14px;
			height: 40px;
			text-align: center;
		}
	
		.xzhd-body-chacha {
			width: 16px;
			height: 16px;
			margin-left: 15px;
			margin-right: 40px
		}
	
		.xzhd-body-chacha1 {
			width: 16px;
			height: 16px;
			margin-left: 15px;
			margin-right: 40px
		}
	
		.minus_minus {
			width: 15px;
			height: 15px;
		}
	
		.add_add {
			width: 15px;
			height: 15px;
		}
	
		.xzhd-body-kqsl {
			width: 50px;
			border-bottom: 1px solid #BFBFBF;
			text-align: center;
		}
	
		#xzhd-body-count {
			position: absolute;
			top: 7px;
			left: 330px;
			font-size: 16px;
			color: #444444
		}
	
		#xzhd-body-fxwzbt-count {
			position: absolute;
			top: 7px;
			left: 626px;
			font-size: 16px;
			color: #444444
		}
	
		#xzhd-body-fxhdxs-count {
			position: absolute;
			top: 132px;
			left: 626px;
			font-size: 16px;
			color: #444444
		}
	
		.xzhd-body-zdlqrs-upfold {
			width: 30px;
			height: 16px;
			box-sizing: border-box;
			border-left: 1px solid #CCCCCC;
			border-bottom: 1px solid #CCCCCC;
			display: flex;
			justify-content: center;
			align-items: center;
		}
	
		.xzhd-body-zdlqrs-downfold {
			width: 30px;
			height: 16px;
			box-sizing: border-box;
			border-left: 1px solid #CCCCCC;
			display: flex;
			justify-content: center;
			align-items: center;
		}
	
		.xzhd-body-tswztswz {
			color: #bfbcbf;
			font-size: 16px;
			margin: 7px 0 0 14px
		}

		@media screen and (max-width: 1388px) {
		#sj-body-flex111 select {
			width: 10.2% !important;
		}
		/* .busData .c-datepicker-date-editor {
			width: 8%;
		} */

		/* .busData .select_wrap {
			margin-right: 10px;
		} */
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
						<option value="0">未开始</option>
						<option value="2">已结束</option>
					</select>
					<em class="triangle_border_down1"></em>
				</span>
				<p class="yqyl-header-p">活动时间</p>
				<div class="yqyl-header-input J-datepicker-day" style='margin-right:7px'>
					<input id="yqyl-header-hdsjs" type="text" placeholder="开始日期">
				</div>
				<div style="width:5px;height:2px;background:#c7c6c9;margin-right:7px">
				</div>
				<div class="yqyl-header-input J-datepicker-day">
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
						<th class="item3">评论人数</th>
						<th class="item3">评论人次</th>
						<th class="item3">分享人数</th>
						<th class="item3">分享人次</th>
						<th class="item3">领取人数</th>
						<th class="item3">领取人次</th>
						<th class="item3">使用人数</th>
						<th class="item3">状态</th>
						<th class="item4">操作</th>
					</tr>
				</tbody>
				<tbody class="table-body">
					
				</tbody>
			</table>
			<div style="width:100%;margin-top:22px;display:flex;align-items: center;">
				<p style="font-size:16px" id="yqyl-body-sjjl"></p>
				<div class="box" id="boxpage" style="margin:0 0 0 27px"></div>
			</div>
	
		</div>
	
		<div class="xzhd-body" style="display:none;">
			<div style="width:100%">
				<div id="fhsyj">返回上一级</div>
			</div>
			<div class="xzhd-body-line"></div>
			<div style="font-size:18px;color:#444444;margin:20px 0 0 15px;">活动信息</div>
			<div class="xzhd-body-line"></div>
			<div class="xzhd-body-flex" style="margin-top:24px">
				<p style="font-size:16px;margin-right:86px">活动名称</p>
				<div class="xzhd-body-input" style="position:relative">
					<input id="xzhd-body-hdmc" placeholder="请填写活动名称" type="text">
					<p id='xzhd-body-count'><span id="xzhd-body-text-count">0</span>/20</p>
				</div>
			</div>
			<div class="xzhd-body-flex" style="margin-top:24px">
				<p style="font-size:16px;margin-right:86px">活动时间</p>
				<div class="xzhd-body-input J-datepicker-day">
					<input id="xzhd-body-hdsjs" placeholder="开始时间" type="text">
				</div>
				<div style="color:#CCCCCC;margin:0 10px">--</div>
				<div class="xzhd-body-input J-datepicker-day">
					<input id="xzhd-body-hdsje" placeholder="结束时间" type="text">
				</div>
			</div>
	
			<div class="xzhd-body-flex" style="margin-top:24px">
				<p style="font-size:16px;margin-right:54px">最大领取人数</p>
				<div class="xzhd-body-input" style="position: relative;">
					<input id="xzhd-body-zdlqrs" placeholder="人数" type="text">
					<div style="display:flex;flex-direction:column;position:absolute;top:0;right:0">
						<div class="xzhd-body-zdlqrs-upfold">
							<img style="width:13px;height:7.5px;" src="image/upfoldicomTop.png" alt="">
						</div>
						<div class="xzhd-body-zdlqrs-downfold">
							<img style="width:13px;height:7.5px;" src="image/upfoldicomBottom.png" alt="">
						</div>
					</div>
				</div>
			</div>
	
			<div class="xzhd-body-flex" id="zstjzstj" style="margin-top:24px">
				<p style="font-size:16px;margin-right:48px">仅限新客领取</p>
				<div class="xzhd-body-zstjraduis">
					<p style="width:14px;height:14px;border-radius:50%;background:#71B2EF;display:none"></p>
				</div>
				<p style="margin:0 36px 0 15px;font-size:14px">是</p>
				<div class="xzhd-body-zstjraduis">
					<p style="width:14px;height:14px;border-radius:50%;background:#71B2EF;display:none"></p>
				</div>
				<p style="margin:0 36px 0 15px;font-size:14px">否</p>
			</div>
	
			<div class="xzhd-body-flex" style="margin-top:24px;position: relative;">
				<p style="font-size:16px;margin-right:86px">红包内容</p>
				<div class="xzhd-body-input" style="position:relative">
					<div id="xzhd-body-fxhd">
						<p style="color:#BFBFBF"></p>
					</div>
					<div class="xzhd-body-down" id="xzhd-body-down11" style="top:42%"></div>
				</div>
				<p style="font-size: 14px;color:#444444;margin-left:15px">*分享者和领取者的红包随机发放</p>
				<div id="xzhd-body-fxhd-zhankai" style="display:none">
					<div style="width:200px;margin-top:10px">
						<div style="display:flex;align-items:center;">
							<div class="xzhd-body-henggang">
								<img src="image/checkout.png" alt="">
							</div>
							<p style="font-size:16px;color:#444444;margin:0 46px 0 14px;">CRM优惠券</p>
							<img id="crm-rightget" style="display:none" src="image/right_get.png" alt="">
							<img id="crm-rightnone" src="image/right_none.png" alt="">
						</div>
						<div style="display:flex;align-items:center;margin-top:24px">
							<div class="xzhd-body-henggang">
								<img src="image/checkout.png" alt="">
							</div>
							<p style="font-size:16px;color:#444444;margin:0 49px 0 14px;">有赞优惠券</p>
							<img id="crm-rightget" style="display:none" src="image/right_get.png" alt="">
							<img id="crm-rightnone" src="image/right_none.png" alt="">
						</div>
					</div>
					<div style="height:100%;overflow-y:scroll;flex:1">
						<table style="border-collapse: collapse;flex:1;table-layout:fixed;">
							<tbody class="xzhd-body-tbody">
								<tr>
									<th style="width:10%"></th>
									<th style="width:10%">优惠券名称</th>
									<th style="width:10%">数量</th>
									<th style="width:10%">库存</th>
								</tr>
							</tbody>
							<tbody class="xzhd-body-tbody1" style="display:none;">
	
							</tbody>
							<tbody class="xzhd-body-tbody2" style="display:none">
	
							</tbody>
						</table>
					</div>
	
				</div>
			</div>
	
			<!-- <div class="xzhd-body-flex" style="margin-top:24px;position: relative;">
				<p style="font-size:16px;margin-right:70px">领取人获得</p>
				<div class="xzhd-body-input" style="position:relative">
					<div id="xzhd-body-lqrhd">
						<p style="color:#BFBFBF">请选择领取人可获得的优惠券</p>
					</div>
					<div class="xzhd-body-down" id="xzhd-body-down22" style="top:42%"></div>
				</div>
				<div id="xzhd-body-lqrhd-zhankai" style="display:none">
					<div style="width:200px;margin-top:10px">
						<div style="display:flex;align-items:center;">
							<div class="xzhd-body-henggang1">
								<img src="image/checkout.png" alt="">
							</div>
							<p style="font-size:16px;color:#444444;margin:0 46px 0 14px;">CRM优惠券</p>
							<img id="crm-rightget" style="display:none" src="image/right_get.png" alt="">
							<img id="crm-rightnone" src="image/right_none.png" alt="">
						</div>
						<div style="display:flex;align-items:center;margin-top:24px">
							<div class="xzhd-body-henggang1">
								<img src="image/checkout.png" alt="">
							</div>
							<p style="font-size:16px;color:#444444;margin:0 49px 0 14px;">有赞优惠券</p>
							<img id="crm-rightget" style="display:none" src="image/right_get.png" alt="">
							<img id="crm-rightnone" src="image/right_none.png" alt="">
						</div>
					</div>
					<div style="height:100%;overflow-y:scroll;flex:1">
					<table style="border-collapse: collapse;flex:1;table-layout:fixed;">
						<tbody class="xzhd-body-tbody">
							<tr>
								<th style="width:10%"></th>
								<th style="width:10%">优惠券名称</th>
								<th style="width:10%">数量</th>
								<th style="width:10%">库存</th>
							</tr>
						</tbody>
						<tbody class="xzhd-body-tbody11" style="display:none">
							
						</tbody>
						<tbody class="xzhd-body-tbody22" style="display:none">
						
						</tbody>
					</table>
					</div>
				</div>
			</div> -->
	
			<div class="xzhd-body-flex" style="margin-top:24px">
				<p style="font-size:16px;margin-right:54px">红包领取数量</p>
				<div class="xzhd-body-input" style="position: relative;">
					<input id="xzhd-body-hblqsl" placeholder="人数" type="text">
					<div style="display:flex;flex-direction:column;position:absolute;top:0;right:0">
						<div class="xzhd-body-zdlqrs-upfold">
							<img style="width:13px;height:7.5px;" src="image/upfoldicomTop.png" alt="">
						</div>
						<div class="xzhd-body-zdlqrs-downfold">
							<img style="width:13px;height:7.5px;" src="image/upfoldicomBottom.png" alt="">
						</div>
					</div>
				</div>
			</div>
	
			<div class="xzhd-body-flex1" style="margin-top:50px">
				<p style="font-size:16px;margin-right:54px;">分享文字标题</p>
				<div class="xzhd-body-input" style="position:relative">
					<input id="xzhd-body-fxwzbt" placeholder="请填写分享活动描述" />
					<p id='xzhd-body-fxwzbt-count'><span id="xzhd-body-fxwzbt-text-count">0</span>/20</p>
				</div>
			</div>
			<div class="xzhd-body-flex1" style="margin-top:50px">
				<p style="font-size:16px;margin-right:54px">分享活动描述</p>
				<div class="xzhd-body-input" style="position:relative">
					<textarea id="xzhd-body-fxhdxs" placeholder="请对活动分享进行描述"></textarea>
					<p id='xzhd-body-fxhdxs-count'><span id="xzhd-body-fxhdxs-text-count">0</span>/30</p>
				</div>
			</div>
			<div class="xzhd-body-flex1" style="margin-top:50px;position: relative;">
				<p style="font-size:16px;margin-right:22px">活动页面背景配置</p>
				<div id="xzhd-body-hdbjpz-img">
					<img style="width:100%;height:100%" src="image/white-white.jpg" alt="">
				</div>
				<div style="display: flex;flex-direction: column;">
					<div id="xzhd-body-hdbjpz-upload">上传</div>
					<p class="xzhd-body-tswztswz" style="margin-top:14px">图片建议尺寸：宽度建议750像素</p>
					<p class="xzhd-body-tswztswz">高度尽量不要超过3手机屏，</p>
					<p class="xzhd-body-tswztswz">图片大小不超过5M.</p>
				</div>
				<input type="file" accept=".png,.jpeg,.jpg" id="hdbjpz_upload" onchange="hdbjpz_upload()"
					style="display:none">
				<!-- <div style="position:absolute;right:222px;top:0">
					<p style="font-size:16px">示例1</p>
					<p style="font-size:16px;margin-top:9px">上传活动背景图时，分享红包按钮处请留白</p>
					<div style="display:flex;align-items:flex-end;margin-top:9px">
						<img style="width:150px;height:110px" onclick="openImg()" src="image/srcimg.png" alt="">
						<p style="font-size:16px">（点击图片可查看大图）</p>
					</div>
				</div> -->
			</div>
			<div class="xzhd-body-flex1" style="margin-top:50px">
				<p style="font-size:16px;margin-right:54px">分享按钮配置</p>
				<div id="xzhd-body-fxanpz-img">
					<img style="width:120px;height:30px" src="image/white-white.jpg" alt="">
				</div>
				<div id="xzhd-body-fxanpz-upload">上传</div>
				<p class="xzhd-body-tswztswz" style="margin-top:3px">参考示例1:距离顶部820像素,按钮高度90像素以内</p>
				<input type="file" accept=".png,.jpeg,.jpg" id="fxanpz_upload" onchange="fxanpz_upload()"
					style="display:none">
			</div>
			<div class="xzhd-body-flex1" style="margin-top:50px;position:relative">
				<p style="font-size:16px;margin-right:39px">分享好友链接图</p>
				<div id="xzhd-body-fxhyljt-img">
					<img style="width:100%;height:100%" src="image/white-white.jpg" alt="">
				</div>
				<div style="display: flex;flex-direction: column;">
					<div id="xzhd-body-fxhyljt-upload">上传</div>
					<p class="xzhd-body-tswztswz" style="margin-top:14px">图片建议尺寸：宽度建议750像素</p>
					<p class="xzhd-body-tswztswz">高度建议564像素</p>
					<p class="xzhd-body-tswztswz">图片大小不超过2M.</p>
				</div>
				<input type="file" accept=".png,.jpeg,.jpg" id="fxhyljt_upload" onchange="fxhyljt_upload()"
					style="display:none">
				<div style="position:absolute;right:100px;top:0">
					<p style="font-size:16px">示例2</p>
					<p style="font-size:16px;margin-top:9px">建议图片进行适当设计，图上铺之以营销文案，来吸引消费者。</p>
					<div style="display:flex;align-items:flex-end;margin-top:9px">
						<img style="width:150px;height:110px" onclick="openImg()" src="image/srcimg.png" alt="">
						<p style="font-size:16px">（点击图片可查看大图）</p>
					</div>
				</div>
			</div>
			<div class="xzhd-body-flex1" style="margin-top:50px">
				<p style="font-size:16px;margin-right:22px">领取活动背景配置</p>
				<div id="xzhd-body-lqhdbjpz-img">
					<img style="width:100%;height:100%" src="image/white-white.jpg" alt="">
				</div>
				<div style="display: flex;flex-direction: column;">
					<div id="xzhd-body-lqhdbjpz-upload">上传</div>
					<p class="xzhd-body-tswztswz" style="margin-top:39px">高度尽量不要超过3手机屏</p>
					<p class="xzhd-body-tswztswz">图片大小不超过5M，参考示例1</p>
				</div>
				<input type="file" accept=".png,.jpeg,.jpg" id="lqhdbjpz_upload" onchange="lqhdbjpz_upload()"
					style="display:none">
			</div>
			<div class="xzhd-body-flex1" style="margin-top:50px">
				<p style="font-size:16px;margin-right:54px">领取按钮配置</p>
				<div id="xzhd-body-lqanpz-img">
					<img style="width:120px;height:30px" src="image/white-white.jpg" alt="">
				</div>
				<div id="xzhd-body-lqanpz-upload">上传</div>
				<input type="file" accept=".png,.jpeg,.jpg" id="lqanpz_upload" onchange="lqanpz_upload()"
					style="display:none">
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
				<p id="sj-body-hdmc"></p>
				<div style="display:flex;align-items: center;">
					<p id="sj-body-gd">更多</p>
					<img id="sj-body-gdimg" style="width:13px;height:7px;margin-left:7px" src="image/more_unfold.png"
						alt="">
					<img id="sj-body-gdimg1" style="width:13px;height:7px;margin-left:7px;display:none"
						src="image/more_fold.png" alt="">
				</div>
			</div>
			<div class="sj-body-flex1">
	
			</div>
			<div class="sj-body-flex" style="margin-top:30px" id="sj-body-flex111">
				<label class="sj-body-flex-p">优惠券名称</label>
				<!-- <div class="sj-body-input" id='sj-body-inputyhjmc' style="width:120px"> -->
				<span class="select_wrap">
					<select name="visitstatus" id="sj-body-slelctyhjmc">
	
					</select>
					<em class="triangle_border_down1"></em>
				</span>
				<!-- </div> -->
				<label class="sj-body-flex-p" style="margin-left:38px">领取时间</label>
				<div class="sj-body-input J-datepicker-day">
					<input id="sj-body-lqsjs" type="text" placeholder="开始日期">
				</div>
				<div style="margin:0 10px">-</div>
				<div class="sj-body-input J-datepicker-day">
					<input id="sj-body-lqsje" type="text" placeholder="结束日期">
				</div>
				<label class="sj-body-flex-p" style="margin-left:38px">状态</label>
				<span class="select_wrap">
					<select name="visitstatus" id="sj-body-zt">
						<option value="" selected="selected">全部</option>
						<option value="0">未核销</option>
						<option value="1">已核销</option>
						<option value="2">已赠送</option>
						<option value="3">撤回</option>
						<option value="4">已过期</option>
					</select>
					<em class="triangle_border_down1"></em>
				</span>
				<label class="sj-body-flex-p" style="margin-left:38px">来源</label>
				<span class="select_wrap">
					<select name="visitstatus" id="sj-body-ly">
						<option value="" selected="selected">全部</option>
						<option value="1">crm</option>
						<option value="2">有赞</option>
					</select>
					<em class="triangle_border_down1"></em>
				</span>
				<span id="sj-body-chaxun">查询</span>
				<span id="sj-body-qingchu">清除</span>
				<span id="sj-body-dcsj">导出数据</span>
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
				<tbody class="table-body1" id="sj-body-body1">
	
				</tbody>
			</table>
	
			<div class="sj-body-flex" style="margin-top:24px">
				<p style="font-size:16px;color:#444444" id="sj-body-flex-jujl"></p>
				<div class="box" id="boxpage1" style="margin:0 0 0 27px"></div>
			</div>
		</div>
	</body>
	
	<script type="text/javascript" src="easyui/datepicker.all.js"></script>
	<script type="text/javascript" src="easyui/datepicker.en.js"></script>
	
	<script>
		//活动界面赠送条件单选按钮
		$('.xzhd-body-zstjraduis').click(function () {
			$('.xzhd-body-zstjraduis').css('border-color', '#BFBFBF')
			$('.xzhd-body-zstjraduis').children().hide()
			$(this).css('border-color', '#71B2EF')
			$(this).children().show()
		})
		//新建活动按钮
		$('#xjhd-start').click(function () {
			for (var j = 0; j < $('.xzhd-body-gouxuan').length; j++) {
				$('.xzhd-body-gouxuan').eq(j).removeClass('gx')
				$('.xzhd-body-gouxuan').eq(j).children().hide()
			}
			for (var jj = 0; jj < $('.xzhd-body-gouxuan1').length; jj++) {
				$('.xzhd-body-gouxuan1').eq(jj).removeClass('gxx')
				$('.xzhd-body-gouxuan1').eq(jj).children().hide()
			}
			$('.xzhd-body').show()
			$('.yqyl-body').hide()
			$('#xzhd-body-hdmc').val('')
			$('#xzhd-body-hdsjs').val('')
			$('#xzhd-body-hdsje').val('')
			var xjhdstr = `<p style="color:#757575">请选择评论分享可获得的红包</p>`
			$('#xzhd-body-fxhd').html(xjhdstr)
			var lqrhdstr = `<p style="color:#757575">请选择领取人可获得的优惠券</p>`
			$('#xzhd-body-lqrhd').html(lqrhdstr)
			for (var e = 0; e < $('.xzhd-body-zstjraduis').length; e++) {
				$('.xzhd-body-zstjraduis').eq(e).children().hide()
			}
			$('#xzhd-body-hdbjpz-img').attr('class', '')
			$('#xzhd-body-hdbjpz-img').children().attr('src', 'image/white-white.jpg')
			$('#xzhd-body-fxanpz-img').attr('class', '')
			$('#xzhd-body-fxanpz-img').children().attr('src', 'image/white-white.jpg')
			$('#xzhd-body-fxhyljt-img').attr('class', '')
			$('#xzhd-body-fxhyljt-img').children().attr('src', 'image/white-white.jpg')
			$('#xzhd-body-lqhdbjpz-img').attr('class', '')
			$('#xzhd-body-lqhdbjpz-img').children().attr('src', 'image/white-white.jpg')
			$('#xzhd-body-lqanpz-img').attr('class', '')
			$('#xzhd-body-lqanpz-img').children().attr('src', 'image/white-white.jpg')
			$('#xzhd-body-fxwzbt').val('')
			$('#xzhd-body-fxhdxs').val('')
			$('#xzhd-body-zdlqrs').val('')
			$('#xzhd-body-hblqsl').val('')
			//新建活动的点击按钮
			$('#xzhd-body-save').unbind()
			$('#xzhd-body-save').click(function () {
				newhd()
			})
		})
		//新建活动的返回上一级按钮
		$('#fhsyj').click(function () {
			$('.xzhd-body').hide()
			$('.yqyl-body').show()
			$('#xzhd-body-hdmc').css('pointer-events', 'auto')
			$('#xzhd-body-hdsjs').css('pointer-events', 'auto')
			$('#xzhd-body-hdsje').css('pointer-events', 'auto')
			$('#xzhd-body-fxhd').css('pointer-events', 'auto')
			$('#xzhd-body-lqrhd').css('pointer-events', 'auto')
			$('.xzhd-body-zstjraduis').css('pointer-events', 'auto')
			$('#xzhd-body-fxwzbt').css('pointer-events', 'auto')
			$('#xzhd-body-fxhdxs').css('pointer-events', 'auto')
			$('#xzhd-body-hdbjpz-upload').css('pointer-events', 'auto')
			$('#xzhd-body-fxanpz-upload').css('pointer-events', 'auto')
			$('#xzhd-body-fxhyljt-upload').css('pointer-events', 'auto')
			$('#xzhd-body-lqhdbjpz-upload').css('pointer-events', 'auto')
			$('#xzhd-body-lqanpz-upload').css('pointer-events', 'auto')
			$('#xzhd-body-save').css('pointer-events', 'auto')
		})
		//新建活动返回按钮
		$('#xzhd-body-quxiao').click(function () {
			$('.xzhd-body').hide()
			$('.yqyl-body').show()
			$('#xzhd-body-hdmc').css('pointer-events', 'auto')
			$('#xzhd-body-hdsjs').css('pointer-events', 'auto')
			$('#xzhd-body-hdsje').css('pointer-events', 'auto')
			$('#xzhd-body-fxhd').css('pointer-events', 'auto')
			$('#xzhd-body-lqrhd').css('pointer-events', 'auto')
			$('.xzhd-body-zstjraduis').css('pointer-events', 'auto')
			$('#xzhd-body-fxwzbt').css('pointer-events', 'auto')
			$('#xzhd-body-fxhdxs').css('pointer-events', 'auto')
			$('#xzhd-body-hdbjpz-upload').css('pointer-events', 'auto')
			$('#xzhd-body-fxanpz-upload').css('pointer-events', 'auto')
			$('#xzhd-body-fxhyljt-upload').css('pointer-events', 'auto')
			$('#xzhd-body-lqhdbjpz-upload').css('pointer-events', 'auto')
			$('#xzhd-body-lqanpz-upload').css('pointer-events', 'auto')
			$('#xzhd-body-save').css('pointer-events', 'auto')
		})
		//数据页面返回上一级按钮
		$('#sj-body-fhsyj').click(function () {
			$('.yqyl-body').show()
			$('.sj-body').hide()
		})
		//活动页面分享获得下拉
		$('#xzhd-body-fxhd').click(function () {
			if ($('#xzhd-body-fxhd-zhankai').is(':hidden')) {
				$('#xzhd-body-fxhd-zhankai').show()
				$('#xzhd-body-down11').attr('class', 'xzhd-body-up')
			}
		})

		$('.xzhd-body').click(function () {
			if ($(event.target).attr('class') == 'xzhd-body-flex' || $(event.target).attr('class') == 'xzhd-body') {
				if ($('#xzhd-body-fxhd-zhankai').is(':visible')) {
					$('#xzhd-body-fxhd-zhankai').hide()
					$('#xzhd-body-down11').attr('class', 'xzhd-body-down')
				}
				if ($('#xzhd-body-lqrhd-zhankai').is(':visible')) {
					$('#xzhd-body-lqrhd-zhankai').hide()
					$('#xzhd-body-down22').attr('class', 'xzhd-body-down')
				}
			}
		})

		//活动页面领取获得下拉
		$('#xzhd-body-lqrhd').click(function () {
			if ($('#xzhd-body-lqrhd-zhankai').is(':hidden')) {
				$('#xzhd-body-lqrhd-zhankai').show()
				$('#xzhd-body-down22').attr('class', 'xzhd-body-up')
			}
		})
		//活动页面分享获得卡券分类
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
		//活动页面领取获得卡券分类
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

		//活动页面分享获得收回
		$('#xzhd-body-down11').click(function () {
			if ($('#xzhd-body-fxhd-zhankai').is(':visible')) {
				$('#xzhd-body-fxhd-zhankai').hide()
				$(this).attr('class', 'xzhd-body-down')
			}
		})
		//活动界面领取获得收回
		$('#xzhd-body-down22').click(function () {
			if ($('#xzhd-body-lqrhd-zhankai').is(':visible')) {
				$('#xzhd-body-lqrhd-zhankai').hide()
				$(this).attr('class', 'xzhd-body-down')
			}
		})

		//首页的查询按钮
		$('#chaxun').click(function () {
			shouye()
		})
		//首页的清除按钮
		$('#qingchu').click(function () {
			$('#yqyl-header-hdmc').val('')
			$('#yqyl-header-hdsjs').val('')
			$('#yqyl-header-hdsje').val('')
			$('#zengjuanyuany').find('option[value=""]').prop("selected", true);
			shouye()
		})

		shouye()

		time()

		youzanjk()

		//活动背景配置点击
		$('#xzhd-body-hdbjpz-upload').click(function () {
			$('#hdbjpz_upload').click()
		})
		//分享按钮配置点击
		$('#xzhd-body-fxanpz-upload').click(function () {
			$('#fxanpz_upload').click()
		})
		//分享好友链接图点击
		$('#xzhd-body-fxhyljt-upload').click(function () {
			$('#fxhyljt_upload').click()
		})
		//领取活动背景配置点击
		$('#xzhd-body-lqhdbjpz-upload').click(function () {
			$('#lqhdbjpz_upload').click()
		})
		//领取按钮配置点击
		$('#xzhd-body-lqanpz-upload').click(function () {
			$('#lqanpz_upload').click()
		})
		//数据页面的更多按钮
		$('#sj-body-gd').click(function () {
			if ($('#sj-body-gdimg1').is(':hidden')) {
				$('#sj-body-gdimg1').show()
				$('#sj-body-gdimg').hide()
				$('.sj-body-flex1').css('height', 'auto')
			} else {
				$('#sj-body-gdimg1').hide()
				$('#sj-body-gdimg').show()
				$('.sj-body-flex1').css('height', '143px')
			}
		})

		$("#xzhd-body-hdmc").on("input propertychange", function () {
			var $this = $(this),
				_val = $this.val(),
				count = "";
			if (_val.length > 20) {
				$this.val(_val.substring(0, 20));
			}
			count = $this.val().length;
			$("#xzhd-body-text-count").text(count);
		});

		$('#xzhd-body-fxwzbt').on("input propertychange", function () {
			var $this = $(this),
				_val = $this.val(),
				count = "";
			if (_val.length > 20) {
				$this.val(_val.substring(0, 20));
			}
			count = $this.val().length;
			$("#xzhd-body-fxwzbt-text-count").text(count);
		});
		$('#xzhd-body-fxhdxs').on("input propertychange", function () {
			var $this = $(this),
				_val = $this.val(),
				count = "";
			if (_val.length > 30) {
				$this.val(_val.substring(0, 30));
			}
			count = $this.val().length;
			$("#xzhd-body-fxhdxs-text-count").text(count);
		});
		
		//活动背景配置上传
		function hdbjpz_upload() {
			if($('#hdbjpz_upload').val() == ''){
				return;
			}
			let file = $("#hdbjpz_upload").val()
			let filename = file.substr(file.lastIndexOf("."));
			if (filename != '.png' && filename != '.jpeg' && filename != '.jpg') {
				alert("请上传图片格式的文件");
				return;
			}
			var fileMaxSize = 5120;
			var fileSize1 = document.getElementById('hdbjpz_upload').files[0].size;
			var fileSize = fileSize1 /1024;
			if(fileSize> fileMaxSize){
				alert("上传文件大小不能超过5M")
				return;
			}
			var formData = new FormData();
			formData.append('file', document.getElementById('hdbjpz_upload').files[0])
			$.ajax({
				url: "rest/evaluateActivity/uploadEvaluateActivitiesFile",
				type: "post",
				data: formData,
				contentType: false,
				processData: false,
				success: function (data) {
					console.log(data)
					$('#xzhd-body-hdbjpz-img').children().attr('src','images/'+ data.rows[0].path)
					$('#xzhd-body-hdbjpz-img').attr('class', 'images/' + data.rows[0].path)
				},
				error: function (data) {
					alert("上传失败")
				}
			});
		}

		//分享按钮配置上传
		function fxanpz_upload() {
			if ($('#fxanpz_upload').val() == '') {
				return;
			}
			let file = $("#fxanpz_upload").val()
			let filename = file.substr(file.lastIndexOf("."));
			if (filename != '.png' && filename != '.jpeg' && filename != '.jpg') {
				alert("请上传图片格式的文件");
				return;
			}

			var formData = new FormData();
			formData.append('file', document.getElementById('fxanpz_upload').files[0])
			$.ajax({
				url: "rest/evaluateActivity/uploadEvaluateActivitiesFile",
				type: "post",
				data: formData,
				contentType: false,
				processData: false,
				success: function (data) {
					console.log(data)
					//var img = data
					//return data
					$('#xzhd-body-fxanpz-img').children().attr('src', 'images/' + data.rows[0].path)
					$('#xzhd-body-fxanpz-img').attr('class', 'images/' + data.rows[0].path)
				},
				error: function (data) {
					alert("上传失败")
				}
			});
		}

		//分享好友链接图上传
		function fxhyljt_upload() {
			if ($('#fxhyljt_upload').val() == '') {
				return;
			}
			let file = $("#fxhyljt_upload").val()
			let filename = file.substr(file.lastIndexOf("."));
			if (filename != '.png' && filename != '.jpeg' && filename != '.jpg') {
				alert("请上传图片格式的文件");
				return;
			}

			var fileMaxSize = 2048;
			var fileSize1 = document.getElementById('fxhyljt_upload').files[0].size;
			var fileSize = fileSize1 / 1024;
			if (fileSize > fileMaxSize) {
				alert("上传文件大小不能超过2M")
				return;
			}

			var formData = new FormData();
			formData.append('file', document.getElementById('fxhyljt_upload').files[0])
			$.ajax({
				url: "rest/evaluateActivity/uploadEvaluateActivitiesFile",
				type: "post",
				data: formData,
				contentType: false,
				processData: false,
				success: function (data) {
					console.log(data)
					//var img = data
					//return data
					$('#xzhd-body-fxhyljt-img').children().attr('src', 'images/' + data.rows[0].path)
					$('#xzhd-body-fxhyljt-img').attr('class', 'images/' + data.rows[0].path)
				},
				error: function (data) {
					alert("上传失败")
				}
			});
		}

		//领取活动背景配置上传
		function lqhdbjpz_upload() {
			if ($('#lqhdbjpz_upload').val() == '') {
				return;
			}
			let file = $("#lqhdbjpz_upload").val()
			let filename = file.substr(file.lastIndexOf("."));
			if (filename != '.png' && filename != '.jpeg' && filename != '.jpg') {
				alert("请上传图片格式的文件");
				return;
			}

			var fileMaxSize = 5120;
			var fileSize1 = document.getElementById('lqhdbjpz_upload').files[0].size;
			var fileSize = fileSize1 / 1024;
			if (fileSize > fileMaxSize) {
				alert("上传文件大小不能超过5M")
				return;
			}

			var formData = new FormData();
			formData.append('file', document.getElementById('lqhdbjpz_upload').files[0])
			$.ajax({
				url: "rest/evaluateActivity/uploadEvaluateActivitiesFile",
				type: "post",
				data: formData,
				contentType: false,
				processData: false,
				success: function (data) {
					console.log(data)
					//var img = data
					//return data
					$('#xzhd-body-lqhdbjpz-img').children().attr('src', 'images/' + data.rows[0].path)
					$('#xzhd-body-lqhdbjpz-img').attr('class', 'images/' + data.rows[0].path)
				},
				error: function (data) {
					alert("上传失败")
				}
			});
		}

		//领取按钮配置上传
		function lqanpz_upload() {
			if ($('#lqanpz_upload').val() == '') {
				return;
			}
			let file = $("#lqanpz_upload").val()
			let filename = file.substr(file.lastIndexOf("."));
			if (filename != '.png' && filename != '.jpeg' && filename != '.jpg') {
				alert("请上传图片格式的文件");
				return;
			}

			var formData = new FormData();
			formData.append('file', document.getElementById('lqanpz_upload').files[0])
			$.ajax({
				url: "rest/evaluateActivity/uploadEvaluateActivitiesFile",
				type: "post",
				data: formData,
				contentType: false,
				processData: false,
				success: function (data) {
					console.log(data)
					//var img = data
					//return data
					$('#xzhd-body-lqanpz-img').children().attr('src', 'images/' + data.rows[0].path)
					$('#xzhd-body-lqanpz-img').attr('class', 'images/' + data.rows[0].path)
				},
				error: function (data) {
					alert("上传失败")
				}
			});
		}

		//时间组件
		function time() {
			$('.J-datepicker-day').datePicker({
				hasShortcut: true,
				format: 'YYYY-MM-DD',
				shortcutOptions: [{
					name: '今天',
					day: '0'
				}, {
					name: '昨天',
					day: '-1'
				}, {
					name: '一周前',
					day: '-7'
				}]
			});

			function fchatitylist() {
				intoPages = 1;
				visititylist();
			}

			function visititylist() {
				var status = $("#visitstatus").val();
				var conditionName = '';//顾问姓名
				var startDate = $("#selectDate1").val();
				var endDate = $("#selectDate2").val();
				//var club = $("#clubId").val();
				var fangcusname = $("#fangcusname").val();
				var fangmobile = $("#fangmobile").val();
				if (startDate != '') {
					if (endDate == '') {
						alert("请选择结束日期");
						return;
					}
				}
			}


			function getDay(day) {

				var today = new Date();



				var targetday_milliseconds = today.getTime() + 1000 * 60 * 60 * 24 * day;



				today.setTime(targetday_milliseconds); //注意，这行是关键代码



				var tYear = today.getFullYear();

				var tMonth = today.getMonth();

				var tDate = today.getDate();

				tMonth = doHandleMonth(tMonth + 1);

				tDate = doHandleMonth(tDate);

				return tYear + "-" + tMonth + "-" + tDate;

			}

			function doHandleMonth(month) {

				var m = month;

				if (month.toString().length == 1) {

					m = "0" + month;

				}

				return m;

			}
		}
		//打开图片
		function openImg() {

			var page = window.open();

			var html = "<body style='background:black'><div style ='text-align:center'><img style='width:800px;height:600px' src='http://test.physicalclub.com/crm/image/srcimg.png' alt=''/></div></body > "

			page.document.write(html);
		}

		//新建活动接口
		function newhd() {

			if ($('#xzhd-body-hdmc').val() == '') {
				alert('请填写活动名称')
				return;
			}

			if ($('#xzhd-body-hdsjs').val() == '') {
				alert('请选择活动开始时间')
				return;
			}

			if ($('#xzhd-body-hdsje').val() == '') {
				alert('请选择活动结束时间')
				return;
			}
					
			if ($('.xzhd-body-zstjraduis').eq(0).children('p').is(':hidden') && $('.xzhd-body-zstjraduis').eq(1).children('p').is(':hidden')) {
				alert('请选择赠送条件')
				return;
			}

			if ($('#xzhd-body-fxhd').children().eq(0).html() == '请选择评论分享可获得的红包') {
				alert('请选择分享获得优惠券')
				return;
			}

			if ($('#xzhd-body-fxwzbt').val() == '') {
				alert('请填写分享文字标题')
				return;
			}

			if ($('#xzhd-body-fxhdxs').val() == '') {
				alert('请填写分享活动描述')
				return;
			}

			if ($('#xzhd-body-hdbjpz-img').attr('class') == '') {
				alert('请上传活动背景配置图片')
				return;
			}

			if ($('#xzhd-body-fxanpz-img').attr('class') == '') {
				alert('请上传分享按钮配置图片')
				return;
			}

			if ($('#xzhd-body-fxhyljt-img').attr('class') == '') {
				alert('请上传分享好友链接图片')
				return;
			}

			if ($('#xzhd-body-lqhdbjpz-img').attr('class') == '') {
				alert('请上传领取活动背景配置图片')
				return;
			}

			if ($('#xzhd-body-lqanpz-img').attr('class') == '') {
				alert('请上传领取按钮配置图片')
				return;
			}

			var activityName = $('#xzhd-body-hdmc').val()
			var startdata = $('#xzhd-body-hdsjs').val() + ' ' + '00:00'
			var enddata = $('#xzhd-body-hdsje').val() + ' ' + '23:59'
			var data1 = new Date(startdata)
			var data2 = new Date(enddata)
			var activityStartDate = data1.getTime()
			var activityEndDate = data2.getTime()
			for (var i = 0; i < $('#zstjzstj').children('.xzhd-body-zstjraduis').length; i++) {
				if ($('#zstjzstj').children('.xzhd-body-zstjraduis').eq(0).children().is(':visible')) {
					var onlyNewPeople = 1
				} else if ($('#zstjzstj').children('.xzhd-body-zstjraduis').eq(1).children().is(':visible')) {
					var onlyNewPeople = 2
				}
			}
			var pageBackgroundUrl = $('#xzhd-body-hdbjpz-img').attr('class')
			var sharePosterButtonUrl = $('#xzhd-body-fxanpz-img').attr('class')
			var shareBuddyLinksUrl = $('#xzhd-body-fxhyljt-img').attr('class')
			var receiveBackgroundUrl = $('#xzhd-body-lqhdbjpz-img').attr('class')
			var receiveButtonUrl = $('#xzhd-body-lqanpz-img').attr('class')
			var shareTitle = $('#xzhd-body-fxwzbt').val()
			var shareDescription = $('#xzhd-body-fxhdxs').val()
			var maxReceiveNumber = $('#xzhd-body-zdlqrs').val()
			var everyReceive = $('#xzhd-body-hblqsl').val()
			var receiveCouponList = []
			for (var j = 0; j < $('#xzhd-body-fxhd').children().length; j++) {
				if ($('#xzhd-body-fxhd').children().eq(j).children('p').html().split('/')[0] == 'CRM优惠券') {
					var couponSource = 1
				} else if ($('#xzhd-body-fxhd').children().eq(j).children('p').html().split('/')[0] == '有赞优惠券') {
					var couponSource = 2
				}
				var couponId = $('#xzhd-body-fxhd').children().eq(j).attr('class')
				var couponName = $('#xzhd-body-fxhd').children().eq(j).attr('id')
				var quantity = Number($('#xzhd-body-fxhd').children().eq(j).children('p').html().split('×')[1])
				receiveCouponList.push({
					couponId: couponId,
					couponName: couponName,
					couponSource: couponSource,
					quantity: quantity
				})
			}
			
			var xjhdstr = {
				activityName: activityName,
				activityStartDate: activityStartDate,
				activityEndDate: activityEndDate,
				onlyNewPeople: onlyNewPeople,
				pageBackgroundUrl: pageBackgroundUrl,
				sharePosterButtonUrl: sharePosterButtonUrl,
				shareBuddyLinksUrl: shareBuddyLinksUrl,
				receiveBackgroundUrl: receiveBackgroundUrl,
				receiveButtonUrl: receiveButtonUrl,
				shareTitle: shareTitle,
				shareDescription: shareDescription,
				receiveCouponList: receiveCouponList,
				fontColor: 123,
				maxReceiveNumber: maxReceiveNumber,
				everyReceive : everyReceive
			}

			$.ajax({
				type: 'POST',
				contentType: "application/json;charset=UTF-8",
				url: "rest/evaluateActivity/addEvaluateActivities",
				data: JSON.stringify(xjhdstr),
				success: function (result) {
					console.log(result)
					if (result.message !== '新增成功!') {
						alert(result.message)
						return;
					}else if (result.message == '新增成功!') {
						alert(result.message)
						$('.xzhd-body').hide()
						$('.yqyl-body').show()
						shouye()
					}
				},
				error: function (e) {
					console.log(e.status);
					console.log(e.responseText)
				}
			})

			//console.log(xjhdstr)
		}

		//编辑活动接口
		function bjhdjk(id) {
			var activityName = $('#xzhd-body-hdmc').val()
			var startdata = $('#xzhd-body-hdsjs').val() + ' ' + '00:00'
			var enddata = $('#xzhd-body-hdsje').val() + ' ' + '23:59'
			var data1 = new Date(startdata)
			var data2 = new Date(enddata)
			var activityStartDate = data1.getTime()
			var activityEndDate = data2.getTime()
			for (var i = 0; i < $('#zstjzstj').children('.xzhd-body-zstjraduis').length; i++) {
				if ($('#zstjzstj').children('.xzhd-body-zstjraduis').eq(0).children().is(':visible')) {
					var onlyNewPeople = 1
				} else if ($('#zstjzstj').children('.xzhd-body-zstjraduis').eq(1).children().is(':visible')) {
					var onlyNewPeople = 2
				}
			}
			var pageBackgroundUrl = $('#xzhd-body-hdbjpz-img').attr('class')
			var sharePosterButtonUrl = $('#xzhd-body-fxanpz-img').attr('class')
			var shareBuddyLinksUrl = $('#xzhd-body-fxhyljt-img').attr('class')
			var receiveBackgroundUrl = $('#xzhd-body-lqhdbjpz-img').attr('class')
			var receiveButtonUrl = $('#xzhd-body-lqanpz-img').attr('class')
			var shareTitle = $('#xzhd-body-fxwzbt').val()
			var shareDescription = $('#xzhd-body-fxhdxs').val()
			var maxReceiveNumber = $('#xzhd-body-zdlqrs').val()
			var everyReceive = $('#xzhd-body-hblqsl').val()
			var receiveCouponList = []
			for (var j = 0; j < $('#xzhd-body-fxhd').children().length; j++) {
				if ($('#xzhd-body-fxhd').children().eq(j).children('p').html().split('/')[0] == 'CRM优惠券') {
					var couponSource = 1
				} else if ($('#xzhd-body-fxhd').children().eq(j).children('p').html().split('/')[0] == '有赞优惠券') {
					var couponSource = 2
				}
				var couponId = $('#xzhd-body-fxhd').children().eq(j).attr('class')
				var couponName = $('#xzhd-body-fxhd').children().eq(j).attr('id')
				var quantity = Number($('#xzhd-body-fxhd').children().eq(j).children('p').html().split('×')[1])
				receiveCouponList.push({
					couponId: couponId,
					couponName: couponName,
					couponSource: couponSource,
					quantity: quantity
				})
			}

			var xjhdstr = {
				id:id,
				activityName: activityName,
				activityStartDate: activityStartDate,
				activityEndDate: activityEndDate,
				onlyNewPeople: onlyNewPeople,
				pageBackgroundUrl: pageBackgroundUrl,
				sharePosterButtonUrl: sharePosterButtonUrl,
				shareBuddyLinksUrl: shareBuddyLinksUrl,
				receiveBackgroundUrl: receiveBackgroundUrl,
				receiveButtonUrl: receiveButtonUrl,
				shareTitle: shareTitle,
				shareDescription: shareDescription,
				receiveCouponList: receiveCouponList,
				fontColor: 123,
				maxReceiveNumber: maxReceiveNumber,
				everyReceive: everyReceive
			}

			$.ajax({
				type: 'POST',
				contentType: "application/json;charset=UTF-8",
				url: "rest/evaluateActivity/updateEvaluateActivities",
				data: JSON.stringify(xjhdstr),
				success: function (result) {
					console.log(result)
					if (result.message !== '修改成功!') {
						alert(result.message)
						return;
					} else if (result.message == '修改成功!') {
						alert(result.message)
						$('.xzhd-body').hide()
						$('.yqyl-body').show()
						shouye()
					}
				},
				error: function (e) {
					console.log(e.status);
					console.log(e.responseText)
				}
			})

			console.log(xjhdstr)

		}
		//首页接口
		function shouye() {

			var onPagechange = function (page) {
				aaaaaa(page)
			}

			var page = 1
			aaaaaa(page)

			function aaaaaa(page) {

				var name = $('#yqyl-header-hdmc').val()
				var status = $('#zengjuanyuany').val()
				var startDate = $('#yqyl-header-hdsjs').val()
				var endDate = $('#yqyl-header-hdsje').val()

				var param = {
					pacId: 3,
					name: name,
					status: status,
					startDate: startDate,
					endDate: endDate
				}

				var str = {
					param: param,
					page: page,
					rows: 10
				}

				function timegeshi(i) {
					var strstr = ''
					strstr = i.split(' ')[0]
					return strstr = i.split(' ')[0].split('-')[0] + '.' + i.split(' ')[0].split('-')[1] + '.' + i.split(' ')[0].split('-')[2]
				}

				function xhbs(q) {
					var str1 = ''
					return str1 = q + (str.page - 1) * 15
				}

				$.ajax({
					type: 'POST',
					contentType: "application/json;charset=UTF-8",
					url: "rest/evaluateActivity/selectEvaluateActivityList",
					data: JSON.stringify(str),
					success: function (result) {
						console.log(result)
						var str = ''
						$.each(result.rows, function (i, item) {
							if (item.state == 0) {
								str += `
							<tr>
								<td class="item1"><span>`+ xhbs(i + 1) + `</span></td>
								<td class="item2"><span>`+ item.activityName + `</span></td>
								<td class="item2"><span>`+ timegeshi(item.activityStartDate) + '-' + timegeshi(item.activityEndDate) + `</span></td>
								<td class="item3"><span>`+ item.evaluationNum +`</span></td>
								<td class="item3"><span>`+ item.evaluationTimes +`</span></td>
								<td class="item3"><span>`+ item.shareCustomerNum +`</span></td>
								<td class="item3"><span>`+ item.shareCustomerTimes +`</span></td>
								<td class="item3"><span>`+ item.receiveCount +`</span></td>
								<td class="item3"><span>`+ item.receiveTimes +`</span></td>
								<td class="item3"><span>`+ item.useCount +`</span></td>
								<td class="item3">未开始</td>
								<td class="`+ item.id + `">
									<p class="shuju">数据</p>
									<p>|</p>
									<p class="chakan">编辑</p>
									<p>|</p>
									<p class="youxiao">开启</p>
									<div
										style="position:absolute;top:0;left:-275px;width:370px;height:110px;background:white;z-index: 999;padding:20px 20px 0 23px;box-sizing: border-box;display:none">
										<div style="display:flex;justify-content: center;padding-bottom:10px">
											<div style="line-height: 36px;">是否立即开始活动？</div>
											<div class="yqyl-body-queding"
											>
												确定</div>
											<div class="yqyl-body-quxiao"
											>
												取消</div>
										</div>
										<div style="height:1px;background:#BFBFBF;"></div>
									</div>
								</td>
							</tr>
							`
							} else if (item.state == 1) {
								str += `
							<tr>
								<td class="item1"><span>`+ xhbs(i + 1) + `</span></td>
								<td class="item2"><span>`+ item.activityName + `</span></td>
								<td class="item2"><span>`+ timegeshi(item.activityStartDate) + '-' + timegeshi(item.activityEndDate) + `</span></td>
								<td class="item3"><span>`+ item.evaluationNum + `</span></td>
								<td class="item3"><span>`+ item.evaluationTimes + `</span></td>
								<td class="item3"><span>`+ item.shareCustomerNum + `</span></td>
								<td class="item3"><span>`+ item.shareCustomerTimes + `</span></td>
								<td class="item3"><span>`+ item.receiveCount + `</span></td>
								<td class="item3"><span>`+ item.receiveTimes + `</span></td>
								<td class="item3"><span>`+ item.useCount +`</span></td>
								<td class="item3" style="color:#ff0000">进行中</td>
								<td class="`+ item.id + `">
									<p class="shuju">数据</p>
									<p>|</p>
									<p class="chakan">查看</p>
									<p>|</p>
									<p class="youxiao">失效</p>
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
							`
							} else {
								str += `
							<tr>
								<td class="item1"><span>`+ xhbs(i + 1) + `</span></td>
								<td class="item2"><span>`+ item.activityName + `</span></td>
								<td class="item2"><span>`+ timegeshi(item.activityStartDate) + '-' + timegeshi(item.activityEndDate) + `</span></td>
								<td class="item3"><span>`+ item.evaluationNum + `</span></td>
								<td class="item3"><span>`+ item.evaluationTimes + `</span></td>
								<td class="item3"><span>`+ item.shareCustomerNum + `</span></td>
								<td class="item3"><span>`+ item.shareCustomerTimes + `</span></td>
								<td class="item3"><span>`+ item.receiveCount + `</span></td>
								<td class="item3"><span>`+ item.receiveTimes + `</span></td>
								<td class="item3"><span>`+ item.useCount +`</span></td>
								<td class="item3">已结束</td>
								<td class="`+ item.id + `">
									<p class="shuju">数据</p>
									<p>|</p>
									<p class="chakan">查看</p>
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
							`
							}
						})
						$('.table-body').html(str)

						$('.table-body').children().mouseover(function () {
							$(this).children().css('background', '#faa262')
							$(this).children().children('span').css('color', 'white')
						})

						$('.table-body').children().mouseout(function () {
							$(this).children().css('background', '#ffffff')
							$(this).children().children('span').css('color', '#444444')
						})

						//显示数据页面按钮
						$('.shuju').click(function () {
							$('.yqyl-body').hide()
							$('.sj-body').show()
							var id = $(this).parent().attr('class')
							var hdmcstrstr =  $(this).parent().parent().children().eq(1).html()
							youhuiqtj(id,hdmcstrstr)
							youhuiqxl(id)
							youhuiqtable11(id)
							$('#sj-body-chaxun').click(function(){
								youhuiqtable11(id)
							})
							$('#sj-body-qingchu').click(function(){
								$('#sj-body-slelctyhjmc').find('option[value=""]').prop("selected", true)
								$('#sj-body-lqsjs').val('')
								$('#sj-body-lqsje').val('')
								$('#sj-body-zt').find('option[value=""]').prop("selected", true)
								$('#sj-body-ly').find('option[value=""]').prop("selected", true)
								youhuiqtable11(id)
							})
							$('#sj-body-dcsj').click(function(){
								shujuymdc(id)
							})
						})

						//查看编辑页面按钮
						$('.chakan').click(function(){
							$('.yqyl-body').hide()
							$('.xzhd-body').show()
							var id=$(this).parent().attr('class')
							var dianjimc = $(this).html()
							//console.log(id)
							chakanchakan(id,dianjimc)
						})

						//首页有效按钮显示
						$('.youxiao').click(function () {
							$(this).parent().children('div').show()
						})

						//首页结束活动界面隐藏
						$('.yqyl-body-quxiao').click(function () {
							$(this).parent().parent().hide()
						})

						//首页活动确定按钮
						$('.yqyl-body-queding').click(function(){
							var id = $(this).parent().parent().parent().attr('class')
							if($(this).parent().parent().parent().parent().children().eq(10).html() == '未开始'){
								var status = 1
								jieshuhdjkan(id,status)
							}else if($(this).parent().parent().parent().parent().children().eq(10).html() == '进行中'){
								var status = 2
								jieshuhdjkan(id,status)
							}

						})

						var obj = {
							wrapid: 'boxpage', //页面显示分页器容器id
							total: result.total, //总条数
							pagesize: 15, //每页显示10条
							currentPage: page, //当前页
							onPagechange: onPagechange
							//btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
						}
						pagination.init(obj);
						var sjjlstr = `共`+ result.total +`条，每页15条`
						$('#yqyl-body-sjjl').html(sjjlstr)
					},
					error: function (e) {
						console.log(e.status);
						console.log(e.responseText)
					}
				})

			}

		}
		//有赞接口
		function youzanjk() {
			$.ajax({
				type: 'GET',
				//contentType: "application/json;charset=UTF-8",
				dataType:'json',
				url: "rest/evaluateActivity/getCouponList",
				success: function (result) {
					console.log(result)
					var str1 = ''
					var str11 = ''
					var str2 = ''
					var str22 = ''
					$.each(result.rows[0].crmCouponList,function(i,item){
					str1 +=
					`<tr class="`+ item.couponId +`">
						<td style="width:10%">
							<div class="xzhd-body-gouxuan">
								<img src="image/codeallset_btn.png" alt="">
							</div>
						</td>
						<td style="width:10%;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;">`+ (item.internalName ? item.internalName : item.packageName) +`</td>
						<td style="width:10%">
							<div style="display:flex;justify-content: center;">
								<img class="minus_minus" src="image/minus_minus.png" alt="">
								<p class="xzhd-body-kqsl">1</p>
								<img class="add_add" src="image/add_add.png" alt="">
							</div>
						</td>
						<td style="width:10%">`+ item.stockQuantity +`</td>
					</tr>`
					})
					$.each(result.rows[0].yzCouponList, function (i, item) {
						str2 +=
							`<tr class="`+ item.id +`">
						<td style="width:10%">
							<div class="xzhd-body-gouxuan">
								<img src="image/codeallset_btn.png" alt="">
							</div>
						</td>
						<td style="width:10%;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;">`+ item.title + `</td>
						<td style="width:10%">
							<div style="display:flex;justify-content: center;">
								<img class="minus_minus" src="image/minus_minus.png" alt="">
								<p class="xzhd-body-kqsl">1</p>
								<img class="add_add" src="image/add_add.png" alt="">
							</div>
						</td>
						<td style="width:10%">`+ item.stockQty + `</td>
					</tr>`
					})
					$('.xzhd-body-tbody1').html(str1)
					$('.xzhd-body-tbody2').html(str2)
					//活动页面分享获得卡券勾选
					$('.xzhd-body-gouxuan').click(function () {
						if ($(this).children().is(':hidden')) {
							$(this).children().show()
							$(this).addClass('gx')
							gouxuan()
						} else {
							$(this).children().hide()
							$(this).removeClass('gx')
							var str2 = $(this).parent().parent().attr('class')
							// for (var i = 0; i < $('.xzhd-body-henggang').length; i++) {
							// 	if ($('.xzhd-body-henggang').eq(i).children().is(":visible")) {
							// 		var str1 = $('.xzhd-body-henggang').eq(i).parent().children('p').html()
							// 	}
							// }

							for (var j = 0; j < $('#xzhd-body-fxhd').children().length; j++) {
								if (str2 == $('#xzhd-body-fxhd').children().eq(j).attr('class')) {
									$('#xzhd-body-fxhd').children().eq(j).remove()
								}
							}
						}
					})
					
					//新建页面添加卡券数量
					$('.add_add').click(function () {
						var strcount = $(this).parent().children('.xzhd-body-kqsl').html()
						strcount++
						var str55 = $(this).parent().parent().parent().children().eq(3).html()
						if (strcount >= str55) {
							strcount = str55
						}
						$(this).parent().children('.xzhd-body-kqsl').html(strcount)

						// for (var i = 0; i < $('.xzhd-body-henggang').length; i++) {
						// 	if ($('.xzhd-body-henggang').eq(i).children().is(":visible")) {
						// 		var str1 = $('.xzhd-body-henggang').eq(i).parent().children('p').html()
						// 	}
						// }

						// for (var i = 0; i < $('.xzhd-body-henggang1').length; i++) {
						// 	if ($('.xzhd-body-henggang1').eq(i).children().is(":visible")) {
						// 		var str1 = $('.xzhd-body-henggang1').eq(i).parent().children('p').html()
						// 	}
						// }

						var str2 = $(this).parent().parent().parent().attr('class')
						for (var j = 0; j < $(this).parent().parent().parent().parent().parent().parent().parent().parent().children().eq(1).children().eq(0).children().length; j++) {
							if (str2 == $(this).parent().parent().parent().parent().parent().parent().parent().parent().children().eq(1).children().eq(0).children().eq(j).attr('class')) {
								var str3 = $(this).parent().parent().parent().parent().parent().parent().parent().parent().children().eq(1).children().eq(0).children().eq(j).children('p').html().split('×')[0]
								var str5 = $(this).parent().children('p').html()

								var str6 = str3 + '×' + str5
								$(this).parent().parent().parent().parent().parent().parent().parent().parent().children().eq(1).children().eq(0).children().eq(j).children('p').html(str6)
							}
						}

					})
					//新建页面减少卡券数量
					$('.minus_minus').click(function () {
						var strcount = $(this).parent().children('.xzhd-body-kqsl').html()
						strcount--
						if (strcount <= 1) {
							strcount = 1
						}
						$(this).parent().children('.xzhd-body-kqsl').html(strcount)

						// for (var i = 0; i < $('.xzhd-body-henggang').length; i++) {
						// 	if ($('.xzhd-body-henggang').eq(i).children().is(":visible")) {
						// 		var str1 = $('.xzhd-body-henggang').eq(i).parent().children('p').html()
						// 	}
						// }

						var str2 = $(this).parent().parent().parent().attr('class')
						for (var j = 0; j < $(this).parent().parent().parent().parent().parent().parent().parent().parent().children().eq(1).children().eq(0).children().length; j++) {
							if (str2 == $(this).parent().parent().parent().parent().parent().parent().parent().parent().children().eq(1).children().eq(0).children().eq(j).attr('class')) {
								var str3 = $(this).parent().parent().parent().parent().parent().parent().parent().parent().children().eq(1).children().eq(0).children().eq(j).children('p').html().split('×')[0]
								var str5 = $(this).parent().children('p').html()
								var str6 = str3 + '×' + str5
								$(this).parent().parent().parent().parent().parent().parent().parent().parent().children().eq(1).children().eq(0).children().eq(j).children('p').html(str6)
							}
						}
					})
				},
				error: function (e) {
					console.log(e.status);
					console.log(e.responseText)
				}
			})

		}
		//数据页面优惠券统计
		function youhuiqtj(id, hdmcstrstr) {
			var str123 = '活动名称:' + hdmcstrstr
			$('#sj-body-hdmc').html(str123)
			var str = {
				id: id
			}

			$.ajax({
				type: 'GET',
				dataType:'json',
				//contentType: "application/json;charset=UTF-8",
				url: "rest/evaluateActivity/selectActivityCouponStatistics/"+id,
				success: function (result) {
					console.log(result)
					var str11 = ''
					$.each(result.rows,function(i,item){
						str11 += `
						<div class="sj-body-flex111" style="width:500px;margin-top:22px;box-sizing:border-box;">
							<p style="font-size:16px;color:#444444;font-weight: bold;">`+ item.couponName +`</p>
							<div style="display:flex;height:90px;background:#F5F5F5;margin-top:10px;justify-content: space-around;align-items: center;">
								<div style="text-align: center;">
									<p style="font-size:14px">已领取</p>
									<p style="font-size:14px;margin-top:18px">`+ item.totalCount +`</p>
								</div>
								<div style="text-align: center;">
									<p style="font-size:14px">已使用</p>
									<p style="font-size:14px;margin-top:18px">`+ item.count +`</p>
								</div>
							</div>
						</div>
						`
					})
					$('.sj-body-flex1').html(str11)
				},
				error: function (e) {
					console.log(e.status);
					console.log(e.responseText)
				}
			})

		}
		//数据页面下拉优惠券
		function youhuiqxl(id) {
			var activityId = id

			$.ajax({
				type: 'GET',
				dataType:'json',
				//contentType: "application/json;charset=UTF-8",
				url: "rest/evaluateActivity/getCouponDropdownList/"+ activityId,
				success: function (result) {
					console.log(result)
					var youhuiqxlstr = `<option value="" selected="selected"></option>`
					$.each(result.rows,function(i,item){
						if(item.couponName.length>7){
							var couponNamestr = item.couponName.substring(0,7)+'...'
						}else{
							var couponNamestr = item.couponName
						}
						//console.log(couponNamestr)
						youhuiqxlstr +=`
							<option value="`+ item.couponId +`">`+ couponNamestr +`</option>
						`
					})
					$('#sj-body-slelctyhjmc').html(youhuiqxlstr)
				},
				error: function (e) {
					console.log(e.status);
					console.log(e.responseText)
				}
			})

		}
		//数据页面表格
		function youhuiqtable11(id) {

			var onPagechange = function (page) {
				youhuiqtable(page)
			}

			var page = 1
			youhuiqtable(page)

			function youhuiqtable(page) {
				var str = {
					activityId: id,
					page: page,
					rows: 10,
					couponId: $('#sj-body-slelctyhjmc').val(),
					startDate: $('#sj-body-lqsjs').val(),
					endDate: $('#sj-body-lqsje').val(),
					status: $('#sj-body-zt').val(),
					couponSource: $('#sj-body-ly').val()
				}

				$.ajax({
					type: 'POST',
					contentType: "application/json;charset=UTF-8",
					url: "rest/evaluateActivity/selectActivityCouponList",
					data: JSON.stringify(str),
					success: function (result) {
						console.log(result)
						function xinlaoke(i){
							var str = ''
							if(i==1){
								return str = '老客'
							}else if(i==2){
								return str = '新客'
							}
						}
						function zhuangtai(i){
							var str = ''
							if(i==0){
								return str = '未核销'
							}else if(i==1){
								return str = '已核销'
							}else if(i==2){
							    return str = '已赠送'
							}else if(i==3){
								return str = '撤回'
							}else if(i==4){
								return str = '已过期'
							}
						}
						function laiyuan(i){
							var str = ''
							if(i==1){
								return str = 'crm'
							}else if(i==2){
								return str = '有赞'
							}
						}
						function tygs(i){
							var str = ''	
							if(!i){
								return str = ''
							}else{
								return str = i
							}
						}
						var str123456 = ''
						$.each(result.rows,function(i,item){
							str123456 += `
							<tr>
								<td class="item1">`+ (i+1) +`</td>
								<td class="item22">`+ tygs(item.customerName) +`</td>
								<td class="item22">`+ tygs(item.mobile) +`</td>
								<td class="item33">`+ tygs(item.couponName) +`</td>
								<td class="item22">`+ tygs(item.shareDate) +`</td>
								<td class="item22">`+ tygs(item.receiveDate) +`</td>
								<td class="item22">`+ tygs(item.verifyDate) +`</td>
								<td class="item22">`+ xinlaoke(item.customerNature) +`</td>
								<td class="item44">`+ zhuangtai(item.status) +`</td>
								<td class="item44">`+ laiyuan(item.couponSource) +`</td>
							</tr>
							`
						})

						$('#sj-body-body1').html(str123456)

						var obj = {
							wrapid: 'boxpage1', //页面显示分页器容器id
							total: result.total, //总条数
							pagesize: 10, //每页显示10条
							currentPage: page, //当前页
							onPagechange: onPagechange
							//btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
						}
						pagination.init(obj);
						var jujlstr = `共`+ result.total +`条，每页10条`
						$('#sj-body-flex-jujl').html(jujlstr)
					},
					error: function (e) {
						console.log(e.status);
						console.log(e.responseText)
					}
				})

			}
		}
		//数据页面导出
		function shujuymdc(id) {

			var couponId = $('#sj-body-slelctyhjmc').val()
			var startDate = $('#sj-body-lqsjs').val()
			var endDate = $('#sj-body-lqsje').val()
			var status = $('#sj-body-zt').val()
			var couponSource = $('#sj-body-ly').val()

			location.href = "rest/evaluateActivity/exportActivityCoupon?activityId=" + id + '&couponId=' + couponId + '&startDate=' + startDate + '&endDate=' + endDate + '&status=' + status + '&couponSource=' + couponSource
		}
		//查看页面
		function chakanchakan(id, dianjimc) {
			// var str = {
			// 	id: id
			// }
			var activityId = id
			$.ajax({
				type: 'GET',
				//contentType: "application/json;charset=UTF-8",
				dataType:'json',
				url: "rest/evaluateActivity/getActivitiesInfoById/"+ activityId,
				success: function (result) {
					console.log(dianjimc)
					console.log(result)
					if(dianjimc == '查看'){
						$('#xzhd-body-hdmc').css('pointer-events','none')
						$('#xzhd-body-hdsjs').css('pointer-events', 'none')
						$('#xzhd-body-hdsje').css('pointer-events', 'none')
						$('#xzhd-body-fxhd').css('pointer-events', 'none')
						$('#xzhd-body-lqrhd').css('pointer-events', 'none')
						$('.xzhd-body-zstjraduis').css('pointer-events', 'none')
						$('#xzhd-body-fxwzbt').css('pointer-events', 'none')
						$('#xzhd-body-fxhdxs').css('pointer-events', 'none')
						$('#xzhd-body-hdbjpz-upload').css('pointer-events', 'none')
						$('#xzhd-body-fxanpz-upload').css('pointer-events', 'none')
						$('#xzhd-body-fxhyljt-upload').css('pointer-events', 'none')
						$('#xzhd-body-lqhdbjpz-upload').css('pointer-events', 'none')
						$('#xzhd-body-lqanpz-upload').css('pointer-events', 'none')
						$('#xzhd-body-save').css('pointer-events', 'none')
					}
					//console.log(result)
					for(var j=0;j<$('.xzhd-body-gouxuan').length;j++){
						$('.xzhd-body-gouxuan').eq(j).removeClass('gx')
						$('.xzhd-body-gouxuan').eq(j).children().hide()
					}
					for (var jj = 0; jj < $('.xzhd-body-gouxuan1').length; jj++) {
						$('.xzhd-body-gouxuan1').eq(jj).removeClass('gxx')
						$('.xzhd-body-gouxuan1').eq(jj).children().hide()
					}
					var str = ''
					//分享有礼内容渲染
					for(var i=0;i< result.rows[0].receiveCouponList.length;i++){
						if(result.rows[0].receiveCouponList[i].couponSource == 1){
							var str1 = 'CRM优惠券'
						}else if(result.rows[0].receiveCouponList[i].couponSource == 2){
							var str1 = '有赞优惠券'
						}
						var str22 = result.rows[0].receiveCouponList[i].couponName
						// if (str22.length > 5) {
						// 	var str2 = str22.substring(0, 4) + '...'
						// }else{
						// 	var str2 = str22
						// }
						var str3 = result.rows[0].receiveCouponList[i].quantity
						str += `<div style="display:flex;align-items:center;justify-content:space-between;font-size:16px" id="` +  str22 + `" class="` + result.rows[0].receiveCouponList[i].couponId + `">
							<p>` + str1 + '/' + str22 + '×' + str3 + `</p>
							<img class="xzhd-body-chacha" src="image/classdel_btn.png">
						</div>`
					}
					//领取有礼内容渲染
					
					$('#xzhd-body-fxhd').html(str)
					chacha()
					//console.log($('#xzhd-body-fxhd').html())
					//分享获得点击渲染
					for (var z = 0; z < $('.xzhd-body-gouxuan').length; z++) {
						if($('.xzhd-body-gouxuan').eq(z).parent().parent().parent().attr('class') == 'xzhd-body-tbody1'){
							var kaquanfl = 'CRM优惠券'
							for(var x=0;x<$('#xzhd-body-fxhd').children().length;x++){
								if($('#xzhd-body-fxhd').children().eq(x).attr('id') == $('.xzhd-body-gouxuan').eq(z).parent().parent().children().eq(1).html()){
									$('.xzhd-body-gouxuan').eq(z).addClass('gx')
									$('.xzhd-body-gouxuan').eq(z).children().show()
									//console.log(z)
									var str666 = $('#xzhd-body-fxhd').children().eq(x).children('p').html().split('×')[1]
									$('.xzhd-body-gouxuan').eq(z).parent().parent().children().eq(2).children().children().eq(1).html(str666)
								}
							}
						}else if($('.xzhd-body-gouxuan').eq(z).parent().parent().parent().attr('class') == 'xzhd-body-tbody2'){
							var kaquanfl = '有赞优惠券'
							for (var y = 0; y < $('#xzhd-body-fxhd').children().length; y++) {
								if ($('#xzhd-body-fxhd').children().eq(y).attr('id') == $('.xzhd-body-gouxuan').eq(z).parent().parent().children().eq(1).html()) {
									$('.xzhd-body-gouxuan').eq(z).addClass('gx')
									$('.xzhd-body-gouxuan').eq(z).children().show()
									//console.log(z)
									var str666 = $('#xzhd-body-fxhd').children().eq(y).children('p').html().split('×')[1]
									$('.xzhd-body-gouxuan').eq(z).parent().parent().children().eq(2).children().children().eq(1).html(str666)
								}
							}
						}
					}
					$('#xzhd-body-hdmc').val(result.rows[0].activityName)
					$('#xzhd-body-hdsjs').val(result.rows[0].activityStartDate.split(' ')[0])
					$('#xzhd-body-hdsje').val(result.rows[0].activityEndDate.split(' ')[0])
					if(result.rows[0].onlyNewPeople ==1 ){
						$('.xzhd-body-zstjraduis').eq(0).click()
					}else if(result.rows[0].onlyNewPeople == 2 ){
						$('.xzhd-body-zstjraduis').eq(1).click()
					}
					$('#xzhd-body-hdbjpz-img').attr('class', result.rows[0].pageBackgroundUrl)
					$('#xzhd-body-hdbjpz-img').children().attr('src',result.rows[0].pageBackgroundUrl)
					$('#xzhd-body-fxanpz-img').attr('class',result.rows[0].sharePosterButtonUrl)
					$('#xzhd-body-fxanpz-img').children().attr('src', result.rows[0].sharePosterButtonUrl)
					$('#xzhd-body-fxhyljt-img').attr('class',result.rows[0].shareBuddyLinksUrl)
					$('#xzhd-body-fxhyljt-img').children().attr('src', result.rows[0].shareBuddyLinksUrl)
					$('#xzhd-body-lqhdbjpz-img').attr('class',result.rows[0].receiveBackgroundUrl)
					$('#xzhd-body-lqhdbjpz-img').children().attr('src', result.rows[0].receiveBackgroundUrl)
					$('#xzhd-body-lqanpz-img').attr('class', result.rows[0].receiveButtonUrl)
					$('#xzhd-body-lqanpz-img').children().attr('src', result.rows[0].receiveButtonUrl)
					$('#xzhd-body-fxwzbt').val(result.rows[0].shareTitle)
					$('#xzhd-body-fxhdxs').val(result.rows[0].shareDescription)
					$('#xzhd-body-zdlqrs').val(result.rows[0].maxReceiveNumber)
					$('#xzhd-body-hblqsl').val(result.rows[0].everyReceive)
					var id = result.rows[0].id
					$('#xzhd-body-save').unbind()
					$('#xzhd-body-save').click(function(){
						bjhdjk(id)
					})

				},
				error: function (e) {
					console.log(e.status);
					console.log(e.responseText)
				}
			})

		}
		//开始或结束活动接口按钮
		function jieshuhdjkan(id, status) {
			var str = {
				id: id,
				status: status
			}
			$.ajax({
				type: 'POST',
				contentType: "application/json;charset=UTF-8",
				url: "rest/evaluateActivity/updateEvaluateActivitiesState",
				data: JSON.stringify(str),
				success: function (result) {
					console.log(result)
					alert(result.message)
					shouye()
				},
				error: function (e) {
					console.log(e.status);
					console.log(e.responseText)
				}
			})
		}
		//活动界面分享获得点击叉号删除
		function chacha() {
			$('.xzhd-body-chacha').click(function () {
				
				if ($('#xzhd-body-fxhd-zhankai').is(':hidden')) {
					return;
				}

				if ($(this).parent().children('p').html().split('/')[0] == 'CRM优惠券') {
					$('.xzhd-body-henggang').eq(0).click()
				} else if ($(this).parent().children('p').html().split('/')[0] == '有赞优惠券') {
					$('.xzhd-body-henggang').eq(1).click()
				}

				$(this).parent().remove()
				var str = $(this).parent().attr('class')
				// for (var i = 0; i < $('.xzhd-body-henggang').length; i++) {
				// 	if ($('.xzhd-body-henggang').eq(i).children().is(":visible")) {
				// 		var str1 = $('.xzhd-body-henggang').eq(i).parent().children('p').html()
				// 	}
				// }
				//console.log(str)
				var strcount = $('.xzhd-body-tbody1').children().length - 1
				for (var j = 0; j < $('.xzhd-body-gouxuan').length; j++) {
					var str2 = $('.xzhd-body-gouxuan').eq(j).parent().parent().attr('class')
					//console.log(str1+str2)
					if (str == str2) {
						//$('.xzhd-body-gouxuan').eq(j).click()
						for (var p = 0; p < $('.xzhd-body-henggang').length; p++) {
							if ($('.xzhd-body-henggang').eq(p).children().is(':visible')) {
								if (p == 0) {
									if (j <= strcount) {
										$('.xzhd-body-gouxuan').eq(j).click()
									}
								} else if (p == 1) {
									if (j > strcount) {
										$('.xzhd-body-gouxuan').eq(j).click()
									}
								}
							}
						}

					}
				}
			})
		}
		
		//活动界面分享获得卡券面额勾选
		function gouxuan() {
			for (var k = 0; k < $('#xzhd-body-fxhd').children().length; k++) {
				if ($('#xzhd-body-fxhd').children().eq(k).html() == '请选择要分享的优惠券') {
					$('#xzhd-body-fxhd').children().eq(k).remove()
				}
			}

			var str = ''
			var str1 = ''
			var str2 = ''
			// for(var i=0;i<$('.xzhd-body-henggang').length;i++){
			// 	if($('.xzhd-body-henggang').eq(i).children().is(":visible")){
			// 		str1 = $('.xzhd-body-henggang').eq(i).parent().children('p').html()
			// 	}
			// }
			var strcount = $('.xzhd-body-tbody1').children().length - 1
			for (var j = 0; j < $('.xzhd-body-gouxuan').length; j++) {
				if ($('.xzhd-body-gouxuan').eq(j).hasClass('gx')) {
					//str += ($('#xzhd-body-fxhd').html())
					if (j <= strcount) {
						str1 = $('.xzhd-body-henggang').eq(0).parent().children('p').html()
					} else if (j > strcount) {
						str1 = $('.xzhd-body-henggang').eq(1).parent().children('p').html()
					}
					//console.log(j)
					var str3 = $('.xzhd-body-gouxuan').eq(j).parent().parent().children().eq(2).children().children('.xzhd-body-kqsl').html()
					str2 = $('.xzhd-body-gouxuan').eq(j).parent().parent().children().eq(1).html()
					// if (str2.length > 5) {
					// 	str2 = str2.substring(0, 4) + '...'
					// }
					str += `<div style="display:flex;align-items:center;justify-content:space-between;font-size:16px" id="` + $('.xzhd-body-gouxuan').eq(j).parent().parent().children().eq(1).html() + `" class="` + $('.xzhd-body-gouxuan').eq(j).parent().parent().attr('class') + `"><p>` + str1 + '/' + str2 + '×' + str3 + `</p><img class="xzhd-body-chacha" src="image/classdel_btn.png"></div>`
				}
			}
			$('#xzhd-body-fxhd').html(str)
			$('.xzhd-body-chacha').unbind()
			chacha()
		}
		
		//新建活动界面人数翻页
		$('.xzhd-body-zdlqrs-upfold').click(function () {
			var rsstr = $(this).parent().parent().children('input').val()
			rsstr++
			$(this).parent().parent().children('input').val(rsstr)
		})
		$('.xzhd-body-zdlqrs-downfold').click(function () {
			var rsstr = $(this).parent().parent().children('input').val()
			rsstr--
			if (rsstr <= 0) {
				rsstr = 0
			}
			$(this).parent().parent().children('input').val(rsstr)
		})
	</script>
	
	</html>