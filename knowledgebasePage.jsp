<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>企业微信知识库</title>
	<link rel="stylesheet" type="text/css" href="http://test.physicalclub.com/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="http://test.physicalclub.com/easyui/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="http://test.physicalclub.com/easyui/demo.css">
	<link rel="stylesheet" type="text/css" href="http://test.physicalclub.com/easyui/pagination.css" />
	<link rel="stylesheet" type="text/css" href="http://test.physicalclub.com/easyui/themes/datepicker.css" />
	<link rel="stylesheet" type="text/css" href="../../css/froalaeditor.min.css" />
	<script type="text/javascript" src="http://test.physicalclub.com/easyui/jquery.min.js"></script>
	<script type="text/javascript" src="http://test.physicalclub.com/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="http://test.physicalclub.com/js/common.js"></script>
	<script src="http://test.physicalclub.com/easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
	<script src="../../js/froala_editor.pkgd.min.js?t=3" type="text/javascript" charset="utf-8"></script>
</head>
<style type="text/css">
	html {
		border: 1px solid #95B8E7;

	}

	html,
	body {
		min-width: 1200px;
		padding: inherit;
		background-color: #F5F5F5;
	}

	.bussess_user {
		padding: 20px;
		height: 100%;
		background-color: #fff;
	}

	select::-ms-expand {
		display: none;
	}

	/*1*/
	.item1 {
		width: 1%;
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
		padding: 7px;
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
		/*margin-top: 8px;*/
		margin-left: 39px;
		cursor: pointer;
		/*vertical-align: middle;*/
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
		/*vertical-align: middle;*/
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
		width: 120px;
		height: 30px;
		cursor: pointer;
		vertical-align: middle;
		margin-top: -4px;
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
		color: #BFBFBF;
		font-size: 12px;
	}

	input::-moz-placeholder,
	textarea:-moz-placeholder {
		color: #BFBFBF;
		font-size: 12px;
	}

	input::-ms-input-placeholder,
	textarea:-moz-placeholder {
		color: #BFBFBF;
		font-size: 12px;
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
		position: relative;
		z-index: 9999;

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
		position: relative;
		z-index: 9999;
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

	.qrcode {
		position: fixed;
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
		background-color: rgba(0, 0, 0, 0.6);
		display: none;
		z-index: 999999999999999999;
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
		/* overflow: hidden;
		text-overflow: ellipsis; */
		white-space: nowrap;
		color: #444444;
	}

	#xzhd-body-fxhd .cgysl {
		margin-bottom: 5px;
	}

	.articleImg {
		width: 84px;
		height: 84px;
		object-fit: cover;
		/*background-image: url(images/logo.png);
 background-repeat: no-repeat;
 background-position: center center;*/
		margin: 0 auto;
	}

	/*新增编辑知识*/
	.fr-toolbar {
		position: fixed;
		width: 100%;
	}

	.wrapper {
		max-width: 768px;
		margin: 0 auto;
		box-sizing: border-box;
	}

	.article_editor {
		background: #F5F5F5;
		padding: 70px 0;
		font-size: 0;
		box-sizing: border-box;
		position: relative;
	}

	.article_editor_page {
		background: #FFFFFF;
		padding: 17px 95px;
		padding-top: 0;
		box-sizing: border-box;
		border: 1px solid #EEEEEE;
		border-bottom: none;
	}

	.article_editor_title input {
		width: 88%;
		border: 0;
		padding: 0;
		margin: 0;
		outline: 0;
		height: 30px;
		font-size: 16px;
		font-weight: 500;
		padding: 0 10px;
	}

	.article_editor_toolbar {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		z-index: 9999999999;
	}

	.article_editor_info {
		margin-bottom: 40px;
		border-bottom: 1px solid #f7f7f7;
	}

	.article_editor_info span {
		display: inline-block;
		vertical-align: top;
		font-size: 14px;
		padding: 0;
		border: 0;
		height: 30px;
		line-height: 30px;
		color: #999999;
		outline: 0;
		padding-right: 5px;
		cursor: text;
	}

	.article_editor_info input {
		display: inline-block;
		vertical-align: top;
		font-size: 14px;
		padding: 0;
		border: 0;
		height: 30px;
		outline: 0;
	}

	.article_editor_info input.l {
		width: 150px;
	}

	.article_editor_info input.s {
		width: 60px;
	}

	.article_editor_info select {
		display: inline-block;
		vertical-align: top;
		font-size: 14px;
		padding: 0;
		border: 0;
		height: 30px;
		outline: 0;
		margin: 0;
		color: #288BDE;
		padding-right: 10px;
	}

	.article_editor_info select {
		appearance: none;
		-moz-appearance: none;
		-webkit-appearance: none;
		cursor: pointer;
	}

	.article_editor_info select::-ms-expand {
		display: none;
	}

	.article_editor_info2 .con {
		position: relative;
		padding-left: 108px;
	}

	.article_editor_info2 .con .fl {
		position: absolute;
		top: 0;
		left: 0;
	}

	.article_editor_info2 .con .fl .thumb {
		cursor: pointer;
		position: absolute;
		box-sizing: border-box;
		width: 90px;
		height: 90px;
		border: 2px dashed #EEEEEE;
		overflow: hidden;
		display: table-cell;
		/*主要是这个属性*/

		vertical-align: middle;

		text-align: center;
	}

	.article_editor_info2 .con .fr textarea {
		resize: none;
		padding: 10px 16px;
		margin: 0;
		width: 100%;
		box-sizing: border-box;
		line-height: 23px;
		height: 65px;
		border: none;
		outline: 0;
	}

	.article_editor_options {
		margin-top: 20px;
	}

	.article_editor_options .tit {
		font-size: 16px;
		padding: 20px 0 15px 0;
	}

	.article_editor_options .con ul {
		padding: 0;
		margin: 0;
		list-style: none;
		border-top: 1px solid #EEEEEE;
	}

	.article_editor_options .con li .box {
		position: relative;
		border: 1px solid #EEEEEE;
		font-size: 14px;
		color: #666666;
		padding-left: 80px;
		border-top: 0;
	}

	.article_editor_options .con li .box span {
		position: absolute;
		top: 0;
		left: 0;
		line-height: 35px;
		padding-left: 10px;
	}

	.article_editor_options .con li .box input {
		outline: 0;
	}

	.article_editor_options .con li .box input[type=radio],
	.article_editor_options .con li .box input[type=checkbox] {
		margin: 0;
		margin-right: 5px;
		vertical-align: -2px;
	}

	.article_editor_options .con li .box input[type=text] {
		border: 0;
		padding: 0;
		margin: 0;
		width: 100%;
		height: 35px;
	}

	.article_editor_options .con li .box label {
		display: inline-block;
		vertical-align: top;
		line-height: 35px;
		margin-right: 10px;
		cursor: pointer;
	}

	.article_editor_savebar {
		position: absolute;
		bottom: 0;
		left: 0;
		width: 100%;
		z-index: 99;
	}

	.article_editor_savebar .fl {
		float: left;
	}

	.article_editor_savebar .fl i {
		margin-left: 8px;
		font-style: normal;
	}

	.article_editor_savebar .fl span {
		font-size: 14px;
		color: #999999;
		line-height: 30px;
	}

	.article_editor_savebar .fr {
		float: right;
	}

	.article_editor_savebar .fr button {
		border: 1px solid #E7E7E7;
		background: #FFFFFF;
		box-sizing: border-box;
		padding: 0;
		padding: 0 22px;
		line-height: 30px;
		margin-left: 12px;
		cursor: pointer;
		outline: 0;
		width: 80px;
		height: 30px;
		line-height: 30px;
		text-align: center;
		border-radius: 4px;
		background: #71B2EF;
		color: #fff;
	}

	.article_editor_savebar .wrapper {
		background: #FFFFFF;
		padding: 25px 60px;
		overflow: hidden;
		border-bottom: 0;
	}

	.article_editor_textarea {
		font-size: 16px;
		padding: 0 10px;
	}

	input::-webkit-input-placeholder,
	textarea::-webkit-input-placeholder {
		color: #bfbfbf;
	}

	.wzwrite {
		border: 1px solid rgba(247, 247, 247, 1);
		border-top: none;
	}

	.article_editor_title {
		position: relative;
		padding: 16px 0;
	}

	.thumb {
		position: relative;
		text-align: center;
		font-size: 14px;
		font-weight: 400;
		color: rgba(113, 178, 239, 1);
		padding-top: 15px;
	}

	.thumb img {
		width: 30px;
	}

	.thumb span {
		display: block;
		margin-top: 5px;
	}

	.article_editor_setting .tit {
		display: inline-block;
		padding-left: 17px;
		font-size: 16px;
		font-weight: 400;
		color: rgba(68, 68, 68, 1);
	}

	.article_editor_setting .con {
		display: inline-block;
		margin-left: 11px;
	}

	.article_editor_setting .con select {
		width: 468px;
		height: 30px;
		border: 1px solid rgba(191, 191, 191, 1);
		padding: 0 16px;
	}

	.preview {
		position: absolute;
		width: 322px;
		left: 0;
		top: 68px;
		padding: 0 20px;
		z-index: 999;
	}

	.preview .title {
		font-size: 16px;
		font-weight: 400;
		color: rgba(68, 68, 68, 1);
	}

	.preview .share {
		position: relative;
		width: 322px;
		height: 146px;
		background: rgba(255, 255, 255, 1);
		border: 1px solid rgba(191, 191, 191, 1);
		border-radius: 4px;
		margin-top: 15px;
		padding-top: 10px;
	}

	.preview .share .title {
		font-size: 16px;
		font-weight: 400;
		color: rgba(68, 68, 68, 1);
		padding: 0px 15px;
		text-overflow: -o-ellipsis-lastline;
		overflow: hidden;
		text-overflow: ellipsis;
		height: 42px;
		display: -webkit-box;
		-webkit-line-clamp: 2;
		line-clamp: 2;
		-webkit-box-orient: vertical;
	}

	.preview .share .tuwen {
		position: relative;
	}

	.preview .share .tuwen .describe {
		font-size: 14px;
		width: 200px;
		font-weight: 400;
		color: rgba(68, 68, 68, 1);
		padding-left: 15px;
		padding-top: 10px;
		text-overflow: -o-ellipsis-lastline;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 3;
		line-clamp: 2;
		-webkit-box-orient: vertical;
	}

	.preview .share .tuwen .previewimg,
	.preview .share .tuwen .previewimg1 {
		position: absolute;
		width: 80px;
		height: 80px;
		right: 10px;
		top: -18px;
		border: 1px solid rgba(191, 191, 191, 1);
		border-radius: 4px;
		overflow: hidden;
		object-fit: cover;
	}

	.preview .share .tuwen .previewimg1 {
		display: none;
	}

	.preview .share .logo {
		position: absolute;
		width: 309px;
		height: 25px;
		line-height: 25px;
		border-top: 1px solid rgba(191, 191, 191, 1);
		bottom: 0;
		color: #bfbfbf;
		font-size: 12px;
		padding-left: 13px;
	}

	.preview .share .logo img {
		width: 20px;
		vertical-align: middle;
		margin-right: 10px;
		margin-top: -2px;
	}

	.preview .phone {
		position: relative;
		width: 322px;
		height: 573px;
		border: 1px solid rgba(191, 191, 191, 1);
		margin-top: 25px;
		background-color: #fff;
	}

	.preview .phone .phoneTop {
		width: 100%;
		height: 60px;
		background-image: url(../../images/phoneTop.png);
		background-repeat: no-repeat;
	}

	.preview .phone .time {
		padding-top: 5px;
		font-size: 12px;
		color: #444;
		position: absolute;
		top: 0;
		width: 100%;
		font-weight: bold;
		text-align: center;
	}

	.preview .phone .title {
		position: absolute;
		font-size: 16px;
		width: 100%;
		text-align: center;
		font-weight: 400;
		color: rgba(0, 0, 0, 1);
		top: 30px;
		font-weight: bold;
	}

	.fr-wrapper>div[style*='z-index: 9999'] {
		position: absolute !important;
		top: -10000px !important;
		;
		opacity: 0 !important;
		;
	}

	.fr-box.fr-basic .fr-element {
		margin-top: -30px;
	}

	.preview .phone .content {
		padding: 10px;
		overflow-y: auto;
		color: #444;
		font-size: 14px;
		height: 495px;
	}

	.article_editor_title span {
		position: absolute;
		color: #9a9a9a;
		font-size: 14px;
		right: 10px;
		top: 22px;
	}

	#describeZS {
		display: block;
		color: #9a9a9a;
		font-size: 14px;
		text-align: right;
		height: 20px;
		padding-right: 7px;
	}

	.coverPhoto {
		position: absolute;
		width: 100% !important;
		height: 100%;
		object-fit: cover;
		left: 0;
		top: 0;
		display: none;
	}

	.content .articletitle {
		font-size: 18px;
		font-weight: 500;
		color: rgba(29, 29, 29, 1);
		font-weight: bold;
	}

	.content .articleTime {
		font-size: 14px;
		font-weight: 500;
		color: rgba(153, 153, 153, 1);
		padding: 5px 0;
		display: none;
	}

	.articleContent img {
		width: 100% !important;
	}

	#output {
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
		top: 150px;
	}

	.saoma {
		text-align: center;
		font-size: 16px;
		padding: 10px 0;
		margin-top: 430px;
		color: #fff;
	}
