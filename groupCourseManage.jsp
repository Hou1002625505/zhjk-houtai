<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>

<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo.css">
    <link rel="stylesheet" type="text/css" href="easyui/pagination.css" />

    <link rel="stylesheet" type="text/css" href="easyui/themes/datepicker.css" />

    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/moment.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
    <script src="easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="imgui/zyUpload.css" type="text/css">
    <!-- 引用核心层插件 -->
    <script src="imgui/zyFile.js"></script>

    <!-- 引用控制层插件 -->
    <script src="imgui/zyUpload.js"></script>

    <!-- 引用初始化JS -->
    <script src="imgui/jq22.js"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        .course-manage-body {
            /* padding: 20px 20px 0 20px; */
        }

        .course-manage-button {
            width: 120px;
            height: 40px;
            background: #71B2EF;
            color: white;
            font-size: 20px;
            text-align: center;
            line-height: 40px;
            cursor: pointer;
            border-radius: 4px;
        }

        .course-manage-flex {
            display: flex;
            margin-top: 20px;
            align-items: center;
        }

        .course-manage-flex #course-manage-flex-input {
            width: 200px;
            height: 30px;
            border-radius: 4px;
            margin-left: 20px;
            margin-right: 39px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }

        .course-manage-flextwo {
            display: flex;
            margin-top: 20px;
        }

        .course-manage-flextwo #course-manage-flextwo-search {
            width: 80px;
            height: 30px;
            border-radius: 4px;
            background: #71B2EF;
            text-align: center;
            line-height: 30px;
            color: white;
            font-size: 16px
        }

        .course-manage-flextwo #course-manage-flextwo-clear {
            width: 80px;
            height: 30px;
            border-radius: 4px;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            text-align: center;
            line-height: 30px;
            color: black;
            margin-left: 13px;
            font-size: 16px
        }

        .select-menu {
            margin-left: 20px;
            margin-right: 39px;
            cursor: pointer;
            width: 120px;
            height: 30px;
            box-sizing: border-box;
        }

        .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 120px;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .select-menu-ul li {
            height: 32px;
            font-size: 14px;
            padding: 0 15px;
            box-sizing: border-box;
            line-height: 32px;
        }

        .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .select-menu-div {
            position: relative;
            height: 30px;
            width: 120px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            line-height: 30px;
        }

        .select-this {
            background: #71B2EF;
        }

        .select-this:hover {
            background: #71B2EF !important;
        }

        .select-menu-img {
            width: 11px;
            height: 8px;
            margin-right: 10px;
            position: absolute;
            right: 0;
            top: 10px;
        }

        .select-menu-input {
            padding-left: 14px;
            border: 0;
            width: 60px;
            height: 24px;
            cursor: pointer;
            user-select: none;
            font-size: 14px
        }

        .course-manage-flex-input-one {
            width: 120px;
            height: 30px;
            border-radius: 4px;
            margin-left: 21px;
            margin-right: 7px;
            padding: 8px 0 7px 10px;
            box-sizing: border-box;
            font-size: 12px;
            border: 1px solid #BFBFBF
        }

        .course-manage-flex-input-two {
            width: 120px;
            height: 30px;
            border-radius: 4px;
            margin-left: 7px;
            margin-right: 38px;
            padding: 8px 0 7px 10px;
            box-sizing: border-box;
            font-size: 12px;
            border: 1px solid #BFBFBF
        }

        .course-manage-flex-input-three {
            width: 80px;
            height: 30px;
            border-radius: 4px;
            margin-left: 21px;
            margin-right: 6px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }

        .course-manage-flex-input-four {
            width: 80px;
            height: 30px;
            border-radius: 4px;
            margin-left: 6px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }

        .course-manage-table {
            margin-top: 18px;
            font-size: 12px;
        }

        .course-manage-table table tr:nth-child(2) td {
            border-top: none
        }

        .course-manage-table table td {
            border-left: 1px dashed #CCCCCC;
            border-bottom: 1px dashed #CCCCCC;
            height: 40px;
            text-align: center;
            font-size: 14px;
        }

        .course-manage-table table td:last-child {
            border-right: 1px dashed #CCCCCC;
            text-align: center;
        }

        .course-manage-table table th {
            background: #D0E8F2;
            text-align: center;
            height: 40px;
            font-size: 14px;
        }

        .course-manage-table .course-manage-table-tr td:last-child {
            cursor: pointer;
            color: #71B2EF;
        }

        .course-manage-table .course-manage-table-tr td:last-child a:nth-child(1) {
            margin-right: 5px;
        }

        .course-manage-table .course-manage-table-tr td:last-child a:nth-child(2) {
            margin-left: 5px;
        }

        .course-manage-table .course-manage-table-checkbox {
            width: 16px;
            height: 16px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
        }

        .course-manage-table .course-manage-table-checkbox img {
            width: 16px;
            height: 16px;
            margin-left: -1px;
            margin-top: -1px;
        }

        .course-manage-table .headingsifting {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .course-manage-table .headingsifting .headingsifting-column {
            display: flex;
            flex-direction: column;
            margin-left: 6px;
        }

        .course-manage-table .headingsifting .headingsifting-column img:nth-child(2) {
            margin-top: 1px
        }

        .course-manage-footer {
            display: flex;
            margin-top: 17px;
            height: 26px;
            display: flex;
            align-items: center;
            padding-left: 14px;
        }

        .course-manage-table-checkbox {
            width: 16px;
            height: 16px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
            line-height: 14px;
        }

        .course-manage-table-checkbox img {
            width: 16px;
            height: 16px;
            margin-top: -1px;
            margin-left: -1px;
        }

        #course-manage-table-checkbox {
            width: 16px;
            height: 16px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
            line-height: 14px;
        }

        #course-manage-table-checkbox img {
            width: 16px;
            height: 16px;
            margin-top: -1px;
            margin-left: -1px;
        }

        .course-manage-footer .course-manage-footer-pone {
            font-size: 14px;
            margin-left: 8px;
        }

        .course-manage-footer .course-manage-footer-ptwo {
            width: 90px;
            height: 30px;
            border: 1px solid #BFBFBF;
            margin-left: 9px;
            font-size: 14px;
            color: #444444;
            text-align: center;
            line-height: 30px;
            border-radius: 2px;
        }

        .course-manage-footer .course-manage-footer-pthree {
            font-size: 16px;
            margin-left: 893px;
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

        .c-datepicker-date-table td.disabled .cell,
        .c-datepicker-month-table td.disabled .cell,
        .c-datepicker-year-table td.disabled .cell {
            text-decoration: none;
        }


        /* ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// */
        /* ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// */
        /* ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// */
        /* ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// */
        /* ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// */
        /* ///////////////////////////////////////////////////////////////////////////////////////////////////////////////// */


        /* .add-course-body {
            padding: 15px 26px 0 18px
        } */

        .add-course-body .add-course-body-pone {
            font-size: 16px;
            color: #71B2EF
        }

        .add-course-body .add-course-body-line {
            height: 1px;
            background: #BFBFBF;
            margin-top: 20px
        }

        .add-course-body .add-course-body-ptwo {
            font-size: 18px;
            color: #444444;
            margin-left: 13px;
            margin-top: 20px;
        }

        .add-course-sortone .add-course-sortone-select .select-menu {
            margin-left: 10px;
            margin-right: 39px;
            cursor: pointer;
            width: 240px;
            height: 32px;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 240px;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-ul li {
            height: 32px;
            font-size: 16px;
            padding: 0 15px;
            box-sizing: border-box;
            line-height: 32px;
            width: 240px;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-div {
            position: relative;
            height: 32px;
            width: 240px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            line-height: 32px;
        }

        .add-course-sortone .add-course-sortone-select .select-this {
            background: #71B2EF;
        }

        .add-course-sortone .add-course-sortone-select .select-this:hover {
            background: #71B2EF !important;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-img {
            width: 11px;
            height: 8px;
            margin-right: 10px;
            position: absolute;
            right: 0;
            top: 10px;
            color: #CCCCCC
        }

        .add-course-sortone .add-course-sortone-select .select-menu-input {
            padding-left: 14px;
            border: 0;
            width: 80px;
            height: 24px;
            cursor: pointer;
            user-select: none;
            font-size: 16px;
            line-height: 24px;
        }

        .add-course-sortone {
            display: flex;
            margin-top: 24px;
            align-items: center;
        }

        .add-course-sortone .add-course-sortone-select {
            margin-left: 76px
        }

        .add-course-sortone .add-course-sortone-inputone {
            width: 380px;
            height: 32px;
            box-sizing: border-box;
            margin-left: 86px;
            padding-left: 17px;
            font-size: 14px;
            border: 1px solid #CCCCCC;
            line-height: 28px;
            border-radius: 4px;
            display: flex;
            justify-content: space-between;
            font-size: 16px
        }

        .add-course-sortone .add-course-sortone-inputone input {
            border: none;
            outline: none;
            -webkit-appearance: none;
        }

        .add-course-sortone .add-course-sortone-inputone p {
            margin-right: 9px;
        }

        .add-course-sortone .add-course-sortone-inputtwo {
            display: flex;
            width: 120px;
            height: 32px;
            border: 1px solid #CCCCCC;
            margin-left: 70px;
            border-radius: 4px;
        }

        .add-course-sortone .add-course-sortone-inputtwo p {
            width: 18px;
            height: 32px;
            background: #CCCCCC;
            line-height: 32px;
            text-align: center;
        }

        .add-course-sortone .add-course-sortone-inputtwo input {
            border: none;
            outline: none;
            -webkit-appearance: none;
            width: 88px;
            padding-left: 5px;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputthree {
            display: flex;
            align-items: center;
        }

        .add-course-sortone .add-course-sortone-inputthree-p {
            width: 80px;
            height: 32px;
            border: 1px solid #71B2EF;
            border-radius: 3px;
            text-align: center;
            line-height: 32px;
            font-size: 14px;
            margin-left: 18px;
            box-sizing: border-box;
        }

        .add-course-sortone-inputthree-p-active {
            color: white;
            background: #71B2EF
        }

        .add-course-sortone .add-course-sortone-inputfour {
            display: flex;
        }

        .add-course-sorttwo {
            display: flex;
            margin-top: 31px;
        }

        .add-course-sorttwo .add-course-sortone-inputfour textarea {
            width: 680px;
            height: 160px;
            border: 1px solid #CCCCCC;
            border-radius: 3px;
            margin-left: 90px;
            resize: none;
            font-size: 14px;
            box-sizing: border-box;
            padding: 10px 0 0 20px;
        }

        .add-course-sorttwo .add-course-sortone-inputfour .add-course-sortone-inputfour-position {
            margin-left: 710px;
            margin-top: -25px;
            font-size: 14px
        }

        .add-course-sortone .rating li {
            list-style: none;
        }

        .add-course-sortone .rating {
            width: 300px;
            height: 26px;
            margin-left: 73px;
        }

        .add-course-sortone .rating .rating-item {
            float: left;
            width: 28px;
            height: 27px;
            background: url(./image/star_set.png) no-repeat center center;
            background-size: 25px 24px;
            background-position: 0 -58px;
            overflow: hidden;
            margin-left: 13px;
        }

        .add-course-sortone .rating .rating-item img {
            width: 28px;
            height: 27px
        }

        .add-course-sortone .add-course-sortone-inputfive {
            width: 120px;
            height: 32px;
            border: 1px solid #CCCCCC;
            border-radius: 3px;
            margin-left: 72px;
            display: flex;
            align-items: center;
            font-size: 16px
        }

        .add-course-sortone .add-course-sortone-inputfive input {
            border: none;
            outline: none;
            width: 80px;
            box-sizing: border-box;
            padding-left: 20px
        }

        .add-course-sortone .add-course-sortone-inputsix {
            width: 380px;
            height: 32px;
            border: 1px solid #CCCCCC;
            padding-left: 18px;
            margin-left: 86px;
            line-height: 32px;
            border-radius: 3px;
        }

        .add-course-sortone .add-course-sortone-inputsix input {
            border: none;
            outline: none;
            width: 316px;
            font-size: 14px
        }

        .add-course-sortone .add-course-sortone-inputseven {
            margin-left: 54px;
            display: flex;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput {
            width: 120px;
            height: 32px;
            border: 1px solid #CCCCCC;
            margin-left: 18px;
            border-radius: 3px;
            display: flex;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .input {
            width: 63px;
            border: none;
            outline: none;
            text-align: center;
        }



        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone {
            width: 55px;
            height: 32px;
            border-right: 1px solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu {
            cursor: pointer;
            width: 55px;
            height: 32px;
            box-sizing: border-box;
            line-height: 28px;
            border-right: 1px solid #CCCCCC;
            margin: 0;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 55px;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-ul li {
            height: 32px;
            font-size: 14px;
            box-sizing: border-box;
            line-height: 32px;
            width: 55px;
            text-align: left;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-div {
            position: relative;
            height: 32px;
            border-radius: 4px;
            box-sizing: border-box;
            width: 55px;
            line-height: 32px;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-this {
            background: #71B2EF;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-this:hover {
            background: #71B2EF !important;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-img {
            width: 11px;
            height: 8px;
            position: absolute;
            right: 0;
            top: 10px;
            color: #CCCCCC;
            margin: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-input {
            border: 0;
            width: 55px;
            height: 32px;
            cursor: pointer;
            user-select: none;
            font-size: 14px;
            padding: 0;
            line-height: 31px;
            outline: none;
            margin-top: -2px;
            margin-left: -1px
        }



        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo {
            width: 55px;
            height: 32px;
            border-right: 1px solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu {
            cursor: pointer;
            width: 55px;
            height: 32px;
            box-sizing: border-box;
            line-height: 28px;
            border-right: 1px solid #CCCCCC;
            margin: 0;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 55px;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-ul li {
            height: 32px;
            font-size: 14px;
            box-sizing: border-box;
            line-height: 32px;
            width: 55px;
            text-align: left;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-div {
            position: relative;
            height: 32px;
            border-radius: 4px;
            box-sizing: border-box;
            width: 55px;
            line-height: 32px;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-this {
            background: #71B2EF;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-this:hover {
            background: #71B2EF !important;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-img {
            width: 11px;
            height: 8px;
            position: absolute;
            right: 0;
            top: 10px;
            color: #CCCCCC;
            margin: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-input {
            border: 0;
            width: 55px;
            height: 32px;
            cursor: pointer;
            user-select: none;
            font-size: 14px;
            padding: 0;
            line-height: 31px;
            outline: none;
            margin-top: -2px;
            margin-left: -1px
        }



        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree {
            width: 55px;
            height: 32px;
            border-right: 1px solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu {
            cursor: pointer;
            width: 55px;
            height: 32px;
            box-sizing: border-box;
            line-height: 28px;
            border-right: 1px solid #CCCCCC;
            margin: 0;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 55px;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-ul li {
            height: 32px;
            font-size: 14px;
            box-sizing: border-box;
            line-height: 32px;
            width: 55px;
            text-align: left;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-div {
            position: relative;
            height: 32px;
            border-radius: 4px;
            box-sizing: border-box;
            width: 55px;
            line-height: 32px;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-this {
            background: #71B2EF;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-this:hover {
            background: #71B2EF !important;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-img {
            width: 11px;
            height: 8px;
            position: absolute;
            right: 0;
            top: 10px;
            color: #CCCCCC;
            margin: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-input {
            border: 0;
            width: 55px;
            height: 32px;
            cursor: pointer;
            user-select: none;
            font-size: 14px;
            padding: 0;
            line-height: 31px;
            outline: none;
            margin-top: -2px;
            margin-left: -1px
        }



        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour {
            width: 55px;
            height: 32px;
            border-right: 1px solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu {
            cursor: pointer;
            width: 55px;
            height: 32px;
            box-sizing: border-box;
            line-height: 28px;
            border-right: 1px solid #CCCCCC;
            margin: 0;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 55px;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-ul li {
            height: 32px;
            font-size: 14px;
            box-sizing: border-box;
            line-height: 32px;
            width: 55px;
            text-align: left;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-div {
            position: relative;
            height: 32px;
            border-radius: 4px;
            box-sizing: border-box;
            width: 55px;
            line-height: 32px;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-this {
            background: #71B2EF;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-this:hover {
            background: #71B2EF !important;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-img {
            width: 11px;
            height: 8px;
            position: absolute;
            right: 0;
            top: 10px;
            color: #CCCCCC;
            margin: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-input {
            border: 0;
            width: 55px;
            height: 32px;
            cursor: pointer;
            user-select: none;
            font-size: 14px;
            padding: 0;
            line-height: 31px;
            outline: none;
            margin-top: -2px;
            margin-left: -1px
        }



        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive {
            width: 55px;
            height: 32px;
            border-right: 1px solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu {
            cursor: pointer;
            width: 55px;
            height: 32px;
            box-sizing: border-box;
            line-height: 28px;
            border-right: 1px solid #CCCCCC;
            margin: 0;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 55px;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-ul li {
            height: 32px;
            font-size: 14px;
            box-sizing: border-box;
            line-height: 32px;
            width: 55px;
            text-align: left;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-div {
            position: relative;
            height: 32px;
            border-radius: 4px;
            box-sizing: border-box;
            width: 55px;
            line-height: 32px;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-this {
            background: #71B2EF;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-this:hover {
            background: #71B2EF !important;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-img {
            width: 11px;
            height: 8px;
            position: absolute;
            right: 0;
            top: 10px;
            color: #CCCCCC;
            margin: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-input {
            border: 0;
            width: 55px;
            height: 32px;
            cursor: pointer;
            user-select: none;
            font-size: 14px;
            padding: 0;
            line-height: 31px;
            outline: none;
            margin-top: -2px;
            margin-left: -1px
        }



        .add-course-sorttwo .add-course-sortone-inputeight {
            margin-left: 120px;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table {
            width: 680px;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr:nth-child(1) {
            height: 40px;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table th {
            border: 1px solid #CCCCCC;
            border-left: none;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr:nth-child(1) th:nth-child(1) {
            border-left: 1px solid #CCCCCC;
            width: 240px
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td {
            border: 1px solid #CCCCCC;
            border-top: none;
            border-left: none;
            padding: 7.5px 7.5px 5.5px 7.5px;
            box-sizing: border-box;
            height: 100px
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(1) {
            border-left: 1px solid #CCCCCC;
            width: 240px;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(1) textarea {
            width: 220px;
            height: 80px;
            border: 1px solid #CCCCCC;
            resize: none;
            box-sizing: border-box;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(2) textarea {
            width: 340px;
            height: 80px;
            border: 1px solid #CCCCCC;
            resize: none;
            box-sizing: border-box;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(3) {
            padding: 0 15px;
            display: flex;
            height: 100px;
            align-items: center;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(3) img {
            width: 20px;
            height: 20px
        }

        .add-course-sortone .add-course-sortone-inputnine {
            margin-left: 90px;
            display: flex;
            align-items: center;
        }

        .add-course-sortone .add-course-sortone-inputnine div {
            width: 120px;
            height: 32px;
            background: #71B2EF;
            font-size: 14px;
            color: white;
            text-align: center;
            line-height: 32px;
        }

        .add-course-sortone .add-course-sortone-inputnine p {
            margin-left: 19px;
            font-size: 14px
        }

        .add-course-sorttwo #demo {
            margin: 0;
            height: 182px;
        }

        .add-course-sorttwo #preview .upload_preview {
            border: none;
            margin: 0;
            flex: 1;
            width: 800px;
            height: 320px
        }

        .add-course-sorttwo .andArea {
            border: none;
            background: #F7F7F7;
        }

        .add-course-sorttwo .file_del_img {
            border: none;
            border-radius: 50%;
        }

        .add-course-sorttwo .upload_append_list {
            width: 210px;
            height: 160px
        }

        .add-course-sorttwo .convent_choice {
            background: #F7F7F7
        }

        .add-course-sorttwo .upload_image {
            width: 100%;
            height: 100%
        }

        .add-course-sorttwo .upload_main {
            display: flex
        }

        .add-course-sorttwo #preview1 {
            display: flex;
            flex-wrap: wrap;
        }

        .add-course-sorttwo .demo {
            margin-left: 58px
        }



        .add-course-sortone .add-course-sortone-inputten {
            display: flex;
            margin-left: 50px
        }

        .add-course-sortone .add-course-sortone-inputten .inputten-paypay {
            display: flex;
        }

        .add-course-sortone .add-course-sortone-inputten .inputten-paypay .paypay {
            width: 24px;
            height: 24px;
            margin-left: 44px;
            margin-right: 18px
        }

        .add-course-sortone .add-course-sortone-inputten .inputten-paypay .paypay .paypay-show {
            width: 21px;
            height: 21px
        }

        .add-course-sortone .add-course-sortone-inputten .inputten-paypay .paypay .paypay-hidden {
            width: 21px;
            height: 21px;
            display: none;
        }



        .add-course-sortone .add-course-sortone-inputeleven {
            /* margin-top: 14px */
        }

        .add-course-sortone .add-course-sortone-inputeleven input:nth-child(1) {
            width: 240px;
            height: 32px;
            margin-left: 64px;
            font-size: 14px;
            line-height: 32px;
            padding-left: 18px;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputeleven input:nth-child(2) {
            width: 410px;
            height: 32px;
            margin-left: 20px;
            box-sizing: border-box;
        }

        .add-course-sortthree {
            display: flex;
            margin-top: 10px;
            height: 120px
        }

        .add-course-sortthree .add-course-sortone-inputtwelve {
            margin-top: 14px;
            height: 120px
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-flex {
            display: flex;
            width: 696px;
            height: 90px;
            flex-wrap: wrap;
            overflow: hidden;
            margin-left: 4px
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-checkbox {
            width: 210px;
            height: 32px;
            border: 1px solid #CCCCCC;
            font-size: 12px;
            text-align: center;
            line-height: 32px;
            position: relative;
            cursor: pointer;
            margin-left: 20px;
            border-radius: 3px;
            margin-bottom: 18px
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-checkbox img {
            position: absolute;
            left: 190px;
            top: 14px;
            display: none
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-zhankai {
            display: flex;
            align-items: center;
            margin-left: 650px
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-zhankai p {
            font-size: 14px;
            color: #71B2EF
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-zhankai img {
            width: 13px;
            height: 7px;
            margin-left: 4px
        }

        .add-course-check {
            display: flex;
            align-items: center;
            margin-left: 752px;
            margin-top: 15px
        }

        .add-course-check p {
            color: #71B2EF;
            font-size: 14px;
            margin-left: 8px
        }

        .add-course-check .add-course-checkboxall {
            width: 16px;
            height: 16px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
            line-height: 14px;
        }

        .add-course-check .add-course-checkboxall img {
            width: 16px;
            height: 16px;
            margin-left: -1px;
            margin-top: -1px;
        }

        .add-course-footer {
            display: flex;
            margin-top: 60px;
            margin-bottom: 30px;
        }

        .add-course-footer p:nth-child(1) {
            width: 110px;
            height: 40px;
            background: #71B2EF;
            color: white;
            font-size: 14px;
            text-align: center;
            line-height: 40px;
            border-radius: 4px;
        }

        .add-course-footer p:nth-child(2) {
            width: 110px;
            height: 40px;
            font-size: 14px;
            text-align: center;
            line-height: 40px;
            border-radius: 4px;
            border: 1px solid #71B2EF;
            box-sizing: border-box;
            margin-left: 15px
        }

        #GroupCourseGole {
            display: flex
        }
    </style>
</head>

<body>
    <div class="course-manage-body">
        <div class="course-manage-button" id="course-manage-button">新建课程</div>
        <div class="course-manage-flex">
            <div style="font-size:16px">课程名称</div>
            <input id="course-manage-flex-input" type="text">
            <div style="font-size:16px">课程分类</div>
            <div class="course-manage-flex-select-one">
                <div class="select-menu">
                    <div class="select-menu-div" id="select-menu-div1">
                        <input class="select-menu-input" />

                        <img class="select-menu-img" src="../images/simage/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul1">

                    </ul>
                </div>
            </div>
            <div style="font-size:16px">课程状态</div>
            <div class="course-manage-flex-select-two">
                <div class="select-menu">
                    <div class="select-menu-div" id="select-menu-div2">
                        <input class="select-menu-input" />

                        <img class="select-menu-img" src="../images/simage/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul2">
                        <li class="select-this">全部</li>
                        <li>上架</li>
                        <li>下架</li>
                    </ul>
                </div>
            </div>
            <div style="font-size:16px">创建时间</div>
            <div class="J-datepicker-day"> <input type="text" class="course-manage-flex-input-one "
                    id="course-manage-flex-input-one" placeholder="开始时间">
            </div>
            <p>-</p>
            <div class="J-datepicker-day"> <input type="text" class="course-manage-flex-input-two"
                    id="course-manage-flex-input-two" placeholder="结束时间">
            </div>
            <div style="font-size:16px">价格区间</div>
            <input type="text" class="course-manage-flex-input-three" id="course-manage-flex-input-three">
            <p>-</p>
            <input type="text" class="course-manage-flex-input-four" id="course-manage-flex-input-four">
        </div>
        <div class="course-manage-flextwo">
            <p id="course-manage-flextwo-search">查询</p>
            <p id="course-manage-flextwo-clear">清除</p>
        </div>
        <div class="course-manage-table"></div>
        <div class="course-manage-footer">
            <div id="course-manage-table-checkbox">
                <img style="display:none" src="../images/simage/codeallset_btn.png">
            </div>
            <div class="course-manage-footer-pone">当页全选</div>
            <div class="course-manage-footer-ptwo" id="batchup">批量上传</div>
            <div class="course-manage-footer-ptwo" id="batchdown">批量下架</div>
            <div class="course-manage-footer-pthree"></div>
        </div>

        <div class="box" id="boxpage"></div>
    </div>

    <div class="add-course-body" style="display:none">
        <p class="add-course-body-pone" id="add-course-body-pone">返回上一级</p>
        <div class="add-course-body-line"></div>
        <p class="add-course-body-ptwo">基本信息</p>
        <div class="add-course-body-line"></div>
        <div class="add-course-sortone">
            <p style="font-size:16px">课程类型</p>
            <div class="add-course-sortone-select">
                <div class="select-menu">
                    <div class="select-menu-div">
                        <input class="select-menu-input" id="select-menu-input-GroupType" />

                        <img class="select-menu-img" src="./image/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul-GroupType">

                    </ul>
                </div>
            </div>
        </div>
        <div class="add-course-sortone">
            <p style="font-size:16px">上课方式</p>
            <div class="add-course-sortone-select">
                <div class="select-menu">
                    <div class="select-menu-div">
                        <input class="select-menu-input" id="select-menu-input-GCourseType" />

                        <img class="select-menu-img" src="./image/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul-GCourseType">

                    </ul>
                </div>
            </div>
        </div>
        <div class="add-course-sortone">
            <p style="font-size:16px">课程名称</p>
            <div class="add-course-sortone-inputone">
                <input type="text" value="BODYBLANCE" id="area2">
                <p><span id="text-count2">0</span>/22</p>
            </div>
        </div>
        <div class="add-course-sortone">
            <p style="font-size:16px">课程标准价</p>
            <div class="add-course-sortone-inputtwo">
                <p>￥</p>
                <input type="text" id="kcbzj">
            </div>
        </div>
        <div class="add-course-sortone">
            <p style="font-size:16px;margin-right:70px">课程目标</p>
            <div class="add-course-sortone-inputthree">
                <div id="GroupCourseGole"></div>
                <div style="font-size: 12px;color:#444444;margin-left:14px">(可多选)</div>
            </div>
        </div>
        <div class="add-course-sorttwo">
            <p style="font-size:16px">课程简介</p>
            <div class="add-course-sortone-inputfour">
                <textarea id="area" cols="30" rows="10" placeholder="请输入本节课简介"></textarea>
                <p class="add-course-sortone-inputfour-position"><span id="text-count">0</span>/300</p>
            </div>
        </div>

        <p style="font-size:18px;font-weight:bold;margin-top:53px">课程详情</p>
        <div class="add-course-body-line"></div>

        <div class="add-course-sortone">
            <p style="font-size:16px">课程难度</p>
            <ul class="rating" id="rating">
                <li class="rating-item" title="很不好"><img src="/image/star_nor.png" alt=""></li>
                <li class="rating-item" title="不好"><img src="/image/star_nor.png" alt=""></li>
                <li class="rating-item" title="一般"><img src="/image/star_nor.png" alt=""></li>
                <li class="rating-item" title="好"><img src="/image/star_nor.png" alt=""></li>
                <li class="rating-item" title="很好"><img src="/image/star_nor.png" alt=""></li>
            </ul>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:16px">卡路里消耗</p>
            <div class="add-course-sortone-inputfive">
                <input type="text" id="kllxh">
                <p>cal</p>
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:16px">适用人群</p>
            <div class="add-course-sortone-inputsix">
                <input type="text" value="通用" id="shrq">
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:16px">课程雷达图</p>
            <div class="add-course-sortone-inputseven">
                <div class="oneinput">
                    <div class="add-course-sortone-selectone">
                        <div class="select-menu">
                            <div class="select-menu-div">
                                <input class="select-menu-input" />
                                <img class="select-menu-img" src="./image/sifting_icon.png" />
                            </div>
                            <ul class="select-menu-ul">
                                <div class="select-menu-ul-GroupRadar"></div>
                            </ul>
                        </div>
                    </div>
                    <input class="input" type="text" value="5">
                </div>
                <div class="oneinput">
                    <div class="add-course-sortone-selecttwo">
                        <div class="select-menu">
                            <div class="select-menu-div">
                                <input class="select-menu-input" />
                                <img class="select-menu-img" src="./image/sifting_icon.png" />
                            </div>
                            <ul class="select-menu-ul">
                                <div class="select-menu-ul-GroupRadar"></div>
                            </ul>
                        </div>
                    </div>
                    <input class="input" type="text" value="5">
                </div>
                <div class="oneinput">
                    <div class="add-course-sortone-selectthree">
                        <div class="select-menu">
                            <div class="select-menu-div">
                                <input class="select-menu-input" />
                                <img class="select-menu-img" src="./image/sifting_icon.png" />
                            </div>
                            <ul class="select-menu-ul">
                                <div class="select-menu-ul-GroupRadar"></div>
                            </ul>
                        </div>
                    </div>
                    <input class="input" type="text" value="5">
                </div>
                <div class="oneinput">
                    <div class="add-course-sortone-selectfour">
                        <div class="select-menu">
                            <div class="select-menu-div">
                                <input class="select-menu-input" />
                                <img class="select-menu-img" src="./image/sifting_icon.png" />
                            </div>
                            <ul class="select-menu-ul">
                                <div class="select-menu-ul-GroupRadar"></div>
                            </ul>
                        </div>
                    </div>
                    <input class="input" type="text" value="5">
                </div>
            </div>
        </div>

        <div class="add-course-sorttwo">
            <p style="font-size:16px">注意事项</p>
            <div class="add-course-sortone-inputfour">
                <textarea id="area1" cols="30" rows="10"></textarea>
                <p class="add-course-sortone-inputfour-position"><span id="text-count1">0</span>/300</p>
            </div>
        </div>

        <div class="add-course-sorttwo">
            <p style="font-size:16px">FAQ</p>
            <div class="add-course-sortone-inputeight" id="faq">
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <th>问题</th>
                        <th>回答</th>
                        <th></th>
                    </tr>
                    <tr>
                        <td><textarea placeholder="Q :"></textarea></td>
                        <td><textarea placeholder="A :"></textarea></td>
                        <td><img id="addOneRow" style="margin-right:6px" src="/image/add_btn.png" alt="">
                            <img id="delOneRow" src="/image/del_btn.png" alt="">
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:16px">课程视频</p>
            <div class="add-course-sortone-inputnine">
                <div>上传视频</div>
                <p>最多上传1个视频，单个视频不超过20M，视频作品将会展示在团课详情首位</p>
            </div>
        </div>

        <div class="add-course-sorttwo">
            <p style="font-size:16px;margin-right:90px">课程图片</p>
            <div id="demo" class="demo"></div>
        </div>

        <p style="font-size:16px;font-weight:bold;margin-top:53px">课程详情</p>
        <div class="add-course-body-line"></div>

        <div class="add-course-sortone">
            <p style="font-size:16px">广信编码</p>
            <div class="add-course-sortone-inputten">
                <div class="inputten-paypay">
                    <div class="paypay">
                        <img class="paypay-show" src="/image/payment_btn.png" alt="">
                        <img class="paypay-hidden" src="/image/paymentnor_btn.png" alt="">
                    </div>
                    <p style="font-size: 14px;">付现</p>
                </div>
                <div class="inputten-paypay">
                    <div class="paypay">
                        <img class="paypay-show" src="/image/payment_btn.png" alt="">
                        <img class="paypay-hidden" src="/image/paymentnor_btn.png" alt="">
                    </div>
                    <p style="font-size: 14px;">会员卡扣</p>
                </div>
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:16px">课程对应编码</p>
            <div class="add-course-sortone-inputeleven">
                <input placeholder="请输入课程对应广信编码" type="text" id="gxbm">
                <input type="text" id="gxmc">
            </div>
        </div>

        <div class="add-course-check">
            <div class="add-course-checkboxall">
                <img style="display:none" src="/image/codeallset_btn.png" alt="">
            </div>
            <p>取消全选</p>
        </div>

        <div class="add-course-sortthree">
            <p style="font-size:16px;margin-right:8px">会员卡口对应编码</p>
            <div class="add-course-sortone-inputtwelve">
                <div class="inputtwelve-flex" id="inputtwelve-flex">

                </div>
                <div class="inputtwelve-zhankai" id="zhankai-show">
                    <p>展开</p>
                    <img src="/image/pulldown_btn.png" alt="">
                </div>
                <div class="inputtwelve-zhankai" id="zhankai-hide" style="display:none">
                    <p>关闭</p>
                    <img src="/image/pullup_btn.png" alt="">
                </div>
            </div>
        </div>

        <div class="add-course-footer">
            <p id="add-course-footer-save">保存</p>
            <p>返回</p>
        </div>
    </div>
</body>
<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>


<script type="text/javascript">
    
    window.onload = function () {
        new course_manage().init();
        new add_course().init()
    }

    class course_manage {
        constructor() {
            this.li_one = $("#select-menu-ul1")
            this.select_two = $(".course-manage-flex-select-two")
            this.table = $(".course-manage-table")
            this.input_four = $(".course-manage-footer-pthree")
        }

        init() {
            this.table_all()
            this.time()
            this.add_change()
        }

        time() {
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

        table_all() {
            var list = [];
            var listclassifyName0 = [];
            var smd2input;
            var str;
            var str2;
            var that = this

            

            if ($('#select-menu-div2').children('input').val() == "上架") {
                smd2input = 1
            } else if ($('#select-menu-div2').children('input').val() == "下架") {
                smd2input = 2
            }

            //课程类型的请求及渲染
            var paramsGroupType = {
                typeCode: "GroupType"
            }

            $.ajax({
                type: 'POST',
                contentType: "application/json;charset=UTF-8",
                url: "http://test.physicalclub.com/rest/wx/dictionnary/getdictionnarylist",
                data: JSON.stringify(paramsGroupType),
                success: function (result) {
                    var strGroupType;
                    //console.log(result)
                    strGroupType = `
                        <li class="select-this">全部</li>
                    `
                    $.each(result.rows, function (i, item) {
                        strGroupType += `
                            <li class="`+ item.dictionaryId + `">` + item.name + `</li>
                        `
                    })
                    that.li_one.html(strGroupType)
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText)
                }
            })

            setTimeout(() => {

                var classifyId1;

                // if ($('#select-menu-div1').children('input').val() == "全部") {
                //         classifyId1 = {}
                //     }

                // for(var i = 1;i< $('#select-menu-ul1').children('li').length;i++){
                //     //console.log($('#select-menu-ul1').children('li').eq(i).html())
                //     if($('#select-menu-ul1').children('li').eq(i).html() == $('#select-menu-div1').children('input').val()){
                //         classifyId1 = $('#select-menu-ul1').children('li').eq(i).attr('class')
                //     }
                // }

                

                var paramsall = {
                    rows : 10000
                }

                $.ajax({
                    type: 'POST',
                    url: 'http://test.physicalclub.com/crm/rest/leagueCurriculum/selectLeagueCurriculumList',
                    contentType: "application/json;charset=UTF-8",
                    data: JSON.stringify(paramsall),
                    success: function (resultall) {

                        //console.log(resultall.results.length)

                        var onPagechange = function (page) {
                            //console.log(page)
                            aaaaaa(page)
                        }

                        var obj = {
                            wrapid: 'boxpage', //页面显示分页器容器id
                            total: resultall.results.length, //总条数
                            pagesize: 10, //每页显示10条
                            currentPage: 1, //当前页
                            onPagechange: onPagechange
                            //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                        }

                        pagination.init(obj);

                        
                        var page = 1
                        aaaaaa()

                        function aaaaaa(page){

                        var params = {
                            page: page,
                            rows: 10,
                            name: $('#course-manage-flex-input').val(),
                            state: smd2input,
                            minCreateDate: $('#course-manage-flex-input-one').val(),
                            maxCreateDate: $('#course-manage-flex-input-two').val(),
                            minPrice: $('#course-manage-flex-input-three').val(),
                            maxPrice: $('#course-manage-flex-input-four').val()
                        }
                        
                        $.ajax({
                            type: 'POST',
                            url: 'http://test.physicalclub.com/crm/rest/leagueCurriculum/selectLeagueCurriculumList',
                            contentType: "application/json;charset=UTF-8",
                            data: JSON.stringify(params),
                            success: function (result) {

                                list = result.results
                                console.log(list)
                                //两个str都为下菜单的渲染
                                // str = `
                                //         <li class="select-this">全部</li>
                                //         `
                                // var newArr = [];
                                // $.each(list, function (i, item) {
                                //     if (newArr.indexOf(item.classifyName) == -1) {
                                //         newArr.push(item.classifyName)
                                //         str += `
                                //             <li>` + item.classifyName + `</li>
                                //             `
                                //     }
                                // })
                                //课程分类下拉菜单渲染
                                //that.li_one.html(str)

                                // $.each(list, function (i, item) {
                                //     //如果遍历的分类名和菜单中的对应，添加到新数组中
                                //     if (item.classifyName == that.li_one.parent().children('.select-menu-div').children('input').val()) {
                                //         listclassifyName0.push(item)
                                //     }
                                // })
                                //如果菜单显示全部，则list为获取的全部数据
                                //否则list为添加到新数组中的数据
                                // if (that.li_one.parent().children('.select-menu-div').children('input').val() == "全部") {
                                //     list = list
                                // } else if (listclassifyName0.length > 0) {
                                //     list = listclassifyName0
                                // }

                                str2 = `
                                            <table border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <th width="48"></th>
                                                <th width="288">课程分类</th>
                                                <th width="288">课程名称</th>
                                                <th width="288"><div class="headingsifting">课程价格<div class="headingsifting-column"><img src="../images/simage/headingsifting_up.png"><img src="../images/simage/headingsifting_down.png"></div></div></th>
                                                <th width="288"><div class="headingsifting">创建时间<div class="headingsifting-column"><img src="../images/simage/headingsifting_up.png"><img src="../images/simage/headingsifting_down.png"></div></div></th>
                                                <th width="288">状态</th>
                                                <th width="148">操作</th>
                                            </tr>
                                        `

                                $.each(list, function (i, item) {
                                    //通过遍历和if判断上下架的表格行
                                    if (item.state == 1) {
                                        str2 += `
                                        <tr class="course-manage-table-tr">
                                            <td width="48"><div style="display:flex;justify-content: center;"><div class="course-manage-table-checkbox"><img style="display:none" src="../images/simage/codeallset_btn.png"></div></div></td>
                                            <td width="288">`+ item.classifyName + `</td>
                                            <td width="288">`+ item.name + `</td>
                                            <td width="288">`+ item.price + `</td>
                                            <td width="288">`+ item.createDate + `</td>
                                            <td width="288">上架</td>
                                            <td width="148" class="`+ item.id + `"><a class="course-manage-table-tr-edit">编辑</a>|<a class="course-manage-table-tr-up">上架</a></td>
                                        </tr>
                                    `
                                    }

                                    if (item.state == 2) {
                                        str2 += `
                                        <tr class="course-manage-table-tr">
                                            <td width="48"><div style="display:flex;justify-content: center;"><div class="course-manage-table-checkbox"><img style="display:none" src="../images/simage/codeallset_btn.png"></div></div></td>
                                            <td width="288">`+ item.classifyName + `</td>
                                            <td width="288">`+ item.name + `</td>
                                            <td width="288">`+ item.price + `</td>
                                            <td width="288">`+ item.createDate + `</td>
                                            <td width="288">下架</td>
                                            <td width="148" class="`+ item.id + `"><a class="course-manage-table-tr-edit">编辑</a>|<a class="course-manage-table-tr-up">上架</a></td>
                                        </tr>
                                    `
                                    }
                                })

                                that.table.html(str2)

                                var str3
                                str3 = `
                                <p>共`+ resultall.results.length + `条，每页` + params.rows + `条</p>
                            `
                                that.input_four.html(str3)

                                //批量上架下架

                                $('.course-manage-table-tr-up').click(function () {

                                    var id = [];

                                    if ($(this).parent().parent().children().eq(0).children().children().children().is(':visible')) {
                                        id.push($(this).parent().attr('class'))

                                        var params1 = {
                                            state: 1,
                                            ids: id
                                        }

                                        $.ajax({
                                            type: 'POST',
                                            url: 'http://test.physicalclub.com/crm/rest/leagueCurriculum/updateAllLeagueCurriculumState',
                                            contentType: "application/json;charset=UTF-8",
                                            data: JSON.stringify(params1),
                                            success: function (resule) {
                                                //console.log(resule)
                                                //console.log(list)
                                            },
                                            error: function (e) {
                                                console.log(e.status);
                                                console.log(e.responseText)
                                            }
                                        })
                                    }
                                    window.location.reload()
                                })

                                $('#batchup').click(function () {
                                    var id = [];

                                    for (var i = 0; i < $('.course-manage-table-tr').length; i++) {
                                        if ($('.course-manage-table-tr').eq(i).children().eq(0).children().children().children().is(':visible')) {
                                            id.push($('.course-manage-table-tr').eq(i).children().eq(6).attr('class'))
                                        }
                                    }

                                    var params1 = {
                                        state: 1,
                                        ids: id
                                    }

                                    $.ajax({
                                        type: 'POST',
                                        url: 'http://test.physicalclub.com/crm/rest/leagueCurriculum/updateAllLeagueCurriculumState',
                                        contentType: "application/json;charset=UTF-8",
                                        data: JSON.stringify(params1),
                                        success: function (resule) {
                                            //console.log(resule)
                                            //console.log(list)
                                        },
                                        error: function (e) {
                                            console.log(e.status);
                                            console.log(e.responseText)
                                        }
                                    })

                                    window.location.reload()
                                })

                                $('#batchdown').click(function () {
                                    var id = [];

                                    for (var i = 0; i < $('.course-manage-table-tr').length; i++) {
                                        if ($('.course-manage-table-tr').eq(i).children().eq(0).children().children().children().is(':visible')) {
                                            id.push($('.course-manage-table-tr').eq(i).children().eq(6).attr('class'))
                                        }
                                    }

                                    var params1 = {
                                        state: 2,
                                        ids: id
                                    }

                                    $.ajax({
                                        type: 'POST',
                                        url: 'http://test.physicalclub.com/crm/rest/leagueCurriculum/updateAllLeagueCurriculumState',
                                        contentType: "application/json;charset=UTF-8",
                                        data: JSON.stringify(params1),
                                        success: function (resule) {
                                            //console.log(resule)
                                            //console.log(list)
                                        },
                                        error: function (e) {
                                            console.log(e.status);
                                            console.log(e.responseText)
                                        }
                                    })

                                    window.location.reload()
                                })

                                that.li_one.one("click", function () {
                                    that.table_all()
                                })
                                $('#course-manage-flextwo-search').one("click", function () {
                                    that.table_all()
                                })
                                $('#course-manage-flextwo-clear').one("click", function () {
                                    window.location.reload()
                                })

                                //console.log(pagination.init)
                                new computed().init()
                            },

                            error: function (e) {
                                console.log(e.status);
                                console.log(e.responseText)
                            }
                        })
                    
                        }
                    }
                })
            }, 100);
        }

        add_change() {
            $('#course-manage-button').click(function () {
                $('.course-manage-body').hide()
                $('.add-course-body').show()
            })
        }
    }

    class computed {
        constructor() {
            this.checkbox = $(".course-manage-table-checkbox")
            this.checkbox1 = $("#course-manage-table-checkbox")
        }
        init() {
            this.checkbox_click()
            this.edit_change()
        }

        checkbox_click() {
            var that = this
            this.checkbox.click(function () {
                if ($(this).children('img').is(":hidden")) {
                    $(this).children('img').show()
                } else {
                    $(this).children('img').hide()
                    that.checkbox1.children('img').hide()
                }
            })


            this.checkbox1.click(function () {
                if ($(this).children('img').is(":hidden")) {
                    $(this).children('img').show()
                    that.checkbox.children('img').show()
                } else {
                    $(this).children('img').hide()
                    that.checkbox.children('img').hide()
                }
            })
        }
    
        edit_change() {
            $('.course-manage-table-tr-edit').click(function () {
                $('.course-manage-body').hide()
                $('.add-course-body').show()
                
                var a = $(this).parent().parent().children().eq(2).html()
                //new add_course().init(a)
                var paramsall = {
                    rows: 10000
                }
                $.ajax({
                    type: 'POST',
                    url: 'http://test.physicalclub.com/crm/rest/leagueCurriculum/selectLeagueCurriculumList',
                    contentType: "application/json;charset=UTF-8",
                    data: JSON.stringify(paramsall),
                    success: function (resultall) {
                        console.log(resultall.results)

                        $.each(resultall.results, function (i, item) {
                            if (item.name == a) {
                                $('#select-menu-input-GroupType').val(item.name)
                                $('#select-menu-input-GCourseType').val(item.modeName)

                            }
                        })


                    }
                })
            })
        }
    }

    class add_course {
        constructor() {
            this.acs_select = $(".add-course-sortone-select")
            this.acs_select1 = $("#select-menu-ul-GCourseType")
            this.acs_select2 = $("#select-menu-ul-GroupType")
            this.acs_select3 = $("#GroupCourseGole")
            this.acs_select4 = $(".select-menu-ul-GroupRadar")
            this.acs_select5 = $(".add-course-sortone-selectfive")
            this.bn = $('#bn')
            this.acs_input8 = $(".add-course-sortone-inputeight")
            this.item = $('#rating').find('.rating-item'); //获取的所有li
        }

        init(a) {
            this.acsselect_all()
            this.select_option()
            this.textare_contain()
            this.textare_contain1()
            this.textare_contain2()
            this.table_table()
            this.xingxing()
            this.acsip()
            this.show_change()
            //this.save()
        }

        acsselect_all() {
            var that = this
            var str11;
            str11 = `
                <div class="select-menu">
		            <div class="select-menu-div">
			            <input class="select-menu-input" />

			            <img class="select-menu-img" src="./image/sifting_icon.png"/>
		            </div>
                    <ul class="select-menu-ul">
                        <li class="select-this">全部</li>
                        <li>莱美课</li>
                        <li>莱美课</li>
                    </ul>
                </div>
            `

            //课程类型的请求及渲染
            var paramsGroupType = {
                typeCode: "GroupType"
            }

            $.ajax({
                type: 'POST',
                contentType: "application/json;charset=UTF-8",
                url: "http://test.physicalclub.com/rest/wx/dictionnary/getdictionnarylist",
                data: JSON.stringify(paramsGroupType),
                success: function (result) {
                    var strGroupType;
                    //console.log(result)
                    strGroupType = `
                        <li class="select-this">全部</li>
                    `
                    $.each(result.rows, function (i, item) {
                        strGroupType += `
                            <li class="`+ item.dictionaryId + `">` + item.name + `</li>
                        `
                    })
                    that.acs_select2.html(strGroupType)
                    that.acs_select2.parent().children('.select-menu-div').children('input').val("全部")
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText)
                }
            })

            //上课方式的请求及渲染
            var paramsGCourseType = {
                typeCode: "GCourseType"
            }

            $.ajax({
                type: 'POST',
                contentType: "application/json;charset=UTF-8",
                url: "http://test.physicalclub.com/rest/wx/dictionnary/getdictionnarylist",
                data: JSON.stringify(paramsGCourseType),
                success: function (result) {
                    var strmodel;
                    //console.log(result)
                    strmodel = `
                        <li class="select-this">全部</li>
                    `
                    $.each(result.rows, function (i, item) {
                        strmodel += `
                            <li class="`+ item.dictionaryId + `">` + item.name + `</li>
                        `
                    })
                    that.acs_select1.html(strmodel)
                    that.acs_select1.parent().children('.select-menu-div').children('input').val("全部")
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText)
                }
            })

            //团课目标的请求及渲染
            var paramsGroupCourseGole = {
                typeCode: "GroupCourseGole"
            }

            $.ajax({
                type: 'POST',
                contentType: "application/json;charset=UTF-8",
                url: "http://test.physicalclub.com/rest/wx/dictionnary/getdictionnarylist",
                data: JSON.stringify(paramsGroupCourseGole),
                success: function (result) {
                    var strmodel = '';
                    //console.log(result)

                    $.each(result.rows, function (i, item) {
                        strmodel += `
                            <p class="add-course-sortone-inputthree-p `+ item.dictionaryId + `">` + item.name + `</p>
                        `
                    })
                    that.acs_select3.html(strmodel)
                    that.acs_select3.parent().children('.select-menu-div').children('input').val("全部")
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText)
                }
            })

            //课程雷达图的请求及渲染

            var paramsGroupRadar = {
                typeCode: "GroupRadar"
            }

            $.ajax({
                type: 'POST',
                contentType: "application/json;charset=UTF-8",
                url: "http://test.physicalclub.com/rest/wx/dictionnary/getdictionnarylist",
                data: JSON.stringify(paramsGroupRadar),
                success: function (result) {
                    var strGroupRadar = '';
                    //console.log(result)
                    $.each(result.rows, function (i, item) {
                        strGroupRadar += `
                            <li class="`+ item.dictionaryId + `">` + item.name + `</li>
                        `
                    })
                    that.acs_select4.html(strGroupRadar)
                    //that.acs_select4.parent().parent().children('.select-menu-div').children('input').val("全部")
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText)
                }
            })

            //获取广信编码

            var paramsgxbm = {

            }

            $.ajax({
                type: 'POST',
                contentType: "application/json;charset=UTF-8",
                url: "http://test.physicalclub.com/crm/rest/leagueCurriculum/selectGxFitListByCondition",
                data: JSON.stringify(paramsgxbm),
                success: function (result) {
                    var strgxbm = '';
                    var thatresult = result
                    //console.log(result)
                    $('#gxbm').blur(function () {
                        $.each(thatresult.rows, function (i, item) {
                            if (item.mediid == $('#gxbm').val()) {
                                $('#gxmc').val(item.mediname)
                            }
                        })
                    })

                    $.each(thatresult.rows, function (i, item) {
                        strgxbm += `
                            <div class="inputtwelve-checkbox">
                                <p>`+ item.mediid + item.mediname + `</p>
                                <img src="/image/checkset_btn.png" alt="">
                            </div>
                        `
                        $('#inputtwelve-flex').html(strgxbm)
                    })
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText)
                }
            })

            setTimeout(() => {
                new paypay().init()
            }, 500);

        }

        textare_contain() {
            $("#area").on("input propertychange", function () {
                var $this = $(this),
                    _val = $this.val(),
                    count = "";
                if (_val.length > 300) {
                    $this.val(_val.substring(0, 300));
                }
                count = $this.val().length;
                $("#text-count").text(count);
            });
        }

        textare_contain1() {
            $("#area1").on("input propertychange", function () {
                var $this = $(this),
                    _val = $this.val(),
                    count = "";
                if (_val.length > 300) {
                    $this.val(_val.substring(0, 300));
                }
                count = $this.val().length;
                $("#text-count1").text(count);
            });
        }

        textare_contain2() {
            $("#area2").on("input propertychange", function () {
                var $this = $(this),
                    _val = $this.val(),
                    count = "";
                if (_val.length > 22) {
                    $this.val(_val.substring(0, 22));
                }
                count = $this.val().length;
                $("#text-count2").text(count);
            });
        }

        acsip() {
            $('.add-course-sortone-inputthree-p').click(function () {
                if ($(this).hasClass('add-course-sortone-inputthree-p-active')) {
                    $(this).removeClass('add-course-sortone-inputthree-p-active')
                } else {
                    $(this).addClass('add-course-sortone-inputthree-p-active')
                }
            })
        }

        xingxing() {
            var num = 4; //点亮个数
            //点亮星星函数
            var that = this
            var dianLiang = function (num) {
                that.item.each(function (index) { //遍历所有li,即所有星星
                    if (index < num) {
                        $(this).find('img').hide()
                        $(this).css('background-position', '0 0') //点亮
                    } else {
                        $(this).find('img').show()
                        $(this).css('background-position', '0 -58px') //未点亮
                    }
                })
            }
            //    初始化,默认点亮2颗
            dianLiang(num)
            //    绑定事件
            this.item.on('mouseover', function () {
                dianLiang($(this).index() + 1)
            }).on('click', function () {
                dianLiang($(this).index() + 1);
                num = $(this).index() + 1
            })
            $('#rating').on('mouseout', function () {
                dianLiang(num)
            })
        }

        table_table() {
            $("#addOneRow").click(function () {
                var tempTr = $(this).parent().parent().clone(true);
                $(this).parent().parent().parent().children("tr:last").after(tempTr);
            });
            $("#delOneRow").click(function () {
                if ($(this).parent().parent().parent().children("tr").length < 2) {
                    alert("至少保留一行!");
                } else {
                    if (confirm("确认删除?")) {
                        $(this).parent().parent().remove();
                    }
                }
            });
        }

        select_option() {
            selectMenu(0);
            selectMenu(1);
            selectMenu(2);
            selectMenu(3);
            selectMenu(4);
            selectMenu(5);
            selectMenu(6);
            selectMenu(7);
            selectMenu(8);

            function selectMenu(index) {
                $(".select-menu-input").eq(index).val($(".select-this").eq(index).html()); //在输入框中自动填充第一个选项的值
                $(".select-menu-div").eq(index).on("click", function (e) {
                    e.stopPropagation();
                    if ($(".select-menu-ul").eq(index).css("display") === "block") {
                        $(".select-menu-ul").eq(index).hide();
                        $(".select-menu-div").eq(index).find("i").removeClass("select-menu-i");
                        $(".select-menu-ul").eq(index).animate({
                            marginTop: "0",
                            opacity: "0"
                        }, "fast");
                    } else {
                        $(".select-menu-ul").eq(index).show();
                        $(".select-menu-div").eq(index).find("i").addClass("select-menu-i");
                        $(".select-menu-ul").eq(index).animate({
                            marginTop: "5px",
                            opacity: "1"
                        }, "fast");
                    }
                    for (var i = 0; i < $(".select-menu-ul").length; i++) {
                        if (i !== index && $(".select-menu-ul").eq(i).css("display") === "block") {
                            $(".select-menu-ul").eq(i).hide();
                            $(".select-menu-div").eq(i).find("i").removeClass("select-menu-i");
                            $(".select-menu-ul").eq(i).animate({
                                marginTop: "0",
                                opacity: "0"
                            }, "fast");
                        }
                    }
                });
                $(".select-menu-ul").eq(index).on("click", "li", function () { //给下拉选项绑定点击事件
                    $(".select-menu-input").eq(index).val($(this).html()); //把被点击的选项的值填入输入框中
                    $(".select-menu-div").eq(index).click();
                    $(this).siblings(".select-this").removeClass("select-this");
                    $(this).addClass("select-this");
                });
                $("body").on("click", function (event) {
                    event.stopPropagation();
                    if ($(".select-menu-ul").eq(index).css("display") === "block") {
                        console.log(1);
                        $(".select-menu-ul").eq(index).hide();
                        $(".select-menu-div").eq(index).find("i").removeClass("select-menu-i");
                        $(".select-menu-ul").eq(index).animate({
                            marginTop: "0",
                            opacity: "0"
                        }, "fast");

                    }

                });

            }
        }

        show_change() {
            $('#add-course-body-pone').click(function () {
                $('.course-manage-body').show()
                $('.add-course-body').hide()
            })
        }
    }

    class paypay {
        constructor() {
            this.paypay = $(".paypay")
            this.it_checkbox = $(".inputtwelve-checkbox")
            this.zhankai_show = $("#zhankai-show")
            this.zhankai_hide = $("#zhankai-hide")
            this.ac_checkboxall = $(".add-course-checkboxall")
            this.acsip = $(".add-course-sortone-inputthree-p")
        }

        init() {
            this.pay_pay()
            this.save()
        }

        pay_pay() {
            //广信标签显示隐藏
            this.paypay.click(function () {
                $('.paypay').children('.paypay-show').hide()
                $('.paypay').children('.paypay-hidden').show()
                if ($(this).children('.paypay-hidden').is(":hidden")) {
                    $(this).children('.paypay-hidden').show()
                    $(this).children('.paypay-show').hide()
                } else {
                    $(this).children('.paypay-hidden').hide()
                    $(this).children('.paypay-show').show()
                }
            })
            //课程目标标签显示隐藏
            this.acsip.click(function () {
                if ($(this).hasClass('add-course-sortone-inputthree-p-active')) {
                    $(this).removeClass('add-course-sortone-inputthree-p-active')
                } else {
                    $(this).addClass('add-course-sortone-inputthree-p-active')
                }
            })

            this.it_checkbox.click(function () {
                if ($(this).children('img').is(":hidden")) {
                    $(this).children('img').show()
                    $(".add-course-checkboxall").children('img').hide()
                } else {
                    $(this).children('img').hide()
                }
            })
            //广信标签展开
            this.zhankai_show.click(function () {
                $(".inputtwelve-flex").css('height', 'auto')
                $(this).hide()
                $("#zhankai-hide").show()
            })
            //广信标签闭合
            this.zhankai_hide.click(function () {
                $(".inputtwelve-flex").css('height', '80px')
                $(this).hide()
                $("#zhankai-show").show()
            })

            this.ac_checkboxall.click(function () {
                if ($(this).children('img').is(":hidden")) {
                    $(this).children('img').show()
                    $(".inputtwelve-checkbox").children('img').hide()
                } else {
                    $(this).children('img').hide()
                }
            })
        }

        save() {
            var that = this;
            $('#add-course-footer-save').click(function () {
                //支付方式的参数

                for (var i = 0; i < that.paypay.length; i++) {
                    if (that.paypay.eq(i).children('.paypay-show').is(':visible')) {
                        var payMode = i + 1
                    }
                }
                //上课方式的参数

                for (var i = 1; i < $('#select-menu-ul-GCourseType').children().length; i++) {
                    if ($('#select-menu-ul-GCourseType').children().eq(i).html() == $('#select-menu-input-GCourseType').val()) {

                        var modeId = $('#select-menu-ul-GCourseType').children().eq(i).attr('class').split(' ')[0]
                    }
                }

                //适合人群参数

                var suitableForCrowd = $('#shrq').val()

                //注意事项参数

                var announcements = $('#area1').val()

                //卡路里参数

                var calorieConsumption = $('#kllxh').val()

                //课程分类id

                for (var i = 1; i < $('#select-menu-ul-GroupType').children().length; i++) {
                    if ($('#select-menu-ul-GroupType').children().eq(i).html() == $('#select-menu-input-GroupType').val()) {

                        var classifyId = $('#select-menu-ul-GroupType').children().eq(i).attr('class').split(' ')[0]
                    }
                }

                //课程难度id

                var difficultyId = 5;

                for (var i = 0; i < $('#rating').children('li').length; i++) {
                    if ($('#rating').children('li').eq(i).children('img').is(':visible')) {
                        difficultyId--
                    }
                }

                //产品价格参数

                var price = $('#kcbzj').val()

                //课程名称

                var name = $('#area2').val()

                //课程介绍参数

                var description = $('#area').val()

                //雷达字典id
                var ldzdcount = 0;
                var curriculumEffectList = []

                for (var i = 0; i < $('.select-menu-ul-GroupRadar').length; i++) {
                    if ($('.select-menu-ul-GroupRadar').eq(i).parent().parent().children('.select-menu-div').children('input').val()) {
                        ldzdcount++
                    }
                }

                for (var i = 0; i < ldzdcount; i++) {
                    for (var j = 0; j < $('.select-menu-ul-GroupRadar').length; j++) {

                        if ($('.select-menu-ul-GroupRadar').children().eq(j).html() == $('.select-menu-ul-GroupRadar').eq(i).parent().parent().children('.select-menu-div').children('input').val()) {
                            var dictionaryId = $('.select-menu-ul-GroupRadar').children().eq(j).attr('class').split(' ')[0]
                            var effectValue = $('.select-menu-ul-GroupRadar').children().eq(j).parent().parent().parent().parent().parent().children('.input').val()
                            curriculumEffectList.push({ dictionaryId, effectValue })
                        }
                    }

                }

                //标签字典id
                var curriculumTagList = []
                for (var i = 0; i < $('#GroupCourseGole').children().length; i++) {
                    if ($('#GroupCourseGole').children().eq(i).hasClass('add-course-sortone-inputthree-p-active')) {
                        var dictionaryId = ($('#GroupCourseGole').children().eq(i).attr('class').split(' ')[1])
                        curriculumTagList.push({ dictionaryId })
                    }
                }

                //FAQ问题

                var leagueCurriculumFaqList = []

                for (var i = 1; i < $('#faq').children().children().children().length; i++) {
                    var problem = $('#faq').children().children().children().eq(i).children().eq(0).children('textarea').val()
                    var answer = $('#faq').children().children().children().eq(i).children().eq(1).children('textarea').val()
                    leagueCurriculumFaqList.push({ problem, answer })
                }

                //广信编码

                var curriculumGuangxinList = []

                for (var i = 0; i < $('#inputtwelve-flex').children().length; i++) {
                    if ($('#inputtwelve-flex').children().eq(i).children('img').is(':visible')) {

                        var itemId = parseInt($('#inputtwelve-flex').children().eq(i).children('p').html())

                        curriculumGuangxinList.push({ itemId })
                    }
                }

                var fd = {
                    payMode: payMode,
                    modeId: modeId,
                    suitableForCrowd: suitableForCrowd,
                    announcements: announcements,
                    calorieConsumption: calorieConsumption,
                    classifyId: classifyId,
                    difficultyId: difficultyId,
                    price: price,
                    description: description,
                    name: name,
                    curriculumEffectList: curriculumEffectList,
                    curriculumTagList: curriculumTagList,
                    leagueCurriculumFaqList: leagueCurriculumFaqList,
                    curriculumGuangxinList: curriculumGuangxinList
                }

                $.ajax({
                    type: 'POST',
                    url: "http://test.physicalclub.com/crm/rest/leagueCurriculum/insertLeagueCurriculum",
                    contentType: "application/json",  //multipart/form-data;boundary=--xxxxxxx   application/json,
                    data: JSON.stringify(fd),
                    success: function (result) {
                        console.log(result)
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText)
                    }
                })
                console.log(fd)
            })
        }
    }

</script>

</html>