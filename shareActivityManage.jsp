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
	<title>企业消费明细</title>
	<link rel="stylesheet" type="text/css" href="http://test.physicalclub.com/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="http://test.physicalclub.com/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="http://test.physicalclub.com/easyui/demo.css">
	<link rel="stylesheet" type="text/css" href="http://test.physicalclub.com/easyui/pagination.css" />
	<link rel="stylesheet" type="text/css" href="http://test.physicalclub.com/easyui/themes/datepicker.css" />
	<script type="text/javascript" src="http://test.physicalclub.com/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="http://test.physicalclub.com/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="http://test.physicalclub.com/js/common.js"></script>
	<script src="http://test.physicalclub.com/easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
</head>
<style type="text/css">
	html,
	body {
		min-width: 1024px;
	}

	/*1*/
	.item1 {
		width: 3%;
	}

	/*5*/
	.item2 {
		width: 11.8%;
	}

	/*  4*/
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

	.fitem2f {
		width: 7%;
		position: relative;
	}

	.fitem3f {
		width: 11%;
	}

	.fitem4f {
		width: 12%;
	}

	.fitem5f {
		width: 5%;
	}

	.fitem6f {
		width: 9%;
	}

	.clear:after {
		content: '';
		display: block;
		clear: both;
	}

	.clear {
		zoom: 1;
	}

	input::-webkit-outer-spin-button,
	input::-webkit-inner-spin-button {
		-webkit-appearance: none;
	}

	input[type="number"] {
		-moz-appearance: textfield;
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
		height: 36px;
		border-right: 1px dotted #CCCCCC;
	}

	.tuancao_wrap td {
		height: 36px;
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

	.tuancao_wrap1 tr {
		height: 36px;
		border-right: 1px dotted #CCCCCC;
	}

	.tuancao_wrap1 td {
		height: 40px;
		text-align: center;
		border-left: 1px dotted #CCCCCC;
		border-bottom: 1px dotted #CCCCCC;
		font-size: 14px;
		color: #444444;
	}

	.tuancao_wrap1 th {
		font-weight: 400;
		font-size: 16px;
		color: #444444;
	}

	.tuancao_wrap td span {
		font-size: 16px;
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

	#fangdatalist_wrap .bianji {
		color: #71B2EF;
		cursor: pointer;
	}

	.datalist .delte {
		padding-left: 6px;
		cursor: pointer;
	}

	.tuancao1_header .input1 {
		border: 1px solid #CCCCCC;
		width: 150px;
		line-height: 30px;
		height: 30px;
		border-radius: 3px;
		padding-left: 10px;
		font-size: 18px;
	}

	.tuancao1_header .input2 {
		border: 1px solid #CCCCCC;
		width: 200px;
		line-height: 30px;
		height: 30px;
		border-radius: 3px;
		padding-left: 10px;
		font-size: 18px;
		margin-right: 39px;
	}

	.tuancao1_header select {
		border: 1px solid #BFBFBF;
		width: 120px;
		line-height: 30px;
		height: 30px;
		border-radius: 3px;
		padding-left: 10px;
		font-size: 14px;
		appearance: none;
		background-color: #fff;
		-moz-appearance: none;
		color: #444444;
		-webkit-appearance: none;
		padding-right: 25px;
	}

	.tuancao1_header label {
		font-size: 16px;
		font-family: MicrosoftYaHei;
		font-weight: 400;
		color: rgba(68, 68, 68, 1);
		padding: 0 2px 0 0px;
		padding-right: 20px;

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
		width: 80px;
		line-height: 30px;
		height: 30px;
		text-align: center;
		background: #71B2EF;
		color: #fff;
		border-radius: 4px;
		font-size: 16px;
		cursor: pointer;
		margin-right: 15px;
		margin-bottom: 10px;
		margin-top: 2px;
	}

	.clearbtn {
		display: inline-block;
		width: 80px;
		line-height: 30px;
		height: 30px;
		text-align: center;
		background: #fff;
		color: #444444;
		border-radius: 4px;
		border: 1px solid #BFBFBF;
		font-size: 16px;
		cursor: pointer;
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
		cursor: pointer;
	}

	.bussess_item select {
		width: 537px;
		padding-left: 10px;
		font-size: 18px;
		font-family: MicrosoftYaHei;
		font-weight: 400;
		color: rgba(68, 68, 68, 1);
		height: 36px;
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
		top: 14px;
	}

	.fem {
		/*padding-left: 15px;*/
		font-size: 14px;
		font-family: Microsoft YaHei;
		font-weight: 400;
		color: rgba(68, 68, 68, 1);
	}

	.c-datepicker-date-editor {
		border: 1px solid #CCCCCC;
		position: relative;
		top: -18px;
		width: 120px;
		height: 30px;
		cursor: pointer;
	}

	.c-datepicker-data-input.only-date {
		width: 100%;
		font-size: 14px;
	}

	.select_wrap {
		position: relative;
		margin-right: 39px;
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

	.daochustyle {
		width: 100px;
		height: 36px;
		line-height: 36px;
		text-align: center;
		background: rgba(113, 178, 239, 1);
		border-radius: 4px;
		font-size: 16px;
		font-family: MicrosoftYaHei;
		font-weight: 400;
		color: rgba(255, 255, 255, 1);
		position: absolute;
		right: 20px;
		top: 90px;
		cursor: pointer;
	}

	input::-webkit-input-placeholder,
	textarea::-webkit-input-placeholder {
		font-size: 14px;
		color: rgba(191, 191, 191, 1);
	}

	input:-moz-placeholder,
	textarea:-moz-placeholder {
		font-size: 14px;
		color: rgba(191, 191, 191, 1);
	}

	input:-ms-input-placeholder,
	textarea:-moz-placeholder {
		font-size: 14px;
		color: rgba(191, 191, 191, 1);
	}

	/* 新建活动 */
	.xzhd-body {
		position: relative;
		padding-bottom: 30px;
		display: none;
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
		position: relative;
		border: 1px solid #BFBFBF;
		overflow: hidden;
		border-radius: 4px;
	}

	.xzhd-body-hdmc {
		width: 380px;
		height: 32px;
		border: none;
		font-size: 16px;
		padding-left: 20px;
		box-sizing: border-box;
	}

	#xzhd-body-hdsjs {
		width: 175px;
		height: 32px;
		border: none;
		color: #BFBFBF;
		font-size: 16px;
		padding-left: 20px;
		box-sizing: border-box;
	}

	#xzhd-body-hdsje {
		width: 175px;
		height: 32px;
		border: none;
		color: #BFBFBF;
		font-size: 16px;
		padding-left: 20px;
		box-sizing: border-box;
	}

	#xzhd-body-fxhd {
		position: relative;
		width: 500px;
		min-height: 32px;
		border: none;
		color: #BFBFBF;
		line-height: 32px;
		font-size: 14px;
		padding-left: 20px;
		box-sizing: border-box;
		cursor: pointer;
	}

	.xzhd-body-down {
		display: inline-block;
		width: 0;
		height: 0;
		border-left: 5px solid transparent;
		border-right: 5px solid transparent;
		border-top: 7px solid #BFBFBF;
		position: absolute;
		right: 10px;
		cursor: pointer;
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

	#xzhd-body-lqrhd,
	#xzhd-body-fxhd {
		width: 500px;
		min-height: 32px;
		border: none;
		color: #BFBFBF;
		line-height: 32px;
		font-size: 14px;
		padding-left: 20px;
		box-sizing: border-box;
		cursor: pointer;
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
		cursor: pointer;
	}

	#xzhd-body-hdbjpz-img {
		width: 120px;
		height: 150px;
		border: 1px solid #CCCCCC;
		border-radius: 3px;
		background-size: contain;
	}

	.xzbac,
	.xzbac1 {
		background: rgba(245, 245, 245, 1);
	}

	#xzhd-body-hdbjpz-upload,
	.xzhd-body-hdbjpz-upload {
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
	}

	#xzhd-body-lqanpz-upload,
	.xzhd-body-lqanpz-upload {
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

	#xzhd-body-fxwzbt,
	.xzhd-body-fxwzbt {
		width: 680px;
		height: 32px;
		border: none;
		font-size: 16px;
		padding-left: 20px;
		box-sizing: border-box;
	}

	#xzhd-body-fxhdxs,
	.xzhd-body-fxhdxs {
		width: 680px;
		height: 160px;
		resize: none;
		border: none;
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
		color: #71B2EF
	}

	.sj-body-flex1 {
		height: auto;
		display: flex;
		flex-wrap: wrap;
	}

	.sj-body-flex1 div:nth-child(2n) {
		margin-left: 44px
	}

	.sj-body-flex-p {
		font-size: 16px;
		color: #444444;
		margin-right: 20px
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
		border: none
	}

	#sj-body-lqsje {
		width: 120px;
		height: 30px;
		border: none
	}

	#sj-body-zt {
		width: 120px;
		height: 30px;
		border: 1px solid #d5d5d7;
		border-radius: 4px;
		font-size: 14px
	}

	#sj-body-ly {
		width: 120px;
		height: 30px;
		border: 1px solid #d5d5d7;
		border-radius: 4px;
		font-size: 14px
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
		left: 405px;
		z-index: 999;
		padding: 0 20px 10px 20px;
		display: flex;
		margin-top: 10px;
		border-radius: 5px;
		padding-right: 0;
		display: none;
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
		float: left;
		vertical-align: middle;
		margin-top: 2px;
		cursor: pointer;
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
		font-weight: normal;
	}

	.xzhd-body-tbody1 td {
		position: relative;
		font-size: 14px;
		height: 40px;
		text-align: center;
	}

	.xzhd-body-tbody1 .psda {
		width: 90%;
		position: absolute;
		padding-right: 0;
		float: left;
		text-overflow: ellipsis;
		left: 20px;
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
		position: absolute;
		height: 16px;
		margin-left: 22px;
		margin-right: 50px;
		right: -39px;
	}

	.xzhd-body-chacha1 {
		width: 16px;
		height: 16px;
		margin-left: 22px;
		margin-right: 50px
	}

	#backleavel {
		font-size: 16px;
		color: #71B2EF;
		cursor: pointer;
	}

	#largestNum,
	.largestNum {
		width: 100;
		height: 32px;
		border: none;
		font-size: 16px;
		box-sizing: border-box;
		text-align: center;
		padding-right: 30px;
	}

	.xzhd-body-input .leftborder {
		position: absolute;
		border-left: 1px solid #CCCCCC;
		width: 30px;
		right: 0;
		top: 0;
		height: 32px;
	}

	.xzhd-body-input .topArrow,
	.xzhd-body-input .bottomArrow {
		width: 30px;
		height: 15px;
		border-bottom: 1px solid #CCCCCC;
		text-align: center;
		cursor: pointer;
	}

	.xzhd-body-input .bottomArrow {
		border-bottom: none;
	}

	.xzhd-body-input .topArrow img,
	.xzhd-body-input .bottomArrow img {
		width: 13px;
		margin-top: 3px;

	}

	.xzhd-body-input .topArrow img {
		transform: rotate(180deg);
	}

	.xzhd-body-input .topArrow:active,
	.xzhd-body-input .bottomArrow:active {
		background-color: #F7F7F7;
	}

	.xzhd-body-flex .lqPeople p {
		float: left;
		font-size: 14px;
		margin-right: 25px;
		margin-top: 6px;
	}

	.add,
	.reduce {
		width: 15px;
		height: 15px;
		border: 1px solid rgba(191, 191, 191, 1);
		border-radius: 50%;
		text-align: center;
		color: #BFBFBF;
		margin-left: 15px;
		cursor: pointer;
		line-height: 14px;
	}

	.add:active {
		background-color: #F7F7F7;
	}

	.reduce {
		margin-left: 8px;
	}

	.reduce:active {
		background-color: #F7F7F7;

	}

	.whiteColor {
		padding-left: 15px;
		font-size: 16px;
		color: rgba(68, 68, 68, 1);
		line-height: 62px;
	}

	.xzbac input,
	.xzbac1 input {
		width: 160px;
		height: 60px;
		background: rgba(245, 245, 245, 1);
		border: none;
		border-radius: 3px;
		padding: 0 20px;
		font-size: 16px;
	}

	.xzhd-body .sample {
		position: absolute;
		left: 55%;
		top: 1206px;
	}

	.xzhd-body .sample .slk {
		font-size: 16px;
		color: rgba(68, 68, 68, 1);
	}

	/* 数据 */
	.data_title {
		font-size: 18px;
		color: rgba(68, 68, 68, 1);
		margin-top: 9px;
	}

	.coupons {
		position: relative;
		width: 100%;
		overflow: hidden;
	}

	.coupons .coupons1 {
		width: 30%;
		float: left;
		margin-top: 22px;
		margin-right: 30px;

	}

	.coupons1 .cqs {
		font-size: 16px;
		font-weight: bold;
		color: rgba(68, 68, 68, 1);
		margin-bottom: 19px;
	}

	.coupons1 .detail {
		display: flex;
		width: 100%;
		height: 90px;
		background: rgba(245, 245, 245, 1);
	}

	.coupons1 .detail .item {
		text-align: center;
		flex: 1;
	}

	.coupons1 .detail .item .ylq {
		font-size: 14px;
		color: rgba(68, 68, 68, 1);
		margin-top: 20px;
	}

	.coupons1 .detail .item .yly {
		font-size: 16px;
		font-weight: bold;
		color: rgba(68, 68, 68, 1);
		margin-top: 10px;
	}

	.coupons .more {
		position: absolute;
		font-size: 16px;
		font-weight: bold;
		color: rgba(113, 178, 239, 1);
		right: 30px;
		top: 22px;
		cursor: pointer;
	}

	.coupons .more .test {
		position: absolute;
		font-size: 16px;
		margin-top: 5px;
		margin-left: 3px;
	}

	@media screen and (max-width: 1388px) {
		.busData .tuancao1_header select {
			width: 10.2% !important;
		}

		.busData .c-datepicker-date-editor {
			/* width: 8%; */
		}

		.busData .select_wrap {
			margin-right: 10px;
		}
	}

	.box {
		margin-left: 0px;
		transform: none;
	}

	.wswq .page {
		font-size: 16px;
		margin-right: 27px;
		float: left;
		margin-top: 18px;
		margin-left: 27px;
	}

	.remove {
		width: 370px;
		height: 110px;
		background: rgba(255, 255, 255, 1);
		box-shadow: 0px 0px 20px 0px rgba(153, 153, 153, 0.5);
		border-radius: 4px;
		position: absolute;
		right: 75px;
		top: -31px;
		z-index: 999;
	}

	.removeSX {
		padding-top: 20px;
	}

	.removeSX .wz,
	.removeSX .removeBtn {
		float: left;
		padding-top: 5px;
	}

	.removeSX .wz {
		font-size: 16px;
		padding: 0 20px;
		padding-top: 12px;
	}

	.removeBtn .rebtn {
		float: left;
		width: 70px;
		height: 36px;
		line-height: 36px;
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
		margin-top: 12px;
	}

	.lookHide {
		position: absolute;
		width: 100%;
		height: 100%;
		left: 0;
		top: 100px;
		z-index: 999;
		display: none;
	}

	#xzhd-body-count {
		position: absolute;
		top: 7px;
		right: 10px;
		font-size: 16px;
		color: #444444
	}

	.minus_minus {
		width: 15px;
		height: 15px;
		cursor: pointer;
	}

	.add_add {
		width: 15px;
		height: 15px;
		cursor: pointer;
	}

	.xzhd-body-kqsl {
		width: 50px;
		border-bottom: 1px solid #BFBFBF;
		text-align: center;
	}

	#xzhd-body-count {
		position: absolute;
		top: 7px;
		right: 10px;
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

	.xzhd-body-kqsl input {
		border: none;
		width: 50px;
		font-size: 14px;
		text-align: center;
	}

	.cgysl {
		display: flex;
		align-items: center;
		justify-content: space-between;
		font-size: 16px;
		width: 90%;
		background-color: #F5F5F5;
		height: 30px;
		height: 26px;
		line-height: 26px;
		border-radius: 2px;
		margin-top: 7px;
		position: relative;
		padding: 0 8px;
	}

	.cgysl p {
		width: 100%;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		color: #444444;
	}

	#xzhd-body-fxhd .cgysl {
		margin-bottom: 5px;
	}
