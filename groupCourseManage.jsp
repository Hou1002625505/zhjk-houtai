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
    <script src="../easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="easyui/moment.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
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


        .add-course-body {
            padding: 15px 26px 0 18px
        }

        .add-course-body .add-course-body-pone {
            font-size: 14px;
            color: #71B2EF
        }

        .add-course-body .add-course-body-line {
            height: 1px;
            background: #BFBFBF;
            margin-top: 17px
        }

        .add-course-body .add-course-body-ptwo {
            font-size: 16px;
            color: #444444;
            margin-left: 13px;
            margin-top: 18px;
        }

        .add-course-sortone .add-course-sortone-select .select-menu {
            margin-left: 10px;
            margin-right: 39px;
            cursor: pointer;
            width: 106px;
            height: 26px;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 106px;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
            width: 210px;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-ul li {
            height: 32px;
            font-size: 14px;
            padding: 0 15px;
            box-sizing: border-box;
            line-height: 32px;
            width: 210px;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-div {
            position: relative;
            height: 28px;
            width: 210px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            width: 210px;
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
            width: 50px;
            height: 24px;
            cursor: pointer;
            user-select: none;
            font-size: 14px
        }

        .add-course-sortone {
            display: flex;
            margin-top: 22px;
            align-items: center;
        }

        .add-course-sortone .add-course-sortone-select {
            margin-left: 66px
        }

        .add-course-sortone .add-course-sortone-inputone {
            width: 334px;
            height: 28px;
            box-sizing: border-box;
            margin-left: 76px;
            padding-left: 17px;
            font-size: 14px;
            border: 1px solid #CCCCCC;
            line-height: 28px;
            border-radius: 4px;
            display: flex;
            justify-content: space-between;
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
            width: 106px;
            height: 28px;
            border: 1px solid #CCCCCC;
            margin-left: 62px;
            border-radius: 4px;
        }

        .add-course-sortone .add-course-sortone-inputtwo p {
            width: 18px;
            height: 28px;
            background: #CCCCCC;
            line-height: 28px;
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

        .add-course-sortone .add-course-sortone-inputthree p {
            width: 70px;
            height: 28px;
            border: 1px solid #71B2EF;
            border-radius: 3px;
            text-align: center;
            line-height: 28px;
            font-size: 12px;
            color: #444444;
            margin-left: 18px;
        }

        .add-course-sortone .add-course-sortone-inputfour {
            display: flex;
        }

        .add-course-sorttwo {
            display: flex;
            margin-top: 31px;
        }

        .add-course-sorttwo .add-course-sortone-inputfour textarea {
            width: 600px;
            height: 140px;
            border: 1px solid #CCCCCC;
            border-radius: 3px;
            margin-left: 76px;
            resize: none;
        }

        .add-course-sorttwo .add-course-sortone-inputfour .add-course-sortone-inputfour-position {
            margin-left: 612px;
            margin-top: -30px;
        }

        .add-course-sortone .rating li {
            list-style: none;
        }

        .add-course-sortone .rating {
            width: 300px;
            height: 26px;
            margin-left: 63px;
        }

        .add-course-sortone .rating .rating-item {
            float: left;
            width: 25px;
            height: 24px;
            background: url(./image/star_set.png) no-repeat center center;
            background-size: 25px 24px;
            background-position: 0 -58px;
            overflow: hidden;
            margin-left: 13px;
        }

        .add-course-sortone .rating .rating-item img {
            width: 25px;
            height: 24px
        }

        .add-course-sortone .add-course-sortone-inputfive {
            width: 106px;
            height: 28px;
            border: 1px solid #CCCCCC;
            border-radius: 3px;
            margin-left: 62px;
            display: flex;
            align-items: center;
        }

        .add-course-sortone .add-course-sortone-inputfive input {
            border: none;
            outline: none;
            width: 80px;
            box-sizing: border-box;
            padding-left: 20px
        }

        .add-course-sortone .add-course-sortone-inputsix {
            width: 334px;
            height: 28px;
            border: 1px solid #CCCCCC;
            padding-left: 18px;
            margin-left: 76px;
            line-height: 28px;
            border-radius: 3px;
        }

        .add-course-sortone .add-course-sortone-inputsix input {
            border: none;
            outline: none;
            width: 316px;
        }

        .add-course-sortone .add-course-sortone-inputseven {
            margin-left: 44px;
            display: flex;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput {
            width: 106px;
            height: 28px;
            border: 1px solid #CCCCCC;
            margin-left: 18px;
            border-radius: 3px;
            display: flex;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .input {
            width: 61px;
            border: none;
            outline: none;
            text-align: center;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu {
            cursor: pointer;
            width: 44px;
            height: 28px;
            box-sizing: border-box;
            line-height: 28px;
            border-right: 1px solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 44px;
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
            width: 44px;
            text-align: left;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-div {
            position: relative;
            height: 28px;
            width: 210px;
            border-radius: 4px;
            box-sizing: border-box;
            width: 40px;
            line-height: 28px;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-this {
            background: #71B2EF;
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
            color: #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-input {
            border: 0;
            width: 40px;
            height: 24px;
            cursor: pointer;
            user-select: none;
            font-size: 14px
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu {
            cursor: pointer;
            width: 44px;
            height: 28px;
            box-sizing: border-box;
            line-height: 28px;
            border-right: 1px solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 44px;
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
            width: 44px;
            text-align: left;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-div {
            position: relative;
            height: 28px;
            width: 210px;
            border-radius: 4px;
            box-sizing: border-box;
            width: 40px;
            line-height: 28px;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-this {
            background: #71B2EF;
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
            color: #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-input {
            border: 0;
            width: 40px;
            height: 24px;
            cursor: pointer;
            user-select: none;
            font-size: 14px
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu {
            cursor: pointer;
            width: 44px;
            height: 28px;
            box-sizing: border-box;
            line-height: 28px;
            border-right: 1px solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 44px;
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
            width: 44px;
            text-align: left;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-div {
            position: relative;
            height: 28px;
            width: 210px;
            border-radius: 4px;
            box-sizing: border-box;
            width: 40px;
            line-height: 28px;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-this {
            background: #71B2EF;
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
            color: #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-input {
            border: 0;
            width: 40px;
            height: 24px;
            cursor: pointer;
            user-select: none;
            font-size: 14px
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu {
            cursor: pointer;
            width: 44px;
            height: 28px;
            box-sizing: border-box;
            line-height: 28px;
            border-right: 1px solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 44px;
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
            width: 44px;
            text-align: left;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-div {
            position: relative;
            height: 28px;
            width: 210px;
            border-radius: 4px;
            box-sizing: border-box;
            width: 40px;
            line-height: 28px;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-this {
            background: #71B2EF;
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
            color: #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-input {
            border: 0;
            width: 40px;
            height: 24px;
            cursor: pointer;
            user-select: none;
            font-size: 14px
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu {
            cursor: pointer;
            width: 44px;
            height: 28px;
            box-sizing: border-box;
            line-height: 28px;
            border-right: 1px solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 44px;
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
            width: 44px;
            text-align: left;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-div {
            position: relative;
            height: 28px;
            width: 210px;
            border-radius: 4px;
            box-sizing: border-box;
            width: 40px;
            line-height: 28px;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-this {
            background: #71B2EF;
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
            color: #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-input {
            border: 0;
            width: 40px;
            height: 24px;
            cursor: pointer;
            user-select: none;
            font-size: 14px
        }

        .add-course-sorttwo .add-course-sortone-inputeight {
            margin-left: 105px;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table {
            width: 600px;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr:nth-child(1) {
            height: 35px;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table th {
            border: 1px solid #CCCCCC;
            border-left: none;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr:nth-child(1) th:nth-child(1) {
            border-left: 1px solid #CCCCCC;
            width: 208px
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td {
            border: 1px solid #CCCCCC;
            border-top: none;
            border-left: none;
            padding: 7.5px 7.5px 5.5px 7.5px;
            box-sizing: border-box;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(1) {
            border-left: 1px solid #CCCCCC;
            width: 211px;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(1) textarea {
            width: 194px;
            height: 71px;
            border: 1px solid #CCCCCC;
            resize: none;
            box-sizing: border-box;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(2) textarea {
            width: 300px;
            height: 70px;
            border: 1px solid #CCCCCC;
            resize: none;
            box-sizing: border-box;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(3) {
            padding: 0 15px;
            display: flex;
            height: 88px;
            align-items: center;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(3) img {
            width: 18px;
            height: 18px
        }

        .add-course-sortone .add-course-sortone-inputnine {
            margin-left: 76px;
            display: flex;
            align-items: center;
        }

        .add-course-sortone .add-course-sortone-inputnine div {
            width: 106px;
            height: 28px;
            background: #71B2EF;
            font-size: 12px;
            color: white;
            text-align: center;
            line-height: 28px;
        }

        .add-course-sortone .add-course-sortone-inputnine p {
            margin-left: 17px
        }

        .add-course-sorttwo #demo {
            margin: 0;
            height: 160px;
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
            margin-left: 34px
        }

        .add-course-sortone .add-course-sortone-inputten .inputten-paypay {
            display: flex;
        }

        .add-course-sortone .add-course-sortone-inputten .inputten-paypay .paypay {
            width: 21px;
            height: 21px;
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
            margin-top: 14px
        }

        .add-course-sortone .add-course-sortone-inputeleven input:nth-child(1) {
            width: 210px;
            height: 28px;
            margin-left: 50px;
            font-size: 12px;
            line-height: 28px;
            padding-left: 18px
        }

        .add-course-sortone .add-course-sortone-inputeleven input:nth-child(2) {
            width: 360px;
            height: 28px;
            margin-left: 18px
        }

        .add-course-sortthree {
            display: flex;
            margin-top: 10px
        }

        .add-course-sortthree .add-course-sortone-inputtwelve {
            margin-top: 14px
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-flex {
            display: flex;
            width: 650px;
            height: 80px;
            flex-wrap: wrap;
            overflow: hidden;
            margin-left: 4px
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-checkbox {
            width: 193px;
            height: 28px;
            border: 1px solid #CCCCCC;
            font-size: 12px;
            text-align: center;
            line-height: 28px;
            position: relative;
            cursor: pointer;
            margin-left: 18px;
            border-radius: 3px;
            margin-bottom: 18px
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-checkbox img {
            position: absolute;
            left: 173px;
            top: 10px;
            display: none
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-zhankai {
            display: flex;
            align-items: center;
            margin-left: 580px
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-zhankai p {
            font-size: 12px;
            color: #71B2EF
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-zhankai img {
            width: 11px;
            height: 8px;
            margin-left: 4px
        }

        .add-course-check {
            display: flex;
            align-items: center;
            margin-left: 685px;
            margin-top: 15px
        }

        .add-course-check p {
            color: #71B2EF;
            font-size: 12px;
            margin-left: 8px
        }

        .add-course-check .add-course-checkboxall {
            width: 14px;
            height: 14px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
            line-height: 14px;
        }

        .add-course-check .add-course-checkboxall img {
            width: 14px;
            height: 14px;
            margin-left: -1px;
            margin-top: -1px;
        }

        .add-course-footer {
            display: flex;
            margin-left: 15px;
            margin-top: 60px;
            margin-bottom: 30px;
        }

        .add-course-footer p:nth-child(1) {
            width: 100px;
            height: 35px;
            background: #71B2EF;
            color: white;
            font-size: 12px;
            text-align: center;
            line-height: 35px;
            border-radius: 4px;
        }

        .add-course-footer p:nth-child(2) {
            width: 100px;
            height: 35px;
            font-size: 12px;
            text-align: center;
            line-height: 35px;
            border-radius: 4px;
            border: 1px solid #71B2EF;
            box-sizing: border-box;
            margin-left: 13px
        }
    </style>
</head>

<body>
    <div class="course-manage-body">
        <div class="course-manage-button">新建课程</div>
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
        <!-- <div class="m-style M-box11"></div> -->
        <div class="box" id="ywyboxpage"></div>
    </div>

    <!-- <div class="add-course-body" style="display:none">
        <p class="add-course-body-pone">返回上一级</p>
        <div class="add-course-body-line"></div>
        <p class="add-course-body-ptwo">基本信息</p>
        <div class="add-course-body-line"></div>
        <div class="add-course-sortone">
            <p style="font-size:14px">课程类型</p>
            <div class="add-course-sortone-select"></div>
        </div>
        <div class="add-course-sortone">
            <p style="font-size:14px">上课方式</p>
            <div class="add-course-sortone-select"></div>
        </div>
        <div class="add-course-sortone">
            <p style="font-size:14px">课程名称</p>
            <div class="add-course-sortone-inputone">
                <input type="text" value="BODYBLANCE">
                <p>0/22</p>
            </div>
        </div>
        <div class="add-course-sortone">
            <p style="font-size:14px">课程标准价</p>
            <div class="add-course-sortone-inputtwo">
                <p>￥</p>
                <input type="text">
            </div>
        </div>
        <div class="add-course-sortone">
            <p style="font-size:14px;margin-right:58px">课程目标</p>
            <div class="add-course-sortone-inputthree">
                <p>燃脂</p>
                <p>燃脂</p>
                <p>燃脂</p>
                <p>燃脂</p>
                <p>燃脂</p>
                <div style="font-size: 12px;color:#444444;margin-left:12px">(可多选)</div>
            </div>
        </div>
        <div class="add-course-sorttwo">
            <p style="font-size:14px">课程简介</p>
            <div class="add-course-sortone-inputfour">
                <textarea id="area" cols="30" rows="10" placeholder="请输入本节课简介"></textarea>
                <p class="add-course-sortone-inputfour-position"><span id="text-count">0</span>/300</p>
            </div>
        </div>

        <p style="font-size:16px;font-weight:bold;margin-top:53px">课程详情</p>
        <div class="add-course-body-line"></div>

        <div class="add-course-sortone">
            <p style="font-size:14px">课程难度</p>
            <ul class="rating" id="rating">
                <li class="rating-item" title="很不好"><img src="./image/star_nor.png" alt=""></li>
                <li class="rating-item" title="不好"><img src="./image/star_nor.png" alt=""></li>
                <li class="rating-item" title="一般"><img src="./image/star_nor.png" alt=""></li>
                <li class="rating-item" title="好"><img src="./image/star_nor.png" alt=""></li>
                <li class="rating-item" title="很好"><img src="./image/star_nor.png" alt=""></li>
            </ul>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:14px">卡路里消耗</p>
            <div class="add-course-sortone-inputfive">
                <input type="text">
                <p>cal</p>
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:14px">适用人群</p>
            <div class="add-course-sortone-inputsix">
                <input type="text" value="通用">
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:14px">课程雷达图</p>
            <div class="add-course-sortone-inputseven">
                <div class="oneinput">
                    <div class="add-course-sortone-selectone"></div>
                    <input class="input" type="text" value="5">
                </div>
                <div class="oneinput">
                    <div class="add-course-sortone-selecttwo"></div>
                    <input class="input" type="text" value="5">
                </div>
                <div class="oneinput">
                    <div class="add-course-sortone-selectthree"></div>
                    <input class="input" type="text" value="5">
                </div>
                <div class="oneinput">
                    <div class="add-course-sortone-selectfour"></div>
                    <input class="input" type="text" value="5">
                </div>
                <div class="oneinput">
                    <div class="add-course-sortone-selectfive"></div>
                    <input class="input" type="text" value="5">
                </div>
            </div>
        </div>

        <div class="add-course-sorttwo">
            <p style="font-size:14px">注意事项</p>
            <div class="add-course-sortone-inputfour">
                <textarea id="area1" cols="30" rows="10"></textarea>
                <p class="add-course-sortone-inputfour-position"><span id="text-count1">0</span>/300</p>
            </div>
        </div>

        <div class="add-course-sorttwo">
            <p style="font-size:14px">FAQ</p>
            <div class="add-course-sortone-inputeight">
                <table cellspacing="0" cellpadding="0">
                    <tr>
                        <th>问题</th>
                        <th>回答</th>
                        <th></th>
                    </tr>
                    <tr>
                        <td><textarea>Q :</textarea></td>
                        <td><textarea>A :</textarea></td>
                        <td><img id="addOneRow" style="margin-right:6px" src="./image/add_btn.png" alt="">
                            <img id="delOneRow" src="./image/del_btn.png" alt="">
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:14px">课程视频</p>
            <div class="add-course-sortone-inputnine">
                <div>上传视频</div>
                <p>最多上传1个视频，单个视频不超过20M，视频作品将会展示在团课详情首位</p>
            </div>
        </div>

        <div class="add-course-sorttwo">
            <p style="font-size:14px;margin-right:76px">课程图片</p>
            <div id="demo" class="demo"></div>
        </div>

        <p style="font-size:16px;font-weight:bold;margin-top:53px">课程详情</p>
        <div class="add-course-body-line"></div>

        <div class="add-course-sortone">
            <p style="font-size:14px">广信编码</p>
            <div class="add-course-sortone-inputten">
                <div class="inputten-paypay">
                    <div class="paypay">
                        <img class="paypay-show" src="./image/payment_btn.png" alt="">
                        <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                    </div>
                    付现
                </div>
                <div class="inputten-paypay">
                    <div class="paypay">
                        <img class="paypay-show" src="./image/payment_btn.png" alt="">
                        <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                    </div>
                    会员卡扣
                </div>
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:14px">课程对应编码</p>
            <div class="add-course-sortone-inputeleven">
                <input placeholder="请输入课程对应广信编码" type="text">
                <input type="text">
            </div>
        </div>

        <div class="add-course-check">
            <div class="add-course-checkboxall">
                <img style="display:none" src="./image/codeallset_btn.png" alt="">
            </div>
            <p>取消全选</p>
        </div>

        <div class="add-course-sortthree">
            <p style="font-size:14px">会员卡口对应编码</p>
            <div class="add-course-sortone-inputtwelve">
                <div class="inputtwelve-flex">
                    <div class="inputtwelve-checkbox">
                        <p>（T-20190001）华为健身</p>
                        <img src="./image/checkset_btn.png" alt="">
                    </div>
                    <div class="inputtwelve-checkbox">
                        <p>（T-20190001）华为健身</p>
                        <img src="./image/checkset_btn.png" alt="">
                    </div>
                    <div class="inputtwelve-checkbox">
                        <p>（T-20190001）华为健身</p>
                        <img src="./image/checkset_btn.png" alt="">
                    </div>
                    <div class="inputtwelve-checkbox">
                        <p>（T-20190001）华为健身</p>
                        <img src="./image/checkset_btn.png" alt="">
                    </div>
                    <div class="inputtwelve-checkbox">
                        <p>（T-20190001）华为健身</p>
                        <img src="./image/checkset_btn.png" alt="">
                    </div>
                    <div class="inputtwelve-checkbox">
                        <p>（T-20190001）华为健身</p>
                        <img src="./image/checkset_btn.png" alt="">
                    </div>
                    <div class="inputtwelve-checkbox">
                        <p>（T-20190001）华为健身</p>
                        <img src="./image/checkset_btn.png" alt="">
                    </div>
                    <div class="inputtwelve-checkbox">
                        <p>（T-20190001）华为健身</p>
                        <img src="./image/checkset_btn.png" alt="">
                    </div>
                    <div class="inputtwelve-checkbox">
                        <p>（T-20190001）华为健身</p>
                        <img src="./image/checkset_btn.png" alt="">
                    </div>
                </div>
                <div class="inputtwelve-zhankai" id="zhankai-show">
                    <p>展开</p>
                    <img src="./image/pulldown_btn.png" alt="">
                </div>
                <div class="inputtwelve-zhankai" id="zhankai-hide" style="display:none">
                    <p>关闭</p>
                    <img src="./image/pullup_btn.png" alt="">
                </div>
            </div>
        </div>

        <div class="add-course-footer">
            <p>保存</p>
            <p>返回</p>
        </div>
    </div> -->
</body>
<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>
<script type="text/javascript">

    window.onload = function () {
        new course_manage().init();
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
            this.select_option()
            this.time()
            this.input_all4()
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

        select_option() {
            selectMenu(0);
            selectMenu(1);
            function selectMenu(index) {
                $(".select-menu-input").eq(index).val($(".select-this").eq(index).html());//在输入框中自动填充第一个选项的值
                $(".select-menu-div").eq(index).on("click", function (e) {
                    e.stopPropagation();
                    if ($(".select-menu-ul").eq(index).css("display") === "block") {
                        $(".select-menu-ul").eq(index).hide();
                        $(".select-menu-div").eq(index).find("i").removeClass("select-menu-i");
                        $(".select-menu-ul").eq(index).animate({ marginTop: "0", opacity: "0" }, "fast");
                    } else {
                        $(".select-menu-ul").eq(index).show();
                        $(".select-menu-div").eq(index).find("i").addClass("select-menu-i");
                        $(".select-menu-ul").eq(index).animate({ marginTop: "5px", opacity: "1" }, "fast");
                    }
                    for (var i = 0; i < $(".select-menu-ul").length; i++) {
                        if (i !== index && $(".select-menu-ul").eq(i).css("display") === "block") {
                            $(".select-menu-ul").eq(i).hide();
                            $(".select-menu-div").eq(i).find("i").removeClass("select-menu-i");
                            $(".select-menu-ul").eq(i).animate({ marginTop: "0", opacity: "0" }, "fast");
                        }
                    }
                });
                $(".select-menu-ul").eq(index).on("click", "li", function () {//给下拉选项绑定点击事件
                    $(".select-menu-input").eq(index).val($(this).html());//把被点击的选项的值填入输入框中
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
                        $(".select-menu-ul").eq(index).animate({ marginTop: "0", opacity: "0" }, "fast");

                    }

                });

            }
        }

        table_all() {
            var list = [];
            var listclassifyName0 = [];
            var smd2input;
            var str;
            var str2;
            var that = this
            // data: JSON.stringify(data),
            // var data={
            //     page:1,
            //     rows:10,
            //     name: "课程名称5"
            // }

            if ($('#select-menu-div2').children('input').val() == "上架") {
                smd2input = 1
            } else if ($('#select-menu-div2').children('input').val() == "下架") {
                smd2input = 2
            }

            var params = {
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
                    //两个str都为下菜单的渲染
                    str = `
                            <li class="select-this">全部</li>
                            `
                    var newArr = [];
                    $.each(list, function (i, item) {
                        if (newArr.indexOf(item.classifyName) == -1) {
                            newArr.push(item.classifyName)
                            str += `
                                <li>` + item.classifyName + `</li>
                                `
                        }
                    })
                    //课程分类下拉菜单渲染
                    that.li_one.html(str)

                    $.each(list, function (i, item) {
                        //如果遍历的分类名和菜单中的对应，添加到新数组中
                        if (item.classifyName == that.li_one.parent().children('.select-menu-div').children('input').val()) {
                            listclassifyName0.push(item)
                        }
                    })
                    //如果菜单显示全部，则list为获取的全部数据
                    //否则list为添加到新数组中的数据
                    if (that.li_one.parent().children('.select-menu-div').children('input').val() == "全部") {
                        list = list
                    } else if (listclassifyName0.length > 0) {
                        list = listclassifyName0
                    }

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
                                            <td width="148" class="`+ item.id + `"><a>编辑</a>|<a class="course-manage-table-tr-up">上架</a></td>
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
                                            <td width="148" class="`+ item.id + `"><a>编辑</a>|<a class="course-manage-table-tr-up">上架</a></td>
                                        </tr>
                                    `
                        }
                    })

                    that.table.html(str2)

                    var str3
                    str3 = `
                                <p>共`+ list.length + `条，每页` + params.rows + `条</p>
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
                            if($('.course-manage-table-tr').eq(i).children().eq(0).children().children().children().is(':visible')){
                                id.push($('.course-manage-table-tr').eq(i).children().eq(6).attr('class'))
                            }
                            //console.log($('.course-manage-table-tr').eq(i).children().eq(0).children().eq(0).children().eq(0).html())
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
                    new computed().init()
                },

                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText)
                }
            })

            $.ajax({
                //     type: 'GET',
                //     url: 'http://test.physicalclub.com/crm/rest/leagueCurriculum/getReleaseLeagueCurriculumListGroupByType',
                //     contentType: "application/json;charset=UTF-8",
                //     success: function (result) {

                //         list = result

                //         $.each(list, function (i, item) {

                //             str = `
                //                 <li class="select-this">全部</li>
                //             `
                //             str += `
                //                 <li>` + item.classifyName + `</li>
                //                 `
                //             that.li_one.html(str)

                //             if (that.li_one.parent().children('.select-menu-div').children('input').val() == "全部") {
                //                 list = list
                //             } 
                //             //等于其他分类名时
                //             else if (item.classifyName == that.li_one.parent().children('.select-menu-div').children('input').val()) {

                //                 $.each(item.children, function (i, item2) {

                //                     if(item2.name == $('#course-manage-flex-input').val()){
                //                         listclassifyName3.push(item2)
                //                     }
                //                 })

                //                 if($('#course-manage-flex-input').val() == ''){
                //                     list = list
                //                 }else if(listclassifyName3.length > 0){
                //                     listclassifyName2.children = listclassifyName3
                //                     listclassifyName.push(listclassifyName2)
                //                     list = listclassifyName
                //                     console.log(list)
                //                 }else{
                //                     list = []
                //                 }

                //             }

                //         })

                //         //console.log(that.li_one.parent().children('.select-menu-div').children('input').val())

                //         str2 = `
                //             <table border="0" cellspacing="0" cellpadding="0">
                //             <tr>
                //                 <th width="48"></th>
                //                 <th width="288">课程分类</th>
                //                 <th width="288">课程名称</th>
                //                 <th width="288"><div class="headingsifting">课程价格<div class="headingsifting-column"><img src="../images/simage/headingsifting_up.png"><img src="../images/simage/headingsifting_down.png"></div></div></th>
                //                 <th width="288"><div class="headingsifting">创建时间<div class="headingsifting-column"><img src="../images/simage/headingsifting_up.png"><img src="../images/simage/headingsifting_down.png"></div></div></th>
                //                 <th width="288">状态</th>
                //                 <th width="148">操作</th>
                //             </tr>
                //         `

                //         $.each(list, function (i, item) {
                //             //console.log(item)

                //             $.each(item.children, function (i, item1) {
                //                 //console.log(item1)
                //                 if (item1.state == 1) {
                //                     str2 += `
                //                                 <tr class="course-manage-table-tr">
                //                                     <td width="48"><div style="display:flex;justify-content: center;"><div class="course-manage-table-checkbox"><img style="display:none" src="../images/simage/codeallset_btn.png"></div></div></td>
                //                                     <td width="288">`+ item1.classifyName + `</td>
                //                                     <td width="288">`+ item1.name + `</td>
                //                                     <td width="288">`+ item1.price + `</td>
                //                                     <td width="288">`+ item1.createDate + `</td>
                //                                     <td width="288">上架</td>
                //                                     <td width="148"><a>编辑</a>|<a></a>上架</td>
                //                                 </tr>
                //                             `
                //                 }

                //                 if (item1.state == 2) {
                //                     str2 += `
                //                                 <tr class="course-manage-table-tr">
                //                                     <td width="48"><div style="display:flex;justify-content: center;"><div class="course-manage-table-checkbox"><img style="display:none" src="../images/simage/codeallset_btn.png"></div></div></td>
                //                                     <td width="288">`+ item.classifyName + `</td>
                //                                     <td width="288">`+ item1.name + `</td>
                //                                     <td width="288">`+ item1.price + `</td>
                //                                     <td width="288">`+ item1.createDate + `</td>
                //                                     <td width="288">下架</td>
                //                                     <td width="148"><a>编辑</a>|<a></a>上架</td>
                //                                 </tr>
                //                             `
                //                 }
                //             })

                //         })
                //         that.table.html(str2)
                //         that.li_one.one("click", function () {
                //             that.table_all()
                //         })
                //         $('#course-manage-flextwo-search').one("click", function (){
                //             that.table_all()
                //         })
                //     },

                //     error: function (e) {
                //         console.log(e.status);
                //         console.log(e.responseText)
                //     }
            })
        }

        input_all4() {
            var obj = {
                wrapid: 'ywyboxpage', //页面显示分页器容器id
                total: 15, //总条数
                pagesize: 15, //每页显示10条
                currentPage: 2, //当前页
                onPagechange: 2,
                //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
            }
            pagination.init(obj);

            //console.log(window.location.href)
        }
    }

    class computed {
        constructor() {
            this.checkbox = $(".course-manage-table-checkbox")
            this.checkbox1 = $("#course-manage-table-checkbox")
        }
        init() {
            this.checkbox_click()
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
    }

</script>

</html>