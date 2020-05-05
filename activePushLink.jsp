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
	<title>侧边栏活动推送链接</title>
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
		/* .hdts-body{
		} */
		.hdts-xjhd{
			width:120px;
			height:40px;
			background:#71B2EF;
			font-size: 20px;
			color:#FFFFFF;
			border-radius: 4px;
			text-align: center;
			line-height: 40px;
			cursor: pointer;
		}
		.hdts-headerspan{
			font-size: 16px;
			color:#444444;
			float: left
		}
		#sstwxx{
			width:200px;
			height:30px;
			border:1px solid #BFBFBF;
			border-radius:4px;
			box-sizing:border-box;
			font-size:12px;
			color:#BFBFBF;
			padding:0 0 0 15px;
			margin-left:20px;
			margin-right:40px;
			float: left
		}
		.select_wrap {
            position: relative;
			float: left;
        }
		#hdts-hdfl {
            width: 120px;
            height: 30px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 14px;
            padding-left: 13px;
            box-sizing: border-box;
            -webkit-appearance: none;
        }
		#hdts-hdfl::-ms-expand {
			display: none;
		}
		.triangle_border_down1 {
            display: inline-block;
            width: 0;
            height: 0;
            border-width: 8px 5px 0;
            border-style: solid;
            border-color: #444444 transparent transparent;
            position: absolute;
            right: 10px;
            top: 11px;
        }
		#cjsjs{
			width: 120px;
            height: 30px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
			font-size: 12px;
            padding-left: 13px;
            box-sizing: border-box;
			color:#BFBFBF;
			float: left;
			
		}
		#cjsje{
			width: 120px;
            height: 30px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
			font-size: 12px;
            padding-left: 13px;
            box-sizing: border-box;
			color:#BFBFBF;
			float: left
		}
		#hdts-cx{
			display: block;
			width:80px;
			height:30px;
			background:#71B2EF;
			color:white;
			font-size: 16px;
			text-align: center;
			line-height: 30px;
			float: left;
			border-radius: 4px;
			margin:0 15px 0 40px
		}
		#hdts-qc{
			display: block;
			width:80px;
			height:30px;
			color:#444444;
			font-size: 16px;
			text-align: center;
			line-height: 30px;
			float: left;
			border-radius: 4px;
			border:1px solid #BFBFBF
		}
		.table-header th {
            font-size: 14px;
            color: #444444;
            height: 40px;
            text-align: center;
        }
		.item1{
			width:2.5%
		}
		.item2{
			width:8.9583%
		}
		.item3{
			width:22.239583%
		}
		.item4{
			width:14.5833%
		}
		.item5{
			width:7.7083%
		}

		.table-body1 tr td {
            font-size: 14px;
            color: #444444;
            height: 100px;
            text-align: center;
            border-left: 1px dotted #CCCCCC;
            border-bottom: 1px dotted #CCCCCC;
			box-sizing: border-box;
        }

        .table-body1 tr td:last-child {
            border-right: 1px dotted #CCCCCC;
        }

		#xjaxghd{
			position: absolute;
			width:634px;
			height:548px;
			border:1px solid #71B2EF;
			border-radius: 10px;
			top:50%;
			left:50%;
			top:136px;
			margin-left:-317px;
			box-sizing: border-box;
			padding:15px 20px 20px 20px;
			background:#edf4ff;
			display:none;
			box-shadow: 3px 3px 10px 2px #dcdcdc;
		}
		#shangchuan{
			width:60px;
			height:32px;
			background: #71B2EF;
			border-radius: 4px;
			color:white;
			text-align: center;
			line-height: 32px;
			font-size: 16px;
			cursor: pointer;
		}
		#hdts-hdfl1{
			width: 240px;
            height: 32px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 14px;
            padding-left: 13px;
            box-sizing: border-box;
            -webkit-appearance: none;
		}
		#hdts-hdfl1::-ms-expand {
			display: none;
		}
		#hdts-hdbt{
			width:460px;
			height:32px;
			border:1px solid #BFBFBF;
			box-sizing: border-box;
			border-radius: 4px;
			font-size: 14px;
			padding-left:14px;
		}
		#hdts-hdms{
			width:460px;
			height:80px;
			border:1px solid #BFBFBF;
			box-sizing: border-box;
			border-radius: 4px;
			font-size: 14px;
			padding-left:14px;
			padding-top: 10px;
			resize: none;
			float: left;
			display: block;
		}
		#hdts-hdlj{
			width:460px;
			height:32px;
			border:1px solid #BFBFBF;
			box-sizing: border-box;
			border-radius: 4px;
			font-size: 14px;
			padding-left:14px;
		}
		#hdts-queding{
			width:80px;
			height:32px;
			background:#71B2EF;
			font-size: 16px;
			color: white;
			text-align: center;
			line-height: 32px;
			float: left;
			border-radius: 4px;
			cursor: pointer;
		}
		#hdts-quxiao{
			width:80px;
			height:32px;
			font-size: 16px;
			color: #444444;
			text-align: center;
			line-height: 32px;
			float: left;
			border-radius: 4px;
			border:1px solid #BFBFBF;
			box-sizing: border-box;
			margin-left:20px;
			cursor: pointer;
		}
		.pagination-wrap .pagenum{
			height:22px;
			line-height: 22px;
		}
	</style>