</style>

<body>
	<div class="bussess_user" id="bussess_user">
		<div class="tuancao1_header">
			<div class="tuancao_header">
				<p id="addjuesebtn">新建活动</p>
			</div>
			<label>活动名称</label>
			<input class="input2" type="text" id="ygmdgonghao">
			<label style="padding-left:0!important;">活动状态</label>
			<span class="select_wrap"><select name="club" id="activity">
					<option value="">全部</option>
					<option value="0">未开始</option>
					<option value="1">活动中</option>
					<option value="2">已结束</option>
				</select><em class="triangle_border_down" id="sanjiaof"></em></span>
			<label style="padding-left:0!important;">活动时间</label>
			<div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"><input type="text"
					id="startDate" autocomplete="off" name="" placeholder="开始日期"
					class=" c-datepicker-data-input only-date" value=""> </div>
			<span style="color: #BFBFBF;">- </span>
			<div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"><input type="text"
					id="endDate" placeholder="结束日期" autocomplete="off" name=""
					class=" c-datepicker-data-input only-date" value=""> </div>

		</div>
		<div class="tuancao_wrap1">
			<span class="querybtn" id="fangquerybtn" onclick="queryyewuyuans()">查询</span><span class="clearbtn"
				onclick="clearstyles()">清除</span>
			<div class="tuandatalist_wrap" id="fangcardlist" style="margin-top:10px;">
				<table style=" border-collapse:collapse;width:100%;table-layout: fixed;">
					<tr style="height:40px;background:rgba(208,232,242,0.2);border:1px solid rgba(204,204,204,0.2);">
						<th class="item item1 ">序号</th>
						<th class="item fitem6f ">活动名称</th>
						<th class="item fitem6f ">活动时间</th>
						<th class="item fitem5f ">分享人数</th>
						<th class="item fitem5f ">领取人数</th>
						<th class="item fitem5f ">使用人数</th>
						<th class="item fitem5f ">状态</th>
						<th class="item fitem2f ">操作</th>
					</tr>
					<tbody id="fangdatalist_wrap">
						<!-- <tr>
				 <td class="item item1 ">1</td>
				 <td class="item fitem6f ">22</td>
				 <td class="item fitem6f ">33</td>
				 <td class="item fitem5f ">22</td>
				<td class="item fitem5f ">22</td>
				 <td class="item fitem5f ">222</td>
				 <td class="item fitem5f ">222</td> 
				 <td class="item fitem2f ">
					 <span class="bianji" onclick="lookData(1,'的1')">数据</span>
						<span class="bianji" onclick="edit(0,1)">｜编辑</span>
						<span class="bianji" onclick="remove(this,2)">｜失效</span>
						<div class="remove" ><div class="removeSX"><div class="wz">是否立即结束活动？</div><div class="removeBtn"><div class="rebtn" onclick="removeQD(3373)">确定</div><div class="rebtn active" onclick="cancel()">取消</div></div></div><div class="tip">结束后活动停止，已领取的优惠券还能继续使用！</div></div>
				</td>
				 </tr> -->
					</tbody>
				</table>
			</div>
			<div class="wswq" id="wswq1">
				<div class='page'></div>
				<div class="box" id="ywyboxpage">
				</div>
			</div>
		</div>
	</div>
	<!-- 新建活动 -->
	<div class="xzhd-body">
		<div style="width:100%">
			<div id="backleavel" onclick="backsyj()">返回上一级</div>
		</div>
		<div class="xzhd-body-line"></div>
		<div style="font-size:18px;color:#444444;margin:20px 0 0 15px;">活动信息</div>
		<div class="xzhd-body-line"></div>
		<div class="xzhd-body-flex" style="margin-top:24px">
			<p style="font-size:16px;margin-right:86px">活动名称</p>
			<div class="xzhd-body-input">
				<input id="activityName" maxlength="20" class="xzhd-body-hdmc" placeholder="请填写活动名称" type="text">
				<div id="xzhd-body-count"><span id="xzhd-body-text-count">0</span>/20</div>
			</div>
		</div>
		<div class="xzhd-body-flex" style="margin-top:24px">
			<p style="font-size:16px;margin-right:86px">活动时间</p>
			<div class="xzhd-body-input">
				<div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"
					style="top: 0;border: none;width: 172px;"><input type="text" id="activityStartDate"
						autocomplete="off" name="" placeholder="开始日期" class=" c-datepicker-data-input only-date"
						value=""></div>
			</div>
			<div style="color:#CCCCCC;margin:0 10px">--</div>
			<div class="xzhd-body-input">
				<div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"
					style="top: 0;border: none;width: 172px;"><input type="text" id="activityEndDate" autocomplete="off"
						name="" placeholder="结束日期" class=" c-datepicker-data-input only-date" value=""></div>
			</div>
		</div>
		<div class="xzhd-body-flex" style="margin-top:24px">
			<p style="font-size:16px;margin-right:54px">最大领取人数</p>
			<div class="xzhd-body-input">
				<input id="maxReceiveNumber" class="largestNum" placeholder="人数" value="" type="number">
				<div class="leftborder">
					<div class="topArrow" onclick="add(this)"><img src="../images/upfoldicomtwo.png"></div>
					<div class="bottomArrow" onclick="reduce(this)"><img src="../images/upfoldicomtwo.png"></div>
				</div>
			</div>
		</div>
		<div class="xzhd-body-flex" style="margin-top:24px">
			<p style="font-size:16px;margin-right:54px">仅限新客领取</p>
			<div class="xzhd-body-zstjraduis" vals="1">
				<p style="width:14px;height:14px;border-radius:50%;background:#71B2EF;display:none"></p>
			</div>
			<p style="margin:0 36px 0 15px;font-size:14px">是</p>
			<div class="xzhd-body-zstjraduis" vals="0">
				<p style="width:14px;height:14px;border-radius:50%;background:#71B2EF;display:none"></p>
			</div>
			<p style="margin:0 36px 0 15px;font-size:14px">否</p>
			<input type="hidden" id="onlyNewPeople" value="" />
		</div>
		<div class="xzhd-body-flex xundata" style="margin-top:24px;position: relative;">
			<p style="font-size:16px;margin-right:86px">分享获得</p>

			<div class="lqPeople">
				<p>领取人数</p>
				<div class="xzhd-body-input">
					<input id="largestNum" placeholder="人数" type="number">
					<div class="leftborder">
						<div class="topArrow" onclick="add(this)"><img src="../images/upfoldicomtwo.png"></div>
						<div class="bottomArrow" onclick="reduce(this)"><img src="../images/upfoldicomtwo.png"></div>
					</div>
				</div>
			</div>
			<p style="margin:0 15px;font-size: 14px;">可获得</p>
			<div class="xzhd-body-input" style="position:relative;" onclick="showyhz(this)">
				<div id="xzhd-body-fxhd">
					<p class="slsk">请选择要分享的优惠券</p>
					<!-- <div class="cgysl">
				<p>CRM优惠券/阿饿的</p><p style="width: 20px;position: absolute;left: 180px;">x1</p>
				<img class="xzhd-body-chacha" src="../images/classdel_btn.png"> 
				</div> -->
				</div>
				<div class="xzhd-body-down" id="xzhd-body-down11" style="top:42%"></div>
			</div>
			<div class="add" onclick="addlingqur()">+</div>
			<div id="xzhd-body-fxhd-zhankai" onclick="stopfz()" class="xzhd-body-fxhd-zhankai1" style="">
				<div style="width:200px;margin-top:10px">
					<div style="display:flex;align-items:center;cursor: pointer;" onclick="selectType(this,1)">
						<div class="xzhd-body-henggang">
							<img src="../images/checkout.png" alt="" style="display: block;">
						</div>
						<p style="font-size:16px;color:#444444;margin:0 46px 0 14px;">CRM优惠券</p>
						<img id="crm-rightget" style="" src="../images/right_get.png" alt="">
						<img id="crm-rightnone" src="../images/right_none.png" alt="" style="display: none;">
					</div>
					<div class="mkklp"
						style="display:flex;align-items:center;margin-top:18px;cursor: pointer;""  onclick="
						selectType(this,2)">
						<div class="xzhd-body-henggang">
							<img src="../images/checkout.png" alt="" style="display: none;">
						</div>
						<p style="font-size:16px;color:#444444;margin:0 49px 0 14px;">有赞优惠券</p>
						<img id="crm-rightget" style="display:none" src="../images/right_get.png" alt="">
						<img id="crm-rightnone" src="../images/right_none.png" alt="">
					</div>
				</div>
				<div style="height:100%;overflow-y:scroll;flex:1">
					<table style="border-collapse: collapse;flex:1;table-layout:fixed;">
						<thead class="xzhd-body-tbody">
							<tr>
								<th style="width:10%">优惠券名称</th>
								<th style="width:10%">数量</th>
								<th style="width:10%">库存</th>
							</tr>

						</thead>
						<tbody class="xzhd-body-tbody1">


						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div id="addlingqu">

		</div>

		<div class="xzhd-body-flex xundata1" style="margin-top:24px;position: relative;">
			<p style="font-size:16px;margin-right:70px">领取人获得</p>
			<div class="xzhd-body-input mksdd" style="position:relative;" onclick="showyhz(this)">
				<div id="xzhd-body-fxhd">
					<p class="slsk">请选择领取人可获得的优惠券</p>
				</div>
				<div class="xzhd-body-down" id="xzhd-body-down22" style="top:42%"></div>
			</div>
			<div id="xzhd-body-fxhd-zhankai" onclick="stopfz()" class="xzhd-body-fxhd-zhankai1" style="">
				<div style="width:200px;margin-top:10px">
					<div style="display:flex;align-items:center;cursor: pointer;" onclick="selectType(this,1)">
						<div class="xzhd-body-henggang">
							<img src="../images/checkout.png" alt="" style="display: block;">
						</div>
						<p style="font-size:16px;color:#444444;margin:0 46px 0 14px;">CRM优惠券</p>
						<img id="crm-rightget" style="" src="../images/right_get.png" alt="">
						<img id="crm-rightnone" src="../images/right_none.png" alt="" style="display: none;">
					</div>
					<div class="mkklp"
						style="display:flex;align-items:center;margin-top:18px;cursor: pointer;""  onclick="
						selectType(this,2)">
						<div class="xzhd-body-henggang">
							<img src="../images/checkout.png" alt="" style="display: none;">
						</div>
						<p style="font-size:16px;color:#444444;margin:0 49px 0 14px;">有赞优惠券</p>
						<img id="crm-rightget" style="display:none" src="../images/right_get.png" alt="">
						<img id="crm-rightnone" src="../images/right_none.png" alt="">
					</div>
				</div>
				<div style="height:100%;overflow-y:scroll;flex:1">
					<table style="border-collapse: collapse;flex:1;table-layout:fixed;">
						<thead class="xzhd-body-tbody">
							<tr>
								<th style="width:10%">优惠券名称</th>
								<th style="width:10%">数量</th>
								<th style="width:10%">库存</th>
							</tr>

						</thead>
						<tbody class="xzhd-body-tbody1">


						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:86px">分享标题</p>
			<div class="xzhd-body-input">
				<input class="xzhd-body-fxwzbt" maxlength="20" id="shareTitle" placeholder="请填写分享标题" />
				<div id='xzhd-body-count'><span id="xzhd-body-fxwzbt-text-count">0</span>/20</div>
			</div>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:86px">分享描述</p>
			<div class="xzhd-body-input">
				<textarea class="xzhd-body-fxhdxs" id="shareDescription" placeholder="请对活动分享描述"
					maxlength="30"></textarea>
				<div id='xzhd-body-count' style="bottom: 10px;top: initial;"><span
						id="xzhd-body-fxhdxs-text-count">0</span>/30</div>
			</div>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:24px">活动页面背景配置</p>
			<div id="xzhd-body-hdbjpz-img" class="xzbac uploadssimg1" valnum=1></div>
			<div class="xzhd-body-hdbjpz-upload successcg" id="uploadss1">上传</div>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:54px">分享按钮配置</p>
			<div id="xzhd-body-lqanpz-img" class="xzbac uploadssimg2" valnum=2></div>
			<div class="xzhd-body-lqanpz-upload successcg" style="margin-top: 16px;" id="uploadss2">上传</div>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:54px">分享海报按钮</p>
			<div id="xzhd-body-lqanpz-img" class="xzbac uploadssimg3" valnum=3></div>
			<div class="xzhd-body-lqanpz-upload successcg" style="margin-top: 16px;" id="uploadss3">上传</div>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:54px">字体颜色配置</p>
			<div id="xzhd-body-lqanpz-img" class="xzbac1"><input type="text" name="" id="fontColor" value="" /></div>
			<p class="whiteColor">填写颜色代码，例如333333</p>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:38px">分享好友链接图</p>
			<div id="xzhd-body-lqanpz-img" class="xzbac uploadssimg4" valnum=4 style="width: 150px;height: 120px;">
			</div>
			<div class="xzhd-body-lqanpz-upload successcg" id="uploadss4">上传</div>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:24px">客户分享海报配置</p>
			<div id="xzhd-body-hdbjpz-img" class="xzbac uploadssimg5" valnum=5></div>
			<div class="xzhd-body-hdbjpz-upload successcg" id="uploadss5">上传</div>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:24px">领取活动背景配置</p>
			<div id="xzhd-body-hdbjpz-img" class="xzbac uploadssimg6" valnum=6></div>
			<div class="xzhd-body-hdbjpz-upload successcg" id="uploadss6">上传</div>
		</div>
		<div class="xzhd-body-flex1" style="margin-top:50px">
			<p style="font-size:16px;margin-right:54px">领取按钮配置</p>
			<div id="xzhd-body-lqanpz-img" class="xzbac uploadssimg7" valnum=7></div>
			<div class="xzhd-body-lqanpz-upload successcg" style="margin-top: 16px;" id="uploadss7">上传</div>
		</div>
		<input type="file" name="collection" id="collection" value="" style="display:none" />
		<div class="xzhd-body-flex1" id="isedit" style="margin-top:50px">
			<p id="xzhd-body-save">保存</p>
			<p id="xzhd-body-quxiao" onclick="backsyj()">返回</p>
		</div>
		<!-- 示例 -->
		<div class="sample">
			<div class="slk">示例：</div>
			<img src="../images/yaoqing.png" style="width: 350px;margin-top: 7px;">
			<div class="slk" style="margin-top: 7px;">示例：</div>
			<div class="slk">建议图片进行适当设计，图上铺之以营销文案，来吸引消费者。</div>
			<img src="../images/lianjie.png" style="width: 150px;margin-top: 7px;">
			<span style="font-size: 16px;margin-left: 10px;">（点击图片可查看大图）</span>
		</div>
		<div class="lookHide"></div>
	</div>
	<!-- 数据 -->
	<div class="bussess_user busData" id="listdata" style="display: none;">
		<div style="width:100%">
			<div id="backleavel" onclick="backsyj()">返回上一级</div>
		</div>
		<div class="xzhd-body-line"></div>
		<div class="data_title">活动名称：<span id="huodongName"></span></div>
		<div class="coupons" id="coupons">
			<!-- 	  <div class="coupons1">
				  <p class="cqs">500元优惠券C</p>
				  <div class="detail">
					  <div class="item">
						  <p class="ylq">已领取</p>
						  <p class="yly">50</p>
					  </div>
					  <div class="item">
					  	<p class="ylq">已使用</p>
					  	 <p class="yly">50</p>
					  </div>
				  </div>
			  </div> -->

			<!-- <div class="more">更多 <span class="test">ˇ</span></div> -->
		</div>
		<div class="tuancao1_header" style="margin-top: 50px;">
			<label style="padding-left:0!important;">优惠券名称</label>
			<span class="select_wrap"><select style="width: 200px;" id="coupName">
					<option value="">全部</option>
				</select><em class="triangle_border_down" id="sanjiaof"></em></span>
			<label style="padding-left:0!important;">领取时间</label>
			<div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"><input type="text"
					id="ygmdselectDate1" autocomplete="off" name="" placeholder="开始日期"
					class=" c-datepicker-data-input only-date" value=""> </div>
			<span style="color: #BFBFBF;">- </span>
			<div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"><input type="text"
					id="ygmdselectDate2" placeholder="结束日期" autocomplete="off" name=""
					class=" c-datepicker-data-input only-date" value=""> </div>
			<label style="padding-left:0!important;margin-left: 38px;">状态</label>
			<span class="select_wrap"><select id="activezt">
					<option value="">全部</option>
					<option value="0">未核销</option>
					<option value="1">已核销</option>
					<option value="2">已赠送</option>
					<option value="3">撤回</option>
					<option value="4">已过期</option>
				</select><em class="triangle_border_down" id="sanjiaof"></em></span>
			<label style="padding-left:0!important;">来源</label>
			<span class="select_wrap"><select id="source">
					<option value="">全部</option>
					<option value="1">crm</option>
					<option value="2">有赞</option>
				</select><em class="triangle_border_down" id="sanjiaof"></em></span>
			<span class="querybtn" id="fangquerybtn" onclick="queryyewuyuans1()">查询</span><span class="clearbtn"
				onclick="clearstyle1()">清除</span>
			<span class="querybtn" id="fangquerybtn" onclick="queryyewuyuanf()"
				style="width: 100px;float: right;margin-right: 0;">导出数据</span>
		</div>
		<div class="tuancao_wrap1">

			<div class="tuandatalist_wrap" id="fangcardlist" style="margin-top:10px;">
				<table style=" border-collapse:collapse;width:100%;table-layout: fixed;">
					<tr style="height:40px;background:rgba(208,232,242,0.2);border:1px solid rgba(204,204,204,0.2);">
						<th class="item item1 ">序号</th>
						<th class="item fitem5f ">会员姓名</th>
						<th class="item fitem5f ">手机号码</th>
						<th class="item fitem5f ">优惠券名称</th>
						<th class="item fitem5f ">分享时间</th>
						<th class="item fitem5f ">领取时间</th>
						<th class="item fitem5f ">使用时间</th>
						<th class="item fitem5f ">会员性质</th>
						<th class="item fitem5f ">状态</th>
						<th class="item fitem5f ">来源</th>
					</tr>
					<tbody id="fangdatalist_wrap1">
						<!--  <tr>
	           <td class="item item1 ">1</td>
	           <td class="item fitem5f ">王小娟</td>
	           <td class="item fitem5f ">15218943782</td>
	           <td class="item fitem5f ">500元优惠券C</td>
	           <td class="item fitem5f ">2020-02-11</td>
	           <td class="item fitem5f ">2020-02-11</td>
	           <td class="item fitem5f ">2020-02-11</td>
	           <td class="item fitem5f ">老客</td>
			  <td class="item fitem5f ">已使用</td>
				 <td class="item fitem5f ">CRM</td>
	       </tr> -->


					</tbody>
				</table>
			</div>

			<div class="wswq" id="wswq2">
				<div class='page'></div>
				<div class="box" id="ywyboxpage1">
				</div>
			</div>
		</div>
	</div>
