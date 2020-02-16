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

		#xjhd-start {
			width: 120px;
			height: 40px;
			background: #71B2EF;
			border-radius: 4px;
			color: white;
			font-size: 20px;
			text-align: center;
			line-height: 40px;
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
			margin-right: 40px;
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
			border: 1px solid #c8cacc
		}

		.table-header th {
			font-size: 14px;
			color: #444444;
			height: 40px;
		}

		.table-body tr th {
			font-size: 14px;
			color: #444444;
			height: 40px;
			text-align: center;
			border-left: 1px dotted #CCCCCC;
			border-bottom: 1px dotted #CCCCCC
		}

		.table-body tr th:last-child {
			flex: 1;
			border-right: 1px dotted #CCCCCC;
			display: flex;
			justify-content: center;
			position: relative
		}

		.table-body tr th:last-child p {
			line-height: 40px;
			color: #71B2EF
		}

		#fhsyj {
			font-size: 16px;
			color: #71B2EF
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
		}

		#xzhd-body-hdsjs {
			width: 175px;
			height: 32px;
			border: none;
			color: #BFBFBF;
		}

		#xzhd-body-hdsje {
			width: 175px;
			height: 32px;
			border: none;
			color: #BFBFBF;
		}

		#xzhd-body-fxhd {
			width: 300px;
			height: 32px;
			border: none;
			color: #BFBFBF;
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

		#xzhd-body-lqrhd {
			width: 300px;
			height: 32px;
			border: none;
			color: #BFBFBF;
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
			margin-left:15px
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
			margin-left:15px
		}
		#xzhd-body-fxwzbt{
			width:680px;
			height:32px;
			border: none;
			color: #BFBFBF;
		}
		#xzhd-body-fxhdxs{
			width:680px;
			height:160px;
			resize: none;
			border: none;
			color: #BFBFBF;
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
		}
		#xzhd-body-quxiao{
			width:110px;
			height:40px;
			text-align: center;
			line-height: 40px;
			border-radius: 4px;
			border:1px solid #BFBFBF;
			font-size: 16px;
			margin-left:15px
		}
	</style>
</head>

