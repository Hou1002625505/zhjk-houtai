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
	<style>
		html {
			border: 1px solid #95B8E7;
		}

		/*1*/
		.item1 {
			width: 3%;
		}

		/*5*/
		.item2 {
			width: 9.3%;
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
			height: 100px;
			border-right: 1px dotted #CCCCCC;
		}

		.tuancao_wrap td {
			height: 100px;
			text-align: center;
			border-left: 1px dotted #CCCCCC;
			border-bottom: 1px dotted #CCCCCC;
			font-size: 14px;
			color: #444444;
		}

		.tuancao_wrap th {
			border-top: 1px solid #71B2EE;
			border-bottom: 1px solid #71B2EE;
			font-weight: 600;
			font-size: 14px;
			color: #444444;
		}

		.tuancao_wrap td span {
			font-size: 14px;
			color: #71B2EF;
			cursor: pointer;
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
			width: 400px;
			height: 32px;
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
			width: 370px;
			height: 110px;
			background: rgba(255, 255, 255, 1);
			box-shadow: 0px 0px 20px 0px rgba(153, 153, 153, 0.5);
			border-radius: 4px;
			position: absolute;
			right: 120px;
			top: 52px;
			z-index: 999;
		}

		.removeSX {
			/*padding-top: 10px;*/
			height: 58px;
		}

		.removeSX .wz,
		.removeSX .removeBtn {
			float: left;
			padding-top: 14px;
		}

		.removeSX .wz {
			font-size: 16px;
			padding: 20px 16px 0 18px;
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
			overflow: inherit !important;
			position: relative;
		}

		.removetipred {
			width: 330px;
			margin: 0 20px;
			border-top: 1px solid #BFBFBF;
			text-align: left;
		}

		.removetipred p {
			padding-top: 14px;
			font-size: 14px;
			color: red;
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
			margin-bottom: 15px;

		}

		.tuancao_header p {
			width: 120px;
			height: 40px;
			line-height: 40px;
			background: rgba(113, 178, 239, 1);
			border-radius: 4px;
			text-align: center;
			font-size: 20px;
			color: #fff;
			margin-bottom: 20px;
		}

		.bianji {
			border-right: 2px solid #71B2EF;
			padding-right: 4px;
		}

		.xiajia {
			padding-left: 4px;
		}

		/*新建卡卷*/
		.xinjianka_wrap {
			display: none;
			background: #fff;
			width: 100%;
			min-height: 100%;
			margin-top: -10px
		}

		.xinjianka_header {
			border-bottom: 1px solid #BFBFBF;
			padding-bottom: 14px;
			border-top: 1px solid #BFBFBF;
			padding-top: 14px;
		}

		.xinjianka_header .hei {
			font-size: 20px;
			color: #444444;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			padding-right: 30px;
		}

		.xinjianka_header .bu {
			font-size: 16px;
			color: #BFBFBF;
			font-family: MicrosoftYaHei;
			font-weight: 400;
		}

		.xinjianka_con_left {
			width: 19%;
			height: 594px;
			border: 1px solid rgba(204, 204, 204, 1);
			float: left;
		}

		.xinjianka_con_left_header {
			text-align: center;
			padding: 60px 0;
		}

		.shiybtn {
			width: 104px;
			margin: 0 auto;
			height: 30px;
			line-height: 30px;
			background: rgba(4, 209, 4, 1);
			border-radius: 4px;
			font-size: 16px;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(255, 255, 255, 1);
		}

		.xinjianka_con_left .ziti {
			font-size: 16px;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(68, 68, 68, 1);
		}

		.xinjianka_con_left .shijian {
			margin: 0 auto;
			width: 94%;
			height: 40px;
			line-height: 40px;
			border-bottom: 1px solid #CCCCCC;
		}

		.xinjianka_con_left .quanyi {
			margin: 0 auto;
			width: 94%;
			height: 40px;
			line-height: 40px;
			border-bottom: 1px solid #CCCCCC;
			position: relative;
		}

		.xinjianka_con_left .mendian {
			margin: 0 auto;
			width: 94%;
			height: 40px;
			line-height: 40px;
			position: relative;
		}

		.arrow:after {
			content: " ";
			display: inline-block;
			height: 8px;
			width: 8px;
			border-width: 2px 2px 0 0;
			border-color: #c8c8cd;
			border-style: solid;
			-webkit-transform: matrix(.71, .71, -.71, .71, 0, 0);
			transform: matrix(.71, .71, -.71, .71, 0, 0);
			position: relative;
			top: -2px;
			position: absolute;
			top: 50%;
			margin-top: -6px;
			right: 4px;
		}

		.xinjianka_con_left_header img {
			width: 38px;
			padding-top: 4px;
		}

		.pcimg_wrap {
			width: 40px;
			margin: 0 auto;
			height: 40px;
			line-height: 40px;
			text-align: center;
			background: rgba(255, 255, 255, 1);
			border: 1px solid rgba(204, 204, 204, 1);
			border-radius: 50%;
		}

		.xinjianka_con_left_header .fpinpai {
			font-size: 16px;
			color: #444;
			line-height: 50px;
		}

		.xinjianka_con {
			padding-top: 20px;
			background: #fff;
		}

		.xinjianka_con_right {
			width: 79%;
			border: 1px solid rgba(204, 204, 204, 1);
			float: right;
		}

		.clear:after {
			content: '';
			display: block;
			clear: both;
		}

		.clear {
			zoom: 1;
		}

		.xinjianka_infotext {
			margin-left: 20px;
			border-bottom: 1px solid rgba(204, 204, 204, 1);
			position: relative;
		}

		.xinjianka_infotext .textflag {
			position: absolute;
			right: 10px;
			top: 22px;
			font-size: 16px;
			cursor: pointer;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(113, 178, 239, 1);
		}

		.xinjianka_infotext p {
			padding: 20px 0 20px 10px;
			font-size: 16px;
			font-family: MicrosoftYaHei;
			font-weight: 600;
			color: rgba(68, 68, 68, 1);
		}

		.xinjianka_info1item {
			padding: 25px 0 0 30px;
			font-size: 16px;
			font-family: MicrosoftYaHei;
			position: relative;
			font-weight: 400;
			color: #444444;
		}

		.xinjianka_info1item .btn {
			display: inline-block;
			text-align: center;
			width: 80px;
			height: 36px;
			margin-left: 138px;
			position: relative;
			top: 6px;
			font-size: 16px;
			cursor: pointer;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(255, 255, 255, 1);
			line-height: 36px;
			background: rgba(113, 178, 239, 1);
			border-radius: 4px;
		}

		.xinjianka_info1item .text1 {
			display: inline-block;
			width: 150px;
		}

		.xinjianka_info1item .img_wrap {
			display: inline-block;
			width: 80px;
			text-align: center;
			height: 80px;
			margin-right: 20px;
			line-height: 80px;
			background: rgba(255, 255, 255, 1);
			border: 1px solid rgba(204, 204, 204, 1);
			border-radius: 3px;
		}

		.img_wrap img {
			width: 78px;
			vertical-align: middle;
			border: none;
			height: 60px;
			padding-top: 10px;
		}

		.xinjianka_info1item .input1 {
			width: 400px;
			padding-left: 20px;
			font-size: 16px;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(68, 68, 68, 1);
			height: 32px;
			line-height: 32px;
			border: 1px solid rgba(204, 204, 204, 1);
			border-radius: 3px;
		}

		.xinjianka_info1item .input2 {
			width: 280px;
			padding-left: 20px;
			font-size: 16px;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(68, 68, 68, 1);
			height: 32px;
			line-height: 32px;
			border: 1px solid rgba(204, 204, 204, 1);
			border-radius: 3px;
		}

		.xinjianka_info1item .input3 {
			width: 187px;
			padding-left: 20px;
			font-size: 16px;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(68, 68, 68, 1);
			height: 32px;
			line-height: 32px;
			border: 1px solid rgba(204, 204, 204, 1);
			border-radius: 3px;
		}

		.select_wrap {
			position: relative;
		}

		.xinjianka_info1item .xieg {
			position: absolute;
			right: 20px;
			top: 0.2px;
		}

		.xinjianka_info1item select {
			width: 400px;
			padding-left: 20px;
			font-size: 16px;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(68, 68, 68, 1);
			height: 32px;
			line-height: 32px;
			border: 1px solid rgba(204, 204, 204, 1);
			border-radius: 3px;
			appearance: none;
			-moz-appearance: none;
			-webkit-appearance: none;
		}

		.triangle_border_down1 {
			display: inline-block;
			width: 0;
			height: 0;
			border-width: 8px 5px 0;
			border-style: solid;
			border-color: #BFBFBF transparent transparent;
			position: absolute;
			right: 10px;
			top: 3px;
		}

		.triangle_border_down {
			display: inline-block;
			width: 0;
			height: 0;
			border-width: 8px 5px 0;
			border-style: solid;
			border-color: #BFBFBF transparent transparent;
			position: absolute;
			right: 10px;
			top: 6px;
		}

		.xinjianka_info1item .fgxid {
			padding: 0 10px 0 60px;
		}

		.check_wrap .yuan {
			display: inline-block;
			width: 24px;
			height: 24px;
			position: relative;
			top: 10px;
			border: 1px solid rgba(191, 191, 191, 1);
			border-radius: 12px;
		}

		.xinjianka_info1item .youxiaotime {
			display: inline-block;
			height: 0;
		}

		.xinjianka_info1item .lingqu {
			padding-top: 30px;
		}

		.youxiaotime .text {
			font-size: 16px;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(68, 68, 68, 1);
			padding: 0 20px;
		}

		.youxiaotime .guding {
			height: 32px;
			line-height: 32px;
		}

		.youxiaotime .lingqu {
			height: 32px;
			line-height: 32px;
		}

		.xinjianka_info1item .text2 {
			position: relative;
			bottom: 25px;
		}

		.xinjianka_con_right .fpad {
			padding-top: 20px;
		}

		input::-webkit-input-placeholder {
			font-size: 14px;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(191, 191, 191, 1);
		}

		.imgupdate {
			width: 80px;
			display: inline-block;
			margin-left: 30px;
			height: 36px;
			cursor: pointer;
			line-height: 36px;
			text-align: center;
			font-size: 16px;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			color: rgba(255, 255, 255, 1);
			background: rgba(113, 178, 239, 1);
			border-radius: 3px;
		}

		.picyulan {
			width: 100px;
			display: inline-block;
			border: 1px solid rgba(204, 204, 204, 1);
			height: 100px;
		}

		.xinjianka_info1item textarea {
			width: 400px;
			height: 44px;
			resize: none;
			font-family: MicrosoftYaHei;
			padding: 10px 20px;
			font-size: 16px;
			color: #444444;
			border: 1px solid rgba(204, 204, 204, 1);
			border-radius: 3px;
		}

		.xinjianka_info1item .pesc {
			position: relative;
			bottom: 26px;
		}

		.clof {
			font-size: 12px;
			font-family: MicrosoftYaHei;
			font-weight: 400;
			padding: 0 10px;
			color: rgba(191, 191, 191, 1);
		}

		.fsavebtn {
			margin: 20px 0 20px 30px;
		}

		.fsavebtn .saveshangjia {
			width: 110px;
			display: inline-block;
			height: 40px;
			margin-right: 20px;
			cursor: pointer;
			line-height: 40px;
			text-align: center;
			font-size: 16px;
			color: #FFFFFF;
			background: rgba(113, 178, 239, 1);
			border-radius: 4px;
		}

		.fsavebtn .save,
		.fsavebtn .back {
			width: 110px;
			display: inline-block;
			height: 40px;
			margin-right: 20px;
			cursor: pointer;
			line-height: 40px;
			text-align: center;
			font-size: 16px;
			color: #444444;
			border: 1px solid rgba(191, 191, 191, 1);
			background: #fff;
			border-radius: 4px;
		}

		#addjuesebtn {
			cursor: pointer;
		}

		.xinjianka_info1item {}

		.xinjianka_info1item .ftext {
			position: relative;
			bottom: 94px;
		}

		#_easyui_textbox_input1 {
			height: 32px !important;
			line-height: 32px !important;
			font-size: 16px;
		}

		.xinjianka_info1item .fscg {
			width: 20px;
			height: 20px;
			position: relative;
			top: 6px;
		}

		.fsdate {
			width: 266px;
		}

		#couponExplain {
			width: 620px;
			height: 160px;
			float: left;
		}

		.youhs {
			float: left;
			position: relative;
			top: 60px;
		}

		.c-datepicker-single-editor .c-datepicker-data-input {
			cursor: pointer;
		}

		.textbox {
			border: 1px solid rgba(204, 204, 204, 1) !important;
			border-radius: 3px !important;
		}

		.combo-arrow {
			display: inline-block;
			width: 0 !important;
			height: 0 !important;
			border-width: 8px 5px 0;
			border-style: solid;
			border-color: #BFBFBF transparent transparent;
			position: absolute;
			right: 10px;
			top: 12px;
			background: #fff !important;
		}

		.check_wrap3 {
			display: inline-block;
			width: 30px;
			position: relative;
			top: 6px;
		}

		.check_wrap3>input {
			display: none;
		}

		.check_wrap3>label {
			position: relative;
		}

		.check_wrap3>label::before {
			display: inline-block;
			content: "";
			width: 22px;
			height: 22px;
			border-radius: 50%;
			border: 1px solid #BFBFBF;
			margin-right: 6px;
			vertical-align: bottom;
		}

		.check_wrap3>input:checked+label::before {
			background-color: #fff;
		}

		.check_wrap3>input:checked+label::after {
			display: inline-block;
			content: "";
			width: 14px;
			height: 14px;
			border-radius: 50%;
			position: absolute;
			left: 4px;
			bottom: 8px;
			background-color: #71B2EF;
		}

		.edior {
			border: 1px solid #f8f8f8;
			height: 201px;
			width: 620px;
			margin-top: 20px;
		}

		.fzlogo {
			position: relative;
			top: 6px;
		}

		.pingpainame {
			position: relative;
			top: 6px;
		}

		.fztextarea_wrap {
			position: relative;
			width: 620px;
			height: 150px;
			display: inline-block;
		}

		.fztextarea_wrap .shuzil {
			position: absolute;
			right: 10px;
			bottom: 0;
		}

		.check_wrap3 .fzradio {
			display: inline-block;
			width: 24px;
			height: 24px;
			background: url(images/pcradiono.png) no-repeat;
			background-size: 100%;
		}

		.fangactive .fzradio {
			display: inline-block;
			width: 24px;
			height: 24px;
			background: url(images/pcradioche.png) no-repeat;
			background-size: 100%;
		}

		.tdwrap p {
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}

		#gxidflag1 {
			display: none;
		}

		.radiselect {
			position: relative;
		}

		.store {
			position: absolute;
			width: 824px;
			height: 465px;
			background: rgba(255, 255, 255, 1);
			box-shadow: 0px 0px 10px 0px rgba(153, 153, 153, 0.3);
			border-radius: 4px;
			left: 180px;
			top: 130px;
			z-index: 99;
			padding: 20px 40px;
			display: none;
		}

		.store .title {
			position: relative;
			font-size: 20px;
			font-weight: 400;
			color: rgba(68, 68, 68, 1);
		}

		.store .title .storeClose,
		.store .title .storeClose1 {
			width: 23px;
			position: absolute;
			right: 0;
			top: 0;
			cursor: pointer;
		}

		.storeSS {
			width: 340px;
			height: 32px;
			line-height: 32px;
			background: rgba(255, 255, 255, 1);
			border: 1px solid rgba(191, 191, 191, 1);
			border-radius: 4px;
			margin-top: 38px;
		}

		.storeSS input {
			width: 300px;
			height: 32px;
			line-height: 32px;
			padding: 0 14px;
			float: left;
			outline: none;
			border: none;
			border-radius: 4px;
		}

		.storeSS .btns {
			width: 40px;
			height: 28px;
			background: rgba(116, 178, 237, 1);
			border-radius: 0px 4px 4px 0px;
			float: left;
			text-align: center;
			padding-top: 4px;
			cursor: pointer;
		}

		.storeSS .btns img {
			width: 23px;
		}

		.store .shop {
			width: 744px;
			height: 286px;
			border: 1px solid rgba(191, 191, 191, 1);
			border-radius: 4px;
			margin-top: 10px;
			padding: 5px 15px;
			overflow-y: auto;
		}

		.store .shop .allselest,
		.store .shop .allselest1 {
			font-size: 14px;
			font-weight: 400;
			color: rgba(68, 68, 68, 1);
			cursor: pointer;
		}

		.store .shop .allselest img,
		.store .shop .allselest1 img {
			width: 16px;
			vertical-align: middle;
			margin-right: 15px;
			margin-top: -3px;
		}

		.store .wcheng,
		.store .wcheng1 {
			width: 80px;
			height: 32px;
			line-height: 32px;
			text-align: center;
			background: rgba(116, 178, 237, 1);
			border-radius: 4px;
			font-size: 14px;
			color: rgba(255, 255, 255, 1);
			margin-top: 19px;
			cursor: pointer;
		}

		.storeList,
		.storeList1 {
			width: 100%;
		}

		.storeList .item,
		.storeList1 .item {
			width: 50%;
			float: left;
			font-size: 14px;
			font-weight: 400;
			cursor: pointer;
			color: rgba(68, 68, 68, 1);
		}

		.storeList .item img,
		.storeList1 .item img {
			width: 16px;
			vertical-align: middle;
			margin-right: 15px;
			margin-top: -3px;
		}

		.selectShop {
			position: relative;
			width: 824px;
			overflow: hidden;
			border: 1px solid rgba(204, 204, 204, 1);
			border-radius: 3px;
			margin-left: 180px;
			padding: 15px 20px;
			display: none;
			padding-bottom: 0;
			margin-top: 15px;
		}

		.selectShop .arrow {
			position: absolute;
			top: 0;
			right: 0.2rem;
			width: 0.3rem;
			height: 0.3rem;
			float: right;
			border-top: 0.02rem solid #fff;
			border-right: 0.02rem solid #fff;
			transform: rotate(135deg);
			-webkit-transform: rotate(135deg);
			margin-top: 34rpx;
		}

		.selectShop .clubname {
			position: relative;
			height: 30px;
			line-height: 30px;
			text-align: center;
			padding: 0 14px;
			background: rgba(245, 245, 245, 1);
			border-radius: 4px;
			font-size: 14px;
			font-weight: 400;
			color: rgba(68, 68, 68, 1);
			float: left;
			margin-right: 20px;
			cursor: pointer;
			border: 1px solid rgb(245, 245, 245, 1);
			margin-bottom: 15px;
		}

		.selectShop .clubname:hover {
			border: 1px solid rgba(113, 178, 239, 1);
		}

		.selectShop .clubname img {
			position: absolute;
			width: 15px;
			right: -5px;
			top: -5px;
			display: none;
		}

		.selectShop .clubname:hover img {
			display: block;
		}

		.selectBtn,
		.selectBtn1 {
			display: inline-block;
			width: 100px;
			height: 32px;
			text-align: center;
			line-height: 32px;
			background: rgba(113, 178, 239, 1);
			border-radius: 3px;
			font-size: 14px;
			color: rgba(255, 255, 255, 1);
			margin-left: 146px;
			cursor: pointer;
		}

		.selectShop span {
			position: absolute;
			top: 30%;
			left: 50%;
			margin-left: -100px;
			width: 0;
			height: 0;
			border-style: solid;
			border-width: 0 100px 100px 100px;
			border-color: transparent transparent #362a98 transparent;
		}

		.selectShop span i {
			position: absolute;
			left: -96px;
			top: 2px;
			width: 0;
			height: 0;
			border-style: solid;
			border-width: 0 96px 96px 96px;
			border-color: transparent transparent #eee transparent;
			-webkit-transition: all 0.3s ease-in-out;
			transition: all 0.3s ease-in-out;
		}

		.activityPic {
			width: 120px;
			height: 150px;
			border-radius: 3px;
			border: 1px solid rgba(204, 204, 204, 1);
			float: left;
		}

		.activityPic1 {
			width: 120px;
			height: 60px;
			border: 1px solid rgba(204, 204, 204, 1);
			border-radius: 3px;
			float: left;
		}

		.activityPic2 {
			width: 120px;
			height: 150px;
			border: 1px solid rgba(204, 204, 204, 1);
			border-radius: 3px;
			float: left;
		}

		.uploadss {
			width: 60px;
			height: 32px;
			line-height: 32px;
			text-align: center;
			background: rgba(113, 178, 239, 1);
			border-radius: 4px;
			font-size: 14px;
			color: rgba(255, 255, 255, 1);
			float: left;
			margin-left: 100px;
			cursor: pointer;
		}

		.complimentarystore {
			display: none;
		}

		.fanhuisj {
			font-size: 16px;
			font-family: Microsoft YaHei;
			font-weight: 400;
			color: rgba(113, 178, 239, 1);
			height: 40px;
			line-height: 35px;
			cursor: pointer;
		}
	</style>