</body>
<script src="http://test.physicalclub.com/js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="http://test.physicalclub.com/easyui/moment.min.js"></script>
<script type="text/javascript" src="http://test.physicalclub.com/easyui/datepicker.all.js"></script>
<script type="text/javascript" src="http://test.physicalclub.com/easyui/datepicker.en.js"></script>
<script type="text/javascript" src="http://test.physicalclub.com/js/common.js"></script>
<script type="text/javascript" src="http://test.physicalclub.com/easyui/easyui-lang-zh_CN.js"></script>
<script>
	var couponList = [];
	function crmyhj(em) {
		$.each(couponList[0].crmCouponList, function (i, item) {
			var str = '<tr>' +
				'<td style="width:30%;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;">' +
				'<div class="xzhd-body-gouxuan" onclick="seletzm(1,this,\'' + item.couponId + '\',' + item.stockQuantity + ')">';
			if (item.selected) {
				str += '<img class="gouxuan"  id="' + item.couponId + '" src="../images/codeallset_btn.png" alt="" style="display: block;">';
			} else {
				str += '<img class="gouxuan"  id="' + item.couponId + '" src="../images/codeallset_btn.png" alt="" >';
			}
			str += '</div>' +
				'<p class="psda">' + item.activityName + '</p>' +
				'</td>' +
				'<td style="width:10%">' +
				'<div style="display:flex;justify-content: center;">' +
				'<img class="minus_minus" src="../images/minus_minus.png" alt="" onclick="yhzjs(this,\'' + item.couponId + '\',1)">' +
				'<p class="xzhd-body-kqsl">' + item.numbers1 + '</p>' +
				'<img class="add_add" src="../images/add_add.png" alt="" onclick="yhzadd(this,\'' + item.couponId + '\',1,' + item.stockQuantity + ',' + item.stockQuantity + ')">' +
				'</div>' +
				'</td>' +
				'<td style="width:10%">' + item.stockQuantity + '</td>' +
				'</tr>';
			$(em).parents('.xzhd-body-flex').find('.xzhd-body-tbody1').append(str)

		})
	}
	function yzyhj(em) {
		$.each(couponList[0].yzCouponList, function (i, item) {
			var str = '<tr>' +
				'<td style="width:30%;overflow:hidden;text-overflow:ellipsis;white-space: nowrap;">' +
				'<div class="xzhd-body-gouxuan" onclick="seletzm(2,this,\'' + item.id + '\',' + item.totalFansTaked + ')">';
			if (item.selected) {
				str += '<img class="gouxuan" id="' + item.id + '" src="../images/codeallset_btn.png" alt="" style="display: block;">';
			} else {
				str += '<img class="gouxuan"  id="' + item.id + '" src="../images/codeallset_btn.png" alt="" >';
			}
			str += '</div>' +
				'<p class="psda">' + item.title + '</p>' +
				'</td>' +
				'<td style="width:10%">' +
				'<div style="display:flex;justify-content: center;">' +
				'<img class="minus_minus" src="../images/minus_minus.png" alt="" onclick="yhzjs(this,\'' + item.id + '\',2)">' +
				'<p class="xzhd-body-kqsl">' + item.numbers1 + '</p>' +
				'<img class="add_add" src="../images/add_add.png" alt="" onclick="yhzadd(this,\'' + item.id + '\',2,' + item.totalFansTaked + ',' + item.totalFansTaked + ')">' +
				'</div>' +
				'</td>' +
				'<td style="width:10%">' + item.totalFansTaked + '</td>' +
				'</tr>';
			$(em).parents('.xzhd-body-flex').find('.xzhd-body-tbody1').append(str)
		})
	}
	function selectType(em, type) {
		$(".xzhd-body-tbody1").html("")
		$(".xzhd-body-henggang").parent().find("img").hide()
		$(em).find("img").show();
		$(em).children("img:last-child").hide();
		if (type == 1) {
			crmyhj(em);
		} else {
			yzyhj(em);
		}
	}
	function seletzm(i, em, id, kc) {
		if (kc == 0) {
			alert('库存为0，不能选择');
			return;
		}
		if ($(em).find('img').css("display") == "none") {
			$(em).find('img').show();
			if (i == 1) {
				$.each(couponList[0].crmCouponList, function (i, item) {
					if (item.couponId == id) {
						item.selected = true;
						var str = '<div class="cgysl" couponId="' + item.couponId + '" couponName="' + item.activityName + '" couponSource="1" quantity="' + item.numbers1 + '">' +
							'<p>CRM优惠券/' + item.activityName + '</p><p style="position: absolute;left: 80%;" class="koj">x' + item.numbers1 + '</p>' +
							'<img  onclick="deleteyhj(this,\'' + item.couponId + '\',1)"  class="xzhd-body-chacha" src="../images/classdel_btn.png">' +
							'</div>';
						$(em).parents('.xzhd-body-flex').find("#xzhd-body-fxhd").append(str);
					}
				})
			} else {
				$.each(couponList[0].yzCouponList, function (i, item) {
					if (item.id == id) {
						item.selected = true;
						var str = '<div class="cgysl"   couponId="' + item.id + '" couponName="' + item.title + '" couponSource="2" quantity="' + item.numbers1 + '">' +
							'<p>有赞优惠券/' + item.title +  '</p><p style="position: absolute;left: 80%;" class="koj">x' + item.numbers1 + '</p>' +
							'<img onclick="deleteyhj(this,\'' + item.id + '\',2)" class="xzhd-body-chacha" src="../images/classdel_btn.png">' +
							'</div>';
						$(em).parents('.xzhd-body-flex').find("#xzhd-body-fxhd").append(str);
					}
				})
			}


		} else {
			$(em).find('img').hide();
			$(em).parents('.xzhd-body-flex').find(".cgysl").each(function () {
				if ($(this).attr("couponid") == id) {
					$(this).remove();
				}
			})
			if (i == 1) {
				$.each(couponList[0].crmCouponList, function (i, item) {
					if (item.couponId == id) {
						item.selected = false;
					}
				})

			} else {
				$.each(couponList[0].yzCouponList, function (i, item) {
					if (item.id == id) {
						item.selected = false;
					}
				})
			}
		}
		if ($(em).parents('.xzhd-body-flex').find("#xzhd-body-fxhd .cgysl").length == 0) {
			$(em).parents('.xzhd-body-flex').find("#xzhd-body-fxhd .slsk").show();
		} else {
			$(em).parents('.xzhd-body-flex').find("#xzhd-body-fxhd .slsk").hide();
		}

		// console.log(JSON.stringify(couponList[0].crmCouponList))

	}
	function deleteyhj(em, id, i) {
		stopPropagation();
		$(em).parents('.cgysl').remove();
		if (i == 1) {
			$.each(couponList[0].crmCouponList, function (i, item) {
				if (item.couponId == id) {
					item.selected = false;
				}
			})

		} else {
			$.each(couponList[0].yzCouponList, function (i, item) {
				if (item.id == id) {
					item.selected = false;
				}
			})
		}
		$(".gouxuan").each(function () {
			if ($(this).attr("id") == id) {
				$(this).hide()
			}
		})


	}
	function yhzadd(em, id, i, p, ku) {
		if (ku == 0) {
			return;
		}
		if (p <= $(em).parent().find('p').text()) {
			return;
		}
		$(em).parent().find('p').text(parseInt($(em).parent().find('p').text()) + 1)
		if (i == 1) {
			$.each(couponList[0].crmCouponList, function (i, item) {
				if (item.couponId == id) {
					item.numbers1 = $(em).parent().find('p').text();
				}
			})
		} else {
			$.each(couponList[0].yzCouponList, function (i, item) {
				if (item.id == id) {
					item.numbers1 = $(em).parent().find('p').text();
				}
			})
		}
		$(em).parents('.xzhd-body-flex').find(".cgysl").each(function () {
			if ($(this).attr("couponid") == id) {
				$(this).attr("quantity", $(em).parent().find('p').text())
				$(this).find('.koj').text("x" + $(em).parent().find('p').text())
			}
		})
	}
	function yhzjs(em, id, i) {
		if ($(em).parent().find('p').text() < 2) {
			return;
		}
		$(em).parent().find('p').text(parseInt($(em).parent().find('p').text()) - 1)
		if (i == 1) {
			$.each(couponList[0].crmCouponList, function (i, item) {
				if (item.couponId == id) {
					item.numbers1 = $(em).parent().find('p').text();
				}
			})
		} else {
			$.each(couponList[0].yzCouponList, function (i, item) {
				if (item.id == id) {
					item.numbers1 = $(em).parent().find('p').text();
				}
			})
		}

		$(em).parents('.xzhd-body-flex').find(".cgysl").each(function () {
			if ($(this).attr("couponid") == id) {
				$(this).attr("quantity", $(em).parent().find('p').text())
				$(this).find('.koj').text("x" + $(em).parent().find('p').text())
			}
		})
	}
	// console.log(JSON.stringify(couponList))

	function showyhz(em) {
		stopPropagation();
		if ($(em).parent().find("#xzhd-body-fxhd-zhankai").css("display") == "none") {
			$(".xzhd-body-fxhd-zhankai1").css("display", "none")
			$(em).parent().find("#xzhd-body-fxhd-zhankai").css("display", "inherit");
		} else {
			$(em).parent().find("#xzhd-body-fxhd-zhankai").css("display", "none");
		}
		$(".xzhd-body-tbody1").html("")
		$(".xzhd-body-henggang").parent().find("img").hide()
		$.each(couponList[0].crmCouponList, function (i, item) {
			item.numbers1 = 1
			item.selected = false;
		})
		$.each(couponList[0].yzCouponList, function (i, item) {
			item.numbers1 = 1
			item.selected = false;
		})

		$(em).parent().find(".cgysl").each(function () {
			var that = $(this)
			if ($(this).attr("couponsource") == 1) {
				console.log(3242332)
				$.each(couponList[0].crmCouponList, function (i, item) {
					if (item.couponId == that.attr("couponid")) {
						console.log(3432)
						item.numbers1 = that.attr("quantity");
						item.selected = true;
					}
				})
			} else {
				$.each(couponList[0].yzCouponList, function (i, item) {
					if (item.id == that.attr("couponid")) {
						item.numbers1 = that.attr("quantity");
						item.selected = true;
					}
				})
			}
		})
		crmyhj(em)
		// $(em).pare
	}
	function stopfz() {
		stopPropagation();
	}
	function stopPropagation(e) {
		e = e || window.event;
		if (e.stopPropagation) { //W3C阻止冒泡方法  
			e.stopPropagation();
		} else {
			e.cancelBubble = true; //IE阻止冒泡方法  
		}
	}

	var eachPage = 15, eachPage1 = 10;
	var editFlag = false, editId = "";
	$(".xzhd-body-zstjraduis").on("click", function () {
		$('.xzhd-body-zstjraduis p').hide();
		$(this).find("p").show();
		$("#onlyNewPeople").val($(this).attr("vals"))
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
	function tihuan(item) {

		if (item == undefined || item == null) {
			item = ""
		} else {
			return item
		}
		return item
	}
	var fintoPages3 = 1, fintoPages4 = 1;
	function queryyewuyuans() {
		fintoPages3 = 1;
		queryyewuyuan()
	}
	function queryyewuyuans1() {
		fintoPages4 = 1;
		selectActivityCouponList();
	}
	// 清除
	function clearstyles() {
		$("#ygmdgonghao").val("")
		$("#activity").val(" ")
		$("#startDate").val("")
		$("#endDate").val("")
		queryyewuyuans();
	}
	// 清除
	function clearstyle1() {
		$("#activezt").val(" ")
		$("#coupName").val(" ")
		$("#ygmdselectDate1").val("")
		$("#ygmdselectDate2").val("")
		$("#source").val(" ")
		queryyewuyuans1();
	}
	var fonPagechange3 = function (page) {
		console.log('当前点击入场页码', page);
		if (fintoPages3 == page) {
			return;
		}
		if (fintoPages3 != page) {
			fintoPages3 = page;
			queryyewuyuan();
		}
	}
	var fonPagechange4 = function (page) {
		console.log('当前点击入场页码', page);
		if (fintoPages4 == page) {
			return;
		}
		if (fintoPages4 != page) {
			fintoPages4 = page;
			selectActivityCouponList();
		}
	}

	queryyewuyuan();
	coupon();
	function queryyewuyuan() {

		var data = {
			page: fintoPages3,
			rows: eachPage,
			param: {
				name: $("#ygmdgonghao").val(),
				status: $("#activity").val(),
				pacId: 2,
				startDate: $("#startDate").val(),
				endDate: $("#endDate").val()
			}

		}
		$.ajax({
			type: "post",
			url: "rest/shareActivity/selectShareActivityList",
			contentType: "application/json;charset=UTF-8",
			dataType: "json",
			data: JSON.stringify(data),
			success: function (res) {

				//console.log(res)
				if (res.status) {
					$('#fangdatalist_wrap').html('')
					var data = res.rows;
					if (data.length > 0) {
						$("#wswq1").show();
						$('#ywyboxpage').show();
						var intoNum = (fintoPages3 - 1) * eachPage; //序号
						for (var i = 0; i < data.length; i++) {
							intoNum++;
							var item = data[i];
							var str = '<tr>' +
								'<td class="item item1 "><p>' + intoNum + '</p></td>' +
								'<td class="item fitem6f "><p>' + item.activityName + '</p></td>' +
								'<td class="item fitem6f "><p>' + item.activityStartDate.split(" ")[0] + '-' + item.activityEndDate.split(" ")[0] + '</p></td>' +
								'<td class="item fitem5f "><p>' + item.shareCustomerNum + '</p></td>' +
								'<td class="item fitem5f "><p>' + item.receiveCount + '</p></td>' +
								'<td class="item fitem5f "><p>' + item.useCount + '</p></td>' +
								'<td class="item fitem5f coloritem ">' + (item.state == 0 ? '未开始' : item.state == 1 ? '活动中' : item.state == 2 ? '已结束' : '') + '</td>' +
								'<td class="item fitem2f">' +
								'<span class="bianji" onclick="lookData(\'' + item.id + '\',\'' + item.activityName + '\')">数据</span>';
							if (item.state == 0) {
								str += '<span class="bianji" onclick="edit(0,\'' + item.id + '\')">｜编辑</span>';
							}
							if (item.state == 1 || item.state == 2) {
								str += '<span class="bianji" onclick="edit(1,\'' + item.id + '\')">｜查看</span>';
							}
							if (item.state == 0 || item.state == 1) {
								str += '<span class="bianji" onclick="remove(this,\'' + item.id + '\',' + item.state + ')">｜' + (item.state == 0 ? '开启' : '失效') + '</span>';
							}
							str += '</td>' +
								'</tr>';

							$('#fangdatalist_wrap').append(str)



							// if($('.coloritem').html() == '活动中'){
							// 	console.log(111)
							// 	$('#fangdatalist_wrap').children().children().children().eq(i).children().css('background','#f7a567')
							// 	$('#fangdatalist_wrap').children().children().children().eq(i).children().eq(7).css('border-top', '1px solid #f7a567')
							// }
						}
					} else {

						$("#wswq1").hide();
						$('#ywyboxpage').hide()

					}
					if (intoNum != 0) {
						var obj = {
							wrapid: 'ywyboxpage', //页面显示分页器容器id
							total: res.total, //总条数
							pagesize: eachPage, //每页显示10条
							currentPage: fintoPages3, //当前页
							onPagechange: fonPagechange3,
							//btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
						}
						pagination.init(obj);
						$("#wswq1 .page").html("共" + res.total + "条，每页" + eachPage + "条")
						// var strpage="<span class='page'>共"+res.total+"条，每页"+eachPage+"条</span>";
						// $("#ywyboxpage").prepend(strpage)

					}
					for (var ii = 0; ii < $('#fangcardlist').children().children().children().length; ii++) {
						//console.log($('#fangcardlist').children().children().children().eq(ii).children().eq(6).html())
						if ($('#fangcardlist').children().children().children().eq(ii).children().eq(6).html() == '活动中') {
							$('#fangcardlist').children().children().children().eq(ii).children().eq(6).css('color', '#ff0000')
						}
					}

					$('#fangcardlist').children().children().children().mouseover(function () {
						$(this).children('td').css('background', '#faa262')
						$(this).children('td').children('p').css('color', 'white')
					})

					$('#fangcardlist').children().children().children().mouseout(function () {
						$(this).children('td').css('background', '#ffffff')
						$(this).children('td').children('p').css('color', '#444444')
					})

				}
			},
			error: function (res) {
				console.log(res)
			}
		});
	}
	$("#addjuesebtn").on("click", function () {
		editFlag = false;
		$("#isedit").show();
		$(".lookHide").hide();
		$(".xzhd-body").show();
		$("#bussess_user").hide();
		$("#activityName").val('');
		$("#activityStartDate").val('');
		$("#activityEndDate").val('');
		$("#maxReceiveNumber").val('');
		$("#onlyNewPeople").val('')
		$("#shareTitle").val('');
		$("#shareDescription").val('');
		$("#fontColor").val('');
		$("#xzhd-body-text-count").text(0);
		$("#xzhd-body-fxwzbt-text-count").text(0);
		$("#xzhd-body-fxhdxs-text-count").text(0);
		$("#addlingqu").html("");
		$('.xundata #xzhd-body-fxhd').html("");
		$(".xundata").find("input").val("")
		var str = '<p class="slsk">请选择要分享的优惠券</p>';
		$('.xundata #xzhd-body-fxhd').append(str);
		$('.mksdd #xzhd-body-fxhd').html("");
		var str1 = '<p  class="slsk">请选择领取人可获得的优惠券</p>';
		$('.mksdd #xzhd-body-fxhd').append(str1);
		$(".xzhd-body-zstjraduis").each(function () {
			$(this).find("p").hide();
		})
		$(".successcg").each(function (index) {
			$(this).text("上传");
			$(this).css("font-size", "16px");
		})

		pageBackgroundUrl = "";
		shareButtonUrl = "";
		sharePosterUrl = "";
		receiveBackgroundUrl = "";
		receiveButtonUrl = "";
		sharePosterButtonUrl = "";
		shareBuddyLinksUrl = "";
		$(".xzbac").each(function (index) {
			$(this).css({
				'background': 'rgba(245,245,245,1)'
			})
		})
	})
	var imgType = 1, pageBackgroundUrl = "", shareButtonUrl = "", sharePosterUrl = "", receiveBackgroundUrl = "", receiveButtonUrl = "", sharePosterButtonUrl = "", shareBuddyLinksUrl = "";
	$("#uploadss1").on("click", function () {
		$("#collection").click();
		imgType = 1;
	})
	$("#uploadss2").on("click", function () {
		$("#collection").click();
		imgType = 2;
	})
	$("#uploadss3").on("click", function () {
		$("#collection").click();
		imgType = 3;
	})
	$("#uploadss4").on("click", function () {
		$("#collection").click();
		imgType = 4;
	})
	$("#uploadss5").on("click", function () {
		$("#collection").click();
		imgType = 5;
	})
	$("#uploadss6").on("click", function () {
		$("#collection").click();
		imgType = 6;
	})
	$("#uploadss7").on("click", function () {
		$("#collection").click();
		imgType = 7;
	})
	$("#collection").change(function () {
		let file = $("#collection").val()
		let filename = file.substr(file.lastIndexOf("."));
		if (filename != '.png' && filename != '.jpeg' && filename != '.jpg') {
			alert("请上传图片格式的文件");
			return;
		}

		var formData = new FormData();
		formData.append('file', document.getElementById('collection').files[0])
		$("#uploadss" + imgType).css("font-size", "13px");
		$("#uploadss" + imgType).text("正在上传")
		$.ajax({
			url: "rest/shareActivity/uploadShareActivityFile",
			type: "post",
			data: formData,
			contentType: false,
			processData: false,
			success: function (data) {
				if (data.status) {
					$(".uploadssimg" + imgType).css({
						"background": "url(" + 'images/' + data.rows[0].path + ") center / 100% no-repeat"
					})
					$("#uploadss" + imgType).text("上传成功")
					if (imgType == 1) {
						pageBackgroundUrl = 'images/' + data.rows[0].path;
					} else if (imgType == 2) {
						shareButtonUrl = 'images/' + data.rows[0].path;
					} else if (imgType == 3) {
						sharePosterButtonUrl = 'images/' + data.rows[0].path;
					} else if (imgType == 4) {
						shareBuddyLinksUrl = 'images/' + data.rows[0].path;
					} else if (imgType == 5) {
						sharePosterUrl = 'images/' + data.rows[0].path;
					} else if (imgType == 6) {
						receiveBackgroundUrl = 'images/' + data.rows[0].path;
					} else if (imgType == 7) {
						receiveButtonUrl = 'images/' + data.rows[0].path;
					}
				} else {
					$("#uploadss" + imgType).text("上传失败")
				}

				console.log(data)
			},
			error: function (data) {
				$("#uploadss" + imgType).text("上传失败")
			}
		});
	});
	// 新增保存
	$("#xzhd-body-save").on("click", function () {
		var activityName = $.trim($("#activityName").val());
		var activityStartDate = $("#activityStartDate").val();
		var activityEndDate = $("#activityEndDate").val();
		var maxReceiveNumber = $.trim($("#maxReceiveNumber").val());
		var onlyNewPeople = $("#onlyNewPeople").val();
		var shareTitle = $.trim($("#shareTitle").val());
		var shareDescription = $.trim($("#shareDescription").val());
		var fontColor = $.trim($("#fontColor").val());
		if (activityName == "") {
			alert("请填写活动名称")
			return;
		}
		if (activityStartDate == "") {
			alert("请选择开始日期")
			return;
		}
		if (activityEndDate == "") {
			alert("请选择结束日期")
			return;
		}
		if (maxReceiveNumber == "") {
			alert("请填写最大领取人数")
			return;
		}
		if (onlyNewPeople == "") {
			alert("请选择是否仅限新客领取")
			return;
		}
		var flags = 0, flags1 = 0, flags2 = 0;
		$('.xundata').each(function () {
			if ($(this).find('input').val() == "") {
				flags = 1;
			}
			if ($(this).find(".cgysl").length == 0) {
				flags1 = 1;
			}
		})
		if (flags == 1) {
			alert('请填写完分享可获得中的领取人数')
			return;
		}
		if (flags1 == 1) {
			alert('请选择完分享可获得中的优惠券')
			return;
		}
		$('.xundata1').each(function () {
			if ($(this).find(".cgysl").length == 0) {
				flags2 = 1;
			}
		})
		if (flags2 == 1) {
			alert('请选择领取人可获得的优惠券')
			return;
		}
		if (shareTitle == "") {
			alert("请填写分享标题")
			return;
		}
		if (shareDescription == "") {
			alert("请填写分享描述")
			return;
		}
		if (pageBackgroundUrl == '' || shareButtonUrl == '' || sharePosterUrl == '' || receiveBackgroundUrl == '' || receiveButtonUrl == '' || sharePosterButtonUrl == '' || shareBuddyLinksUrl == '') {
			alert('请上传完图片');
			return;
		}
		if (fontColor == '') {
			alert('请填写字体颜色');
			return;
		}
		var data = {
			"activityName": activityName,
			"activityStartDate": activityStartDate,
			"activityEndDate": activityEndDate,
			"maxReceiveNumber": maxReceiveNumber,
			"onlyNewPeople": onlyNewPeople,
			"pageBackgroundUrl": pageBackgroundUrl,
			"shareButtonUrl": shareButtonUrl,
			"sharePosterUrl": sharePosterUrl,
			"receiveBackgroundUrl": receiveBackgroundUrl,
			"receiveButtonUrl": receiveButtonUrl,
			"sharePosterButtonUrl": sharePosterButtonUrl,
			"shareBuddyLinksUrl": shareBuddyLinksUrl,
			"shareTitle": shareTitle,
			"shareDescription": shareDescription,
			"fontColor": fontColor,
			"receiveCouponList": [],
			"shareCouponList": []
		}
		var huodeList = [], huodeList1 = [];
		$('.xundata').each(function () {
			var that = $(this);
			$(this).find(".cgysl").each(function () {
				var duix = {
					"invitationNumber": that.find('input').val(),
					"couponId": $(this).attr("couponid"),
					"couponName": $(this).attr("couponname"),
					"couponSource": $(this).attr("couponsource"),
					"quantity": $(this).attr("quantity")
				}
				huodeList.push(duix)
			})
		})
		$('.xundata1').each(function () {
			var that = $(this);
			$(this).find(".cgysl").each(function () {
				var duix = {
					"couponId": $(this).attr("couponid"),
					"couponName": $(this).attr("couponname"),
					"couponSource": $(this).attr("couponsource"),
					"quantity": $(this).attr("quantity")
				}
				huodeList1.push(duix)
			})
		})
		data.shareCouponList = huodeList;
		data.receiveCouponList = huodeList1;
		$("#xzhd-body-save").text("正在保存");
		if (editFlag) {
			data.id = editId;
			$.ajax({
				type: "post",
				url: "rest/shareActivity/updateMarketingActivities",
				contentType: "application/json;charset=UTF-8",
				dataType: "json",
				data: JSON.stringify(data),
				success: function (res) {
					$("#xzhd-body-save").text("保存");
					console.log(res)
					if (res.status) {
						backsyj();
						queryyewuyuans();
					} else {
						alert(res.message)
					}
				},
				error: function (res) {
					$("#xzhd-body-save").text("保存");
					console.log(res)
				}
			});
		} else {
			$.ajax({
				type: "post",
				url: "rest/shareActivity/insertMarketingActivities",
				contentType: "application/json;charset=UTF-8",
				dataType: "json",
				data: JSON.stringify(data),
				success: function (res) {
					$("#xzhd-body-save").text("保存");
					console.log(res)
					if (res.status) {
						backsyj();
						queryyewuyuans();
					} else {
						alert(res.message)
					}
				},
				error: function (res) {
					$("#xzhd-body-save").text("保存");
					console.log(res)
				}
			});
		}

		// if(fontColor==""){
		// 		  alert("请填写字体颜色")
		// 		  return;
		// }


	})
	$("#ygmdgonghao").on("keydown", function (event) {
		if (event.keyCode == 13) {
			queryyewuyuans();
		}
	})

	// 查看数据
	var selectActivityCouponStatistics = [], activityid = "";
	function lookData(id, name) {
		$("#bussess_user").hide();
		$("#listdata").show();
		$("#huodongName").text(name);
		activityid = id;
		clearstyle1();
		$('#coupons').html("")
		$('#coupName').html("")
		$('#fangdatalist_wrap1').html('')
		$.ajax({
			type: "get",
			url: "rest/shareActivity/selectActivityCouponStatistics/" + id,
			success: function (res) {
				console.log(JSON.stringify(res))
				if (res.status) {
					if (res.rows.length > 0) {
						selectActivityCouponStatistics = res.rows;
						for (var i = 0; i < selectActivityCouponStatistics.length; i++) {
							var item = selectActivityCouponStatistics[i];
							var str = '<div class="coupons1">' +
								'<p class="cqs">' + item.couponName + '</p>' +
								'<div class="detail">' +
								'<div class="item">' +
								'<p class="ylq">已领取</p>' +
								'<p class="yly">' + item.totalCount + '</p>' +
								'</div>' +
								'<div class="item">' +
								'<p class="ylq">已使用</p>' +
								'<p class="yly">' + item.count + '</p>' +
								'</div>' +
								'</div>' +
								'</div>';
							$('#coupons').append(str)
							if (i == 2) {
								break;
							}
						}
						if (selectActivityCouponStatistics.length > 3) {
							var str1 = '<div class="more" onclick="more()">更多 <span class="test">ˇ</span></div>';
							$('#coupons').append(str1)
						}
					}

				}
			},
			error: function (res) {
				console.log(res)
			}
		});

		// 优惠券下拉框
		$.ajax({
			type: "get",
			url: "rest/shareActivity/getCouponDropdownList/" + id,
			success: function (res) {
				console.log(JSON.stringify(res))
				if (res.status) {
					if (res.rows.length > 0) {
						var str = '<option value="">全部</option>';
						$('#coupName').append(str)
						for (var i = 0; i < res.rows.length; i++) {
							var item = res.rows[i];
							var str = '<option value="' + item.couponId + '">' + item.couponName + '</option>';
							$('#coupName').append(str)
						}

					}

				}
			},
			error: function (res) {
				console.log(res)
			}
		});
		selectActivityCouponList();
	}
	// 导出
	function queryyewuyuanf() {
		window.location.href = "rest/shareActivity/exportActivityCoupon?activityId=" + activityid
	}
	//优惠券明细
	function selectActivityCouponList() {
		var data = {
			page: fintoPages4,
			rows: eachPage1,
			activityId: activityid,
			status: $("#activezt").val(),
			couponId: $("#coupName").val(),
			startDate: $("#ygmdselectDate1").val(),
			endDate: $("#ygmdselectDate2").val(),
			couponSource: $("#source").val(),
		}
		$.ajax({
			type: "post",
			url: "rest/shareActivity/selectActivityCouponList",
			contentType: "application/json;charset=UTF-8",
			dataType: "json",
			data: JSON.stringify(data),
			success: function (res) {
				console.log(res)
				if (res.status) {
					$('#fangdatalist_wrap1').html('')
					var data = res.rows;
					if (data.length > 0) {
						$("#wswq2").show();
						$('#ywyboxpage1').show();
						var intoNum = (fintoPages4 - 1) * eachPage1; //序号
						for (var i = 0; i < data.length; i++) {
							intoNum++;
							var item = data[i];
							var str = '<tr>' +
								'<td class="item item1">' + intoNum + '</td>' +
								'<td class="item fitem5f ">' + (item.customerName ? item.customerName : '--') + '</td>' +
								'<td class="item fitem5f ">' + (item.mobile ? item.mobile : '--') + '</td>' +
								'<td class="item fitem5f ">' + (item.couponName ? item.couponName : '--') + '</td>' +
								'<td class="item fitem5f ">' + (item.shareDate ? item.shareDate.split(" ")[0] : '--') + '</td>' +
								'<td class="item fitem5f ">' + (item.receiveDate ? item.receiveDate.split(" ")[0] : '--') + '</td>' +
								'<td class="item fitem5f ">' + (item.verifyDate ? item.verifyDate.split(" ")[0] : '--') + '</td>' +
								'<td class="item fitem5f ">' + (item.customerNature == 1 ? '老客' : '新客') + '</td>' +
								'<td class="item fitem5f ">' + (item.status == 0 ? '未核销' : item.status == 1 ? '已核销' : item.status == 2 ? '已赠送' : item.status == 3 ? '撤回' : item.status == 4 ? '已过期' : '--') + '</td>' +
								'<td class="item fitem5f ">' + (item.couponSource == 1 ? 'crm' : item.couponSource == 2 ? '有赞' : '--') + '</td>' +
								'</tr>';

							$('#fangdatalist_wrap1').append(str)
						}
					} else {

						$('#wswq2').hide()
						$('#ywyboxpage1').hide()
					}
					if (intoNum != 0) {
						var obj = {
							wrapid: 'ywyboxpage1', //页面显示分页器容器id
							total: res.total, //总条数
							pagesize: eachPage1, //每页显示10条
							currentPage: fintoPages4, //当前页
							onPagechange: fonPagechange4,
							//btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
						}
						pagination.init(obj);
						$("#wswq2 .page").html("共" + res.total + "条，每页" + eachPage1 + "条")

					}

				}
			},
			error: function (res) {
				console.log(res)
			}
		});
	}
	var moreFlag = false;
	function more() {
		if (moreFlag) {
			$('#coupons').html("")
			for (var i = 0; i < selectActivityCouponStatistics.length; i++) {
				var item = selectActivityCouponStatistics[i];
				var str = '<div class="coupons1">' +
					'<p class="cqs">' + item.couponName + '</p>' +
					'<div class="detail">' +
					'<div class="item">' +
					'<p class="ylq">已领取</p>' +
					'<p class="yly">' + item.totalCount + '</p>' +
					'</div>' +
					'<div class="item">' +
					'<p class="ylq">已使用</p>' +
					'<p class="yly">' + item.count + '</p>' +
					'</div>' +
					'</div>' +
					'</div>';
				$('#coupons').append(str)
				if (i == 2) {
					break;
				}
			}
			if (selectActivityCouponStatistics.length > 3) {
				var str1 = '<div class="more" onclick="more()">更多 <span class="test">ˇ</span></div>';
				$('#coupons').append(str1)
			}
			moreFlag = false;
		} else {
			$('#coupons').html("")
			for (var i = 0; i < selectActivityCouponStatistics.length; i++) {
				var item = selectActivityCouponStatistics[i];
				var str = '<div class="coupons1">' +
					'<p class="cqs">' + item.couponName + '</p>' +
					'<div class="detail">' +
					'<div class="item">' +
					'<p class="ylq">已领取</p>' +
					'<p class="yly">' + item.totalCount + '</p>' +
					'</div>' +
					'<div class="item">' +
					'<p class="ylq">已使用</p>' +
					'<p class="yly">' + item.count + '</p>' +
					'</div>' +
					'</div>' +
					'</div>';
				$('#coupons').append(str)

			}
			if (selectActivityCouponStatistics.length > 3) {
				var str1 = '<div class="more" onclick="more()">更多 <span class="test">ˇ</span></div>';
				$('#coupons').append(str1)
			}
			moreFlag = true;
		}
	}
	// 编辑，查看
	function edit(num, id) {
		$("#bussess_user").hide();
		$(".xzhd-body").show();
		editFlag = true;
		editId = id;
		if (num == 0) {
			$("#isedit").show();
			$(".lookHide").hide();
		} else if (num == 1) {
			$("#isedit").hide();
			$(".lookHide").show();
		}
		$.ajax({
			type: "get",
			url: "rest/shareActivity/getActivitiesInfoById/" + id,
			success: function (res) {
				console.log(JSON.stringify(res))
				if (res.status) {
					if (res.rows.length > 0) {
						var item = res.rows[0];
						$("#activityName").val('');
						$("#activityStartDate").val('');
						$("#activityEndDate").val('');
						$("#maxReceiveNumber").val('');
						$("#onlyNewPeople").val('')
						$("#shareTitle").val('');
						$("#shareDescription").val('');
						$("#fontColor").val('');
						$("#xzhd-body-text-count").text(0);
						$("#xzhd-body-fxwzbt-text-count").text(0);
						$("#xzhd-body-fxhdxs-text-count").text(0);
						$(".xzhd-body-zstjraduis").each(function () {
							$(this).find("p").hide();
						})
						$("#addlingqu").html("");
						$('.xundata #xzhd-body-fxhd').html("");
						$(".xundata").find("input").val("")
						// var str='<p class="slsk">请选择要分享的优惠券</p>';
						// $('.xundata #xzhd-body-fxhd').append(str);
						$('.mksdd #xzhd-body-fxhd').html("");
						// var str1='<p  class="slsk">请选择领取人可获得的优惠券</p>';
						// $('.mksdd #xzhd-body-fxhd').append(str1);
						var jslist = normalizeSinger(item.shareCouponList);
						console.log(JSON.stringify(jslist))
						var kk = 0;
						$.each(jslist, function (index, item) {
							var renshu = 0, arStr = "";
							$.each(item.items, function (index1, item) {
								if (kk == 0) {
									$(".xundata").find("input").val(index)
									if (item.couponSource == 1) {
										var str = '<div class="cgysl" couponId="' + item.couponId + '" couponName="' + item.couponName + '" couponSource="1" quantity="' + item.quantity + '">' +
											'<p>CRM优惠券/' + item.couponName +'</p><p style="position: absolute;left: 80%;" class="koj">x' + item.quantity + '</p>' +
											'<img  onclick="deleteyhj(this,\'' + item.couponId + '\',1)"  class="xzhd-body-chacha" src="../images/classdel_btn.png">' +
											'</div>';
										$('.xundata #xzhd-body-fxhd').append(str);
									} else {
										var str = '<div class="cgysl"   couponId="' + item.couponId + '" couponName="' + item.couponName + '" couponSource="2" quantity="' + item.quantity + '">' +
											'<p>有赞优惠券/' + item.couponName + '</p><p style="position: absolute;left: 80%;" class="koj">x' + item.quantity + '</p>' +
											'<img onclick="deleteyhj(this,\'' + item.couponId + '\',2)" class="xzhd-body-chacha" src="../images/classdel_btn.png">' +
											'</div>';
										$('.xundata #xzhd-body-fxhd').append(str);
									}

								} else {
									if (item.couponSource == 1) {
										var str = '<div class="cgysl" couponId="' + item.couponId + '" couponName="' + item.couponName + '" couponSource="1" quantity="' + item.quantity + '">' +
											'<p>CRM优惠券/' + item.couponName + '</p><p style="position: absolute;left: 80%;" class="koj">x' + item.quantity + '</p>' +
											'<img  onclick="deleteyhj(this,\'' + item.couponId + '\',1)"  class="xzhd-body-chacha" src="../images/classdel_btn.png">' +
											'</div>';
										arStr += str;
									} else {
										var str = '<div class="cgysl"   couponId="' + item.couponId + '" couponName="' + item.couponName + '" couponSource="2" quantity="' + item.quantity + '">' +
											'<p>有赞优惠券/' + item.couponName + '</p><p style="position: absolute;left: 80%;" class="koj">x' + item.quantity + '</p>' +
											'<img onclick="deleteyhj(this,\'' + item.couponId + '\',2)" class="xzhd-body-chacha" src="../images/classdel_btn.png">' +
											'</div>';
										arStr += str;
									}

								}
							})
							if (kk != 0) {
								console.log(index)
								console.log(arStr)
								addlingqur(index, arStr);
							}
							kk = 1;
							// console.log()
						})
						$.each(item.receiveCouponList, function (index, item) {
							if (item.couponSource == 1) {
								var str = '<div class="cgysl" couponId="' + item.couponId + '" couponName="' + item.couponName + '" couponSource="1" quantity="' + item.quantity + '">' +
									'<p>CRM优惠券/' + item.couponName + '</p><p style="position: absolute;left: 80%;" class="koj">x' + item.quantity + '</p>' +
									'<img  onclick="deleteyhj(this,\'' + item.couponId + '\',1)"  class="xzhd-body-chacha" src="../images/classdel_btn.png">' +
									'</div>';
								$('.mksdd #xzhd-body-fxhd').append(str);
							} else {
								var str = '<div class="cgysl"   couponId="' + item.couponId + '" couponName="' + item.couponName + '" couponSource="2" quantity="' + item.quantity + '">' +
									'<p>有赞优惠券/' + item.couponName + '</p><p style="position: absolute;left: 80%;" class="koj">x' + item.quantity + '</p>' +
									'<img onclick="deleteyhj(this,\'' + item.couponId + '\',2)" class="xzhd-body-chacha" src="../images/classdel_btn.png">' +
									'</div>';
								$('.mksdd #xzhd-body-fxhd').append(str);
							}
						})
						pageBackgroundUrl = "";
						shareButtonUrl = "";
						sharePosterUrl = "";
						receiveBackgroundUrl = "";
						receiveButtonUrl = "";
						sharePosterButtonUrl = "";
						shareBuddyLinksUrl = "";
						$(".xzbac").each(function (index) {
							$(this).css({
								'background': 'rgba(245,245,245,1)'
							})
						})
						$(".successcg").each(function (index) {
							$(this).text("上传");
							$(this).css("font-size", "16px");
						})
						$("#activityName").val(item.activityName);
						$("#xzhd-body-text-count").text(item.activityName ? item.activityName.length : 0)
						$("#activityStartDate").val(item.activityStartDate.split(" ")[0]);
						$("#activityEndDate").val(item.activityEndDate.split(" ")[0]);
						$("#maxReceiveNumber").val(item.maxReceiveNumber);
						$("#onlyNewPeople").val(item.onlyNewPeople)
						$("#shareTitle").val(item.shareTitle);
						$("#xzhd-body-fxwzbt-text-count").text(item.shareTitle ? item.shareTitle.length : 0)
						$("#shareDescription").val(item.shareDescription);
						$("#xzhd-body-fxhdxs-text-count").text(item.shareDescription ? item.shareDescription.length : 0)
						$("#fontColor").val(item.fontColor ? item.fontColor : '');
						$(".xzhd-body-zstjraduis").each(function () {
							if ($(this).attr("vals") == item.onlyNewPeople) {
								$(this).find("p").show();
							}
						})

						if (item.pageBackgroundUrl != '') {
							pageBackgroundUrl = item.pageBackgroundUrl;
							$(".uploadssimg1").css({
								"background": "url(" + item.pageBackgroundUrl + ") center / 100% no-repeat"
							})
						}
						if (item.shareButtonUrl != '') {
							shareButtonUrl = item.shareButtonUrl;
							$(".uploadssimg2").css({
								"background": "url(" + item.shareButtonUrl + ") center / 100% no-repeat"
							})
						}
						if (item.sharePosterButtonUrl != '') {
							sharePosterButtonUrl = item.sharePosterButtonUrl;
							$(".uploadssimg3").css({
								"background": "url(" + item.sharePosterButtonUrl + ") center / 100% no-repeat"
							})
						}
						if (item.shareBuddyLinksUrl != '') {
							shareBuddyLinksUrl = item.shareBuddyLinksUrl;
							$(".uploadssimg4").css({
								"background": "url(" + item.shareBuddyLinksUrl + ") center / 100% no-repeat"
							})
						}
						if (item.sharePosterUrl != '') {
							sharePosterUrl = item.sharePosterUrl;
							$(".uploadssimg5").css({
								"background": "url(" + item.sharePosterUrl + ") center / 100% no-repeat"
							})
						}
						if (item.receiveBackgroundUrl != '') {
							receiveBackgroundUrl = item.receiveBackgroundUrl;
							$(".uploadssimg6").css({
								"background": "url(" + item.receiveBackgroundUrl + ") center / 100% no-repeat"
							})
						}
						if (item.receiveButtonUrl != '') {
							receiveButtonUrl = item.receiveButtonUrl;
							$(".uploadssimg7").css({
								"background": "url(" + item.receiveButtonUrl + ") center / 100% no-repeat"
							})
						}
					}

				} else {
					alert(res.message)
				}
			},
			error: function (res) {
				console.log(res)
			}
		});
	}

	function normalizeSinger(list) {
		let map = {
		}
		list.forEach((item, index) => {
			const key = item.invitationNumber
			if (!map[key]) {
				map[key] = {
					title: key,
					items: []
				}
			}
			map[key].items.push(item)
		})
		return map;
	}
	// 优惠券
	function coupon() {
		$.ajax({
			type: "get",
			url: "rest/shareActivity/getCouponList",
			success: function (res) {

				//console.log(JSON.stringify(res))
				if (res.status) {
					if (res.rows.length > 0) {
						couponList = res.rows;
						$.each(couponList[0].crmCouponList, function (i, item) {
							item.selected = false;
							item.numbers1 = 1;
						})
						$.each(couponList[0].yzCouponList, function (i, item) {
							item.selected = false;
							item.numbers1 = 1;
						})
					}

				}
			},
			error: function (res) {
				console.log(res)
			}
		});
	}
	// 放大图片
	$(document).on("click", ".xzbac", function () {
		if ($(this).attr('valnum') == 1) {
			if (pageBackgroundUrl != '') {
				window.open(pageBackgroundUrl)
			}
		}
		if ($(this).attr('valnum') == 2) {
			if (shareButtonUrl != '') {
				window.open(shareButtonUrl)
			}
		}
		if ($(this).attr('valnum') == 3) {
			if (sharePosterButtonUrl != '') {
				window.open(sharePosterButtonUrl)
			}
		}
		if ($(this).attr('valnum') == 4) {
			if (shareBuddyLinksUrl != '') {
				window.open(shareBuddyLinksUrl)
			}
		}
		if ($(this).attr('valnum') == 5) {
			if (sharePosterUrl != '') {
				window.open(sharePosterUrl)
			}
		}
		if ($(this).attr('valnum') == 6) {
			if (receiveBackgroundUrl != '') {
				window.open(receiveBackgroundUrl)
			}
		}
		if ($(this).attr('valnum') == 7) {
			if (receiveButtonUrl != '') {
				window.open(receiveButtonUrl)
			}
		}

	})
	function backsyj() {
		$(".xzhd-body").hide();
		$("#listdata").hide();
		$("#bussess_user").show();
	}
	// 人数增加减少

	function add(em) {
		if ($(em).parent().parent().find('input').val() == '') {
			$(em).parent().parent().find('input').val(1)
		} else {
			$(em).parent().parent().find('input').val(parseInt($(em).parent().parent().find('input').val()) + 1)
		}
	}
	function reduce(em) {
		if ($(em).parent().parent().find('input').val() == '' || $(em).parent().parent().find('input').val() <= 1) {
		} else {
			$(em).parent().parent().find('input').val(parseInt($(em).parent().parent().find('input').val()) - 1)
		}
	}
	// 失效
	function remove(em, aid, sta) {
		stopPropagation();
		$(".remove").remove();
		var str = '<div class="remove">' +
			'<div class="removeSX">' +
			'<div class="wz">' + (sta == 0 ? '是否立即开启活动' : '是否立即结束活动') + '</div>' +
			'<div class="removeBtn">' +
			'<div class="rebtn" onclick="removeQD(this,\'' + aid + '\',' + sta + ')">确定</div>' +
			'<div class="rebtn active" onclick="cancel()">取消</div>' +
			'</div>' +
			'</div>' +
			'<div class="tip">结束后活动停止，已领取的优惠券还能继续使用！</div>' +
			'</div>';
		$(em).parent().append(str)
	}
	function removeQD(em, aid, sta) {
		$(em).text("加载中");
		var data = {
			id: aid,
			status: sta == 0 ? 1 : 2,
			pacId: 2

		}
		$.ajax({
			type: "post",
			url: "rest/shareActivity/updateMarketingActivitiesState",
			contentType: "application/json;charset=UTF-8",
			dataType: "json",
			data: JSON.stringify(data),
			success: function (res) {
				$(em).text("确定");
				console.log(res)
				if (res.status) {
					$(".remove").remove();
					queryyewuyuan();
				} else {
					alert(res.message)
				}
			},
			error: function (res) {
				console.log(res)
				$(em).text("请求错误");
			}
		});
	}
	function cancel() {
		$(".remove").remove();
	}
	$(".remove").on("click", function (e) {
		e.stopPropagation();
	})

		,
		$("body").on("click", function () {
			$(".remove").remove();
			$(".xzhd-body-fxhd-zhankai1").css("display", "none")
		})
	$("#activityName").on("input", function () {
		var $this = $(this),
			_val = $.trim($this.val()),
			count = "";
		if (_val.length > 20) {
			$this.val(_val.substring(0, 20));
		}
		count = $this.val().length;
		$("#xzhd-body-text-count").text(count);

	});
	$('#shareTitle').on("input", function () {
		var $this = $(this),
			_val = $this.val(),
			count = "";
		if (_val.length > 20) {
			$this.val(_val.substring(0, 20));
		}
		count = $this.val().length;
		$("#xzhd-body-fxwzbt-text-count").text(count);
	});
	$('#shareDescription').on("input", function () {
		var $this = $(this),
			_val = $this.val(),
			count = "";
		if (_val.length > 30) {
			$this.val(_val.substring(0, 30));
		}
		count = $this.val().length;
		$("#xzhd-body-fxhdxs-text-count").text(count);
	});
	function addlingqur(num, str1) {

		var str = '  <div class="xzhd-body-flex xundata" style="margin-top:24px;position: relative;">' +
			' <p style="font-size:16px;margin-right:150px"></p>' +
			' <div class="lqPeople">' +
			' <p>领取人数</p>' +
			' <div class="xzhd-body-input">';
		if (num != undefined && num != "") {
			str += ' <input id="largestNum" value="' + num + '" placeholder="人数" type="number">';
		} else {
			str += ' <input id="largestNum" placeholder="人数" type="number">';
		}

		str += ' <div class="leftborder">' +
			' <div class="topArrow" onclick="add(this)"><img src="../images/upfoldicomtwo.png" ></div>' +
			' <div class="bottomArrow" onclick="reduce(this)"><img src="../images/upfoldicomtwo.png" ></div>' +
			' </div>' +
			' </div>' +
			' </div>' +
			' <p style="margin:0 15px;font-size: 14px;">可获得</p>' +
			' <div class="xzhd-body-input" style="position:relative;" onclick="showyhz(this)">' +
			' <div id="xzhd-body-fxhd">';
		if (str1 != undefined && str1 != '') {
			str += str1;
		} else {
			str += ' <p class="slsk">请选择要分享的优惠券</p>';
		}

		str += ' </div>' +
			' <div class="xzhd-body-down" id="xzhd-body-down11" style="top:42%"></div>' +
			' </div>' +
			' <div class="add" onclick="addlingqur()">+</div>' +
			' 	<div class="reduce" onclick="reducelingqu(this)">-</div>' +
			' <div id="xzhd-body-fxhd-zhankai" onclick="stopfz()" class="xzhd-body-fxhd-zhankai1" style="">' +
			' 	<div style="width:200px;margin-top:10px" >' +
			' 		<div style="display:flex;align-items:center;cursor: pointer;" onclick="selectType(this,1)">' +
			' 	<div class="xzhd-body-henggang">' +
			' 		<img src="../images/checkout.png" alt="" style="display: block;">' +
			' 	</div>' +
			' 	<p style="font-size:16px;color:#444444;margin:0 46px 0 14px;">CRM优惠券</p>' +
			' 	<img id="crm-rightget" style="" src="../images/right_get.png" alt="">' +
			' 	<img id="crm-rightnone" src="../images/right_none.png" alt="" style="display: none;">' +
			' </div>' +
			' 	<div class="mkklp" style="display:flex;align-items:center;margin-top:18px;cursor: pointer;""  onclick="selectType(this,2)" >' +
			' 	<div class="xzhd-body-henggang">' +
			' 		<img src="../images/checkout.png" alt="" style="display: none;">' +
			' 	</div>' +
			' 	<p style="font-size:16px;color:#444444;margin:0 49px 0 14px;">有赞优惠券</p>' +
			' 	<img id="crm-rightget" style="display:none" src="../images/right_get.png" alt="">' +
			' 	<img id="crm-rightnone" src="../images/right_none.png" alt="">' +
			' </div>' +
			' 	</div>' +
			' 	<div style="height:100%;overflow-y:scroll;flex:1">' +
			' 	<table style="border-collapse: collapse;flex:1;table-layout:fixed;">' +
			' 		<thead class="xzhd-body-tbody">' +
			' 			<tr>' +
			' 			<th style="width:10%">优惠券名称</th>' +
			' 			<th style="width:10%">数量</th>' +
			' 			<th style="width:10%">库存</th>' +
			' 		</tr>' +
			' 	</thead>' +
			' 		<tbody class="xzhd-body-tbody1">' +
			' </tbody>' +
			' 		</table>' +
			' 	</div>' +
			' </div>' +
			' </div>';
		$("#addlingqu").append(str)
	}
	function reducelingqu(em) {
		$(em).parents('.xzhd-body-flex').remove();
	}
</script>

</html>