</style>

<body>
	<div class="bussess_user" id="bussess_user">
		<div class="tuancao1_header">
			<div class="tuancao_header">
				<p id="addjuesebtn">新建知识</p>
			</div>
			<label>图文消息</label>
			<input class="input2" type="text" id="ygmdgonghao" placeholder="搜索图文消息">
			<label style="padding-left:0!important;">知识分类</label>
			<span class="select_wrap"><select name="club" id="activity">
					<option value="">全部</option>
				</select><em class="triangle_border_down" id="sanjiaof"></em></span>
			<label style="padding-left:0!important;">更新时间</label>
			<div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"><input type="text"
					id="startDate" autocomplete="off" name="" placeholder="开始日期"
					class=" c-datepicker-data-input only-date" value=""> </div>
			<span style="color: #BFBFBF;">- </span>
			<div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"><input type="text"
					id="endDate" placeholder="结束日期" autocomplete="off" name=""
					class=" c-datepicker-data-input only-date" value=""> </div>
			<span class="querybtn" id="fangquerybtn" onclick="knowledgeBaseLists()">查询</span><span class="clearbtn"
				onclick="clearstyles()">清除</span>
		</div>
		<div class="tuancao_wrap1">

			<div class="tuandatalist_wrap" id="fangcardlist" style="margin-top:10px;">
				<table style=" border-collapse:collapse;width:100%;table-layout: fixed;">
					<tr style="height:40px;background:rgba(208,232,242,0.2);border:1px solid rgba(204,204,204,0.2);">
						<th class="item item1 ">序号</th>
						<th class="item fitem5f ">文章封面</th>
						<th class="item fitem5f " style="width: 10%;">标题</th>
						<th class="item fitem5f ">知识分类</th>
						<th class="item fitem5f ">更新时间</th>
						<th class="item fitem5f ">分享次数</th>
						<th class="item fitem5f ">操作</th>
					</tr>
					<tbody id="fangdatalist_wrap">
						<!--<tr>
				 <td class="item item1 ">1</td>
				 <td class="item fitem5f ">
				 	<div class="articleImg"></div>
				 </td>
				 <td class="item fitem5f ">让自己健康的活着，才是对生命最好的交代！让自己健康的活着，才是对生命最好的交代！让自己健康的活着，才是对生命最好的交代！让自己健康的活着，才是对生命最好的交代！让自己健康的活着，才是对生命最好的交代！让自己健康的活着，才是对生命最好的交代！让自己健康的活着，才是对生命最好的交代！</td>
				 <td class="item fitem5f ">健身</td>
				<td class="item fitem5f ">04月17日</td>
				 <td class="item fitem5f ">220</td>
				 <td class="item fitem2f ">
					 <span class="bianji" onclick="lookData(1,'的1')">编辑 ｜</span>
						<span class="bianji" onclick="edit(0,1)">删除</span>
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
	<section class="article_editor" style="display: none;">
		<div class="article_editor_toolbar"></div>
		<div class="article_editor_content">
			<div class="wrapper">
				<div class="article_editor_page">
					<div class="wzwrite">
						<div class="article_editor_title"><input type="text" placeholder="请在这里输入标题" name="title"
								id="titleinput" maxlength="20">
							<span id="words">0/20</span>
						</div>
						<div class="article_editor_info">
						</div>
						<div class="article_editor_textarea"><textarea id="editor"></textarea></div>
					</div>
					<div class="article_editor_options">
						<div class="article_editor_info2">
							<div class="con">
								<div class="fl">
									<div class="thumb" id="thumb">
										<img src="../../images/addfm.png" />
										<span>选择封面</span>
										<img src="" id="coverPhoto" class="coverPhoto" />
									</div>
								</div>
								<input type="file" name="" id="uploads" value="" style="display: none;" />
								<div class="fr" style="width: 468px;height: 90px;border: 1px solid #BFBFBF;"><textarea
										id="describe" maxlength="120"
										placeholder="选填，摘要会在转发链接等文章外的场景显露，帮助读者快速了解内容，如不填写则默认抓取正文前54字。"></textarea>
									<span id="describeZS">0/120</span>
								</div>
							</div>
						</div>
						<div class="article_editor_setting">
							<div class="tit">知识分类：</div>
							<div class="con">
								<select name="" id="kcgl">
									<!--<option value='' disabled selected style='display:none;font-size:14px;color:rgba(191,191,191,1);'>请选择知识类型</option>-->
								</select>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>

		<div class="article_editor_savebar">

			<div class="wrapper">

				<div class="fr"><button id="save">保存</button><button id="previews">预览</button><button
						style="background-color: #fff;color: #444444;border:1px solid rgba(191,191,191,1);"
						onclick="cancel()">取消</button></div>
			</div>
		</div>

		<div class="preview">
			<div class="title">封面和摘要</div>
			<div class="share">
				<div class="title" id="coverTitle"></div>
				<div class="tuwen">
					<div class="describe" id="coverDescribe"></div>
					<div class="previewimg"></div>
					<img src="" class="previewimg1" />
				</div>
				<div class="logo">
					<img src="images/logo.jpg" />中航健康时尚集团
				</div>
			</div>
			<div class="phone">
				<div class="phoneTop"></div>
				<div class="time" id="time"></div>
				<div class="title">知识库</div>
				<div class="content" id="content">
					<div id="articletitle" class="articletitle"
						style="font-size: 18px;font-weight: 500;color: rgba(29,29,29,1);font-weight: bold;">
					</div>
					<div class="articleTime" id="articleTime"
						style="    font-size: 14px;font-weight: 500;color: rgba(153,153,153,1);padding: 5px 0;"></div>
					<div id="articleContent" class="articleContent"></div>
				</div>
			</div>
		</div>
	</section>
	<iframe id="test-iframe" name="test-iframe" src="" scrolling="no" frameborder="0" style="display: none;"></iframe>
	<div class="qrcode">
		<div id="output"></div>
		<div class="saoma">请手机扫二维码预览</div>
	</div>