</head>

<body>
	<table id="dg" style="width: 100%; height: 100%">
	</table>
	<!--<div id="tb" style="height: auto">
		<shiro:hasPermission name="100207">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-menuaddtyk',plain:true"
				onclick="addCouponCard()">添加体验卡</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-menubj',plain:true"
				onclick="updateCouponCard()">编辑</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-menujieshu',plain:true"
				onclick="endCouponCard()">结束</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"
				data-options="iconCls:'icon-menusetHB',plain:true" onclick="addImg()">设置海报</a>
		【有效日期】：<input class="easyui-datebox" name="startDate" id="startDate"
				data-options="editable:false,showSeconds:false" />
			-<input class="easyui-datebox" name="endDate" id="endDate"
				data-options="editable:false,showSeconds:false" />
		【卡名称】：<input id="cardName" style="width:100px" type="text" />
		【卡类型】：<select name="packageType" id="packageType">
				<option value="0" selected="selected">健身</option>
				<option value="1">美容</option>
			</select>
		【使用范围】：<select name="useRange" id="useRange">
				<option value="0" selected="selected">通用</option>
				<option value="1">单店</option>
			</select>
			<input id="query" name="query" type="button" value="查询"
				class="button" onClick="query()" />
		</shiro:hasPermission>
	</div>-->
	<div class="tuancao_wrap">
		<div class="tuancao_header">
			<div class="tuancao_header">
				<p id="addjuesebtn">新建卡券</p>
			</div>
			<label style="padding-left:0!important;">赠送原因</label>
			<span class="select_wrap">
				<select name="visitstatus" id="zengjuanyuany">
					<option value="" selected="selected">全部</option>
					<option value="1">通用</option>
					<option value="2">交款赠送</option>
					<option value="3">消耗赠送</option>
					<option value="4">关注公众号赠送</option>
					<option value="5">注册sCRM赠送</option>
					<option value="6">首次绑卡赠送 </option>
					<option value="7">消费评价赠送</option>
					<option value="8">消费次数兑换</option>
				</select><em class="triangle_border_down1"></em></span>
			<label>卡券类型</label>
			<span class="select_wrap">
				<select name="visitstatus" id="kajuanlei">
					<option value="" selected="selected">全部</option>
					<option value="0">体验卡</option>
					<option value="1">线下现金券</option>
					<option value="2">现金券</option>

				</select><em class="triangle_border_down1"></em></span>
			<label>卡券状态</label>
			<span class="select_wrap">
				<select name="visitstatus" id="kajuanstatus">
					<option value="" selected="selected">全部</option>
					<option value="0">上架</option>
					<option value="1">下架</option>

				</select><em class="triangle_border_down1"></em></span>
			<span class="querybtn" id="fangquerybtn" onclick="pingjialist()">查询</span><span class="clearbtn"
				onclick="clearcondition()">清除</span>

		</div>


		<div class="tuandatalist_wrap" id="fangcardlist" style="margin-top:20px;">
			<table style=" border-collapse:collapse;width:100%;table-layout: fixed;">
				<tr
					style="border: 1px solid #71B2EE;height:40px;background: linear-gradient(to bottom, #EFF5FF 0, #E0ECFF 100%);background-color: #E0ECFF;">
					<th class="item item1 ">序号</th>
					<th class="item item2 ">卡券名称</th>
					<th class="item item3 ">卡券类型</th>
					<th class="item item3 ">卡券价值</th>
					<th class="item item2 ">有效期</th>
					<th class="item item2 ">赠送原因</th>
					<th class="item item4 ">赠送比例</th>
					<th class="item item5 ">卡券权益</th>
					<th class="item item3 ">卡券状态</th>
					<th class="item item3 ">是否隐藏</th>
					<th class="item item2 ">操作</th>

				</tr>
				<tbody id="fangdatalist_wrap">
					<!--<tr>
				<td class="item item1 ">序号</td>
				<td class="item item2 ">卡券名称</td>
				<td class="item item3 ">卡券类型</td>
				<td class="item item3 ">卡券价值</td>
				<td class="item item2 ">有效期</td>
				<td class="item item2 ">赠送原因</td>
				<td class="item item4 ">赠送比例</td>
				<td class="item item5 ">卡券权益</td>
			    <td class="item item2 ">适用门店</td>
			    <td class="item item3 ">卡券状态</td>
			     <td class="item item3 ">是否隐藏</td>
			      <td class="item item2 "><span class="bianji">编辑</span><span class="xiajia">下架</span></td>
			</tr>-->


				</tbody>
			</table>
		</div>


		<div class="box" id="boxpage"></div>
	</div>

	<div class="xinjianka_wrap">
		<div class="fanhuisj backs">返回上一级</div>
		<div class="xinjianka">
			<div class="xinjianka_header">
				<span class="hei">创建卡券</span> <span class="bu">1.填写卡券信息&nbsp&nbsp2.卡券功能设置 &nbsp&nbsp3.员工体验卡分享海报设置</span>
			</div>
			<div class="xinjianka_con clear">
				<div class="xinjianka_con_left">
					<div class="xinjianka_con_left_header">
						<div class="pcimg_wrap"><img src="images/pczhanghanglogo.png" id="pcimglogo" /></div>
						<p class="fpinpai">中航健身会</p>
						<p class="shiybtn">使用</p>
					</div>
					<div class="shijian ziti"><span></span>可用时间:2019-06-23</div>
					<div class="quanyi ziti">使用须知<span class="arrow"></span></div>
					<div class="mendian ziti">门店地址<span class="arrow"></span></div>
				</div>
				<div class="xinjianka_con_right">
					<div class="xinjianka_infotext">
						<p>基本信息</p>
					</div>
					<form method="post" id="couponform" name="couponform" enctype="multipart/form-data">
						<div class="xinjianka_info1">
							<!--<input type="hidden" name="couponId" id="couponId" />-->
							<div class="xinjianka_info1item">
								<input type="file" id="lmyfiless" name="file" style="display: none;"
									onchange="f_change1(this);" />
								<span class="text1 fzlogo">logo</span><span class="img_wrap"><img
										src="images/pczhanghanglogo.png" border="1" width="80" height="80"
										id="ltemplateName" /></span><span class="pingpainame">中航健身会</span><span
									class="btn" onclick="ffangupodfile()">上传</span>
							</div>
							<div class="xinjianka_info1item">
								<span class="text1">卡券颜色</span><span class="select_wrap"><input type="text"
										class="input1" name="couponColor" id="couponColor" /></span>
							</div>
							<div class="xinjianka_info1item">
								<span class="text1">卡券名称</span><span class="select_wrap"><input type="text"
										class="input1" name="packageName" id="packageName" />
									<!--<em class="xieg"><i id="remain">0</i>/9</em>--></span>
							</div>

							<div class="xinjianka_info1item">
								<span class="text1">对内名称</span><span class="select_wrap"><input type="text"
										class="input1" name="internalName" id="internalName" />
									<!--<em class="xieg"><i id="remain">0</i>/9</em>--></span>
							</div>

							<div class="xinjianka_info1item">
								<span class="text1">卡券类型</span><span class="select_wrap"><select id="kajuanleixing"
										name="couponType">
										<option value="0" selected="selected">体验卡</option>
										<option value="1">线下现金券</option>
										<option value="2">现金券</option>
									</select><em class="triangle_border_down"></em></span><span id="gxidflag"><span
										class="fgxid">广信套餐ID</span><input type="text" class="input1" name="packageIdGx"
										id="packageIdGx" /></span>
								<span id="gxidflag1"><span class="fgxid">现金券面额</span><input type="number" class="input1"
										name="amount" id="packageIdGx1" /></span>
							</div>
							<!--<div class="xinjianka_info1item">
		       	       	          <span class="text1">开始时间</span><div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"><input type="text" id="validDateStart" name="validDateStart" autocomplete="off" name="" placeholder="请选择开始时间" class=" c-datepicker-data-input only-date" value=""> </div>
		       	             </div>-->
							<div class="xinjianka_info1item">
								<span class="text1 text2">有效期</span>
								<div class="youxiaotime">
									<div class="guding radiselect">
										<span class="check_wrap check_wrap3"><span class="fzradio"></span></span><span
											class="text ">固定日期</span>
										<div
											class="fsdate c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10 fcguding">
											<input type="text" name="validDateEnd" id="validDateEnd" autocomplete="off"
												placeholder="请选择时间" class=" c-datepicker-data-input only-date" value="">
										</div>
									</div>
									<div class="lingqu radiselect">
										<span class="check_wrap check_wrap3"><span class="fzradio"></span></span><span
											class="text ">领取后，</span>
										<div
											class="fsdate c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10 fcnoguding">
											<input type="text" name="useDate" id="useDate" autocomplete="off"
												placeholder="请选择时间" class=" c-datepicker-data-input only-date" value="">
										</div><span class="text ">生效，有效天数</span><input type="text" class="input2"
											name="getLimit" id="getLimit" />
									</div>
								</div>
							</div>
						</div>
						<div class="xinjianka_infotext fpad">
							<p>优惠详情</p>
						</div>
						<div class="xinjianka_info1">
							<div class="xinjianka_info1item">
								<span class="text1">卡券价值</span><input type="text" class="input1" name="denomination"
									id="denomination" />
							</div>
							<div class="xinjianka_info1item">
								<span class="text1">赠劵类型</span><span class="select_wrap"><select name="couponsReason"
										id="couponsReason">
										<option value="1" selected="selected">通用</option>
										<option value="2">交款赠送</option>
										<option value="3">消耗赠送</option>
										<option value="4">关注公众号赠送</option>
										<option value="5">注册sCRM赠送</option>
										<option value="6">首次绑卡赠送 </option>
										<option value="7">消费评价赠送</option>
										<option value="8">消费次数兑换</option>
									</select><em class="triangle_border_down"></em></span><span id="fzzsbl"
									style="display: none;"><span class="fgxid">赠送比例</span><input type="text"
										class="input1" name="couponPercent" id="couponPercent" /></span>
							</div>
							<div class="xinjianka_info1item complimentarystore">
								<span class="text1">可赠送门店</span>
								<div class="youxiaotime">
									<div class="guding radiselect" id="selmed1" data-index="0">
										<span class="check_wrap check_wrap3"><span class="fzradio"></span></span><span
											class="text ">通用</span>
									</div>
									<div class="lingqu radiselect" id="selmed" data-index="1">
										<span class="check_wrap check_wrap3"><span class="fzradio"></span></span><span
											class="text ">指定适用门店 <span class="selectBtn">添加适用门店</span></span>
									</div>
									<div class="lingqu">
										<div class="store" id="store">
											<div class="title">选择门店 <img src="../../images/delapicture_btn.png"
													class="storeClose" /></div>
											<div class="storeSS">
												<input type="text" name="" id="mdSearch" value=""
													placeholder="输入门店名称" />
												<div class="btns"><img src="../../images/search_btn.png" /></div>
											</div>
											<div class="shop">
												<div class="allselest"><img src="../../images/codeallnor_btn.png" />全选
												</div>
												<div class="data" id="storeList">
												</div>
											</div>
											<div class="wcheng">完成</div>
										</div>
									</div>
								</div>
								<input type="hidden" class="input1" name="clubId" id="clubId" />
								<!--<span class="select_wrap">
										<select class="easyui-combogrid" id="clubId" name="clubId" 
						data-options="
							panelWidth: 400,
							multiple: true,
							idField: 'clubId',
							textField: 'clubName',
							url: 'rest/evaluationReport/getClubList',
							method: 'post',
							labelPosition: 'left',
							columns: [[ 
								{field:'ck',checkbox:true},
								{field:'clubName',title:'会所名称',width:80}
							]],
							fitColumns: true
						">
						</select>-->
							</div>
							<div class="selectShop" id="selectShop">
								<div class="data" id="selectmd">
									<!--<div class="clubname">1866健身分店 <img src="../../images/classdel_btn.png"/></div>-->

								</div>
							</div>
							<div class="xinjianka_info1item">
								<span class="text1">活动名称</span><span class="select_wrap"><input type="text"
										class="input1" name="activityName" id="activity" /></span>
							</div>
							<!--<div class="xinjianka_info1item">
		       	       	          <span class="text1">发券渠道</span><span class="select_wrap"><select name="channel" id="channel">
						   	 	       							
						   	 	</select><em class="triangle_border_down"></em></span>
		       	             </div>-->
							<div class="xinjianka_info1item">
								<span class="text1">发券数量</span><span class="select_wrap"><input type="text"
										class="input1" name="couponCount" id="couponCount" /></span>
							</div>
							<div class="xinjianka_info1item">
								<span class="text1">每人限领</span><span class="select_wrap"><input type="text"
										class="input1" name="limitCustomer" id="limitCustomer" /></span>
							</div>
							<div class="xinjianka_info1item">
								<span class="text1">允许员工分享</span><span class="select_wrap"><select name="isHide"
										id="isHide">
										<option value="0" selected="selected">可分享</option>
										<option value="1">不可分享</option>
									</select><em class="triangle_border_down"></em></span>
							</div>
							<div class="xinjianka_info1item">
								<span class="text1">是否可赠送</span><span class="select_wrap"><select name="isGive"
										id="isGive">
										<option value="0" selected="selected">是</option>
										<option value="1">否</option>
									</select><em class="triangle_border_down"></em></span>
							</div>
							<div class="xinjianka_info1item">
								<span class="text1">是否可用</span><span class="select_wrap"><select name="isUse"
										id="isUse">
										<option value="0" selected="selected">可用</option>
										<option value="1">不可用</option>
									</select><em class="triangle_border_down"></em></span>
							</div>
							<div class="xinjianka_info1item">
								<span class="text1">适合门店</span>
								<div class="youxiaotime">
									<div class="guding radiselect" id="selmd1" data-index="3">
										<span class="check_wrap check_wrap3"><span class="fzradio"></span></span><span
											class="text ">通用</span>
									</div>
									<div class="lingqu radiselect" id="selmd" data-index="4">
										<span class="check_wrap check_wrap3"><span class="fzradio"></span></span><span
											class="text ">指定适用门店 <span class="selectBtn1">添加适用门店</span></span>
									</div>
									<div class="lingqu">
										<div class="store" id="store1">
											<div class="title">选择门店 <img src="../../images/delapicture_btn.png"
													class="storeClose1" /></div>
											<div class="storeSS">
												<input type="text" name="" id="mdSearch1" value=""
													placeholder="输入门店名称" />
												<div class="btns"><img src="../../images/search_btn.png" /></div>
											</div>
											<div class="shop">
												<div class="allselest1"><img src="../../images/codeallnor_btn.png" />全选
												</div>
												<div class="data" id="storeList1">
												</div>
											</div>
											<div class="wcheng1">完成</div>
										</div>
									</div>
								</div>
								<input type="hidden" class="input1" name="hxClubId" id="hxClubId" />
								<!--<span class="select_wrap">
										<select class="easyui-combogrid" id="clubId" name="clubId" 
						data-options="
							panelWidth: 400,
							multiple: true,
							idField: 'clubId',
							textField: 'clubName',
							url: 'rest/evaluationReport/getClubList',
							method: 'post',
							labelPosition: 'left',
							columns: [[ 
								{field:'ck',checkbox:true},
								{field:'clubName',title:'会所名称',width:80}
							]],
							fitColumns: true
						">
						</select>-->
							</div>
							<div class="selectShop" id="selectShop1">
								<div class="data" id="selectmd1">
									<!--<div class="clubname">1866健身分店 <img src="../../images/classdel_btn.png"/></div>-->

								</div>
							</div>
							<input type="file" name="collection" id="collection" value="" style="display:none" />
							<input type="file" name="buttonBackground" id="buttonBackground" value=""
								style="display:none" />
							<input type="file" name="collectionSuccess" id="collectionSuccess" value=""
								style="display:none" />


							<div class="xinjianka_info1item" style="height:180px;">
								<div class="youhs text1">
									<p>优惠说明</p>
									<p>（选填）</p>
								</div>
								<div class="fztextarea_wrap">
									<textarea name="couponExplain" id="couponExplain" placeholder="请输入自定义优惠说明内容"
										maxlength="300"></textarea>
									<div class="shuzil"><span id="textremain">0</span>/300</div>
								</div>
							</div>
							<div class="xinjianka_info1item">
								<span class="text1 ftext">使用须知</span>
								<span class="select_wrap">
									<textarea rows="" cols=""
										name="packageDes" id="packageDes" style="display:none"
										maxlength="300">
									</textarea>
									<iframe src="editor/index.html" width="620px" height="160px" name="child"
										class="edior">
									</iframe>
									</span>
							</div>
							<div class="xinjianka_info1item">
								<span class="text1">分享标题</span><span class="select_wrap"><input type="text"
										class="input1" name="shareTitle" id="shareTitles" /></span>
							</div>
							<div class="xinjianka_info1item">
								<span class="text1">分享描述</span><span class="select_wrap"><input type="text"
										class="input1" name="shareContent" id="shareContents" /></span>
							</div>
							<div class="xinjianka_info1item" style="height:180px;">
								<div class="youhs text1">
									<p>活动背景图</p>
									<p>（选填）</p>
								</div>
								<div class="fztextarea_wrap">
									<img src="" class="activityPic" />
									<div id="uploadss" class="uploadss">上传</div>
								</div>
							</div>
							<div class="xinjianka_info1item" style="height:90px;">
								<div class="youhs text1" style=" top: 5px;">
									<p>活动背景按钮图</p>
									<p>（选填）</p>
								</div>
								<div class="fztextarea_wrap">
									<img src="" class="activityPic1" />
									<div id="uploadss2" class="uploadss">上传</div>
								</div>
							</div>
							<div class="xinjianka_info1item" style="height:180px;">
								<div class="youhs text1">
									<p>活动领取成功提示</p>
									<p>（选填）</p>
								</div>
								<div class="fztextarea_wrap">
									<img src="" class="activityPic2" />
									<div id="uploadss1" class="uploadss">上传</div>
								</div>
							</div>
							<!--<div class="xinjianka_info1item">
		       	       	          <span class="text1">领取页面路径</span><span class="select_wrap"><input type="text" class="input1"  name="receivePageUrl" id="receivePageUrl"/></span>（选填）
		       	             </div>
		       	               <div class="xinjianka_info1item">
		       	       	          <span class="text1">领取成功页面路径</span><span class="select_wrap"><input type="text" class="input1"  name="receiveSuccessPageUrl" id="receiveSuccessPageUrl"/></span>（选填）
		       	               </div>-->
						</div>
						<input type="hidden" name="status" value="0" id="status" />
						<input type="hidden" name="timeScope" value="" />
						<!--  <input type="hidden" name="clubId"  value="1"/>-->
					</form>
					<!--<div class="xinjianka_infotext fpad">
		       	       	  <p>海报设置 （选填）</p><p class="textflag">展开</p>
		       	       </div>-->
					<div class="xinjianka_info1 haibaoupdated">
						<form method="post" id="imgform" name="imgform" enctype="multipart/form-data">
							<input type="hidden" name="couponId" id="couponId" />
							<!--<div class="xinjianka_info1item">
		       	       	          <span class="text1">海报分享标题</span><input type="text" class="input1"  name="title" id="title"/>
		       	             </div>-->
							<!--<div class="xinjianka_info1item">
		       	             	  <input type="hidden" name="templateName" />
		       	       	          <span class="text1">海报封面</span><input type="file" name="collection" id="myfiless" onchange="f_change(this);" style="display: none;"/><input type="text"  id="myfilename" onclick="fangupodfile()" class="input1"  placeholder="图片建议尺寸：750像素*1206像素，大小不超过1M"/><span class="imgupdate" onclick="fangupodfile()">上传</span>
		       	             </div>
		       	              <div class="xinjianka_info1item">
		       	       	          <span class="text1" ></span><span class="picyulan"><img src=""
								border="1"  id="templateName" /></span>
		       	             </div>-->
							<!--<div class="xinjianka_info1item">
		       	       	          <span class="text1 pesc">海报分享描述</span><textarea name="content" id="content"></textarea>
		       	             </div>
		       	              <div class="xinjianka_info1item">
		       	       	          <span class="text1">二维码距离顶部高度</span><input type="number" class="input1" name="qrCodeTop" id="qrCodeTop"/>
		       	             </div>
		       	              <div class="xinjianka_info1item">
		       	       	          <span class="text1">二维码距离左侧距离</span><input type="number" class="input1" name="qrCodeLeft" id="qrCodeLeft"/>
		       	             </div>
		       	              <div class="xinjianka_info1item">
		       	       	          <span class="text1">二维码尺寸</span><input type="number" class="input3" placeholder="高度" name="qrCodeHeight" id="qrCodeHeight"/><span class="clof">X</span><input type="number" class="input3" placeholder="宽度" name="qrCodeWidth" id="qrCodeWidth"/>
		       	             </div>
		       	             <div class="xinjianka_info1item">
		       	       	          <span class="text1">图片宽高</span><input type="number" class="input3" placeholder="高度" name="imgHeight" id="imgHeight"/><span class="clof">X</span><input type="number" class="input3" placeholder="宽度" name="imgWidth" id="imgWidth"/>
		       	             </div>-->
						</form>
					</div>
					<div class="fsavebtn">
						<span class="saveshangjia" onclick="submitForm()">保存并上架</span><span class="save"
							onclick="fsavebtn()">保存</span><span class="backs back" id="kaback">返回</span>
					</div>
					<p id="xianshi">fasdfsfasdasdasdad</p>
				</div>
			</div>
		</div>

	</div>


	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="js/common.js"></script>
	<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="easyui/moment.min.js"></script>
	<script type="text/javascript" src="easyui/datepicker.all.js"></script>
	<script type="text/javascript" src="easyui/datepicker.en.js"></script>
	<script type="text/javascript">
	
		$('#xianshi').click(function(){
			console.log($('#packageDes').val())
			
		})

		var urls = "http://test.physicalclub.com/images/";
		//	var urls="http://crm.physicalclub.com/images/";

		var flaged = 0;//1 新建 2 编辑
		var mdisFlag = 0, FBmdisFlag = 0;//0通用，1.适用
		var kajuanid;
		var storeList = [];
		var selectstoreList = [], selectstoreList1 = [], FBselectstoreList = [], FBselectstoreList1 = [];
		storeData();
		//		门店
		function storeData() {
			$.ajax({
				type: "post",
				url: "/rest/evaluationReport/getClubList",
				contentType: "application/json;charset=UTF-8",
				dataType: "json",
				success: function (res) {
					//	console.log(JSON.stringify(res))
					storeList = res;
					for (var i = 0; i < storeList.length; i++) {
						var item = storeList[i];
						var str = '<div class="storeList" data-id="' + item.clubId + '"><div class="item storeimg"><img src="../../images/codeallnor_btn.png"/>' + item.clubName + '</div></div>';
						var str1 = '<div class="storeList1" data-id="' + item.clubId + '"><div class="item storeimg1"><img src="../../images/codeallnor_btn.png"/>' + item.clubName + '</div></div>';
						$("#storeList").append(str)
						$("#storeList1").append(str1)
					}
				},
				error: function (res) {
					console.log(res)
				}
			});
		}


		var allselestFlag = 0;
		$(".allselest").on("click", function (e) {
			e.stopPropagation();
			if (allselestFlag == 0) {
				$(".storeList").each(function () {
					var that = this;
					if ($(this).find("img").attr("src") == '../../images/codeallnor_btn.png') {
						$.each(storeList, function (index, item) {
							if ($(that).attr("data-id") == item.clubId) {
								selectstoreList.push(item)
							}
						});
					}

				})

				$(".allselest img").attr("src", "../../images/codeallset_btn.png")
				$("#storeList .item img").attr("src", "../../images/codeallset_btn.png")
				$(".storeList").addClass("set_btn");
				allselestFlag = 1;
			} else {
				$(".allselest img").attr("src", "../../images/codeallnor_btn.png")
				$("#storeList .item img").attr("src", "../../images/codeallnor_btn.png")
				$(".storeList").removeClass("set_btn");
				$(".storeList").each(function () {
					var that = $(this);
					for (var i = 0; i < selectstoreList.length; i++) {
						var item = selectstoreList[i];
						if (item.clubId == that.attr("data-id")) {
							selectstoreList.splice(i, 1);
							i--;
						}
					}
				})


				allselestFlag = 0;
			}

		})

		var FBallselestFlag = 0;
		$(".allselest1").on("click", function (e) {
			e.stopPropagation();
			if (FBallselestFlag == 0) {
				$(".storeList1").each(function () {
					var that = this;
					if ($(this).find("img").attr("src") == '../../images/codeallnor_btn.png') {
						$.each(storeList, function (index, item) {
							if ($(that).attr("data-id") == item.clubId) {
								FBselectstoreList.push(item)
							}
						});
					}

				})

				$(".allselest1 img").attr("src", "../../images/codeallset_btn.png")
				$("#storeList1 .item img").attr("src", "../../images/codeallset_btn.png")
				$(".storeList1").addClass("set_btn");
				FBallselestFlag = 1;
			} else {
				$(".allselest1 img").attr("src", "../../images/codeallnor_btn.png")
				$("#storeList1 .item img").attr("src", "../../images/codeallnor_btn.png")
				$(".storeList1").removeClass("set_btn");
				$(".storeList1").each(function () {
					var that = $(this);
					for (var i = 0; i < FBselectstoreList.length; i++) {
						var item = FBselectstoreList[i];
						if (item.clubId == that.attr("data-id")) {
							FBselectstoreList.splice(i, 1);
							i--;
						}
					}
				})


				FBallselestFlag = 0;
			}

		})

		$(document).on('click', '.storeimg', function (e) {
			e.stopPropagation();
			var that = $(this);
			if ($(this).find("img").attr("src") == "../../images/codeallset_btn.png") {
				$(this).find("img").attr("src", "../../images/codeallnor_btn.png");
				$(this).parent().removeClass("set_btn");
				for (var i = 0; i < selectstoreList.length; i++) {
					var item = selectstoreList[i];
					if (item.clubId == that.parent().attr("data-id")) {
						selectstoreList.splice(i, 1);
						i--;
					}
				}
			} else {
				$(this).find("img").attr("src", "../../images/codeallset_btn.png");
				$(this).parent().addClass("set_btn");

				$.each(storeList, function (index, item) {
					if (item.clubId == that.parent().attr("data-id")) {
						selectstoreList.push(item)
					}
				})
			}
			if ($(".set_btn").length == $(".storeList").length) {
				allselestFlag = 1;
				$(".allselest img").attr("src", "../../images/codeallset_btn.png")
			} else {
				allselestFlag = 0;
				$(".allselest img").attr("src", "../../images/codeallnor_btn.png")
			}
		})
		$(document).on('click', '.storeimg1', function (e) {
			e.stopPropagation();
			var that = $(this);
			if ($(this).find("img").attr("src") == "../../images/codeallset_btn.png") {
				$(this).find("img").attr("src", "../../images/codeallnor_btn.png");
				$(this).parent().removeClass("set_btn1");
				for (var i = 0; i < FBselectstoreList.length; i++) {
					var item = FBselectstoreList[i];
					if (item.clubId == that.parent().attr("data-id")) {
						FBselectstoreList.splice(i, 1);
						i--;
					}
				}
			} else {
				$(this).find("img").attr("src", "../../images/codeallset_btn.png");
				$(this).parent().addClass("set_btn1");

				$.each(storeList, function (index, item) {
					if (item.clubId == that.parent().attr("data-id")) {
						FBselectstoreList.push(item)
					}
				})
			}
			if ($(".set_btn1").length == $(".storeList1").length) {
				FBallselestFlag = 1;
				$(".allselest1 img").attr("src", "../../images/codeallset_btn.png")
			} else {
				FBallselestFlag = 0;
				$(".allselest1 img").attr("src", "../../images/codeallnor_btn.png")
			}
		})
		$("#mdSearch").on('input', function () {
			var searchVal = $(this).val();
			$("#storeList").html("")
			$.each(storeList, function (index, item) {
				if (item.clubName.toUpperCase().indexOf(searchVal.toUpperCase()) != -1) {
					var flag = false;
					$.each(selectstoreList, function (index1, item1) {
						if (item1.clubId == item.clubId) {
							flag = true;
						}
					})
					if (flag) {
						var str = '<div class="storeList set_btn" data-id="' + item.clubId + '"><div class="item storeimg"><img src="../../images/codeallset_btn.png"/>' + item.clubName + '</div></div>';
						$("#storeList").append(str)
					} else {
						var str = '<div class="storeList" data-id="' + item.clubId + '"><div class="item storeimg"><img src="../../images/codeallnor_btn.png"/>' + item.clubName + '</div></div>';
						$("#storeList").append(str)
					}
				}
			})
			if ($(".storeList").length == 0) {
				$(".allselest").hide();
			} else {
				$(".allselest").show();
				var arrfalg = false;
				$(".storeList").each(function () {
					if ($(this).find("img").attr("src") == '../../images/codeallnor_btn.png') {
						arrfalg = true;
					}
				})
				if (arrfalg) {
					allselestFlag = 0;
					$(".allselest img").attr("src", "../../images/codeallnor_btn.png")

				} else {
					allselestFlag = 1;
					$(".allselest img").attr("src", "../../images/codeallset_btn.png")
				}
			}

		})
		$("#mdSearch1").on('input', function () {
			var searchVal = $(this).val();
			$("#storeList1").html("")
			$.each(storeList, function (index, item) {
				if (item.clubName.toUpperCase().indexOf(searchVal.toUpperCase()) != -1) {
					var flag = false;
					$.each(FBselectstoreList, function (index1, item1) {
						if (item1.clubId == item.clubId) {
							flag = true;
						}
					})
					if (flag) {
						var str = '<div class="storeList1 set_btn1" data-id="' + item.clubId + '"><div class="item storeimg1"><img src="../../images/codeallset_btn.png"/>' + item.clubName + '</div></div>';
						$("#storeList1").append(str)
					} else {
						var str = '<div class="storeList1" data-id="' + item.clubId + '"><div class="item storeimg1"><img src="../../images/codeallnor_btn.png"/>' + item.clubName + '</div></div>';
						$("#storeList1").append(str)
					}
				}
			})
			if ($(".storeList1").length == 0) {
				$(".allselest1").hide();
			} else {
				$(".allselest1").show();
				var arrfalg = false;
				$(".storeList1").each(function () {
					if ($(this).find("img").attr("src") == '../../images/codeallnor_btn.png') {
						arrfalg = true;
					}
				})
				if (arrfalg) {
					FBallselestFlag = 0;
					$(".allselest1 img").attr("src", "../../images/codeallnor_btn.png")

				} else {
					FBallselestFlag = 1;
					$(".allselest1 img").attr("src", "../../images/codeallset_btn.png")
				}
			}

		})

		$(".wcheng").on("click", function (e) {
			e.stopPropagation();
			var List = JSON.stringify(selectstoreList);
			selectstoreList1 = JSON.parse(List);
			if (selectstoreList1.length == 0) {
				alert("请选择门店")
				return;
			}
			$("#store").hide();
			$("#selectShop").show();
			$("#selectmd").html("");
			console.log(JSON.stringify(selectstoreList1))
			$.each(selectstoreList1, function (index, item) {
				var str = '<div class="clubname" >' + item.clubName + ' <img onclick="delectshop(this,' + item.clubId + ')" src="../../images/classdel_btn.png"/></div>';
				$("#selectmd").append(str)
			})


		})

		$(".wcheng1").on("click", function (e) {
			e.stopPropagation();
			var List = JSON.stringify(FBselectstoreList);
			FBselectstoreList1 = JSON.parse(List);
			if (FBselectstoreList1.length == 0) {
				alert("请选择门店")
				return;
			}
			$("#store1").hide();
			$("#selectShop1").show();
			$("#selectmd1").html("");
			console.log(JSON.stringify(FBselectstoreList1))
			$.each(FBselectstoreList1, function (index, item) {
				var str = '<div class="clubname" >' + item.clubName + ' <img onclick="delectshop1(this,' + item.clubId + ')" src="../../images/classdel_btn.png"/></div>';
				$("#selectmd1").append(str)
			})


		})

		function delectshop(em, id) {
			$(em).parent().remove();
			for (var i = 0; i < selectstoreList.length; i++) {
				var item = selectstoreList[i];
				if (item.clubId == id) {
					selectstoreList.splice(i, 1);
					i--;
				}
			}
			$(".set_btn").each(function () {
				if ($(this).attr("data-id") == id) {
					$(this).find('img').attr("src", "../../images/codeallnor_btn.png");
					$(this).removeClass("set_btn");
				}
			})
			if ($(".set_btn").length == $(".storeList").length) {
				allselestFlag = 1;
				$(".allselest img").attr("src", "../../images/codeallset_btn.png")
			} else {
				allselestFlag = 0;
				$(".allselest img").attr("src", "../../images/codeallnor_btn.png")
			}
			if (selectstoreList.length == 0) {
				$("#selectShop").hide();
				$("#store").show();
			}
			var List1 = JSON.stringify(selectstoreList);
			selectstoreList1 = JSON.parse(List1);
			console.log(JSON.stringify(selectstoreList1))
		}

		function delectshop1(em, id) {
			$(em).parent().remove();
			for (var i = 0; i < FBselectstoreList.length; i++) {
				var item = FBselectstoreList[i];
				if (item.clubId == id) {
					FBselectstoreList.splice(i, 1);
					i--;
				}
			}
			$(".set_btn1").each(function () {
				if ($(this).attr("data-id") == id) {
					$(this).find('img').attr("src", "../../images/codeallnor_btn.png");
					$(this).removeClass("set_btn1");
				}
			})
			if ($(".set_btn1").length == $(".storeList1").length) {
				FBallselestFlag = 1;
				$(".allselest1 img").attr("src", "../../images/codeallset_btn.png")
			} else {
				FBallselestFlag = 0;
				$(".allselest1 img").attr("src", "../../images/codeallnor_btn.png")
			}
			if (FBselectstoreList.length == 0) {
				$("#selectShop1").hide();
				$("#store1").show();
			}
			var List1 = JSON.stringify(FBselectstoreList);
			FBselectstoreList1 = JSON.parse(List1);
			console.log(JSON.stringify(FBselectstoreList1))
		}

		$(".selectBtn").on("click", function (e) {
			e.stopPropagation();
			$("#selmed").addClass("fangactive");
			$("#selmed1").removeClass("fangactive");
			$("#storeList .item img").attr("src", "../../images/codeallnor_btn.png")
			$(".storeList").removeClass("set_btn");
			$.each(selectstoreList1, function (index, item) {
				$(".storeList").each(function () {
					if ($(this).attr("data-id") == item.clubId) {
						$(this).find("img").attr("src", "../../images/codeallset_btn.png")
						$(this).addClass("set_btn");
					}
				})
			})
			if ($(".set_btn").length == $(".storeList").length) {
				allselestFlag = 1;
				$(".allselest img").attr("src", "../../images/codeallset_btn.png")
			} else {
				allselestFlag = 0;
				$(".allselest img").attr("src", "../../images/codeallnor_btn.png")
			}
			var List2 = JSON.stringify(selectstoreList1);
			selectstoreList = JSON.parse(List2);
			console.log(JSON.stringify(selectstoreList) + "****")
			$("#store").show();
		})

		$(".selectBtn1").on("click", function (e) {
			e.stopPropagation();
			$("#selmd").addClass("fangactive");
			$("#selmd1").removeClass("fangactive");
			$("#storeList1 .item img").attr("src", "../../images/codeallnor_btn.png")
			$(".storeList1").removeClass("set_btn1");
			$.each(FBselectstoreList1, function (index, item) {
				$(".storeList1").each(function () {
					if ($(this).attr("data-id") == item.clubId) {
						$(this).find("img").attr("src", "../../images/codeallset_btn.png")
						$(this).addClass("set_btn1");
					}
				})
			})
			if ($(".set_btn1").length == $(".storeList1").length) {
				FBallselestFlag = 1;
				$(".allselest1 img").attr("src", "../../images/codeallset_btn.png")
			} else {
				FBallselestFlag = 0;
				$(".allselest1 img").attr("src", "../../images/codeallnor_btn.png")
			}
			var List2 = JSON.stringify(FBselectstoreList1);
			FBselectstoreList = JSON.parse(List2);
			console.log(JSON.stringify(FBselectstoreList) + "****")
			$("#store1").show();
		})

		$(".storeClose").on("click", function (e) {
			e.stopPropagation();
			$("#store").hide();
		})
		$(".storeClose1").on("click", function (e) {
			e.stopPropagation();
			$("#store1").hide();
		})
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

		$(document).on('click', '.radiselect', function () {
			console.log(1)
			$(this).addClass("fangactive");
			$(this).siblings().removeClass("fangactive");
			$(this).siblings().find('input').val('')
			if ($(this).attr("data-index") == 0) {
				$("#store").hide();
				$("#selectShop").hide();

				$("#clubId").val("")
				mdisFlag = 0;
			} else if ($(this).attr("data-index") == 1) {
				$("#clubId").val("")
				if (selectstoreList1.length > 0) {
					$("#selectShop").show();
					$("#store").hide();

				} else {
					$("#selectShop").hide();
					$("#store").show();
				}
				mdisFlag = 1;
			} else if ($(this).attr("data-index") == 3) {
				$("#store1").hide();
				$("#selectShop1").hide();

				$("#hxClubId").val("")
				FBmdisFlag = 0;
			} else if ($(this).attr("data-index") == 4) {
				$("#hxClubId").val("")
				if (FBselectstoreList1.length > 0) {
					$("#selectShop1").show();
					$("#store1").hide();

				} else {
					$("#selectShop1").hide();
					$("#store1").show();
				}
				FBmdisFlag = 1;
			}
		})

		$('#useDate').click(function () {
			$('#validDateEnd').val('')
			$('#noguding').attr("checked", "checked");
			$('#gudingstyle').attr("checked", false);
		})
		$('#validDateEnd').click(function () {
			$('#useDate').val('')
			$('#getLimit').val('')
			$('#gudingstyle').attr("checked", "checked");
			$('#noguding').attr("checked", false);
		})
		$('#getLimit').click(function () {
			$('#validDateEnd').val('')
			$('#noguding').attr("checked", "checked");
			$('#gudingstyle').attr("checked", false);
		})
		$('#gudingstyle').click(function () {
			$('#useDate').val('')
			$('#getLimit').val('')

		})
		$('#noguding').click(function () {
			$('#validDateEnd').val('')

		})
		$('#packageName').keyup(function () {
			var vallen = $('#packageName').val().length;
			var remain = 9 - parseInt(vallen);
			$('#remain').html(vallen);
		})

		$(function () {
			/* 			var curr_time = new Date();
						var strDate = curr_time.getFullYear() + "-";
						strDate += curr_time.getMonth() + 1 + "-";
						strDate += curr_time.getDate() + "-";
						strDate += curr_time.getHours() + ":";
						strDate += curr_time.getMinutes() + ":";
						strDate += curr_time.getSeconds();
						$("#startDate").datebox("setValue", strDate);
						$("#endDate").datebox("setValue", strDate); */
			$(window).resize(function () {
				$('#dg').datagrid('resize', {
					width: $(window).width() - 220,
					height: $(window).height() - 40,
				});
			});
			$dg = $("#dg");
			//init($dg);
			pingjialist()
			$("#sub2").dialog({
				onClose: function () {
					$('#sub2').form('clear');
				}
			});
			$("#sub").dialog({
				onClose: function () {
					$('#sub').form('clear');
				}
			});
			$(document).keydown(function (e) {
				if (e.keyCode == 13) {
					init($dg);
				}
			});
		});

		function callChild() {
			child.window.childFunction1();
		}

		function callChild1(type) {
			if (type == 1) {
				var oei = setInterval(function () {
					var quanyi = $("#packageDes").val();
					if (quanyi != "") {
						clearInterval(oei);
						child.window.childFunction(quanyi);
					}
				}, 50)
			} else {
				var quanyi = $("#packageDes").val();
				child.window.childFunction(quanyi);
							 
			}

		}


		$('#couponExplain').keyup(function () {
			var vallen = $('#couponExplain').val().length;
			var remain = 300 - parseInt(vallen);
			$('#textremain').html(vallen);
		})


		function parentFunction(data) {
			$("#packageDes").val(data)
		}


		$('#addjuesebtn').click(function () {
			$('.xinjianka_wrap').show()
			$('.tuancao_wrap').hide()
			$('.textflag ').html('展开')

			flaged = 1;
			$('.radiselect').removeClass("fangactive")
			$('#remain').text(0);
			$('#textremain').text(0);
			$('#packageName').val('')
			//$('#kajuanleixing').val('')
			$('#validDateStart').val('')
			$('#validDateEnd').val('')
			$('#clubId').val('')
			$("#hxClubId").val('')
			$('#limitCustomer').val('')
			$('#packageDes').val('')
			$('#packageIdGx').val('')
			$('#packageIdGx1').val('')
			$('#activity').val('')
			$('#receivePageUrl').val('')
			$('#receiveSuccessPageUrl').val('')
			$('#getLimit').val('')
			$('#useDate').val('')
			$('#denomination').val('')
			// $('#couponsReason').val('')
			$('#couponPercent').val('')
			$('#couponColor').val('')
			$('#couponCount').val('')
			$('#couponExplain').val('')
			$('#internalName').val('')
			callChild1(2);
			//清空海报参数
			$("#title").val('');
			$("#content").val('');
			$("#imgWidth").val('');
			$("#imgHeight").val('');
			$("#qrCodeHeight").val('');
			$("#qrCodeWidth").val('');
			$("#qrCodeTop").val('');
			$("#qrCodeLeft").val('');
			$("#templateName").attr("src", '');
			$("#mdSearch").val("");
			$(".activityPic").attr("src", "");
			$(".activityPic1").attr("src", "");
			$(".activityPic2").attr("src", "");
			$("#ltemplateName").attr("src", "images/pczhanghanglogo.png");
			selectstoreList = [];
			selectstoreList1 = [];
			FBselectstoreList = [];
			FBselectstoreList1 = [];
			$(".allselest img").attr("src", "../../images/codeallnor_btn.png")
			$(".allselest1 img").attr("src", "../../images/codeallnor_btn.png")
			$.each(storeList, function (index, item) {
				var str = '<div class="storeList" data-id="' + item.clubId + '"><div class="item storeimg"><img src="../../images/codeallnor_btn.png"/>' + item.clubName + '</div></div>';
				$("#storeList").append(str)
				var str = '<div class="storeList1" data-id="' + item.clubId + '"><div class="item storeimg1"><img src="../../images/codeallnor_btn.png"/>' + item.clubName + '</div></div>';
				$("#storeList1").append(str)
			})
			$("#selectShop").hide();
			$("#selectShop1").hide();

		})
		$('.backs').click(function () {
			$('.tuancao_wrap').show()
			$('.xinjianka_wrap').hide()
		})
		$('.textflag').click(function () {
			if ($('.haibaoupdated').hasClass("show")) {
				$('.haibaoupdated').hide().removeClass("show");
				$('.textflag').html('展开')
			} else {
				$('.haibaoupdated').show().addClass("show");
				$('.textflag').html('收起')
			}
		})
		$('#kajuanleixing').change(function () {
			if ($(this).val() == 2 || $(this).val() == 1) {
				$('#gxidflag').hide()
				$('#gxidflag1').show()
			} else {
				$('#gxidflag').show()
				$('#gxidflag1').hide()
			}
		})
		$('#couponsReason').change(function () {
			if ($(this).val() == 2 || $(this).val() == 3) {
				$('#fzzsbl').show()
				$(".complimentarystore").show();

			} else {
				$('#fzzsbl').hide()
				$(".complimentarystore").hide();
				if ($("#selectShop").show()) {
					$("#selectShop").hide()
				}
			}
		})
		function ffangupodfile() {
			document.getElementById("lmyfiless").click();

		}
		function fangupodfile() {
			document.getElementById("myfiless").click();

		}

		var file = $('#myfiless'),
			aim = $('#myfilename');
		file.on('change', function (e) {
			//e.currentTarget.files 是一个数组，如果支持多个文件，则需要遍历
			var name = e.currentTarget.files[0].name;
			aim.val(name);
		});

		var file1 = $('#lmyfiless'),
			aim1 = $('#lmyfilename');
		file1.on('change', function (e) {
			//e.currentTarget.files 是一个数组，如果支持多个文件，则需要遍历
			var name = e.currentTarget.files[0].name;
			aim1.val(name);
		});


		//选择图片立即显示
		var reader = new FileReader();
		function f_change(file) {
			var img = document.getElementById('templateName');
			//读取File对象的数据  
			reader.onload = function (evt) {
				img.width = "100";
				img.height = "100";
				img.src = evt.target.result;
			};
			reader.readAsDataURL(file.files[0]);
		}

		//选择图片立即显示
		var reader1 = new FileReader();
		function f_change1(file1) {
			var img = document.getElementById('ltemplateName');
			var img1 = document.getElementById('pcimglogo');
			//读取File对象的数据  
			reader1.onload = function (evt) {
				img.width = "80";
				img.height = "80";
				img.src = evt.target.result;
				//				img1.src = evt.target.result;
			};
			reader1.readAsDataURL(file1.files[0]);
		}


		var id = 0;
		var $dg;
		function tihuan(item) {

			if (item == undefined || item == null) {
				item = ""
			} else {
				return item
			}
			return item
		}
		function tihuan1(item) {

			if (item == undefined || item == null) {
				item = ""
			} else {
				return item.split(' ')[0]
			}
			return item
		}
		getqudaolist()
		//获取渠道

		function getqudaolist() {

			var data = {
				typeCode: 'hdqd'
			}
			$.ajax({
				type: "post",
				url: "rest/wx/dictionnary/getdictionnarylist",
				async: false,
				contentType: "application/json;charset=UTF-8",
				dataType: "json",
				data: JSON.stringify(data),
				success: function (res) {
					console.log(res)
					var clubarray = res.rows;
					if (clubarray.length > 0) {
						for (var i = 0; i < clubarray.length; i++) {
							var club = clubarray[i];
							$("#channel").append("<option value='" + club.dictionaryId + "'>" + club.name + "</option>");
						}
					}
				},
				error: function (res) {
					console.log(res)
				}
			});

		}

		//新增体验卡,保存并上架
		function submitForm() {
			callChild();
			//			        var clubids="";
			// $("input[name='clubId']").each(function() {
			//  if(clubids==""){
			//   clubids+=$(this).val();
			//  }else{
			//   clubids+=","+$(this).val();
			//  }
			// })
			// console.log(clubids)
			var packageName = $('#packageName').val()
			var couponType = $('#kajuanleixing').val()
			var validDateStart = $('#validDateStart').val()
			var validDateEnd = $('#validDateEnd').val()
			var clubId = $('#clubId').val()
			var hxClubId = $('#hxClubId').val()
			var limitCustomer = $('#limitCustomer').val()
			var packageDes = $('#packageDes').val()
			var packageIdGx = $('#packageIdGx').val()
			var status = 0;
			var receivePageUrl = $('#receivePageUrl').val()
			var receiveSuccessPageUrl = $('#receiveSuccessPageUrl').val()
			var isHide = $('#isHide').val()
			var isGive = $('#isGive').val()
			var isUse = $('#isUse').val()
			var getLimit = $('#getLimit').val()
			var useDate = $('#useDate').val()
			var denomination = $('#denomination').val()
			var couponsReason = $('#couponsReason').val()
			var couponPercent = $('#couponPercent').val()
			var couponColor = $('#couponColor').val()
			var couponCount = $('#couponCount').val()
			var amount = $('#packageIdGx1').val()
			var activityName = $('#activity').val()
			var file1 = $("#ltemplateName").attr("src");
			var timeScope = ''


			if (packageName == null || packageName == "" || packageName == undefined) {
				alert('请填写卡券名称');
				return false;
			}
			//				        if (validDateStart == null || validDateStart == ""
			//								|| validDateStart == undefined) {
			//							alert('卡可领取时间不能为空')									
			//							return false;
			//						}
			if (couponType == 0 && packageIdGx == "") {
				alert('请填写广信套餐ID')
				return false;
			}
			console.log(22)
			console.log(validDateEnd)

			if ($('#internalName').val() == '') {
				alert('请输入对内信息')
				return false;
			}

			if (validDateEnd == "" && getLimit == "") {
				alert('卡有效期不能为空!')
				return false;
			}

			if (validDateEnd == "" && getLimit != "" && useDate == "") {
				$('#useDate').val(0)
			}
			if (denomination == null || denomination == "" || denomination == undefined) {
				alert('请填写卡券价值');
				return false;
			}
			if (couponsReason == 2 || couponsReason == 3) {
				if (couponPercent == null || couponPercent == "" || couponPercent == undefined) {
					alert('请填写赠送比例');
					return false;
				}
			}


			if (packageDes == null || packageDes == ""
				|| packageDes == undefined || packageDes === "<p><br></p>") {
				alert('使用须知不能为空')
				return false;
			}
			var clubid = "";
			if (mdisFlag == 0) {
				$.each(storeList, function (index, item) {
					if (clubid == "") {
						clubid += item.clubId;
					} else {
						clubid += "," + item.clubId;
					}
				})
			} else if (mdisFlag == 1) {
				$.each(selectstoreList1, function (index, item) {
					if (clubid == "") {
						clubid += item.clubId;
					} else {
						clubid += "," + item.clubId;
					}
				})
			}
			var FBclubid = "";
			if (FBmdisFlag == 0) {
				$.each(storeList, function (index, item) {
					if (FBclubid == "") {
						FBclubid += item.clubId;
					} else {
						FBclubid += "," + item.clubId;
					}
				})
			} else if (FBmdisFlag == 1) {
				$.each(FBselectstoreList1, function (index, item) {
					if (FBclubid == "") {
						FBclubid += item.clubId;
					} else {
						FBclubid += "," + item.clubId;
					}
				})
				console.log("JGH" + JSON.stringify(FBselectstoreList1))
			}
			if ($('#couponsReason option:selected').val() == 2 || $('#couponsReason option:selected').val() == 3) {
				$("#clubId").val(clubid)
				if ($("#clubId").val() == "") {
					alert('请选择可赠送门店')
					return false;
				}
			} else {
				$("#clubId").val("")
			}
			$("#hxClubId").val(FBclubid)
			if ($("#hxClubId").val() == "") {
				alert('请选择适合门店')
				return false;
			}
			var data = {
				'packageName': packageName,
				'couponType': couponType,
				'validDateStart': validDateStart,
				'validDateEnd': validDateEnd,
				'clubId': '安柏健身',
				'limitCustomer': limitCustomer,
				'packageDes': packageDes,
				'packageIdGx': packageIdGx,
				'receivePageUrl': receivePageUrl,
				'receiveSuccessPageUrl': receiveSuccessPageUrl,
				'isHide': isHide,
				'isGive': isGive,
				'isUse': isUse,
				'getLimit': getLimit,
				'useDate': useDate,
				'denomination': denomination,
				'couponsReason': couponsReason,
				'couponPercent': couponPercent,
				'couponColor': couponColor,
				'couponCount': couponCount,
				'file': file1,
				'timeScope': timeScope,
				'status': status,
				'kajuanid': kajuanid,
				'amount': amount,
				'activityName': activityName
			}
			console.log(data)
			//				          	$.ajax({
			//							type:"post",
			//							url:"rest/coupon/addCouponPackage",
			//							async:false,
			//							//contentType: false,
			//					        //dataType: "json",
			//							data:JSON.stringify(data),
			//							success:function(res){
			//								console.log(res)
			//							},
			//							error:function(res){
			//									console.log(res)
			//							}
			//						});  
			$('#status').val(0)
			// flaged=1新增

			setTimeout(() => {
				if (flaged == 1) {

					if ($('.textflag').html() == '收起') {
						if (checkAddImgInfo()) {
							$('#couponform').form('submit', {
								type: "POST",
								url: "rest/coupon/addCouponPackage",
								onSubmit: function () {
									return $(this).form('validate');
								},
								success: function (data) {


									console.log(data)
									var data1 = JSON.parse(data)
									console.log(data1.message)
									var id = data1.message;
									addImgTemplate(id);

								}
							});
						}
					} else {
						$('#couponform').form('submit', {
							type: "POST",
							url: "rest/coupon/addCouponPackage",
							onSubmit: function () {
								return $(this).form('validate');
							},
							success: function (data) {
								$('.xinjianka_wrap').hide()
								$('.tuancao_wrap').show()
								pingjialist()
								console.log(data)

							}
						});
					}

				} else {

					if ($('.textflag').html() == '收起') {
						if (checkAddImgInfo()) {
							$('#couponform').form('submit', {
								type: "POST",
								url: "rest/coupon/editCouponPackage?couponId=" + kajuanid,
								onSubmit: function () {
									return $(this).form('validate');
								},
								success: function (data) {
									$('.xinjianka_wrap').hide()
									$('.tuancao_wrap').show()
									pingjialist()
									console.log(data)
									addImgTemplate(kajuanid);
								}
							});
						}

					} else {
						$('#couponform').form('submit', {
							type: "POST",
							url: "rest/coupon/editCouponPackage?couponId=" + kajuanid,
							onSubmit: function () {
								return $(this).form('validate');
							},
							success: function (data) {
								$('.xinjianka_wrap').hide()
								$('.tuancao_wrap').show()
								pingjialist()
								console.log(data)

							}
						});
					}



				}
			}, 100);


		}
		
		//保存按钮
		function fsavebtn() {
			callChild();
			var packageName = $('#packageName').val()
			var couponType = $('#kajuanleixing').val()
			var validDateStart = $('#validDateStart').val()
			var validDateEnd = $('#validDateEnd').val()
			var clubId = $('#clubId').val()
			var hxClubId = $('#hxClubId').val()
			var limitCustomer = $('#limitCustomer').val()
			var packageDes = $('#packageDes').val()
			var packageIdGx = $('#packageIdGx').val()
			var status = 0;
			var receivePageUrl = $('#receivePageUrl').val()
			var receiveSuccessPageUrl = $('#receiveSuccessPageUrl').val()
			var isHide = $('#isHide').val()
			var isGive = $('#isGive').val()
			var isUse = $('#isUse').val()
			var getLimit = $('#getLimit').val()
			var useDate = $('#useDate').val()
			var denomination = $('#denomination').val()
			var couponsReason = $('#couponsReason').val()
			var couponPercent = $('#couponPercent').val()
			var couponColor = $('#couponColor').val()
			var couponCount = $('#couponCount').val()
			var file1 = $("#ltemplateName").attr("src");
			var amount = $('#packageIdGx1').val()
			var activityName = $('#activity').val()
			var timeScope = ''


			if (packageName == null || packageName == "" || packageName == undefined) {
				alert('请填写卡券名称');
				return false;
			}
			//				        if (validDateStart == null || validDateStart == ""
			//								|| validDateStart == undefined) {
			//							alert('卡可领取时间不能为空')									
			//							return false;
			//						}
			if (couponType == 0 && packageIdGx == "") {
				alert('请填写广信套餐ID')
				return false;
			}
			console.log(22)
			console.log(validDateEnd)

			if ($('#internalName').val() == '') {
				alert('请输入对内信息')
				return false;
			}

			if (validDateEnd == "" && getLimit == "") {
				alert('卡有效期不能为空!')
				return false;
			}

			if (validDateEnd == "" && getLimit != "" && useDate == "") {
				$('#useDate').val(0)
			}
			if (denomination == null || denomination == "" || denomination == undefined) {
				alert('请填写卡券价值');
				return false;
			}
			if (couponsReason == 2 || couponsReason == 3) {
				if (couponPercent == null || couponPercent == "" || couponPercent == undefined) {
					alert('请填写赠送比例');
					return false;
				}
			}
			var clubid = "";
			if (mdisFlag == 0) {
				$.each(storeList, function (index, item) {
					if (clubid == "") {
						clubid += item.clubId;
					} else {
						clubid += "," + item.clubId;
					}
				})
			} else if (mdisFlag == 1) {
				$.each(selectstoreList1, function (index, item) {
					if (clubid == "") {
						clubid += item.clubId;
					} else {
						clubid += "," + item.clubId;
					}
				})
			}
			var FBclubid = "";
			if (FBmdisFlag == 0) {
				$.each(storeList, function (index, item) {
					if (FBclubid == "") {
						FBclubid += item.clubId;
					} else {
						FBclubid += "," + item.clubId;
					}
				})
			} else if (FBmdisFlag == 1) {
				$.each(FBselectstoreList1, function (index, item) {
					if (FBclubid == "") {
						FBclubid += item.clubId;
					} else {
						FBclubid += "," + item.clubId;
					}
				})
			}
			if ($('#couponsReason option:selected').val() == 2 || $('#couponsReason option:selected').val() == 3) {
				$("#clubId").val(clubid)
				if ($("#clubId").val() == "") {
					alert('请选择可赠送门店')
					return false;
				}
			} else {
				$("#clubId").val("")
			}
			$("#hxClubId").val(FBclubid)
			if ($("#hxClubId").val() == "") {
				alert('请选择适合门店')
				return false;
			}

			if (packageDes == null || packageDes == ""
				|| packageDes == undefined || packageDes === "<p><br></p>") {
				alert('使用须知不能为空')
				return false;
			}

			$('#status').val(1);

			setTimeout(() => {
				if (flaged == 1) {

					if ($('.textflag').html() == '收起') {
						if (checkAddImgInfo()) {
							$('#couponform').form('submit', {
								type: "POST",
								url: "rest/coupon/addCouponPackage",
								onSubmit: function () {
									return $(this).form('validate');
								},
								success: function (data) {


									console.log(data)
									var data1 = JSON.parse(data)
									console.log(data1.message)
									var id = data1.message;
									addImgTemplate(id);

								}
							});
						}
					} else {
						$('#couponform').form('submit', {
							type: "POST",
							url: "rest/coupon/addCouponPackage",
							onSubmit: function () {
								return $(this).form('validate');
							},
							success: function (data) {
								$('.xinjianka_wrap').hide()
								$('.tuancao_wrap').show()
								pingjialist()
								console.log(data)

							}
						});
					}

				} else {

					if ($('.textflag').html() == '收起') {
						if (checkAddImgInfo()) {
							$('#couponform').form('submit', {
								type: "POST",
								url: "rest/coupon/editCouponPackage?couponId=" + kajuanid,
								onSubmit: function () {
									return $(this).form('validate');
								},
								success: function (data) {
									$('.xinjianka_wrap').hide()
									$('.tuancao_wrap').show()
									pingjialist()
									console.log(data)
									addImgTemplate(kajuanid);
								}
							});
						}

					} else {
						$('#couponform').form('submit', {
							type: "POST",
							url: "rest/coupon/editCouponPackage?couponId=" + kajuanid,
							onSubmit: function () {
								return $(this).form('validate');
							},
							success: function (data) {
								$('.xinjianka_wrap').hide()
								$('.tuancao_wrap').show()
								pingjialist()
								console.log(data)

							}
						});
					}



				}
			}, 100);

			
		}

		function query() {
			//init($dg);
		}
		var intoPages = 1;
		var onPagechange = function (page) {
			console.log('当前点击入场页码', page);
			if (intoPages != page) {
				intoPages = page;
				pingjialist();
			}
		}

		//首页表格
		function pingjialist() {

			var zengjuanyuany = $('#zengjuanyuany').val();
			var kajuanlei = $('#kajuanlei').val();
			var kajuanstatus = $('#kajuanstatus').val();
			var intoPages1 = String(intoPages);
			var data = {
				"page": intoPages1,
				'rows': '10',
				'param.pacId': zengjuanyuany,
				'param.tradeId': kajuanlei,
				'param.status': kajuanstatus
			};

			$.ajax({
				type: "post",
				url: "rest/coupon/getCouppnListPage",
				async: false,
				data: data,
				success: function (res) {
					console.log(res)
					if (res.status) {
						$('#fangdatalist_wrap').html('')
						var data = res.rows;
						if (data.length > 0) {
							$('#boxpage').show();
							var intoNum = (intoPages - 1) * 10; //序号
							for (var i = 0; i < data.length; i++) {
								intoNum++;
								var item = data[i];
								var status;
								var ishide;
								var biantext;
								var fcouponType;
								var zengyuany;
								var youxiaodate;//有效期
								if (item.validDateEnd) {
									var validDateEnd = item.validDateEnd
									youxiaodate = validDateEnd.split(' ')[0]

								} else {
									var useDate = item.useDate;
									if (useDate == 0) {
										youxiaodate = '领取当天起有效，有效期' + item.getLimit + '天'
									} else {
										youxiaodate = useDate.split(' ')[0] + '起有效，有效期' + item.getLimit + '天'
									}

								}

								if (item.status == 0) {
									status = '上架';
									biantext = '<span class="bianji" onclick="kabianji(\'' + item.couponId + '\')">编辑</span><span class="xiajia" onclick="fxiajia(this,\'' + item.couponId + '\')">下架</span>'
								} else if (item.status == 1) {
									status = '下架'
									biantext = '<span class="bianji" onclick="kabianji(\'' + item.couponId + '\')">编辑</span><span class="xiajia" onclick="fshangjia(this,\'' + item.couponId + '\')">上架</span>'
								}
								if (item.isHide == 0) {
									ishide = '显示'
								} else if (item.isHide == 1) {
									ishide = '隐藏'
								}
								if (item.couponType == 0) {
									fcouponType = "体验卡"
								} else if (item.couponType == 1) {
									fcouponType = "线下现金券"
								} else {
									fcouponType = "现金券"
								}


								if (item.couponsReason == 1) {
									zengyuany = "通用"
								} else if (item.couponsReason == 2) {
									zengyuany = "交款赠送"
								} else if (item.couponsReason == 3) {
									zengyuany = "消耗赠送"
								} else if (item.couponsReason == 4) {
									zengyuany = "关注公众号赠送"
								} else if (item.couponsReason == 5) {
									zengyuany = "注册crm赠送"
								} else if (item.couponsReason == 6) {
									zengyuany = "首次绑卡赠送"
								} else if (item.couponsReason == 7) {
									zengyuany = "消费评价赠送"
								} else {
									zengyuany = "消费次数兑换"
								}
								// title = "' + tihuan(item.packageDes) + '"
								var str = '<tr>' +
									'<td class="item item1 ">' + intoNum + '</td>' +
									'<td class="item item2 ">' + tihuan(item.packageName) + '</td>' +
									'<td class="item item3 ">' + fcouponType + '</td>' +
									'<td class="item item3 ">' + tihuan(item.denomination) + '</td>' +
									'<td class="item item2 ">' + youxiaodate + '</td>' +
									'<td class="item item2 ">' + zengyuany + '</td>' +
									'<td class="item item4 ">' + tihuan(item.couponPercent) + '</td>' +
									'<td class="item item5 "><div class="tdwrap">' + tihuan(item.packageDes) + '</div></td>' +
									'<td class="item item3 ">' + status + '</td>' +
									'<td class="item item3 ">' + ishide + '</td>' +
									'<td class="item item2 cxbor">' + biantext + '</td>' +
									'</tr>'


								$('#fangdatalist_wrap').append(str)
							}
						} else {
							alert('没有数据，请检查输入信息是否正确')
							$('#boxpage').hide()
						}
						if (intoNum != 0) {
							var obj = {
								wrapid: 'boxpage', //页面显示分页器容器id
								total: res.total, //总条数
								pagesize: 10, //每页显示10条
								currentPage: intoPages, //当前页
								onPagechange: onPagechange,
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

		//下架
		function fxiajia(em, aid) {
			$(".remove").remove();
			var str = '<div class="remove">' +
				'<div class="removeSX">' +
				'<div class="wz">确定要下架该卡券吗？</div>' +
				'<div class="removeBtn">' +
				'<div class="rebtn" onclick="removeQD(\'' + aid + '\')">确定</div>' +
				'<div class="rebtn active" onclick="cancel()">取消</div>' +
				'</div>' +
				'</div>' +
				'<div class="removetipred"><p>卡券下架后，该卡券不再能使用！</p></div>' +
				'</div>'
			$(em).parent().append(str)
		}
		function removeQD(aid) {
			endCouponCard(aid, 1)
		}
		//上架
		function fshangjia(em, aid) {
			$(".remove").remove();
			var str = '<div class="remove">' +
				'<div class="removeSX">' +
				'<div class="wz">确定要上架该卡券吗？</div>' +
				'<div class="removeBtn">' +
				'<div class="rebtn" onclick="removeQD1(\'' + aid + '\')">确定</div>' +
				'<div class="rebtn active" onclick="cancel()">取消</div>' +
				'</div>' +
				'</div>' +
				'<div class="removetipred"><p>卡券上架后，该卡券可以使用！</p></div>' +
				'</div>'
			$(em).parent().append(str)
		}
		function removeQD1(aid) {
			endCouponCard(aid, 0)
		}
		function cancel() {
			$(".remove").remove();
		}
		$(".imgInput").change(function () {
			alert(URL.createObjectURL($(this)[0].files[0]))
			$(".img").attr("src", URL.createObjectURL($(this)[0].files[0]));
		});



		//编辑1
		var bianjiflag;

		function kabianji(coupid) {
			flaged = 2;
			kajuanid = coupid;
			console.log(coupid)
			$('.radiselect').removeClass("fangactive")
			$('#remain').text(0);
			$('#textremain').text(0);
			$('#packageName').val('')
			//$('#kajuanleixing').val('')
			$('#validDateStart').val('')
			$('#validDateEnd').val('')
			$('#hxClubId').val('')
			$('#limitCustomer').val('')
			$('#packageDes').val('')
			$('#packageIdGx').val('')
			$('#receivePageUrl').val('')
			$('#receiveSuccessPageUrl').val('')
			$('#getLimit').val('')
			$('#useDate').val('')
			$('#denomination').val('')
			$('#internalName').val('')
			// $('#couponsReason').val('')
			$('#couponPercent').val('')
			$('#couponColor').val('')
			$('#couponCount').val('')
			$('#couponExplain').val('')
			callChild1(2);
			//清空海报参数
			$("#title").val('');
			$("#content").val('');
			$("#imgWidth").val('');
			$("#imgHeight").val('');
			$("#qrCodeHeight").val('');
			$("#qrCodeWidth").val('');
			$("#qrCodeTop").val('');
			$("#qrCodeLeft").val('');
			$("#templateName").attr("src", '');

			selectstoreList = [];
			selectstoreList1 = [];
			FBselectstoreList = [];
			FBselectstoreList1 = [];
			$("#mdSearch").val("");
			$("#mdSearch1").val("");
			$(".allselest img").attr("src", "../../images/codeallnor_btn.png")
			$(".allselest1 img").attr("src", "../../images/codeallnor_btn.png")
			$("#storeList").html("")
			$("#storeList1").html("")
			$.each(storeList, function (index, item) {
				var str = '<div class="storeList" data-id="' + item.clubId + '"><div class="item storeimg"><img src="../../images/codeallnor_btn.png"/>' + item.clubName + '</div></div>';
				$("#storeList").append(str)
				var str1 = '<div class="storeList1" data-id="' + item.clubId + '"><div class="item storeimg1"><img src="../../images/codeallnor_btn.png"/>' + item.clubName + '</div></div>';
				$("#storeList1").append(str1)
			})
			$("#store").hide();
			$("#store1").hide();
			$('.xinjianka_wrap').show()
			$('.tuancao_wrap').hide()
			$('#couponform').form('load', 'rest/coupon/getCouponInfoById?couponId=' + coupid);
			callChild1(1);
			$('#imgform').form('load', 'rest/imgtemplate/getImgTemplateInfoById?couponId=' + coupid);
			$.ajax({
				type: "get",
				url: "rest/coupon/getCouponInfoById?couponId=" + coupid,
				async: false,
				//			data:,
				success: function (res) {
					console.log(res)
					//			    $('#packageName').val(res.packageName)
					//			    $('#kajuanleixing').val(res.couponType)
					//			     $('#validDateStart').val(res.validDateStart)
					//			     $('#validDateEnd').val(res.validDateEnd)
					//			     $('#clubId').val(res.clubId)
					//			 
					//			    $('#limitCustomer').val(res.limitCustomer)
					//			     $('#packageDes').val(res.packageDes)
					//			     $('#packageIdGx').val(res.packageIdGx)		         
					//		         $('#receivePageUrl').val(res.receivePageUrl)
					//		         $('#receiveSuccessPageUrl').val(res.receiveSuccessPageUrl)
					//		         $('#isHide').val(res.isHide)
					//		         $('#isGive').val(res.isGive)
					//		         $('#isUse').val(res.isUse)
					//		         $('#getLimit').val(res.getLimit)
					if (res.couponsReason == 2 || res.couponsReason == 3) {
						$('#fzzsbl').show()
						$(".complimentarystore").show();
					} else {
						$('#fzzsbl').hide()
						$(".complimentarystore").hide();
					}
					var useDate = res.useDate;
					//alert(useDate)
					if (useDate) {

						if (useDate.length > 0) {
							$('#useDate').parent().parent().addClass("fangactive");
							var validsplit = useDate.split(' ')[0];
							$('#useDate').val(validsplit)
						}


					}
					if (res.useDate == 0) {
						$('#useDate').val('');
					}
					var validDateEnd = res.validDateEnd;
					if (validDateEnd) {

						if (validDateEnd.length > 0) {
							var validsplit = validDateEnd.split(' ')[0];
							$('#validDateEnd').val(validsplit)
							$('#validDateEnd').parent().parent().addClass("fangactive");
						}


					}

					if (res.internalName) {
						$('#internalName').val(res.internalName)
					}


					var couponExplain = res.couponExplain;
					var fzdatale = couponExplain.length;
					$('#textremain').text(fzdatale)

					var packageName = res.packageName;
					var fzdatalength = packageName.length;
					$('#remain').text(fzdatalength)


					//		          $('#denomination').val(res.denomination)
					//		           $('#couponsReason').val(res.couponsReason)
					//		            $('#couponPercent').val(res.couponPercent)
					//		            $('#couponColor').val(res.couponColor)
					//		            $('#couponCount').val(res.couponCount)
					//		            $('#file').val(res.file)
					//		            $('#couponExplain').val(res.couponExplain)		  
					//		            callChild1(1)
					if (res.couponType == 0) {
						$("#gxidflag").show()
						$("#gxidflag1").hide()
					} else {
						$("#gxidflag1").show()
						$("#gxidflag").hide()
					}
					$(".activityPic").attr("src", "");
					$(".activityPic1").attr("src", "");
					$(".activityPic2").attr("src", "");
					if (res.logoUrl) {
						$("#ltemplateName").attr("src", urls + res.logoUrl)
					}
					if (res.receivePageUrl) {
						$(".activityPic").attr("src", urls + res.receivePageUrl)
					}
					if (res.buttonBackgroundUrl) {
						$(".activityPic1").attr("src", urls + res.buttonBackgroundUrl)
					}
					if (res.receiveSuccessPageUrl) {
						$(".activityPic2").attr("src", urls + res.receiveSuccessPageUrl)
					}
					if (res.clubId.split(",").length == storeList.length) {
						$("#selmed1").addClass("fangactive")
						$("#selectShop").hide();
						mdisFlag = 0;
					} else {
						mdisFlag = 1;
						$("#selmed").addClass("fangactive")
						$("#selectShop").show();
						$("#selectmd").html("")
						for (var i = 0; i < res.clubId.split(",").length; i++) {
							var item1 = res.clubId.split(",")[i];
							$.each(storeList, function (index, item) {
								if (item.clubId == item1) {
									var str = '<div class="clubname" >' + item.clubName + ' <img onclick="delectshop(this,' + item.clubId + ')" src="../../images/classdel_btn.png"/></div>';
									$("#selectmd").append(str)
									selectstoreList.push(item)
									selectstoreList1.push(item)
								}
							})
						}

					}
					if (res.hxClubId.split(",").length == storeList.length) {
						$("#selmd1").addClass("fangactive")
						$("#selectShop1").hide();
						mdisFlag = 0;
					} else {
						FBmdisFlag = 1;
						$("#selmd").addClass("fangactive")
						$("#selectShop1").show();
						$("#selectmd1").html("")
						for (var i = 0; i < res.hxClubId.split(",").length; i++) {
							var item1 = res.hxClubId.split(",")[i];
							$.each(storeList, function (index, item) {
								if (item.clubId == item1) {
									var str = '<div class="clubname" >' + item.clubName + ' <img onclick="delectshop1(this,' + item.clubId + ')" src="../../images/classdel_btn.png"/></div>';
									$("#selectmd1").append(str)
									FBselectstoreList.push(item)
									FBselectstoreList1.push(item)
								}
							})
						}

					}
					if (res.couponsReason != 2 && res.couponsReason != 3) {
						$("#selectShop").hide();
					}
				},
				error: function (res) {
					console.log(res)
				}
			});

		}




		$("#uploadss").on("click", function () {
			$("#collection").click();
		})
		$("#uploadss1").on("click", function () {
			$("#collectionSuccess").click();
		})
		$("#uploadss2").on("click", function () {
			$("#buttonBackground").click();
		})
		$("#collection").change(function () {
			$(".activityPic").attr("src", URL.createObjectURL($(this)[0].files[0]));
		});
		$("#collectionSuccess").change(function () {
			$(".activityPic2").attr("src", URL.createObjectURL($(this)[0].files[0]));
		});
		$("#buttonBackground").change(function () {
			$(".activityPic1").attr("src", URL.createObjectURL($(this)[0].files[0]));
		});
		function clearForm() {
			$('#couponform').form('clear');
			$("#packageDes").val("");
			callChild1(2);
		}

		var submitType;
		function addCouponCard() {
			submitType = "add";
			$('#sub').dialog({
				title: '添加体验卡'
			});
			$('#sub').dialog('open');
		}

		//填充表单
		//		function addImg(id) {
		//       
		//					$('#imgform').form('load','rest/imgtemplate/getImgTemplateInfoById?couponId='+id);
		//				
		//			addImgTemplate(id)
		//			
		//		}
		//上传海报模板
		function addImgTemplate(id) {


			$("#couponId").val(id);
			$("#templateName").val($("#templateName").attr("src"));
			$('#imgform').form('submit', {
				type: "POST",
				url: "rest/imgtemplate/addImgTemplate",
				//							onSubmit : function() {
				//								alert(1)
				//								return $(this).form('validate');
				//							},
				success: function (data) {

					$('.xinjianka_wrap').hide()
					$('.tuancao_wrap').show()
					pingjialist()
				}
			});



		}
		//海报模板校验
		function checkAddImgInfo() {
			//			var title = $("#title").val();
			//			var content = $("#content").val();
			//			var imgWidth = $("#imgWidth").val();
			//			var imgHeight = $("#imgHeight").val();
			//			var qrCodeHeight = $("#qrCodeHeight").val();
			//			var qrCodeWidth = $("#qrCodeWidth").val();
			//			var qrCodeTop = $("#qrCodeTop").val();
			//			var qrCodeLeft = $("#qrCodeLeft").val();
			//			var templateName = $("#templateName").attr("src");
			//			if (title == null || title == "" || title == undefined) {
			//				alert('海报分享标题不能为空')
			//				
			//				return false;
			//			}
			//			if (content == null || content == "" || content == undefined) {
			//				alert('海报分享描述不能为空')
			//				
			//				return false;
			//			}
			//			if (imgWidth == null || imgWidth == "" || imgWidth == undefined) {
			//				alert('图片宽度不能为空')
			//				
			//				return false;
			//			}
			//			if (imgHeight == null || imgHeight == "" || imgHeight == undefined) {
			//				alert('图片高度不能为空')
			//				
			//				return false;
			//			}
			//			if (qrCodeHeight == null || qrCodeHeight == ""
			//					|| qrCodeHeight == undefined) {
			//				alert('二维码高度不能为空')		
			//				
			//				return false;
			//			}
			//			if (qrCodeWidth == null || qrCodeWidth == ""
			//					|| qrCodeWidth == undefined) {
			//				alert('二维码宽度不能为空')		
			//				
			//				return false;
			//			}
			//			if (qrCodeTop == null || qrCodeTop == "" || qrCodeTop == undefined) {
			//				alert('二维码距离顶部高度不能为空')
			//				
			//				return false;
			//			}
			//			if (qrCodeLeft == null || qrCodeLeft == ""
			//					|| qrCodeLeft == undefined) {
			//				alert('二维码距离左侧距离不能为空')		
			//				
			//				return false;
			//			}
			//			if (templateName == null || templateName == ""
			//					|| templateName == undefined) {
			//				alert('海报图片不能为空')		
			//				
			//				return false;
			//			}
			return true;
		}



		//编辑体验卡信息
		function updateCouponCard() {
			var row = $("#dg").datagrid('getSelections');
			if (typeof (id) != "undefined" && id != 0) {
				if (row.length == 1) {
					submitType = "edit";
					$('#sub').dialog({
						title: '编辑体验卡信息'
					});
					$('#sub').dialog('open');
					$('#couponform').form('load',
						'rest/coupon/getCouponInfoById?couponId=' + id);
					callChild1(1);

				} else {
					$.messager.alert('提示', '请选择一个需要编辑的体验卡!', 'info');
				}
			} else {
				$.messager.alert('提示', '请选择需要编辑的体验卡!', 'info');
			}
		}

		//体验卡校验
		function checkAddCouponPackage() {
			callChild();
			var packageName = $("#packageName").val();
			var validDateStart = $("#validDateStart").val();
			var validDateEnd = $("#validDateEnd").val();
			var packageDes = $("#packageDes").val();
			var receivePageUrl = $("#receivePageUrl").val();
			if (packageName == null || packageName == ""
				|| packageName == undefined) {
				$.messager.alert('提示', "体验卡名称不能为空!", 'info');
				return false;
			}
			if (validDateStart == null || validDateStart == ""
				|| validDateStart == undefined) {
				$.messager.alert('提示', "卡可领取时间不能为空!", 'info');
				return false;
			}
			if (validDateEnd == null || validDateEnd == ""
				|| validDateEnd == undefined) {
				$.messager.alert('提示', "发放卡结束时间不能为空!", 'info');
				return false;
			}
			if (packageDes == null || packageDes == ""
				|| packageDes == undefined || packageDes === "<p><br></p>") {
				$.messager.alert('提示', "卡权益不能为空!", 'info');
				return false;
			}

			return true;
		}

		//结束体验卡发放
		function endCouponCard(id1, status1) {

			var data = {
				id: id1,
				status: status1
			}


			$.ajax({
				type: "POST",
				url: "rest/coupon/endCouponCard",
				dataType: "json",
				contentType: "application/json;charset=UTF-8",
				data: JSON.stringify(data),
				success: function (data) {
					$(".remove").remove();
					pingjialist();
				},
				error: function () {
					$.messager.alert('提示', "结束失败，请重试!", 'info');
				}
			});



		}
	</script>
</body>

</html>