</head>

<body>
	<div class="hdts-body" style="position:relative">
		<div>
			<div class="hdts-xjhd">新建活动</div>
		</div>
		<div style="height:30px;line-height:30px;margin-top:20px">
			<span class="hdts-headerspan">活动标题</span>
			<input type="text" id="sstwxx" placeholder="搜索图文消息"/>
			<span class="hdts-headerspan">活动分类</span>
			<span class="select_wrap" style="margin:0 40px 0 20px">
				<select name="visitstatus" id="hdts-hdfl" style="cursor:pointer">
					
				</select>
				<em class="triangle_border_down1"></em>
			</span>
			<span class="hdts-headerspan">创建时间</span>
			<div class="J-datepicker-day" style="float: left;margin-left:20px;">
				<input type="text" id="cjsjs" placeholder="开始日期" />
			</div>
			
			<div style="float:left;width:5px;height:2px;background:#BFBFBF;margin:14px 7px 0 7px;">
			</div>
			<div class="J-datepicker-day" style="float: left;">
				<input type="text" id="cjsje" placeholder="结束日期" />
			</div>
			
			<span id="hdts-cx" style="cursor: pointer;">查询</span>
			<span id="hdts-qc" style="cursor: pointer;">清除</span>
		</div>
		<table style='border-collapse: collapse;width: 100%;table-layout:fixed;margin-top:20px'>
			<tbody>
				<tr class="table-header" style="background:#f8fafb">
					<th class="item1">序号</th>
					<th class="item2">活动封面</th>
					<th class="item3">活动标题</th>
					<th class="item4">活动分类</th>
					<th class="item4">创建时间</th>
					<th class="item4">分享次数</th>
					<th class="item5">操作</th>
				</tr>
			</tbody>
			<tbody class="table-body1" id="sj-body-body1">
				
			</tbody>
		</table>
		<div style="height:22px;line-height: 22px;margin-top:18px">
			<div id="jilu" style="float: left;font-size: 16px;color:#444444;margin-right:27px"></div>
			<div class="box" id="boxpage" style="float: left;margin:0"></div>
		</div>
		
		<div id="xjaxghd">
			<div style="height:23px;line-height: 23px;">
				<img style="float: left;width:24px;height:23px" src="./image/editor_icon.png" alt="">
				<p style="float: left;font-size: 18px;color:#444444;margin-left:11px">新建活动</p>
				<img style="float: right;width:20px;height:20px;cursor: pointer;" id="xjhd-gb" src="./image/popupclose_btn.png" alt="">
			</div>
			<div style="width:592px;height:478px;border:1px solid #71B2EF;background:white;margin-top:13px;
			padding:26px 0 0 18px;box-sizing: border-box;box-shadow: 3px 3px 10px 2px #c8d2e1;">
				<div style="height:84px">
					<p style="float: left;font-size: 18px;color:#444444;margin-right:18px">活动图片</p>
					<div style="float: left;width:84px;height: 84px;border:1px solid #BFBFBF;box-sizing: border-box;">
						<img id="hdtp" class="" style="width:100%;height:100%" src="./image/white-white.jpg" alt="">
					</div>
					<div style="float: left;margin-left:15px">
						<p id="shangchuan">上传</p>
						<input id="fileImage" style="display:none" type="file" accept=".png,.jpeg,.jpg" size="30" onchange="imageimage()">
						<p style="color:#BFBFBF;margin-top:5px">图片建议尺寸：500像素*500像素，大小不超过200k</p>
						<p style="color:#BFBFBF;margin-top:5px">支持jpg/png.</p>
					</div>
				</div>
				<div style="height:32px;line-height: 32px;margin-top: 25px;">
					<p style="float: left;font-size: 18px;color:#444444;">活动分类</p>
					<span class="select_wrap" style="margin:0 40px 0 20px">
						<select name="visitstatus" id="hdts-hdfl1" style="cursor:pointer">
							
						</select>
						<em class="triangle_border_down1"></em>
					</span>
				</div>
				<div style="height:32px;line-height: 32px;margin-top: 25px;position: relative;">
					<p style="float: left;font-size: 18px;color:#444444;margin-right:20px">活动标题</p>
					<input type="text" id="hdts-hdbt" autocomplete="off" placeholder="请填写分享活动标题">
					<p style="position:absolute;top:0;right:30px"><span id="text-count">0</span>/20</p>
				</div>
				<div style="height:80px;line-height: 80px;margin-top: 25px;position: relative;">
					<p style="float: left;font-size: 18px;color:#444444;margin-right:20px">活动描述</p>
					<textarea name="" id="hdts-hdms" placeholder="请对活动分享进行描述"></textarea>
					<p style="position:absolute;top:25px;right:30px"><span id="text-count1">0</span>/200</p>
				</div>
				<div style="height:32px;line-height: 32px;margin-top: 25px;">
					<p style="float: left;font-size: 18px;color:#444444;margin-right:20px">活动链接</p>
					<input type="text" id="hdts-hdlj" autocomplete="off" placeholder="请输入H5链接">
				</div>
				<div style="height:32px;line-height: 32px;margin-top: 25px;">
					<div style="clear: both;content: '';display:table;margin:0 auto">
						<p id="hdts-queding">确定</p>
						<p id="hdts-quxiao">取消</p>
					</div>
					
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>

