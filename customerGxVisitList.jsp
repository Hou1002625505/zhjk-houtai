<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>

<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>客户回访</title>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="easyui/demo.css">
	<link rel="stylesheet" type="text/css" href="../easyui/pagination.css" />
	<link rel="stylesheet" type="text/css" href="easyui/themes/datepicker.css" />
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script src="../easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
	<style>
		html {
			border: 1px solid #95B8E7;
			min-width: 1280px;
		}

		table,
		td {
			text-align: left;
		}

		table,
		th {
			text-align: right;
		}

		.item1 {
			width: 3%;

		}

		.item2 {
			width: 8%;
			overflow: hidden;
			white-space: nowrap;
			text-overflow: ellipsis;
		}

		/*5*/
		.item3 {
			width: 12%;
			overflow: hidden;
			white-space: nowrap;
			text-overflow: ellipsis;
		}

		.item4 {
			width: 20%;
			overflow: hidden;
			white-space: nowrap;
			text-overflow: ellipsis;

		}

		* {
			margin: 0;
			padding: 0;
		}

		.tuandatalist {
			width: 100%;
		}

		.pcintolist_title {
			width: 100%;
			height: 40px;
			line-height: 40px;
			border: 1px solid #71B2EE;
			background: linear-gradient(to bottom, #EFF5FF 0, #E0ECFF 100%);
			background-color: #E0ECFF;
		}

		.pcintolist_title .item {
			float: left;
			font-size: 14px;
			color: #444444;
			text-align: center;
			height: 100%;
			font-weight: bold;
			position: relative;
			overflow-y: auto;
		}

		.datalist {
			width: 100%;
			height: 36px;
			line-height: 36px;
			border-bottom: 1px dotted #CCCCCC;
			border-right: 1px dotted #CCCCCC;
		}

		.datalist .item {
			float: left;
			font-size: 14px;
			color: #444444;
			text-align: center;
			height: 100%;
			position: relative;
			overflow-y: auto;
			border-left: 1px dotted #CCCCCC;
		}

		.datalist span {
			font-size: 16px;
			color: #71B2EF;
		}

		.datalist em {
			font-size: 14px;
			font-style: normal;
			color: #BFBFBF;
		}

		.datalist .bianji {
			border-right: 2px solid #71B2EF;
			padding-right: 6px;
			cursor: pointer;
		}

		.datalist .delte {
			padding-left: 6px;
			cursor: pointer;
		}

		.tuancao_header .input1 {
			border: 1px solid #CCCCCC;
			width: 240px;
			line-height: 36px;
			height: 36px;
			border-radius: 3px;
			padding-left: 10px;
			font-size: 18px;
		}

		.tuancao_header .input2 {
			border: 1px solid #CCCCCC;
			width: 240px;
			line-height: 36px;
			height: 36px;
			border-radius: 3px;
			padding-left: 10px;
			font-size: 18px;
		}

		.tuancao_header select {
			border: 1px solid #CCCCCC;
			width: 240px;
			line-height: 36px;
			height: 36px;
			border-radius: 3px;
			padding-left: 10px;
			font-size: 18px;
			appearance: none;
			-moz-appearance: none;
			-webkit-appearance: none;
		}

		.tuancao_header label {
			font-size: 18px;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(68, 68, 68, 1);
			padding: 0 20px 0 28px;

		}

		.querybtn {
			display: inline-block;
			width: 90px;
			line-height: 36px;
			height: 36px;
			text-align: center;
			background: #71B2EF;
			color: #fff;
			border-radius: 4px;
			margin: 0 27px 0 28px;
			font-size: 16px;
			cursor: pointer;
		}

		.clearbtn {
			display: inline-block;
			width: 90px;
			line-height: 36px;
			height: 36px;
			text-align: center;
			background: #fff;
			color: #444444;
			border-radius: 4px;
			border: 1px solid #BFBFBF;
			font-size: 16px;
			cursor: pointer;
		}

		.leave_sure {
			width: 700px;
			overflow: hidden;
			padding-bottom: 10px;
			background: #fff;
			/*background: linear-gradient(180deg, rgba(224, 236, 255, 1), rgba(237, 244, 255, 1));*/
			border: 1px solid rgba(113, 178, 239, 1);
			border-radius: 10px;
			position: absolute;
			top: 5px;
			left: 50%;
			margin-left: -351px;
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
			width: 50px;
			height: 50px;
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
			margin-left: 15px;
		}

		.fangleave_title {
			height: 110px;
			cursor: move;
			padding-left: 40px;
			border-bottom: 1px solid rgba(113, 178, 239, 1);
		}

		.fangleave_title p {
			line-height: 28px;
		}

		.fangleave_title .name {
			padding-top: 15px;
			font-size: 20px;
			color: #BFBFBF;
		}

		.fangleave_title .content {
			font-size: 20px;
			color: #444444;
			width: 600px;
			overflow: hidden;
			white-space: nowrap;
			text-overflow: ellipsis;
		}

		.fangleave_title .time {
			font-size: 20px;
			color: #BFBFBF;
		}

		.fangleave_sure_wrap {
			position: fixed;
			top: 0;
			left: 0;
			right: 0;
			bottom: 0;
			background: rgba(255, 255, 255, 0.1);
		}

		.leave_con_sure {
			padding: 20px 0 6px 40px;
		}

		.leave_con_sure span {
			width: 120px;
			height: 40px;
			line-height: 40px;
			text-align: center;
			display: inline-block;
			border-radius: 4px;
			font-size: 20px;
		}

		.leave_con_sure .sure1 {
			background: rgba(113, 178, 239, 1);
			color: #FFFFFF;
			margin-right: 25px;
		}

		.leave_con_sure .quxiao {
			border: 1px solid rgba(191, 191, 191, 1);
			color: #444444;
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

		.leave_con {}

		.leave_con_table {}

		.leave_con_table p {
			padding: 15px 40px;
			font-size: 20px;
			color: #BFBFBF;
		}

		.leave_con_table .textra {
			width: 620px;
			margin: 0 auto;
		}

		.textra textarea {
			resize: none;
			width: 622px;
			padding: 15px;
			font-size: 20px;
			color: #444444;
			border: 1px solid #BFBFBF;
			background: #fff;
		}

		.tishi {
			width: 620px;
			height: 40px;
			line-height: 44px;
			margin: -5px auto 0;
			border-left: 1px solid #BFBFBF;
			border-right: 1px solid #BFBFBF;
			border-bottom: 1px solid #BFBFBF;

		}

		.tishi span {
			float: right;
			font-size: 16px;
			color: #BFBFBF;
			padding-right: 20px;
		}

		.select_wrap {
			position: relative;
		}

		.triangle_border_down {
			display: inline-block;
			width: 0;
			height: 0;
			border-width: 8px 5px 0;
			border-style: solid;
			border-color: #1d1d1d transparent transparent;
			position: absolute;
			right: 10px;
			top: 3px;
		}

		.fuckstr1 {
			float: left;
		}

		.fuckstr2 {
			float: left;
		}

		.c-datepicker-date-editor {
			border: 1px solid #CCCCCC;
			position: relative;
			top: -24px;
			width: 220px;
			height: 36px;
			cursor: pointer;
		}

		.c-datepicker-data-input.only-date {
			width: 100%;
			font-size: 18px;
		}

		.tuancao_header strong {
			position: relative;
			top: -2px;
		}

		.remove {
			width: 385px;
			height: 64px;
			background: rgba(255, 255, 255, 1);
			box-shadow: 0px 0px 20px 0px rgba(153, 153, 153, 0.5);
			border-radius: 4px;
			position: absolute;
			right: 120px;
			top: 32px;
			z-index: 999;
		}

		.removeSX {
			padding-top: 10px;
		}

		.removeSX .wz,
		.removeSX .removeBtn {
			float: left;
			padding-top: 8px;
		}

		.removeSX .wz {
			font-size: 16px;
			padding: 0 16px;
		}

		.removeBtn .rebtn {
			float: left;
			width: 60px;
			height: 30px;
			line-height: 30px;
			color: #fff;
			background: rgba(113, 178, 239, 1);
			border-radius: 4px;
			font-size: 16px;
			cursor: pointer;
		}

		.removeBtn .rebtn.active {
			background-color: #fff;
			color: #444444;
			border: 1px solid rgba(191, 191, 191, 1);
			margin-left: 20px;
		}

		.remove .tip {
			font-size: 14px;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(255, 0, 0, 1);
			float: left;
			margin: 0 20px;
			width: 89%;
			border-top: 1px solid #bfbfbf;
			text-align: left;
			line-height: 30px;
			margin-top: 7px;
		}

		.cxbor {
			overflow: inherit !important
		}

		.pagination-btn {
			height: 23px !important;
			line-height: 23px !important;
		}

		.pagination-ellipsis {
			position: relative;
			top: -2px !important;
		}

		.box {
			margin-left: 50%;
			transform: translateX(-50%);
			padding-bottom: 20px;

		}

		.c-datepicker-date-table td.disabled .cell,
		.c-datepicker-month-table td.disabled .cell,
		.c-datepicker-year-table td.disabled .cell {
			text-decoration: none;
		}
	</style>
</head>

<body>
	<table id="dg" style="width: 100%; height: 100%">
	</table>
	<div class="tuancao_wrap">
		<div class="tuancao_header">

			<!--<label style="padding-left:0!important;">消费门店</label>
			   	<span class="select_wrap"><select name="club" id="clubId"></select><em class="triangle_border_down"></em></span>-->

			<label style="padding-left:0!important;">订单状态</label>
			<span class="select_wrap">
				<select name="visitstatus" id="visitstatus">
					<option value="" selected="selected">全部</option>
					<option value="0">待回访</option>
					<option value="1">已回访</option>
					<option value="3">已取消</option>
				</select><em class="triangle_border_down"></em></span>
			<label>日期筛选</label>
			<div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10" id="startTime"><input
					type="text" id="selectDate1" autocomplete="off" name="" placeholder="开始日期"
					class=" c-datepicker-data-input only-date" value=""> </div>
			<strong>-- </strong>
			<div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10" id="endTime"><input
					type="text" id="selectDate2" autocomplete="off" name="" placeholder="结束日期"
					class=" c-datepicker-data-input only-date" value=""> </div>
			&nbsp;(一次最长查询1个月)

		</div>
		<div class="tuancao_header" style="margin-top: 0px;">
			<div>
				<label style="padding-left:0!important;">会员姓名</label>
				<input class="input1" type="text" id="fangcusname">
				<label>手机号码</label>
				<input class="input2" type="text" id="fangmobile">
				<span class="querybtn" id="fangquerybtn" onclick="fchatitylist()">查询</span><span class="clearbtn"
					onclick="clearcondition()">清除</span>
			</div>
		</div>



		
		<div class="tuandatalist_wrap" id="fangcardlist" style="margin-top:20px;">
			<div class="tuandatalist">
				<div class="pcintolist_title">

					<div class="item item1 ">序号</div>
					<div class="item item2 ">会员姓名</div>
					<div class="item item2 ">性别</div>
					<div class="item item3 ">计划回访日期</div>
					<div class="item item3 ">手机号码</div>
					<div class="item item3 ">会员注册门店</div>
					<div class="item item3 ">回访类型</div>
					<div class="item item4 ">回访结果</div>
					<div class="item item3 ">操作</div>
				</div>
				<div id="fangdatalist_wrap">
					<!--<div class="datalist">
			       <div class="item item1 ">序号</div>
					<div class="item item2 ">会员姓名</div>
					<div class="item item2 ">性别</div>
					<div class="item item3 ">计划回访日期</div>
					<div class="item item3 ">手机号码</div>
					<div class="item item3 ">会员注册门店</div>
					<div class="item item3 ">回访类型</div>
				    <div class="item item4 ">回访结果</div>
					<div class="item item3 "><span class="bianji">回访</span><span class="delte">取消回访</span></div>
			       	<div class="item item3 "><em>已回访</em></div>
			        </div>-->

				</div>
			</div>
		</div>

	</div>
	<div class="box" id="boxpage"></div>
	<!--  点击回访弹窗-->
	<div class="fangleave_sure_wrap" id="fangleave_sure1" style="display: none;">
		<div class="leave_sure" style="top: 50%;margin-top: -246px;">
			<div class="fangleave_title">
				<p class="name">会员姓名：<span id="customername">张洪超</span></p>
				<p class="content"><span id="luncon">消费类型：</span><span id="pingcon">首次消费</span></p>
				<p class="time" id="pingtime">2019-04-11 12:00:30</p>
			</div>
			<div class="leave_con">
				<div class="leave_con_table">
					<p>填写回访</p>
					<div class="textra">
						<form method="post" id="visitform" name="visitform" enctype="multipart/form-data">
							<textarea rows="7" cols="92" placeholder="最多输入150个汉字" id="huifucontent" name="visitResult"
								maxlength="150" name="description"></textarea>
							<input type="hidden" name="status" id="status" value="" />
							<input type="hidden" name="visitId" id="visitId" value="" />
						</form>
						<div class="tishi">
							<span id="huifuzishu"><span>还可以输入<em id="remain">150</em>字，按下Shift+Enter键换行</span></span>

						</div>
					</div>

				</div>
				<div class="leave_con_sure">
					<span class="sure1" onclick="replysure()">确定</span><span class="quxiao"
						onclick="fangclose()">取消</span>
				</div>
			</div>
			<div class="close" onclick="fangclose()"></div>
		</div>
	</div>
	<!--<div id="sub" class="easyui-dialog" title="回访信息" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width: 550px; height: 500px; top: 20%; left: 30%;">
		<div style="width: 100%; max-width: 400px; padding: 30px 60px;">
			<form method="post" id="visitform" name="visitform" enctype="multipart/form-data">
				<table>
					<tr>
						<th><span>客户姓名:</span></th>
						<td style="padding-left: 10%;"><input name="customerGxName" id="customerGxName" type="text" readonly=true/></td>
					</tr>
					<tr>
						<th><span>性别:</span></th>
						<td style="padding-left: 10%;"><input name="sexName" id="sexName" type="text" readonly="true"/></td>
					</tr>
					<tr>
						<th><span>手机:</span></th>
						<td style="padding-left: 10%;"><input name="customerGxMobile" id="customerGxMobile" type="text" readonly="true"/></td>
					</tr>
					<tr>
						<th><span>回访类型:</span></th>
						<td style="padding-left: 10%;"><input name="visitTypeName" id="visitTypeName" type="text" readonly="true"/></td>
					</tr>
					<tr>
						<th><span>归属顾问:</span></th>
						<td style="padding-left: 10%;"><input name="userName" id="userName" type="text" readonly="true"/></td>
					</tr>
					<tr>
						<th><span>回访结果:</span></th>
						<td style="padding-left: 10%;"><input name="visitResult" id="visitResult" type="text" missingMessage="请填写回访结果!" 
							data-options="required:true"/></td>
					</tr>
				</table>
				<input type="hidden" name="status" id="status" value="" />
				<input type="hidden" name="visitId" id="visitId" value="" />
			</form>
		</div>
		<div style="text-align: center; padding: 5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="cancelVisit()" style="width: 80px">取消回访</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="complateVisit()" style="width: 80px">回访完成</a>
		</div>
	</div>-->
	<script type="text/javascript" src="easyui/moment.min.js"></script>
	<script type="text/javascript" src="easyui/datepicker.all.js"></script>
	<script type="text/javascript" src="easyui/datepicker.en.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
		var id = 0;
		var $dg;
		var club = "";
		var userName = "";
		var oldTime = "";
		$("#selectDate1").val(getDay(-6))
		$("#selectDate2").val(getDay(0))
		oldTime = $("#selectDate1").val();
		var day2 = new Date();
		day2.setTime(day2.getTime());
		var s2 = day2.getFullYear() + "-" + (day2.getMonth() + 1 < 10 ? "0" + (day2.getMonth() + 1) : day2.getMonth() + 1) + "-" + (day2.getDate() < 10 ? "0" + day2.getDate() : day2.getDate());
		$('#startTime').datePicker({
			hasShortcut: false,
			format: 'YYYY-MM-DD',
			max: s2,
			hide: function () {
				if (oldTime != $("#selectDate1").val()) {
					$("#selectDate2").val('')
				}
				oldTime = $("#selectDate1").val();
				sy()
			}
		});

		$("#endTime").on("click", function () {
			if ($("#selectDate1").val() == '') {
				alert("请选择开始时间")
				$('.c-datepicker-picker').hide();
			}
		})
		function sy() {
			var maxTime = "";
			var day2 = new Date();
			day2.setTime(day2.getTime());
			var s2 = day2.getFullYear() + "-" + (day2.getMonth() + 1 < 10 ? "0" + (day2.getMonth() + 1) : day2.getMonth() + 1) + "-" + (day2.getDate() < 10 ? "0" + day2.getDate() : day2.getDate());
			//		alert(s2)
			var t = new Date($("#selectDate1").val());
			var iToDay = t.getDate();
			var iToMon = t.getMonth();
			var iToYear = t.getFullYear();
			var newDay = new Date(iToYear, iToMon, (iToDay + 30));
			var hthird = newDay.getFullYear() + "-" + ((newDay.getMonth() + 1) < 10 ? "0" + (newDay.getMonth() + 1) : newDay.getMonth() + 1) + "-" + (newDay.getDate() < 10 ? "0" + newDay.getDate() : newDay.getDate());
			var thetime = hthird;
			var d = new Date(Date.parse(thetime.replace(/-/g, "/")));
			var curDate = day2;
			if (d <= curDate) {
				maxTime = thetime;
			} else {
				maxTime = s2;
			}

			$("#endTime").datePicker({
				hasShortcut: false,
				format: 'YYYY-MM-DD',
				min: $("#selectDate1").val(),
				max: maxTime
			});
		}

		function formatItem(row) {
			var s = '<span>' + row.clubName + '</span><br/>';
			return s;
		}
		$('#huifucontent').keyup(function () {
			var vallen = $('#huifucontent').val().length;
			var remain = 150 - parseInt(vallen);
			$('#remain').html(remain);
		})
		function fangclose() {
			$('#fangleave_sure2').hide()
			$('#fangleave_sure1').hide()
		}
		function tihuan(item) {

			if (item == undefined || item == null) {
				item = ""
			} else {
				return item
			}
			return item
		}
		$(function () {
			getclublist()
			$(window).resize(function () {
				$('#dg').datagrid('resize', {
					width: $(window).width() - 220,
					height: $(window).height() - 40,
				});
			});


			$dg = $("#dg");
			//init($dg);
			visititylist()

			$("#sub").dialog({
				onClose: function () {
					$('#sub').form('clear');
				}
			});
			$(document).keydown(function (e) {
				if (e.keyCode == 13) {
					//init($dg);
					visititylist();
				}
			});
		});
		//获取会所
		function getclublist() {
			$.ajax({
				url: 'rest/club/getAllClublist',
				type: 'get',
				async: false,//使用同步的方式,true为异步方式
				//data : {},//这里使用json对象
				success: function (res) {
					console.log(1)

					console.log(res)
					var clubarray = res;
					if (clubarray.length > 0) {
						for (var i = 0; i < clubarray.length; i++) {
							var club = clubarray[i];
							$("#clubId").append("<option value='" + club.clubId + "'>" + club.clubName + "</option>");
						}
					}

				}
			});
		}
		var intoPages = 1;
		var onPagechange = function (page) {
			console.log('当前点击入场页码', page);
			if (intoPages != page) {
				intoPages = page;
				visititylist();
			}
		}
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
			var intoPages1 = String(intoPages);
			var data = {
				"page": intoPages1,
				'rows': '20',
				"name": '65685',
				//             "name" : '60383',
				"status": status,
				"startDate": startDate,
				"endDate": endDate,
				"userName": conditionName,
				"customerName": fangcusname,
				"mobile": fangmobile,
			}
			$.ajax({
				type: "post",
				url: "rest/customer/visit/getCustomerVisitList",
				async: false,
				data: data,
				success: function (res) {
					console.log(res)
					$('#fangdatalist_wrap').html('')
					if (res.status) {
						var data = res.rows;
						if (data.length > 0) {
							$('#boxpage').show()
							var sexname = '';//性别
							var visititystatus = '';//访问状态
							var intoNum = (intoPages - 1) * 20; //序号
							for (var i = 0; i < data.length; i++) {
								var item = data[i];
								intoNum++;
								if (item.customerGxSex == 1) {
									sexname = '男'
								} else if (item.customerGxSex == 2) {
									sexname = '女'
								} else {
									sexname = '--'
								}
								if (item.status == '0') {
									visititystatus = '<shiro:hasPermission name="10010801"><span class="bianji" onclick="huifang(\'' + item.visitId + '\',\'' + item.customerGxName + '\',\'' + item.visitTypeName + '\',\'' + item.visitPlanDate + '\')">回访</span><span class="delte" onclick="quxiaohuifang(this,\'' + item.visitId + '\')">取消回访</span></shiro:hasPermission>'
								} else if (item.status == '1') {
									visititystatus = '<em>已访问</em>'
								} else if (item.status == '2') {
									visititystatus = '<em>已拒绝</em>'
								} else if (item.status == '3') {
									visititystatus = '<em>已取消</em>'
								} else {
									visititystatus = '--'
								}
								var str = '	 <div class="datalist">' +
									'<div class="item item1 ">' + intoNum + '</div>' +
									'<div class="item item2 ">' + tihuan(item.customerGxName) + '</div>' +
									'<div class="item item2 ">' + sexname + '</div>' +
									'<div class="item item3 ">' + tihuan(item.visitPlanDate) + '</div>' +
									'<div class="item item3 ">' + tihuan(item.customerGxMobile) + '</div>' +
									'<div class="item item3 ">' + tihuan(item.hospname) + '</div>' +
									'<div class="item item3 ">' + tihuan(item.visitTypeName) + '</div>' +
									'<div class="item item4 ">' + tihuan(item.visitResult) + '</div>' +
									'<div class="item item3 cxbor">' + visititystatus + '</div>' +
									'</div>'
								$('#fangdatalist_wrap').append(str);
							}
						} else {
							//							alert('没有数据，请检查输入信息是否正确')
							$('#boxpage').hide()
						}
					}
					if (intoNum != 0) {
						var obj = {
							wrapid: 'boxpage', //页面显示分页器容器id
							total: res.total, //总条数
							pagesize: 20, //每页显示10条
							currentPage: intoPages, //当前页
							onPagechange: onPagechange,
							//btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
						}
						pagination.init(obj);

					}
				},
				error: function (res) {
					console.log(res)
				}
			});
		}
		function query() {
			init($dg);
		}
		//		取消回访
		function quxiaohuifang(em, aid) {
			$('#huifucontent').val('');
			alert($('#huifucontent').val())
			$('#visitform').form('load', 'rest/customer/visit/getCustomerVisitById?tid=' + aid);
			$(".remove").remove();
			var str = '<div class="remove">' +
				'<div class="removeSX">' +
				'<div class="wz">是否取消对該会员的回访？</div>' +
				'<div class="removeBtn">' +
				'<div class="rebtn" onclick="removeQD(\'' + aid + '\')">确定</div>' +
				'<div class="rebtn active" onclick="cancel()">取消</div>' +
				'</div>' +
				'</div>' +
				'</div>'
			$(em).parent().append(str)
		}
		//回访
		function huifang(aid, cusname, visitype, visiDate) {
			$('#huifucontent').val('');
			$('#visitform').form('load', 'rest/customer/visit/getCustomerVisitById?tid=' + aid);
			$('#fangleave_sure1').show();

			$('#customername').html(cusname)
			$('#pingcon').html(visitype)
			$('#pingtime').html(visiDate)
		}
		//回访确定
		function replysure() {
			var result = $('#huifucontent').val();
			if (result == '') {
				alert('请填写回访结果')
				return;
			}
			complateVisit();
		}
		function cancel() {
			$(".remove").remove();

		}
		//确定取消回访
		function removeQD(visityID) {

			cancelVisit()
		}
		function clearcondition() {
			$("#selectDate1").val('');
			$("#selectDate2").val('');
			$('#startDate').datebox('setValue', '');
			$('#endDate').datebox('setValue', '');
			//			$('#visitstatus').val('');
			$('#conditionName').val('');
			$("#fangcusname").val('');
			$("#fangmobile").val('');
		}

		function init($dg) {
			var status = $("#visitstatus").val();
			var conditionName = $("#conditionName").val();
			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			var club = $("#clubId").val();
			$('#dg').datagrid({
				width: $(window).width() - 220,
				height: $(window).height() - 40,
				striped: true,
				border: true,
				fitColumns: true,
				toolbar: '#tb',
				method: 'post',
				fit: true,// 自动大小
				url: 'rest/customer/visit/getCustomerVisitList',
				idField: 'id',
				queryParams: { "name": userName, "status": status, "startDate": startDate, "endDate": endDate, "userName": conditionName, "clubCode": club },
				columns: [[{
					field: 'visitPlanDate',
					title: '计划回访日期',
					width: parseInt($(this).width() * 0.05),
					align: 'center',
					formatter: function (value, row, index) {
						if (value != null && value != "" && value != undefined) {
							return value.substring(0, 10);
						} else {
							return "";
						}
					}
				}, {
					field: 'customerGxName',
					title: '客户姓名',
					width: parseInt($(this).width() * 0.05),
					align: 'center'
				}, {
					field: 'customerGxSex',
					title: '性别',
					width: parseInt($(this).width() * 0.05),
					align: 'center',
					formatter: function (value, row, index) {
						if (value == '1') {
							return '男';
						} else if (value == '2') {
							return '女';
						} else {
							return '--';
						}
					}
				}, {
					field: 'customerGxMobile',
					title: '手机',
					width: parseInt($(this).width() * 0.05),
					align: 'center'
				}, {
					field: 'hospname',
					title: '会员注册门店',
					width: parseInt($(this).width() * 0.05),
					align: 'center'
				}, {
					field: 'visitTypeName',
					title: '回访类型',
					width: parseInt($(this).width() * 0.05),
					align: 'center'
				}, {
					field: 'userName',
					title: '归属顾问',
					width: parseInt($(this).width() * 0.05),
					align: 'center'
				}, {
					field: 'visitResult',
					title: '回访结果',
					width: parseInt($(this).width() * 0.05),
					align: 'center'
				}, {
					field: 'status',
					title: '回访状态',
					width: parseInt($(this).width() * 0.05),
					align: 'center',
					formatter: function (value, row, index) {
						if (value == '0') {
							return '待回访';
						} else if (value == '1') {
							return '已访问';
						} else if (value == '2') {
							return '已拒绝';
						} else if (value == '3') {
							return '已取消';
						} else {
							return '--';
						}
					}
				}]],
				singleSelect: true,// 是否单选
				pagination: true,// 分页控件
				rownumbers: true,
				pageSize: 10,
				pageList: [10, 20, 30],
				displayMsg: '当前显示 {from} - {to} 条记录   共 {total} 条记录',
				onClickRow: function (rowIndex) {
					var row = $('#dg').datagrid('getSelected');
					if (!row) {
						return;//为防止意外情况可以选择加上此判断
					}
					id = row.visitId;//获取选中行的id
				},
				onDblClickRow: function (rowIndex, rowData) {
					getpackage(rowData.customerId);
				}
			}).datagrid("getPager").pagination({
				beforePageText: '第', //页数文本框前显示的汉字    
				afterPageText: '页/{pages}页',
				displayMsg: '共{total}条记录',
				onBeforeRefresh: function () {
					return true;
				}
			});
		}

		function getTheOne() {
			var row = $("#dg").datagrid('getSelections');
			if (typeof (id) != "undefined" && id != 0) {
				if (row.length == 1) {
					$('#customerId').val(id);
					$('#sub').dialog({
						title: '填写回访记录'
					});
					$('#sub').dialog('open');
					$('#visitform').form('load', 'rest/customer/visit/getCustomerVisitById?tid=' + id);
				} else {
					$.messager.alert('提示', '请选择一条回访记录', 'info');
				}
			} else {
				$.messager.alert('提示', '请选择回访记录', 'info');
			}
		}

		function clearForm() {
			$('#visitform').form('clear');
		}

		/*取消访问*/
		function cancelVisit() {

			$('#status').val("3");
			var url = "rest/customer/visit/updateCustomerVisitById";
			$('#visitform').form('submit', {
				url: url,
				success: function (data) {
					visititylist()
					$(".remove").remove();
				}
			});

		}

		/*完成访问*/
		function complateVisit() {

			$('#status').val("1");
			var url = "rest/customer/visit/updateCustomerVisitById";
			$('#visitform').form('submit', {
				url: url,
				success: function (data) {
					visititylist();
					$('#fangleave_sure1').hide()

				}
			});

		}

		function checkcheck() {
			var resultflag = $('#status').val();
			var flag = "";
			if (resultflag != "0") {
				flag = "回访已结束";
			}
			var result = $('#visitResult').val();
			if (result == null || result == "" || result == undefined) {
				flag = "请填写回访结果";
			}
			return flag;
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
	</script>
</body>

</html>