</body>
<script src="http://test.physicalclub.com/js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="http://test.physicalclub.com/easyui/moment.min.js"></script>
<script type="text/javascript" src="http://test.physicalclub.com/easyui/datepicker.all.js"></script>
<script type="text/javascript" src="http://test.physicalclub.com/easyui/datepicker.en.js"></script>
<script type="text/javascript" src="http://test.physicalclub.com/js/common.js"></script>
<script type="text/javascript" src="http://test.physicalclub.com/easyui/easyui-lang-zh_CN.js"></script>
<script src="../../js/jquery.qrcode.min.js" type="text/javascript" charset="utf-8"></script>
<script>
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
	var fintoPages3 = 1;
	var eachPage = 5;
	var editorFlag = false, editorUuid = "";
	NowTime();

	window.onload = function () {
		//每1秒刷新时间
		setInterval("NowTime()", 1000);
	}
	$(window).scroll(setEditFixed);
	$(document).ready(function () { setEditFixed(); initEditor(); });
	//				$(window).resize(function(){setEditFixed();initEditor();});
	$("#titleinput").on("input", function () {
		$("#words").text($(this).val().length + "/20");
		$("#coverTitle").text($(this).val())
		$("#articletitle").text($(this).val())
		if ($.trim($(this).val()).length != 0) {
			$("#articleTime").show();
		} else {
			$("#articleTime").hide();
		}


	})
	$("#describe").on("input", function () {
		$("#coverDescribe").text($(this).val())
		$("#describeZS").text($(this).val().length + "/120")
	})
	var fmupload = false;
	$("#thumb").on("click", function () {
		fmupload = true;
		$("#uploads").click()
	})
	knowledgeBaseList()
	var coverPhoto = "";
	//		$("#uploads").change(function () {
	//		
	//				
	//				var formData = new FormData();
	//					formData.append('id', uuid())
	//		formData.append('file', document.getElementById('uploads').files[0])
	//		$.ajax({
	//			url: "rest/knowledgebase/uploadMainKnowledgeImg",
	//			type: "post",
	//			data: formData,
	//			contentType: false,
	//			processData: false,
	//			success: function (data) {
	//				console.log(JSON.stringify(data))
	//				if (data.status) {
	//					coverPhoto=data.rows[0].path;
	//				} else {
	//					alert(data.messgae)
	//				}
	//
	//				console.log(data)
	//			},
	//			error: function (data) {
	//			}
	//		});
	//	});

	$("#save").on("click", function () {
		var titleinput = $.trim($("#titleinput").val());
		var editor = $.trim($("#editor").val());
		var describe = $.trim($("#describe").val());
		if (titleinput == "") {
			alert("请输入标题");
			return;
		}
		if (editor == "") {
			alert("请输入内容");
			return;
		}
		if (coverPhoto == "") {
			alert("请选择封面图片");
			return;
		}
		if ($("#kcgl").val() == null) {
			alert('请选择知识分类');
			return;
		}
		$("#save").text("正在保存")
		$.ajax({
			type: 'POST',
			contentType: "application/json;charset=UTF-8",
			url: "rest/knowledgebase/makeKnowledgeHtml",
			data: JSON.stringify({ baseid: uuid(), mainInfoUrl: $("#content").html() }),
			success: function (res) {
				console.log(JSON.stringify(res))
				if (res.status) {
					var data = {
						baseid: uuid(),
						coverImgUrl: coverPhoto,
						coverInfo: describe,
						knowledgeTitle: titleinput,
						knowledgeTypeId: $('#kcgl').val(),
						knowledgeTypeName: $("#kcgl option:selected").text(),
						mainInfoUrl: res.message,
						optype: 'add'
					}
					if (editorFlag) {
						data.baseid = editorUuid;
						data.optype = 'upd',
						data.optype = res.status
					}
					$.ajax({
						type: 'POST',
						contentType: "application/json;charset=UTF-8",
						url: "rest/knowledgebase/editKnowledgeBase",
						data: JSON.stringify(data),
						success: function (result) {
							console.log(JSON.stringify(result))
							$("#save").text("保存");
							if (result.status) {
								editorFlag = false;
								knowledgeBaseLists();
								cancel();
							} else {
								alert(result.message)
							}
						},
						error: function (e) {
							$("#save").text("保存");
						}
					})
				} else {
					$("#save").text("保存");
					alert(res.message)
				}
			},
			error: function (e) {
				$("#save").text("保存");
			}
		})


	})
	setTimeout(function () {
		$(".fr-view").unbind().on("input DOMNodeInserted", function () {
			$("#articleContent").html($(this).html())

		})

	}, 1000);
	$(document).on('click', '.article_editor', function () {
		if (!fmupload) {
			fmupload = false;
		}

		$('input[type=file]').unbind().change(function (e) {
			var formData = new FormData();
			formData.append('id', uuid())
			formData.append('file', $(this)[0].files[0])
			if (fmupload) {
				let file = $("#uploads").val()
				let filename = file.substr(file.lastIndexOf("."));
				if (filename != '.png' && filename != '.jpeg' && filename != '.jpg') {
					alert("请上传图片格式（jpg,jpeg,png）的文件");
					return;
				}
				$("#coverPhoto").show();
				$(".previewimg1").show();
				$("#coverPhoto").attr("src", URL.createObjectURL($(this)[0].files[0]))
				$(".previewimg1").attr("src", URL.createObjectURL($(this)[0].files[0]))
			}
			$.ajax({
				url: "rest/knowledgebase/uploadMainKnowledgeImg",
				type: "post",
				data: formData,
				contentType: false,
				processData: false,
				success: function (data) {
					console.log(JSON.stringify(data))
					if (data.status) {
						setTimeout(function () {
							$(".fr-view img").each(function () {
								if ($(this).attr("src").indexOf("blob") >= 0) {
									$(this).attr("src", "/" + data.rows[0].path)
								}
							});
							$("#articleContent").html($(".fr-view").html())

						}, 1000)
						if (fmupload) {
							coverPhoto = data.rows[0].path;
							fmupload = false;
						}
					} else {
						fmupload = false;
						alert(data.messgae)
					}

					console.log(data)
				},
				error: function (data) {
					fmupload = false;
				}
			});
		})
	})

	var fonPagechange3 = function (page) {
		console.log('当前点击入场页码', page);
		if (fintoPages3 == page) {
			return;
		}
		if (fintoPages3 != page) {
			fintoPages3 = page;
			knowledgeBaseList();
		}
	}
	//	   	查询
	function knowledgeBaseLists() {
		fintoPages3 = 1;
		knowledgeBaseList()
	}
	//清除
	function clearstyles() {
		$("#ygmdgonghao").val("")
		$("#activity").val(" ")
		$("#startDate").val("")
		$("#endDate").val("")
		knowledgeBaseLists();
	}
	function knowledgeBaseList() {
		var data = {
			page: fintoPages3,
			rows: eachPage,
			param: {
				name: $.trim($("#ygmdgonghao").val()),
				itemName: $("#activity").val(),
				startDate: $("#startDate").val(),
				endDate: $("#endDate").val(),
				statusArray : '1,2'
			}

		}
		$.ajax({
			type: "post",
			url: "rest/knowledgebase/knowledgeBaseList",
			contentType: "application/json;charset=UTF-8",
			dataType: "json",
			data: JSON.stringify(data),
			success: function (res) {

				console.log(res)
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
								'<td class="item item1 ">' + intoNum + '</td>' +
								'<td class="item fitem5f ">	<img class="articleImg" src="' + item.coverImgUrl + '"/></td>' +
								'<td class="item fitem5f ">' + item.knowledgeTitle + '</td>' +
								'<td class="item fitem5f ">' + item.knowledgeTypeName + '</td>' +
								'<td class="item fitem5f ">' + item.updateDate.split(" ")[0] + '</td>' +
								'<td class="item fitem5f ">' + item.sendCount + '</td>' +
								'<td class="item fitem2f ">' +
								'<span class="bianji" onclick="editors(\'' + item.baseid + '\')">编辑 ｜</span>' +
								'<span class="bianji" onclick="'+ (item.status == 1 ? 'editorsdown(\'' + item.baseid + '\')' : item.status == 2 ? 'editorsup(\'' + item.baseid + '\')' : '') +'">'+ (item.status == 1? '下架' : item.status == 2 ?'上架' : '') +'｜</span>' +
								'<span class="bianji" onclick="remove(this,\'' + item.baseid + '\')">删除</span>' +
								' </td>' +
								'</tr>';

							$('#fangdatalist_wrap').append(str)
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

					}

				}
			},
			error: function (res) {
				console.log(res)
			}
		});

	}
	
	function editorsup(str){

		var data = {
			baseid: str,
			optype: 'del',
			status : 1
		}

		$.ajax({
			type: "post",
			url: "rest/knowledgebase/editKnowledgeBase",
			contentType: "application/json;charset=UTF-8",
			dataType: "json",
			data: JSON.stringify(data),
			success:function(res){
				console.log(res)
				knowledgeBaseList()
			},
			error:function(err){
				console.log(err)
			}
		})
	}
	
	function editorsdown(str) {

			var data = {
				baseid: str,
				optype: 'del',
				status: 2
			}

			$.ajax({
				type: "post",
				url: "rest/knowledgebase/editKnowledgeBase",
				contentType: "application/json;charset=UTF-8",
				dataType: "json",
				data: JSON.stringify(data),
				success: function (res) {
					console.log(res)
					knowledgeBaseList()
				},
				error: function (err) {
					console.log(err)
				}
			})
		}

	$("#ygmdgonghao").on("keydown", function (event) {
		if (event.keyCode == 13) {
			knowledgeBaseLists();
		}
	})
	$("body").on("click", function () {
		$(".remove").remove();
		$(".qrcode").hide();
	})
	//	编辑
	function editors(id) {
		var data = {
			page: 1,
			rows: 1,
			param: {
				id: id
			}

		}
		$.ajax({
			type: "post",
			url: "rest/knowledgebase/knowledgeBaseList",
			contentType: "application/json;charset=UTF-8",
			dataType: "json",
			data: JSON.stringify(data),
			success: function (res) {

				console.log(res)
				if (res.status) {
					$("#test-iframe").attr("src", res.rows[0].mainInfoUrl);
					editorUuid = res.rows[0].baseid;
					var iframe = document.getElementById('test-iframe');
					if (iframe.attachEvent) {
						iframe.attachEvent("onload", function () {
							console.log(iframe.contentWindow.document.body.innerHTML);
						});
					} else {
						iframe.onload = function () {
							editorFlag = true;
							$("#bussess_user").hide();
							$(".article_editor").show();

							$("#coverTitle").text("");
							$(".previewimg1").hide();
							$("#editor").val("")
							$(".coverPhoto").hide();
							$(".previewimg1").attr("src", "");
							$("#coverDescribe").text("");
							$("#articletitle").text("");
							$("#articleTime").text("");
							$("#articleContent").html("")
							$("#titleinput").val("")
							$(".fr-view").html("")
							$("#coverPhoto").attr("src", "");
							coverPhoto = "";
							$("#describe").val("")
							$("#coverTitle").text(res.rows[0].knowledgeTitle);
							$(".previewimg1").show();
							$("#editor").val("")
							$(".coverPhoto").show();
							$("#content").html(iframe.contentWindow.document.body.innerHTML)
							$(".fr-placeholder").remove();
							$(".previewimg1").attr("src", res.rows[0].coverImgUrl);
							$("#coverDescribe").text(res.rows[0].coverInfo);
							$("#titleinput").val(res.rows[0].knowledgeTitle)
							$(".fr-view").html($("#articleContent").html())
							$("#coverPhoto").attr("src", res.rows[0].coverImgUrl);
							coverPhoto = res.rows[0].coverImgUrl;
							$("#editor").val($("#articleContent").html())
							$("#describe").val(res.rows[0].coverInfo)
							$("#words").text(res.rows[0].knowledgeTitle.length + "/20");
							$("#describeZS").text(res.rows[0].coverInfo.length + "/120")
							$("#kcgl option").each(function () {
								if ($(this).val() == res.rows[0].knowledgeTypeId) {
									$("#kcgl option[value='" + res.rows[0].knowledgeTypeId + "']").prop("selected", "selected");
								}
							})
						};
					}
					//          console.log('<iframe src="'+res.rows[0].mainInfoUrl+'" height="8191" width="100%" frameborder="0" scrolling="no" id="frame"></iframe>')
				}
			},
			error: function (res) {
				console.log(res)
			}
		});
	}
	// 删除
	function remove(em, aid) {
		stopPropagation();
		$(".remove").remove();
		var str = '<div class="remove">' +
			'<div class="removeSX">' +
			'<div class="wz">是否删除这条数据</div>' +
			'<div class="removeBtn">' +
			'<div class="rebtn" onclick="removeQD(this,\'' + aid + '\')">确定</div>' +
			'<div class="rebtn active" onclick="cancels()">取消</div>' +
			'</div>' +
			'</div>' +
			'<div class="tip"></div>' +
			'</div>';
		$(em).parent().append(str)
	}
	function removeQD(em, aid, sta) {
		$(em).text("加载中");
		var data = {
			baseid: aid,
			optype: 'del',
			status : 0
		}
		$.ajax({
			type: "post",
			url: "rest/knowledgebase/editKnowledgeBase",
			contentType: "application/json;charset=UTF-8",
			dataType: "json",
			data: JSON.stringify(data),
			success: function (res) {
				$(em).text("确定");
				console.log(res)
				if (res.status) {
					$(".remove").remove();
					knowledgeBaseList();
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
	function cancels() {
		$(".remove").remove();
	}
	function stopPropagation(e) {
		e = e || window.event;
		if (e.stopPropagation) { //W3C阻止冒泡方法  
			e.stopPropagation();
		} else {
			e.cancelBubble = true; //IE阻止冒泡方法  
		}
	}
	function uuid() {
		var s = [];
		var hexDigits = "0123456789abcdef";
		for (var i = 0; i < 32; i++) {
			s[i] = hexDigits.substr(Math.floor(Math.random() * 0x10), 1);
		}
		s[14] = "4"; // bits 12-15 of the time_hi_and_version field to 0010
		s[19] = hexDigits.substr((s[19] & 0x3) | 0x8, 1); // bits 6-7 of the clock_seq_hi_and_reserved to 01
		s[8] = s[13] = s[18] = s[23] = "-";

		var uuid = s.join("");
		return uuid;
	}
	//获取当前日期时间
	curentTime()
	function curentTime() {
		var now = new Date();

		var year = now.getFullYear();       //年
		var month = now.getMonth() + 1;     //月
		var day = now.getDate();            //日

		var hh = now.getHours();            //时
		var mm = now.getMinutes();          //分
		var ss = now.getSeconds();          //分

		var clock = year + "-";

		if (month < 10)
			clock += "0";

		clock += month + "-";

		if (day < 10)
			clock += "0";

		clock += day + " ";
		$("#articleTime").text(clock)
	}

	function NowTime() {
		var d = new Date();
		var my_hours = d.getHours() < 10 ? '0' + d.getHours() : d.getHours();
		var my_minutes = d.getMinutes() < 10 ? '0' + d.getMinutes() : d.getMinutes();
		$("#time").text(my_hours + ":" + my_minutes + " " + (my_hours >= 12 ? "PM " : "AM "))
	}
	$("#addjuesebtn").on("click", function () {

		$(".article_editor").show();
		$("#bussess_user").hide();
		$("#coverTitle").text("");
		$(".previewimg1").hide();
		$("#editor").val("")
		$(".coverPhoto").hide();
		$(".previewimg1").attr("src", "");
		$("#coverDescribe").text("");
		$("#articletitle").text("");
		$("#articleTime").hide();
		$("#articleTime").text("");
		$("#articleContent").html("");
		$("#content").html("")
		var str = '<div id="articletitle" class="articletitle" style="font-size: 18px;font-weight: 500;color: rgba(29,29,29,1);font-weight: bold;">' +
			'</div>' +
			'<div class="articleTime" id="articleTime" style="    font-size: 14px;font-weight: 500;color: rgba(153,153,153,1);padding: 5px 0;"></div>' +
			'<div id="articleContent" class="articleContent"></div>';
		$("#content").append(str)
		$("#titleinput").val("")
		$(".fr-view").html("")
		$("#coverPhoto").attr("src", "");
		coverPhoto = "";
		$("#describe").val("")
		editorFlag = false;
		curentTime()

	})
	function cancel() {
		$(".article_editor").hide();
		$("#bussess_user").show();
	}

	$.ajax({
		type: 'POST',
		contentType: "application/json;charset=UTF-8",
		url: "rest/wx/dictionnary/getdictionnarylist",
		data: JSON.stringify({
			typeCode: "activityType"
		}),
		success: function (result) {
			console.log(JSON.stringify(result))
			var strGroupType = ``
			$.each(result.rows, function (i, item) {
				strGroupType += `
                            <option value="`+ item.dictionaryId + `">` + item.name + `</option>
                        `
			})
			$('#kcgl').append(strGroupType)
			$('#activity').append(strGroupType)

		},
		error: function (e) {
			console.log(e.status);
			console.log(e.responseText)
		}
	})
	$("#previews").on("click", function () {
		var titleinput = $.trim($("#titleinput").val());
		var editor = $.trim($("#editor").val());
		var describe = $.trim($("#describe").val());
		if (titleinput == "") {
			alert("请输入标题");
			return;
		}
		if (editor == "") {
			alert("请输入内容");
			return;
		}
		if (coverPhoto == "") {
			alert("请选择封面图片");
			return;
		}
		if ($("#kcgl").val() == null) {
			alert('请选择知识分类');
			return;
		}
		$(this).text("请稍后")
		var that = $(this);
		$.ajax({
			type: 'POST',
			contentType: "application/json;charset=UTF-8",
			url: "rest/knowledgebase/makeKnowledgeHtml",
			data: JSON.stringify({ baseid: uuid(), mainInfoUrl: $("#content").html() }),
			success: function (res) {
				console.log(JSON.stringify(res))
				that.text("预览");
				if (res.status) {
					$(".qrcode").show();
					$("#output").html("")
					var htmlUrl = "http://test.physicalclub.com" + res.message;
					jQuery('#output').qrcode(htmlUrl);
				} else {
					alert('预览失败')
				}
			},
			error: function (e) {
				that.text("预览");
			}
		})


	})
</script>

</html>