<script>
	$('.hdts-xjhd').click(function(){
		$('#xjaxghd').show()
		$('#hdtp').attr('src', './image/white-white.jpg')
		$('#hdts-hdfl1').find('option[value=""]').prop("selected", true)
		$('#hdts-hdbt').val('')
		$('#hdts-hdms').val('')
		$('#hdts-hdlj').val('')
		$('#text-count').html('0')
		$('#text-count1').html('0')
		$('#hdts-queding').unbind()
		$('#hdts-queding').click(function(){
			xjhd()
		})
	})
	$('#xjhd-gb').click(function(){
		$(this).parent().parent().hide()
	})
	$('#hdts-quxiao').click(function(){
		$(this).parent().parent().parent().parent().hide()
	})

	$('#shangchuan').click(function(){
		$('#fileImage').click()
	})

	// $('#hdts-queding').click(function(){
	// 	xjhd()
	// })

	//查询
	$('#hdts-cx').click(function(){
		shouye()
	})

	//清除
	$('#hdts-qc').click(function(){
		$('#sstwxx').val('')
		$('#hdts-hdfl').find('option[value=""]').prop("selected", true);
		$('#cjsjs').val('')
		$('#cjsje').val('')
		shouye()
	})

	time()

	shouye()

	xiala()

	jscaozuo()

	function jscaozuo(){
		$("#hdts-hdbt").on("input propertychange", function () {
			var $this = $(this),
				_val = $this.val(),
				count = "";
			if (_val.length > 20) {
				$this.val(_val.substring(0, 20));
			}
			count = $this.val().length;
			$("#text-count").text(count);
		}); 
		$("#hdts-hdms").on("input propertychange", function () {
			var $this = $(this),
				_val = $this.val(),
				count = "";
			if (_val.length > 200) {
				$this.val(_val.substring(0, 200));
			}
			count = $this.val().length;
			$("#text-count1").text(count);
		});
	}

	function time(){
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

	function shouye(){
		var onPagechange = function (page) {
			aaaaaa(page)
		}

		var page = 1;
		aaaaaa(page)

		function aaaaaa(page) {

			var paramscoach = {
				page: page,
				rows: 10,
				param: {
					name: $('#sstwxx').val(),
					status : $('#hdts-hdfl').val(),
					startDate: $('#cjsjs').val(),
					endDate : $('#cjsje').val()
					//leagueCurriculumId:$('#jlgl-kcmc').bal()
				}
			}

			$.ajax({
				type: 'POST',
				contentType: "application/json;charset=UTF-8",
				url: "rest/activePushLink/getActivePushLinkListInfo",
				data: JSON.stringify(paramscoach),
				success: function (result) {
					console.log(result)

					function sjtz(str){
						var aa = str.split(' ')[0]
						return aa
					}
					//整个表格的内容
					var str2 = ''
					$.each(result.rows, function (i, item) {
						str2 += `
                        <tr class="course-coach-manage-table-tr">
                            <td style="width:item1">`+ (i + 1 + (paramscoach.page - 1) * paramscoach.rows) + `</td>
                            <td style="width:item2"><img style="width:84px;height:84px" src="images/`+ item.activeImgUrl +`" alt=""></td>
                            <td style="width:item3">`+ item.activeTitle + `</td>
                            <td style="width:item4">`+ item.activeType + `</td>
                            <td style="width:item4">`+ sjtz(item.createDate) + `</td>
                            <td style="width:item4">`+ item.activePushLinkNum + `</td>
                            <td class="item5" style="text-align:center;" id="`+ item.linkId +`">
								<div style="clear: both;content: '';display:table;margin:0 auto">
									<p class="bianji" style="color:#71B2EF;cursor:pointer;float: left;">编辑</p>
									<p style="float: left;margin:0 5px;color:#71B2EF">|</p>
									<p class="shanchu" style="color:#71B2EF;cursor:pointer;float: left;">删除</p>
								</div>
							</td>
                        </tr>
                    `
					})
					$('#sj-body-body1').html(str2)

					//编辑按钮点击事件
					// $('.course-coach-manage-a').click(function () {
					// 	var jobNumber = $(this).parent().parent().children().eq(2).html()
					// 	jlck(jobNumber)
					// })

					$('.shanchu').click(function(){
						var id = $(this).parent().parent().attr('id')
						shanchu(id)
					})

					$('.bianji').click(function(){
						var id = $(this).parent().parent().attr('id')
						
						bianji(id)
						
					})

					var jiluhtml = `
						<p>共`+ result.total +`条,每页10条</p>
					`
					$('#jilu').html(jiluhtml)
					var obj = {
						wrapid: 'boxpage', //页面显示分页器容器id
						total: result.total, //总条数
						pagesize: 10, //每页显示10条
						currentPage: page, //当前页
						onPagechange: onPagechange,
						btnCount: 5 //页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
					}

					pagination.init(obj);


				},
				error: function (e) {
					console.log(e.status);
					console.log(e.responseText)
				}
			})

		}
	}

	function imageimage(){
		if ($("#fileImage").val() == '') {
			return;
		}

		let file = $("#fileImage").val()
		let filename = file.substr(file.lastIndexOf("."));
		if (filename != '.png' && filename != '.jpeg' && filename != '.jpg' && filename != '.PNG' && filename != '.JPEG' && filename != '.JPG') {
			alert("请上传图片格式的文件");
			return;
		}
		var formData = new FormData();
		formData.append('file', document.getElementById('fileImage').files[0])
		$.ajax({
			url: "rest/activePushLink/uploadActivePushLinkFile",
			type: "post",
			data: formData,
			contentType: false,
			processData: false,
			success: function (data) {
				if(data.message = '上传成功!'){
					alert('上传成功!')
					$('#hdtp').attr('src', 'images/' + data.rows[0].path)
					$('#hdtp').attr('class', data.rows[0].path)
					$('#fileImage').val('')
				}else{
					alert('上传失败!')
				}
				
				//var img = data
				//return data
				
			},
			error: function (data) {
				alert("上传失败")
			}
		});
	}

	function xiala(){
		var paramsGroupType = {
			typeCode: "activityType"
		}

		$.ajax({
			type: 'POST',
			contentType: "application/json;charset=UTF-8",
			url: "rest/wx/dictionnary/getdictionnarylist",
			data: JSON.stringify(paramsGroupType),
			success: function (result) {
				var strGroupType = '';
				var strGroupType1 = '';
				//console.log(result)
				strGroupType = `
                       <option value="" selected="selected">全部</option>
                    `
				$.each(result.rows, function (i, item) {
					strGroupType += `
                            <option value="`+ item.dictionaryId + `">` + item.name + `</option>
                        `
				})
				var strGroupType1 = '';
				//console.log(result)
				strGroupType1 = `
                       <option value="" selected="selected"></option>
                    `
				$.each(result.rows, function (i, item) {
					strGroupType1 += `
                            <option value="`+ item.dictionaryId + `">` + item.name + `</option>
                        `
				})
				$('#hdts-hdfl').html(strGroupType)
				$('#hdts-hdfl1').html(strGroupType1)
			},
			error: function (e) {
				console.log(e.status);
				console.log(e.responseText)
			}
		})
	}

	function xjhd(){

		if($('#hdtp').attr('class') == ''){
			alert('请上传图片')
			return;
		}

		if ($('#hdts-hdfl1').val() == '') {
			alert('请选择活动分类')
			return;
		}

		if ($('#hdts-hdbt').val() == '') {
			alert('请填写活动标题')
			return;
		}

		if ($('#hdts-hdms').val() == '') {
			alert('请填写活动描述')
			return;
		}

		if ($('#hdts-hdlj').val() == '') {
			alert('请填写活动链接')
			return;
		}

		var activeImgUrl = $('#hdtp').attr('class')
		var activeType = $('#hdts-hdfl1').val()
		var activeTitle = $('#hdts-hdbt').val()
		var activeDescription = $('#hdts-hdms').val()
		var activeLink = $('#hdts-hdlj').val()

		var fd = {
			activeImgUrl : activeImgUrl,
			activeType : activeType,
			activeTitle : activeTitle,
			activeDescription : activeDescription,
			activeLink : activeLink
		}

		$.ajax({
			type: 'POST',
			url: "rest/activePushLink/insertActivePushLink",
			contentType: "application/json",  //multipart/form-data;boundary=--xxxxxxx   application/json,
			data: JSON.stringify(fd),
			success: function (result) {
				if(result.message = '新增成功!'){
					alert('新增成功！')
					$('#xjaxghd').hide()
					shouye()
				}
				console.log(result)
			},
			error: function (e) {
				console.log(e.status);
				console.log(e.responseText)
			}
		})

	}

	function shanchu(id){
		var params = {
			linkId : id
		}

		$.ajax({
			type: 'POST',
			contentType: "application/json;charset=UTF-8",
			url: "rest/activePushLink/deleteActivities",
			data: JSON.stringify(params),
			success: function (result) {
				if(result.message == '删除成功!'){
					alert('删除成功')
					shouye()
				}else{
					alert('请检查参数')
				}
				
			},
			error: function (e) {
				console.log(e.status);
				console.log(e.responseText)
			}
		})
	}

	function bianji(id){
		var params = {
			linkId: id
		}

		$.ajax({
			type: 'POST',
			contentType: "application/json;charset=UTF-8",
			url: "rest/activePushLink/getActivitiesInfoById",
			data: JSON.stringify(params),
			success: function (result) {
				console.log(result)
				$('#xjaxghd').show()
				chakan(result)
				
				
			},
			error: function (e) {
				console.log(e.status);
				console.log(e.responseText)
			}
		})
	}

	function chakan(result){
		$('#hdtp').attr('class', result.activeImgUrl)
		$('#hdtp').attr('src', 'images/'+result.activeImgUrl)
		$('#hdts-hdfl1').find(`option[value="` + result.activeType + `"]`).prop("selected", true);
		$('#hdts-hdbt').val(result.activeTitle)
		$('#hdts-hdms').val(result.activeDescription)
		$('#hdts-hdlj').val(result.activeLink)
		var count = $('#hdts-hdbt').val().length
		var count1 = $('#hdts-hdms').val().length
		$('#text-count').html(count)
		$('#text-count1').html(count1)
		$('#hdts-queding').unbind()
		$('#hdts-queding').click(function () {
			 xiugai(result)
		})
	}

	function xiugai(result){
		if ($('#hdtp').attr('class') == '') {
			alert('请上传图片')
			return;
		}

		if ($('#hdts-hdfl1').val() == '') {
			alert('请选择活动分类')
			return;
		}

		if ($('#hdts-hdbt').val() == '') {
			alert('请填写活动标题')
			return;
		}

		if ($('#hdts-hdms').val() == '') {
			alert('请填写活动描述')
			return;
		}

		if ($('#hdts-hdlj').val() == '') {
			alert('请填写活动链接')
			return;
		}

		var activeImgUrl = $('#hdtp').attr('class')
		var activeType = $('#hdts-hdfl1').val()
		var activeTitle = $('#hdts-hdbt').val()
		var activeDescription = $('#hdts-hdms').val()
		var activeLink = $('#hdts-hdlj').val()
		var linkId = result.linkId

		var fd = {
			linkId : linkId,
			activeImgUrl: activeImgUrl,
			activeType: activeType,
			activeTitle: activeTitle,
			activeDescription: activeDescription,
			activeLink: activeLink
		}

		$.ajax({
			type: 'POST',
			url: "rest/activePushLink/updateActivePushLink",
			contentType: "application/json",  //multipart/form-data;boundary=--xxxxxxx   application/json,
			data: JSON.stringify(fd),
			success: function (result) {
				if (result.message = '修改成功!') {
					alert('修改成功！')
					$('#xjaxghd').hide()
					shouye()
				}
				console.log(result)
			},
			error: function (e) {
				console.log(e.status);
				console.log(e.responseText)
			}
		})
	}
</script>

</html>