<body>
	<div class="yqyl-body" style="display:none">
		<div style="width:100%">
			<p id="xjhd-start">新建活动</p>
		</div>
		<div style="width:100%;display:flex;align-items:center;margin:20px 0">
			<p class="yqyl-header-p">活动名称</p>
			<div class="yqyl-header-input">
				<input id="yqyl-header-hdmc" type="text">
			</div>
			<p class="yqyl-header-p">活动状态</p>
			<span class="select_wrap">
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
					<th class="item1">1</th>
					<th class="item2">情人双人健身月卡</th>
					<th class="item2">2020.02.11-2020.02.28</th>
					<th class="item3">514</th>
					<th class="item3">245</th>
					<th class="item3">200</th>
					<th class="item4">活动中</th>
					<th>
						<p>数据</p>
						<p>|</p>
						<p>查看</p>
						<p>|</p>
						<p class="youxiao">有效</p>
						<div
							style="position:absolute;top:0;left:-275px;width:370px;height:110px;background:white;z-index: 999;padding:20px 20px 0 23px;box-sizing: border-box;display:none">
							<div style="display:flex;justify-content: center;padding-bottom:10px">
								<div style="line-height: 36px;">是否立即结束活动？</div>
								<div
									style="width:70px;height:36px;font-size:16px;text-align:center;line-height:36px;background:#71B2EF;color:white;border-radius:4px;margin-left:26px;">
									确定</div>
								<div class="quxiao"
									style="width:70px;height:36px;font-size:16px;text-align:center;line-height:36px;border:1px solid #d8d8d9;border-radius:4px;box-sizing:border-box;margin-left:15px">
									取消</div>
							</div>
							<div style="height:1px;background:#BFBFBF;"></div>
							<div style="font-size: 14px;color:#FF0000;margin-top:10px">结束后活动停止，已领取的优惠券还能继续使用！</div>
						</div>
					</th>
				</tr>
				<tr>
					<th class="item1">1</th>
					<th class="item2">情人双人健身月卡</th>
					<th class="item2">2020.02.11-2020.02.28</th>
					<th class="item3">514</th>
					<th class="item3">245</th>
					<th class="item3">200</th>
					<th class="item4">活动中</th>
					<th>
						<p>数据</p>
						<p>|</p>
						<p>查看</p>
						<p>|</p>
						<p class="youxiao">有效</p>
						<div
							style="position:absolute;top:0;left:-275px;width:370px;height:110px;background:white;z-index: 999;padding:20px 20px 0 23px;box-sizing: border-box;display:none">
							<div style="display:flex;justify-content: center;padding-bottom:10px">
								<div style="line-height: 36px;">是否立即结束活动？</div>
								<div
									style="width:70px;height:36px;font-size:16px;text-align:center;line-height:36px;background:#71B2EF;color:white;border-radius:4px;margin-left:26px;">
									确定</div>
								<div class="quxiao"
									style="width:70px;height:36px;font-size:16px;text-align:center;line-height:36px;border:1px solid #d8d8d9;border-radius:4px;box-sizing:border-box;margin-left:15px">
									取消</div>
							</div>
							<div style="height:1px;background:#BFBFBF;"></div>
							<div style="font-size: 14px;color:#FF0000;margin-top:10px">结束后活动停止，已领取的优惠券还能继续使用！</div>
						</div>
					</th>
				</tr>
				<tr>
					<th class="item1">1</th>
					<th class="item2">情人双人健身月卡</th>
					<th class="item2">2020.02.11-2020.02.28</th>
					<th class="item3">514</th>
					<th class="item3">245</th>
					<th class="item3">200</th>
					<th class="item4">活动中</th>
					<th>
						<p>数据</p>
						<p>|</p>
						<p>查看</p>
						<p>|</p>
						<p class="youxiao">有效</p>
						<div
							style="position:absolute;top:0;left:-275px;width:370px;height:110px;background:white;z-index: 999;padding:20px 20px 0 23px;box-sizing: border-box;display:none">
							<div style="display:flex;justify-content: center;padding-bottom:10px">
								<div style="line-height: 36px;">是否立即结束活动？</div>
								<div
									style="width:70px;height:36px;font-size:16px;text-align:center;line-height:36px;background:#71B2EF;color:white;border-radius:4px;margin-left:26px;">
									确定</div>
								<div class="quxiao"
									style="width:70px;height:36px;font-size:16px;text-align:center;line-height:36px;border:1px solid #d8d8d9;border-radius:4px;box-sizing:border-box;margin-left:15px">
									取消</div>
							</div>
							<div style="height:1px;background:#BFBFBF;"></div>
							<div style="font-size: 14px;color:#FF0000;margin-top:10px">结束后活动停止，已领取的优惠券还能继续使用！</div>
						</div>
					</th>
				</tr>
			</tbody>
		</table>
		<div style="width:100%;margin-top:22px">
			<p style="font-size:16px">共20条，每页15条</p>
		</div>

	</div>

	<div class="xzhd-body">
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
		<div class="xzhd-body-flex" style="margin-top:24px">
			<p style="font-size:16px;margin-right:86px">分享获得</p>
			<div class="xzhd-body-input" style="position:relative">
				<input id="xzhd-body-fxhd" placeholder="请选择要分享的优惠券" type="text">
				<div class="xzhd-body-down"></div>
			</div>
		</div>
		<div class="xzhd-body-flex" style="margin-top:24px">
			<p style="font-size:16px;margin-right:70px">领取人获得</p>
			<div class="xzhd-body-input" style="position:relative">
				<input id="xzhd-body-lqrhd" placeholder="请选择领取人可获得的优惠券" type="text">
				<div class="xzhd-body-down"></div>
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
</body>

<script>
	$('.youxiao').click(function () {
		$(this).parent().children('div').show()
	})

	$('.quxiao').click(function () {
		$(this).parent().parent().hide()
	})

	$('.xzhd-body-zstjraduis').click(function(){
		$('.xzhd-body-zstjraduis').css('border-color', '#BFBFBF')
		$('.xzhd-body-zstjraduis').children().hide()
		$(this).css('border-color','#71B2EF')
		$(this).children().show()
	})
</script>

</html>