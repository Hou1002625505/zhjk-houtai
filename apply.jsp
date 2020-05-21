<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>申请列表</title>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="easyui/demo.css">
	<link rel="stylesheet" type="text/css" href="../easyui/pagination.css" />
	<link rel="stylesheet" type="text/css" href="easyui/themes/datepicker.css" />
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script src="../easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
</head>
<style type="text/css">
	body {
		font-family: verdana, helvetica, arial, sans-serif;
		padding: 20px 20px 20px 18px;
		font-size: 12px;
		margin: 0;
	}

	html {
		border: 1px solid #95B8E7;
		border-bottom: none;
	}

	em {
		font-style: normal;
	}

	/*1*/
	.item1 {
		width: 3%;
	}

	/*5*/
	.item2 {
		width: 11.8%;
	}

	/*	4*/
	.item3 {
		width: 8%;
	}

	/*1*/
	.item4 {
		width: 6%;
	}

	/*1*/
	.item5 {
		width: 23%;
		cursor: pointer;
	}

	.item5 .tdwrap {
		width: 100%;
		height: 100px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}

	* {
		margin: 0;
		padding: 0;
	}

	.tuancao_wrap tr {
		height: 120px;
		border-right: 1px dotted #CCCCCC;
	}

	.tuancao_wrap td {
		height: 120px;
		text-align: center;
		border-left: 1px dotted #CCCCCC;
		border-bottom: 1px dotted #CCCCCC;
		font-size: 14px;
		color: #444444;
	}

	.tuancao_wrap th {
		font-weight: 400;
		font-size: 16px;
		color: #444444;
	}

	.tuancao_wrap td span {
		font-size: 14px;
		color: #71B2EF;
		cursor: pointer;
	}

	.tuancao_wrap td a {
		font-size: 16px;
		font-family: Microsoft YaHei;
		font-weight: 400;
		cursor: pointer;
		text-decoration: underline;
		color: rgba(113, 178, 239, 1);
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

	.tongguobtn {
		display: inline-block;
	}

	.tongguobtn .no {
		width: 80px;
		height: 24px;
		line-height: 24px;
		text-align: center;
		background: #F7F7F7;
		border-radius: 4px;
		font-size: 14px;
		font-family: MicrosoftYaHei;
		font-weight: 400;
		color: #444444;
		margin-top: 20px;
		cursor: pointer;
	}

	.tongguobtn .yes {
		width: 80px;
		height: 24px;
		line-height: 24px;
		text-align: center;
		background: rgba(113, 178, 239, 1);
		border-radius: 4px;
		font-size: 14px;
		font-family: MicrosoftYaHei;
		font-weight: 400;
		color: rgba(255, 255, 255, 1);
		cursor: pointer;
	}

	.zanwushuju {
		width: 100%;
		height: 51px;
		line-height: 51px;
		text-align: center;
		display: none;
	}

	.zanwushuju span {
		font-size: 16px;
		color: #666;
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

	}
</style>

<body>
	<div class="tuancao_wrap">

		<div class="tuandatalist_wrap" id="fangcardlist">
			<table style=" border-collapse:collapse;width:100%;table-layout: fixed;">
				<tr style="height:40px;background-color: rgba(249,249,249,1);">
					<th class="item item1 ">序号</th>
					<th class="item item2 ">企业名称</th>
					<th class="item item2 ">企业地址</th>
					<th class="item item2 ">企业官网</th>
					<th class="item item2 ">营业执照</th>
					<th class="item item2 ">企业人数</th>
					<th class="item item2 ">联系人姓名</th>
					<th class="item item2 ">联系人电话</th>
					<th class="item item2 ">联系人职位</th>
					<th class="item item2 ">操作</th>

				</tr>
				<tbody id="fangdatalist_wrap">
					<!--<tr>
				<td class="item item1 ">序号</td>
				<td class="item item2 ">卡券名称</td>
				<td class="item item2 ">卡券类型</td>
				<td class="item item2 "><a  onclick="newfang('http://www.baidu.com')">www.baidu.com</a></td>
				<td class="item item2 ">有效期</td>
				<td class="item item2 ">赠送原因</td>
				<td class="item item2 ">赠送比例</td>
				<td class="item item2 ">卡券权益</td>			  			   
			      <td class="item item2 ">
			      	<div class="tongguobtn">
						<div class="yes" onclick="addTab('企业档案','rest/business/archives/archivesPage')">通过</div>
						<div class="no">不通过</div>
					</div>
			      </td>
			</tr>-->


				</tbody>
			</table>
		</div>
		<div class="zanwushuju"><span>暂无数据</span></div>

		<div class="box" id="ywyboxpage"></div>
	</div>

</body>
<script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="easyui/moment.min.js"></script>
<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
<script>

	var service_ip = "http://" + location.host.split('.')[0] + ".physicalclub.com";

	function tihuan(item) {

		if (item == undefined || item == null) {
			item = ""
		} else {
			return item
		}
		return item
	}
	var fintoPages3 = 1;
	function queryyewuyuanf() {
		fintoPages3 = 1;
		queryyewuyuan()
	}

	var fonPagechange3 = function (page) {
		console.log('当前点击入场页码', page);
		if (fintoPages3 != page) {
			fintoPages3 = page;
			queryyewuyuan();
		}
	}
	queryyewuyuan()
	function queryyewuyuan() {

		var data = {
			page: fintoPages3,
			rows: 20,
			'param.status': '0,4'
		}
		$.ajax({
			type: "post",
			url: "rest/business/apply/getBusinessApplyByPage",
			async: false,
			//contentType: "application/json;charset=UTF-8",
			dataType: "json",
			data: data,
			//data:JSON.stringify(data),
			success: function (res) {

				console.log(res)
				if (res.status) {
					$('#fangdatalist_wrap').html('')
					var data = res.rows;
					if (data.length > 0) {

						$('.zanwushuju').hide();
						$('#ywyboxpage').show();

						var intoNum = (fintoPages3 - 1) * 20; //序号
						for (var i = 0; i < data.length; i++) {
							intoNum++;
							var item = data[i];
							if (item.status == 0) {
								var str = '<tr>' +
									'<td class="item item1 ">' + intoNum + '</td>' +
									'<td class="item item2 ">' + tihuan(item.name) + '</td>' +
									'<td class="item item2 ">' + tihuan(item.address) + '</td>' +
									'<td class="item item2 "><a  onclick="newfang(\'' + item.officialWebsite + '\')">' + tihuan(item.officialWebsite) + '</a></td>' +
									'<td class="item item2 " style="position:relative"><img class="showsmall" style="100%;height:100%" src="'+ service_ip + '/images/' + tihuan(item.busiLicensePicture) + '" alt=""></td>' +
									'<td class="item item2 ">' + tihuan(item.number) + '</td>' +
									'<td class="item item2 ">' + tihuan(item.contactName) + '</td>' +
									'<td class="item item2 ">' + tihuan(item.contactMobile) + '</td>' +
									'<td class="item item2 ">' + tihuan(item.contactPost) + '</td>' +
									'<td class="item item2 ">' +
									'<div class="tongguobtn">' +
									'<div class="yes" onclick="addTab(\'' + item.status + '\',\'' + item.applyId + '\',\'' + item.abbreviation + '\',\'' + item.address + '\',\'' + item.contactMobile + '\',\'' + item.contactName + '\',\'' + item.contactPost + '\',\'' + item.name + '\',\'' + item.number + '\',\'' + item.busiLicensePicture + '\')">通过</div>' +
									'<div class="no" onclick="addTabno(\'' + item.status + '\',\'' + item.applyId + '\')">不通过</div>' +
									'</div>' +
									'</td>' +
									'</tr>';
							} else {
								var str = '<tr>' +
									'<td class="item item1 ">' + intoNum + '</td>' +
									'<td class="item item2 ">' + tihuan(item.name) + '</td>' +
									'<td class="item item2 ">' + tihuan(item.address) + '</td>' +
									'<td class="item item2 "><a  onclick="newfang(\'' + item.officialWebsite + '\')">' + tihuan(item.officialWebsite) + '</a></td>' +
									'<td class="item item2 " style="position:relative"><img class="showsmall" style="100%;height:100%" src="' + service_ip + '/images/' + tihuan(item.busiLicensePicture) + '" alt=""></td>' +
									'<td class="item item2 ">' + tihuan(item.number) + '</td>' +
									'<td class="item item2 ">' + tihuan(item.contactName) + '</td>' +
									'<td class="item item2 ">' + tihuan(item.contactMobile) + '</td>' +
									'<td class="item item2 ">' + tihuan(item.contactPost) + '</td>' +
									'<td class="item item2 ">' +
									'<div class="tongguobtn">' +
									'<div class="yes" onclick="addTab(\'' + item.status + '\',\'' + item.applyId + '\',\'' + item.abbreviation + '\',\'' + item.address + '\',\'' + item.contactMobile + '\',\'' + item.contactName + '\',\'' + item.contactPost + '\',\'' + item.name + '\',\'' + item.number + '\',\'' + item.busiLicensePicture + '\')">去建档</div>' +
									'</div>' +
									'</td>' +
									'</tr>';
							}


							$('#fangdatalist_wrap').append(str)

							// function openImg(str) {

							// 	var page = window.open();

							// 	var html = "<body style='background:black'><div style ='text-align:center'><img style='' src='"+ str +"' alt=''/></div></body > "

							// 	page.document.write(html);

							// 	console.log(str)
							// }

							$('.showsmall').click(function(){
								var url = $(this).attr('src')

								var page = window.open();

								var html = "<body style='background:black'><div style ='text-align:center'><img style='' src='" + url + "' alt=''/></div></body > "

								page.document.write(html);
							})
						}
					} else {

						$('.zanwushuju').show();
						$('#ywyboxpage').hide()
					}
					if (intoNum != 0) {
						var obj = {
							wrapid: 'ywyboxpage', //页面显示分页器容器id
							total: res.total, //总条数
							pagesize: 20, //每页显示10条
							currentPage: fintoPages3, //当前页
							onPagechange: fonPagechange3,
							//btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
						}
						pagination.init(obj);

					}

				}
			},
			error: function (res) {
				console.log(res)
			}
		});
	}
	//审核通过
	function addTab(ffstatus, shenqingid, qijiancheng, qidizhi, qiliantel, qilianname, qilianzhiwei, qiname, qirenshu, busiLicensePicture) {


		window.location.href = "rest/business/archives/archivesPage?shenqingflag=1" + '&qijiancheng=' + qijiancheng + '&qidizhi=' + qidizhi + '&qiliantel=' + qiliantel + '&qilianname=' + qilianname + '&qilianzhiwei=' + qilianzhiwei + '&qiname=' + qiname + '&qirenshu=' + qirenshu + '&shenqingid=' + shenqingid + '&busiLicensePicture=' + busiLicensePicture


	}
	//审核不通过
	function addTabno(ffstatus, shenqingid) {
		//console.log(url)
		var data = {
			applyId: shenqingid,
			status: 3
		}
		if (ffstatus == 0) {

			$.ajax({
				type: "post",
				url: "rest/business/apply/updBusinessApply",
				async: false,
				//contentType: "application/json;charset=UTF-8",
				//dataType: "json",
				data: data,
				//data:JSON.stringify(data),
				success: function (res) {
					console.log(res)
					if (res.rel) {
						alert('审核不通过成功')
						queryyewuyuan()
					}
				},
				error: function (res) {
					console.log(res)
				}
			});
		}
	}
	function newfang(furl) {
		console.log(furl)
		window.open(furl)
	}
</script>

</html>