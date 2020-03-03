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
    <link rel="stylesheet" href="easyui/zyUpload.css" type="text/css">
    <!-- 引用核心层插件 -->
    <script type="text/javascript" src="easyui/zyFile.js"></script>

    <!-- 引用控制层插件 -->
    <script type="text/javascript" src="easyui/zyUpload.js"></script>

    <!-- 引用初始化JS -->
    <script type="text/javascript" src="easyui/jq22.js"></script>
    <style>

        html{
            font-size:calc(100vw / 88.11);
        }

        * {
            margin: 0;
            padding: 0;
        }
        
        .course-manage-body {
            /* padding: 20px 20px 0 20px; */
        }

        .course-manage-button {
            width: 6rem;
            height: 1.5rem;
            background: #71B2EF;
            color: white;
            font-size: 1rem;
            text-align: center;
            line-height: 1.5rem;
            cursor: pointer;
            border-radius: 0.2rem;
        }

        .course-manage-flex {
            display: flex;
            margin-top: 0.05rem;
            align-items: center;
        }

        .course-manage-flex #course-manage-flex-input {
            width: 10rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            margin-left: 1rem;
            margin-right: 2rem;
            box-sizing: border-box;
            border: 0.05rem solid #BFBFBF
        }

        .course-manage-flextwo {
            display: flex;
            margin-top: 1rem;
        }

        .course-manage-flextwo #course-manage-flextwo-search {
            width: 4rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            background: #71B2EF;
            text-align: center;
            line-height: 1.5rem;
            color: white;
            font-size: 0.8rem
        }

        .course-manage-flextwo #course-manage-flextwo-clear {
            width: 4rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            border: 0.05rem solid #BFBFBF;
            box-sizing: border-box;
            text-align: center;
            line-height: 1.5rem;
            color: black;
            margin-left: 0.65rem;
            font-size: 0.8rem
        }

        .select-menu {
            margin-left: 1rem;
            margin-right: 2rem;
            cursor: pointer;
            width: 6rem;
            height: 1.5rem;
            box-sizing: border-box;
        }

        .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 6rem;
            text-align: left;
            border: 0.05rem solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .select-menu-ul li {
            height: 1.6rem;
            font-size: 0.7rem;
            padding: 0 0.75rem;
            box-sizing: border-box;
            line-height: 1.6rem;
        }

        .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .select-menu-div {
            position: relative;
            height: 1.5rem;
            width: 6rem;
            border: 0.05rem solid #ddd;
            border-radius: 0.2rem;
            box-sizing: border-box;
            line-height: 1.5rem;
        }

        .select-this {
            background: #71B2EF;
        }

        .select-this:hover {
            background: #71B2EF !important;
        }

        .select-menu-img {
            width: 0.6rem;
            height: 0.45rem;
            margin-right: 0.5rem;
            position: absolute;
            right: 0;
            top: 0.5rem;
        }

        .select-menu-input {
            padding-left: 0.7rem;
            border: 0;
            width: 3rem;
            height: 1.2rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem
        }

        .course-manage-flex-input-one {
            width: 6rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            margin-left: 1.05rem;
            margin-right: 0.35rem;
            padding: 0.4rem 0 0.35rem 0.5rem;
            box-sizing: border-box;
            font-size: 0.6rem;
            border: 0.05rem solid #BFBFBF
        }

        .course-manage-flex-input-two {
            width: 6rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            margin-left: 0.35rem;
            margin-right: 1.9rem;
            padding: 0.4rem 0 0.35rem 0.5rem;
            box-sizing: border-box;
            font-size: 0.6rem;
            border: 0.05rem solid #BFBFBF
        }

        .course-manage-flex-input-three {
            width: 4rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            margin-left: 1.05rem;
            margin-right: 0.3rem;
            box-sizing: border-box;
            border: 0.05rem solid #BFBFBF
        }

        .course-manage-flex-input-four {
            width: 4rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            margin-left: 0.3rem;
            box-sizing: border-box;
            border: 0.05rem solid #BFBFBF
        }

        .course-manage-table {
            margin-top: 0.9rem;
            font-size: 0.6rem;
        }

        .course-manage-table table tr:nth-child(2) td {
            border-top: none
        }

        .course-manage-table table td {
            border-left: 0.05rem dashed #CCCCCC;
            border-bottom: 0.05rem dashed #CCCCCC;
            height: 2rem;
            text-align: center;
            font-size: 0.7rem;
        }

        .course-manage-table table td:last-child {
            border-right: 0.05rem dashed #CCCCCC;
            text-align: center;
        }

        .course-manage-table table th {
            background: #CCCCCC;
            text-align: center;
            height: 2rem;
            font-size: 0.7rem;
        }

        .course-manage-table .course-manage-table-tr td:last-child {
            cursor: pointer;
            color: #71B2EF;
        }

        .course-manage-table .course-manage-table-tr td:last-child a:nth-child(1) {
            margin-right: 0.25rem;
        }

        .course-manage-table .course-manage-table-tr td:last-child a:nth-child(2) {
            margin-left: 0.25rem;
        }

        .course-manage-table .course-manage-table-checkbox {
            width: 0.8rem;
            height: 0.8rem;
            box-sizing: border-box;
            border: 0.05rem solid #BFBFBF;
        }

        .course-manage-table .course-manage-table-checkbox img {
            width: 0.8rem;
            height: 0.8rem;
            margin-left: -0.05rem;
            margin-top: -0.05rem;
        }

        .course-manage-table .headingsifting {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .course-manage-table .headingsifting .headingsifting-column {
            display: flex;
            flex-direction: column;
            margin-left: 0.3rem;
        }

        .course-manage-table .headingsifting .headingsifting-column img:nth-child(2) {
            margin-top: 0.05rem
        }

        .course-manage-footer {
            display: flex;
            margin-top: 0.85rem;
            height: 1.3rem;
            display: flex;
            align-items: center;
            padding-left: 0.7rem;
        }

        .course-manage-table-checkbox {
            width: 0.8rem;
            height: 0.8rem;
            box-sizing: border-box;
            border: 0.05rem solid #BFBFBF;
            line-height: 0.7rem;
        }

        .course-manage-table-checkbox img {
            width: 0.8rem;
            height: 0.8rem;
            margin-top: -0.05rem;
            margin-left: -0.05rem;
        }

        #course-manage-table-checkbox {
            width: 0.8rem;
            height: 0.8rem;
            box-sizing: border-box;
            border: 0.05rem solid #BFBFBF;
            line-height: 0.7rem;
        }

        #course-manage-table-checkbox img {
            width: 0.8rem;
            height: 0.8rem;
            margin-top: -0.05rem;
            margin-left: -0.05rem;
        }

        .course-manage-footer .course-manage-footer-pone {
            font-size: 0.7rem;
            margin-left: 0.4rem;
        }

        .course-manage-footer .course-manage-footer-ptwo {
            width: 4.5rem;
            height: 1.5rem;
            border: 0.05rem solid #BFBFBF;
            margin-left: 0.45rem;
            font-size: 0.7rem;
            color: #444444;
            text-align: center;
            line-height: 1.5rem;
            border-radius: 0.1rem;
        }

        .course-manage-footer .course-manage-footer-pthree {
            font-size: 0.8rem;
            margin-left: 50.65rem;
        }

        .c-datepicker-date-editor {
            border: 0.05rem solid #CCCCCC;
            position: relative;
            top: -1.2rem;
            width: 11rem;
            height: 1.8rem;
            cursor: pointer;
        }

        .c-datepicker-data-input.only-date {
            width: 100%;
            font-size: 0.9rem;
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
            font-size: 0.8rem;
            color: #71B2EF
        }

        .add-course-body .add-course-body-line {
            height: 0.05rem;
            background: #BFBFBF;
            margin-top: 1rem
        }

        .add-course-body .add-course-body-ptwo {
            font-size: 0.9rem;
            color: #444444;
            margin-left: 0.65rem;
            margin-top: 1rem;
        }

        .add-course-sortone .add-course-sortone-select .select-menu {
            margin-left: 0.5rem;
            margin-right: 2rem;
            cursor: pointer;
            width: 12rem;
            height: 1.6rem;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 12rem;
            text-align: left;
            border: 0.05rem solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-ul li {
            height: 1.6rem;
            font-size: 0.8rem;
            padding: 0 0.75rem;
            box-sizing: border-box;
            line-height: 1.6rem;
            width: 12rem;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-div {
            position: relative;
            height: 1.6rem;
            width: 12rem;
            border: 0.05rem solid #ddd;
            border-radius: 0.2rem;
            box-sizing: border-box;
            line-height: 1.6rem;
        }

        .add-course-sortone .add-course-sortone-select .select-this {
            background: #71B2EF;
        }

        .add-course-sortone .add-course-sortone-select .select-this:hover {
            background: #71B2EF !important;
        }

        .add-course-sortone .add-course-sortone-select .select-menu-img {
            width: 0.6rem;
            height: 0.45rem;
            margin-right: 0.5rem;
            position: absolute;
            right: 0;
            top: 0.5rem;
            color: #CCCCCC
        }

        .add-course-sortone .add-course-sortone-select .select-menu-input {
            padding-left: 0.7rem;
            border: 0;
            width: 4rem;
            height: 1.2rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.8rem;
            line-height: 1.2rem;
        }

        .add-course-sortone {
            display: flex;
            margin-top: 1.2rem;
            align-items: center;
        }

        .add-course-sortone .add-course-sortone-select {
            margin-left: 3.8rem
        }

        .add-course-sortone .add-course-sortone-inputone {
            width: 19rem;
            height: 1.6rem;
            box-sizing: border-box;
            margin-left: 4.3rem;
            padding-left: 0.85rem;
            font-size: 0.7rem;
            border: 0.05rem solid #CCCCCC;
            line-height: 1.4rem;
            border-radius: 0.2rem;
            display: flex;
            justify-content: space-between;
            font-size: 0.8rem
        }

        .add-course-sortone .add-course-sortone-inputone input {
            border: none;
            outline: none;
            -webkit-appearance: none;
        }

        .add-course-sortone .add-course-sortone-inputone p {
            margin-right: 0.45rem;
        }

        .add-course-sortone .add-course-sortone-inputtwo {
            display: flex;
            width: 6rem;
            height: 1.6rem;
            border: 0.05rem solid #CCCCCC;
            margin-left: 3.55rem;
            border-radius: 0.2rem;
        }

        .add-course-sortone .add-course-sortone-inputtwo p {
            width: 0.9rem;
            height: 1.6rem;
            background: #CCCCCC;
            line-height: 1.6rem;
            text-align: center;
        }

        .add-course-sortone .add-course-sortone-inputtwo input {
            border: none;
            outline: none;
            -webkit-appearance: none;
            width: 4.4rem;
            padding-left: 0.25rem;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputthree {
            display: flex;
            align-items: center;
        }

        .add-course-sortone .add-course-sortone-inputthree-p {
            width: 4rem;
            height: 1.6rem;
            border: 0.05rem solid #71B2EF;
            border-radius: 0.15rem;
            text-align: center;
            line-height: 1.6rem;
            font-size: 0.7rem;
            margin-left: 0.9rem;
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
            margin-top: 1.55rem;
        }

        .add-course-sorttwo .add-course-sortone-inputfour textarea {
            width: 34rem;
            height: 8rem;
            border: 0.05rem solid #CCCCCC;
            border-radius: 0.15rem;
            margin-left: 4.5rem;
            resize: none;
            font-size: 0.7rem;
            box-sizing: border-box;
            padding: 0.5rem 0 0 1rem;
        }

        .add-course-sorttwo .add-course-sortone-inputfour .add-course-sortone-inputfour-position {
            margin-left: 35.5rem;
            margin-top: -1.25rem;
            font-size: 0.7rem
        }

        .add-course-sortone .rating li {
            list-style: none;
        }

        .add-course-sortone .rating {
            width: 15rem;
            height: 1.3rem;
            margin-left: 3.65rem;
        }

        .add-course-sortone .rating .rating-item {
            float: left;
            width: 1.4rem;
            height: 1.35rem;
            background: url(./image/star_set.png) no-repeat center center;
            background-size: 1.25rem 1.2rem;
            background-position: 0 -2.9rem;
            overflow: hidden;
            margin-left: 0.65rem;
        }

        .add-course-sortone .rating .rating-item img {
            width: 1.4rem;
            height: 1.35rem
        }

        .add-course-sortone .add-course-sortone-inputfive {
            width: 6rem;
            height: 1.6rem;
            border: 0.05rem solid #CCCCCC;
            border-radius: 0.15rem;
            margin-left: 3.6rem;
            display: flex;
            align-items: center;
            font-size: 0.8rem
        }

        .add-course-sortone .add-course-sortone-inputfive input {
            border: none;
            outline: none;
            width: 4rem;
            box-sizing: border-box;
            padding-left: 1rem
        }

        .add-course-sortone .add-course-sortone-inputsix {
            width: 19rem;
            height: 1.6rem;
            border: 0.05rem solid #CCCCCC;
            padding-left: 0.9rem;
            margin-left: 4.3rem;
            line-height: 1.6rem;
            border-radius: 0.15rem;
        }

        .add-course-sortone .add-course-sortone-inputsix input {
            border: none;
            outline: none;
            width: 15.8rem;
            font-size: 0.7rem
        }

        .add-course-sortone .add-course-sortone-inputseven {
            margin-left: 2.7rem;
            display: flex;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput {
            width: 6rem;
            height: 1.6rem;
            border: 0.05rem solid #CCCCCC;
            margin-left: 0.9rem;
            border-radius: 0.15rem;
            display: flex;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .input {
            width: 3.15rem;
            border: none;
            outline: none;
            text-align: center;
        }



        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone {
            width: 2.75rem;
            height: 1.6rem;
            border-right: 0.05rem solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu {
            cursor: pointer;
            width: 2.75rem;
            height: 1.6rem;
            box-sizing: border-box;
            line-height: 1.4rem;
            border-right: 0.05rem solid #CCCCCC;
            margin: 0;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 2.75rem;
            text-align: left;
            border: 0.05rem solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-ul li {
            height: 1.6rem;
            font-size: 0.7rem;
            box-sizing: border-box;
            line-height: 1.6rem;
            width: 2.75rem;
            text-align: left;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-div {
            position: relative;
            height: 1.6rem;
            border-radius: 0.2rem;
            box-sizing: border-box;
            width: 2.75rem;
            line-height: 1.6rem;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-this {
            background: #71B2EF;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-this:hover {
            background: #71B2EF !important;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-img {
            width: 0.6rem;
            height: 0.45rem;
            position: absolute;
            right: 0;
            top: 0.5rem;
            color: #CCCCCC;
            margin: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone .select-menu-input {
            border: 0;
            width: 2.75rem;
            height: 0.6rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem;
            padding: 0;
            line-height: 1.55rem;
            outline: none;
            margin-top: -0.1rem;
            margin-left: -0.05rem
        }



        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo {
            width: 2.75rem;
            height: 1.6rem;
            border-right: 0.05rem solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu {
            cursor: pointer;
            width: 2.75rem;
            height: 1.6rem;
            box-sizing: border-box;
            line-height: 1.4rem;
            border-right: 0.05rem solid #CCCCCC;
            margin: 0;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 2.75rem;
            text-align: left;
            border: 0.05rem solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-ul li {
            height: 1.6rem;
            font-size: 0.7rem;
            box-sizing: border-box;
            line-height: 1.6rem;
            width: 2.75rem;
            text-align: left;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-div {
            position: relative;
            height: 1.6rem;
            border-radius: 0.2rem;
            box-sizing: border-box;
            width: 2.75rem;
            line-height: 1.6rem;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-this {
            background: #71B2EF;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-this:hover {
            background: #71B2EF !important;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-img {
            width: 0.6rem;
            height: 0.4rem;
            position: absolute;
            right: 0;
            top: 0.5rem;
            color: #CCCCCC;
            margin: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selecttwo .select-menu-input {
            border: 0;
            width: 2.75rem;
            height: 1.6rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem;
            padding: 0;
            line-height: 1.55rem;
            outline: none;
            margin-top: -0.1rem;
            margin-left: -0.05rem
        }



        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree {
            width: 2.75rem;
            height: 1.6rem;
            border-right: 0.05rem solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu {
            cursor: pointer;
            width: 2.75rem;
            height: 1.6rem;
            box-sizing: border-box;
            line-height: 1.4rem;
            border-right: 0.05rem solid #CCCCCC;
            margin: 0;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 2.75rem;
            text-align: left;
            border: 0.05rem solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-ul li {
            height: 1.6rem;
            font-size: 0.7rem;
            box-sizing: border-box;
            line-height: 1.6rem;
            width: 2.75rem;
            text-align: left;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-div {
            position: relative;
            height: 1.6rem;
            border-radius: 0.2rem;
            box-sizing: border-box;
            width: 2.75rem;
            line-height: 1.6rem;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-this {
            background: #71B2EF;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-this:hover {
            background: #71B2EF !important;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-img {
            width: 0.6rem;
            height: 0.45rem;
            position: absolute;
            right: 0;
            top: 0.5rem;
            color: #CCCCCC;
            margin: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectthree .select-menu-input {
            border: 0;
            width: 2.75rem;
            height: 1.6rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem;
            padding: 0;
            line-height: 1.55rem;
            outline: none;
            margin-top: -0.1rem;
            margin-left: -0.05rem
        }



        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour {
            width: 2.75rem;
            height: 1.6rem;
            border-right: 0.05rem solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu {
            cursor: pointer;
            width: 2.75rem;
            height: 1.6rem;
            box-sizing: border-box;
            line-height: 1.4rem;
            border-right: 0.05rem solid #CCCCCC;
            margin: 0;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 2.75rem;
            text-align: left;
            border: 0.05rem solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-ul li {
            height: 1.6rem;
            font-size: 0.7rem;
            box-sizing: border-box;
            line-height: 1.6rem;
            width: 2.75rem;
            text-align: left;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-div {
            position: relative;
            height: 1.6rem;
            border-radius: 0.2rem;
            box-sizing: border-box;
            width: 2.75rem;
            line-height: 1.6rem;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-this {
            background: #71B2EF;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-this:hover {
            background: #71B2EF !important;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-img {
            width: 0.6rem;
            height: 0.45rem;
            position: absolute;
            right: 0;
            top: 0.5rem;
            color: #CCCCCC;
            margin: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfour .select-menu-input {
            border: 0;
            width: 2.75rem;
            height: 1.6rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem;
            padding: 0;
            line-height: 1.55rem;
            outline: none;
            margin-top: -0.1rem;
            margin-left: -0.05rem
        }



        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive {
            width: 2.75rem;
            height: 1.6rem;
            border-right: 0.05rem solid #CCCCCC
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu {
            cursor: pointer;
            width: 2.75rem;
            height: 1.6rem;
            box-sizing: border-box;
            line-height: 1.4rem;
            border-right: 0.05rem solid #CCCCCC;
            margin: 0;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 2.75rem;
            text-align: left;
            border: 0.05rem solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-ul li {
            height: 1.6rem;
            font-size: 0.7rem;
            box-sizing: border-box;
            line-height: 1.6rem;
            width: 2.75rem;
            text-align: left;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-div {
            position: relative;
            height: 1.6rem;
            border-radius: 0.2rem;
            box-sizing: border-box;
            width: 2.75rem;
            line-height: 1.6rem;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-this {
            background: #71B2EF;
            padding: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-this:hover {
            background: #71B2EF !important;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-img {
            width: 0.6rem;
            height: 0.4rem;
            position: absolute;
            right: 0;
            top: 0.5rem;
            color: #CCCCCC;
            margin: 0
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectfive .select-menu-input {
            border: 0;
            width: 2.75rem;
            height: 1.6rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem;
            padding: 0;
            line-height: 1.55rem;
            outline: none;
            margin-top: -0.1rem;
            margin-left: -0.05rem
        }



        .add-course-sorttwo .add-course-sortone-inputeight {
            margin-left: 6rem;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table {
            width: 34rem;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr:nth-child(1) {
            height: 2rem;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table th {
            border: 0.05rem solid #CCCCCC;
            border-left: none;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr:nth-child(1) th:nth-child(1) {
            border-left: 0.05rem solid #CCCCCC;
            width: 12rem
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td {
            border: 0.05rem solid #CCCCCC;
            border-top: none;
            border-left: none;
            padding: 0.375rem 0.375rem 0.275rem 0.375rem;
            box-sizing: border-box;
            height: 5rem
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(1) {
            border-left: 0.05rem solid #CCCCCC;
            width: 12rem;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(1) textarea {
            width: 11rem;
            height: 4rem;
            border: 0.05rem solid #CCCCCC;
            resize: none;
            box-sizing: border-box;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(2) textarea {
            width: 17rem;
            height: 4rem;
            border: 0.05rem solid #CCCCCC;
            resize: none;
            box-sizing: border-box;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(3) {
            padding: 0 0.75rem;
            display: flex;
            height: 5rem;
            align-items: center;
        }

        .add-course-sorttwo .add-course-sortone-inputeight table tr td:nth-child(3) img {
            width: 1rem;
            height: 1rem
        }

        .add-course-sortone .add-course-sortone-inputnine {
            margin-left: 4.5rem;
            display: flex;
            align-items: center;
        }

        .add-course-sortone .add-course-sortone-inputnine div {
            width: 6rem;
            height: 1.6rem;
            background: #71B2EF;
            font-size: 0.7rem;
            color: white;
            text-align: center;
            line-height: 1.6rem;
        }

        .add-course-sortone .add-course-sortone-inputnine p {
            margin-left: 0.95rem;
            font-size: 0.7rem
        }

        .add-course-sorttwo #demo {
            margin: 0;
            height: 9.1rem;
        }

        .add-course-sorttwo #preview .upload_preview {
            border: none;
            margin: 0;
            flex: 1;
            width: 40rem;
            height: 16rem
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
            width: 10.5rem;
            height: 8rem
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
            margin-left: 2.9rem
        }



        .add-course-sortone .add-course-sortone-inputten {
            display: flex;
            margin-left: 2.5rem
        }

        .add-course-sortone .add-course-sortone-inputten .inputten-paypay {
            display: flex;
        }

        .add-course-sortone .add-course-sortone-inputten .inputten-paypay .paypay {
            width: 1.2rem;
            height: 1.2rem;
            margin-left: 2.2rem;
            margin-right: 0.9rem
        }

        .add-course-sortone .add-course-sortone-inputten .inputten-paypay .paypay .paypay-show {
            width: 1.05rem;
            height: 1.05rem
        }

        .add-course-sortone .add-course-sortone-inputten .inputten-paypay .paypay .paypay-hidden {
            width: 1.05rem;
            height: 1.05rem;
            display: none;
        }



        .add-course-sortone .add-course-sortone-inputeleven {
            /* margin-top: 14px */
            display:flex
        }

        .add-course-sortone .add-course-sortone-inputeleven input:nth-child(1) {
            width: 12rem;
            height: 1.6rem;
            font-size: 0.7rem;
            line-height: 1.6rem;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputeleven input:nth-child(2) {
            width: 20.5rem;
            height: 1.6rem;
            box-sizing: border-box;
        }

        .add-course-sortthree {
            display: flex;
            margin-top: 0.5rem;
            height: 6rem
        }

        .add-course-sortthree .add-course-sortone-inputtwelve {
            margin-top: 0.7rem;
            height: 6rem
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-flex {
            display: flex;
            width: 34.8rem;
            height: 4.5rem;
            flex-wrap: wrap;
            overflow: hidden;
            margin-left: 0.2rem
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-checkbox {
            width: 10.5rem;
            height: 1.6rem;
            border: 0.05rem solid #CCCCCC;
            font-size: 0.6rem;
            text-align: center;
            line-height: 1.6rem;
            position: relative;
            cursor: pointer;
            margin-left: 1rem;
            border-radius: 0.15rem;
            margin-bottom: 0.9rem
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-checkbox img {
            position: absolute;
            left: 9.5rem;
            top: 0.7rem;
            display: none
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-zhankai {
            display: flex;
            align-items: center;
            margin-left: 32.5rem
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-zhankai p {
            font-size: 0.7rem;
            color: #71B2EF
        }

        .add-course-sortthree .add-course-sortone-inputtwelve .inputtwelve-zhankai img {
            width: 0.65rem;
            height: 0.35rem;
            margin-left: 0.2rem
        }

        .add-course-check {
            display: flex;
            align-items: center;
            margin-left: 37.6rem;
            margin-top: 0.75rem
        }

        .add-course-check p {
            color: #71B2EF;
            font-size: 0.7rem;
            margin-left: 0.4rem
        }

        .add-course-check .add-course-checkboxall {
            width: 0.8rem;
            height: 0.8rem;
            box-sizing: border-box;
            border: 0.05rem solid #BFBFBF;
            line-height: 0.7rem;
        }

        .add-course-check .add-course-checkboxall img {
            width: 0.8rem;
            height: 0.8rem;
            margin-left: -0.05rem;
            margin-top: -0.05rem;
        }

        .add-course-footer {
            display: flex;
            margin-top: 3rem;
            margin-bottom: 1.5rem;
        }

        .add-course-footer p:nth-child(1) {
            width: 5.5rem;
            height: 2rem;
            background: #71B2EF;
            color: white;
            font-size: 0.7rem;
            text-align: center;
            line-height: 2rem;
            border-radius: 0.2rem;
        }

        .add-course-footer p:nth-child(2) {
            width: 5.5rem;
            height: 2rem;
            font-size: 0.7rem;
            text-align: center;
            line-height: 2rem;
            border-radius: 0.2rem;
            border: 0.05rem solid #71B2EF;
            box-sizing: border-box;
            margin-left: 0.75rem
        }

        #GroupCourseGole {
            display: flex
        }
    </style>
</head>

<body>
    <div class="course-manage-body">
        <div class="course-manage-button" id="course-manage-button" style="margin-bottom:1rem">新建课程</div>
        <div class="course-manage-flex">
            <div style="font-size:0.8rem">课程名称</div>
            <input id="course-manage-flex-input" type="text">
            <div style="font-size:0.8rem">课程分类</div>
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
            <div style="font-size:0.8rem">课程状态</div>
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
            <div style="font-size:0.8rem">创建时间</div>
            <div class="J-datepicker-day"> <input type="text" class="course-manage-flex-input-one "
                    id="course-manage-flex-input-one" placeholder="开始时间">
            </div>
            <p>-</p>
            <div class="J-datepicker-day"> <input type="text" class="course-manage-flex-input-two"
                    id="course-manage-flex-input-two" placeholder="结束时间">
            </div>
            <div style="font-size:0.8rem">价格区间</div>
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
            <div class="box" id="boxpage" style="margin-left:1.5rem;margin-top:0"></div>
        </div>

        
    </div>

    <div class="add-course-body" style="display:none">
        <p class="add-course-body-pone" id="add-course-body-pone">返回上一级</p>
        <div class="add-course-body-line"></div>
        <p class="add-course-body-ptwo">基本信息</p>
        <div class="add-course-body-line"></div>
        <div class="add-course-sortone">
            <p style="font-size:0.8rem">课程类型</p>
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
            <p style="font-size:0.8rem">上课方式</p>
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
            <p style="font-size:0.8rem">课程名称</p>
            <div class="add-course-sortone-inputone">
                <input type="text" value="BODYBLANCE" id="area2">
                <p><span id="text-count2">0</span>/22</p>
            </div>
        </div>
        <div class="add-course-sortone">
            <p style="font-size:0.8rem">课程标准价</p>
            <div class="add-course-sortone-inputtwo">
                <p>￥</p>
                <input type="text" id="kcbzj">
            </div>
        </div>
        <div class="add-course-sortone">
            <p style="font-size:0.8rem;margin-right:3.5rem">课程目标</p>
            <div class="add-course-sortone-inputthree">
                <div id="GroupCourseGole"></div>
                <div style="font-size:0.6rem;color:#444444;margin-left:0.7rem">(可多选)</div>
            </div>
        </div>
        <div class="add-course-sorttwo">
            <p style="font-size:0.8rem">课程简介</p>
            <div class="add-course-sortone-inputfour">
                <textarea id="area" cols="30" rows="10" placeholder="请输入本节课简介"></textarea>
                <p class="add-course-sortone-inputfour-position"><span id="text-count">0</span>/300</p>
            </div>
        </div>

        <p style="font-size:0.9rem;font-weight:bold;margin-top:2.65rem">课程详情</p>
        <div class="add-course-body-line"></div>

        <div class="add-course-sortone">
            <p style="font-size:0.8rem">课程难度</p>
            <ul class="rating" id="rating">
                <li class="rating-item" title="很不好"><img src="/image/star_nor.png" alt=""></li>
                <li class="rating-item" title="不好"><img src="/image/star_nor.png" alt=""></li>
                <li class="rating-item" title="一般"><img src="/image/star_nor.png" alt=""></li>
                <li class="rating-item" title="好"><img src="/image/star_nor.png" alt=""></li>
                <li class="rating-item" title="很好"><img src="/image/star_nor.png" alt=""></li>
            </ul>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:0.8rem">卡路里消耗</p>
            <div class="add-course-sortone-inputfive">
                <input type="text" id="kllxh">
                <p>cal</p>
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:0.8rem">适用人群</p>
            <div class="add-course-sortone-inputsix">
                <input type="text" value="通用" id="shrq">
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:0.8rem">课程雷达图</p>
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
                <div class="oneinput">
                    <div class="add-course-sortone-selectfive">
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
            <p style="font-size:0.8rem">注意事项</p>
            <div class="add-course-sortone-inputfour">
                <textarea id="area1" cols="30" rows="10"></textarea>
                <p class="add-course-sortone-inputfour-position"><span id="text-count1">0</span>/300</p>
            </div>
        </div>

        <div class="add-course-sorttwo">
            <p style="font-size:0.8rem">FAQ</p>
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
                        <td><img id="addOneRow" style="margin-right:0.3rem" src="/image/add_btn.png" alt="">
                            <img id="delOneRow" src="/image/del_btn.png" alt="">
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:0.8rem">课程视频</p>
            <div class="add-course-sortone-inputnine">
                <div id="scsp">上传视频</div>
                <p>最多上传1个视频，单个视频不超过20M，视频作品将会展示在团课详情首位</p>
            </div>
            <div>
                <input id="photoFile" style="display:none" type="file" onchange="upload()">
            </div>
        </div>

        <div id="videoshow" style="margin-left:7.6rem;margin-top:1.25rem;display:none;">
            <div style="display:flex;align-items:center;">
                <img style="width:1.6rem;height:1.6rem;" src="image/playit_icon.png" alt="">
                <p id="videovideo" style="font-size:0.7rem;margin-left:0.4rem;"></p>
                <p style="font-size:0.7rem;margin-left:5rem">上传成功</p>
                <div style="margin-left:1rem;width:12rem;height:0.4rem;border-radius: 0.2rem;background:#71B2EF"></div>
                <img id="videohide" style="margin-left:1rem" src="image/palyitdel_btn.png" alt="">
            </div>
            
        </div>

        <div class="add-course-sorttwo">
            <p style="font-size:0.8rem;margin-right:4.5rem">课程图片</p>
            <div id="demo" class="demo"></div>
        </div>

        <p style="font-size:0.8rem;font-weight:bold;margin-top:2.65rem">扣课方式及项目关联</p>
        <div class="add-course-body-line"></div>

        <div class="add-course-sortone">
            <p style="font-size:0.8rem">付款方式</p>
            <div class="add-course-sortone-inputten" id="add-course-sortone-inputten">
                <div class="inputten-paypay">
                    <div class="paypay">
                        <img class="paypay-show" src="/image/payment_btn.png" alt="">
                        <img class="paypay-hidden" src="/image/paymentnor_btn.png" alt="">
                    </div>
                    <p style="font-size: 0.7rem;">付现</p>
                </div>
                <div class="inputten-paypay">
                    <div class="paypay">
                        <img class="paypay-show" src="/image/payment_btn.png" alt="">
                        <img class="paypay-hidden" src="/image/paymentnor_btn.png" alt="">
                    </div>
                    <p style="font-size: 0.7rem;">会员卡扣</p>
                </div>
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:0.8rem">课程对应编码</p>
            <div class="add-course-sortone-inputeleven">
                <div style="width:12rem;height:1.6rem;border:0.05rem solid #CCCCCC;margin-left:3.1rem">
                    <input placeholder="请输入课程对应广信编码" type="text" id="gxbm" style="border:none">
                </div>
                <div style="width:20.5rem;height:1.6rem;border:0.05rem solid #CCCCCC;margin-left:1rem">
                    <input type="text" id="gxmc" style="border:none">
                </div>
                
            </div>
        </div>

        <div class="add-course-check">
            <div class="add-course-checkboxall">
                <img style="display:none" src="/image/codeallset_btn.png" alt="">
            </div>
            <p>取消全选</p>
        </div>

        <div class="add-course-sortthree">
            <p style="font-size:0.8rem;margin-right:0.4rem">会员卡口对应编码</p>
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

    // window.addEventListener('load', adaptation);
    //     window.addEventListener('resize', adaptation);
    //     function adaptation() {
    //         var w = document.body.clientWidth;
    //         var h = document.body.clientHeight;
    //         var nw = 1920;
    //         nh = 1080;
    //         var left, top, scale;
    //         if (w / h > nw / nh) {
    //             scale = h / nh;
    //             top = 0;
    //             left = (w - nw * scale) / 2;
    //         } else {
    //             scale = w / nw;
    //             left = 0;
    //             top = (h - nh * scale) / 2;
    //         }
    //         document.getElementById('main').setAttribute('style', 'transform: scale(' + scale + ');left:' + left + 'px;top:' + top + 'px;');
    //     }

    function imageimage(){
        if ($("#fileImage").val() == '') {
            return;
        }

        let file = $("#fileImage").val()
        let filename = file.substr(file.lastIndexOf("."));
        if(filename != '.png' && filename != '.jpeg' && filename != '.jpg'){
             alert("请上传图片格式的文件");
             return;
        }

        var formData = new FormData();
        // for (var i = 0; i < $('#preview1').children().length; i++) {
        formData.append('file', document.getElementById('fileImage').files[0])
        // }
        formData.append('fileType', 1);
        $.ajax({
            url: "rest/leagueCurriculum/uploadLeagueCurriculumFile",
            type: "post",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data)
                //var img = data
                //return data
                alert(data.message)
                $('#demo').addClass(data.rows[0].path)
                $('#preview1').children('div:last-child').addClass(data.rows[0].path)
            },
            error: function (data) {
                alert("上传失败")
            }
        });
    }

    function upload() {
            uploadvideo()

            function uploadvideo() {
                if ($("#photoFile").val() == '') {
                    return;
                }

                let file = $("#photoFile").val()
                let filename = file.substr(file.lastIndexOf("."));
                if (filename != '.MP4') {
                    alert("请上传mp4格式的文件");
                    return;
                }

                var formData = new FormData();
                // for (var i = 0; i < $('#preview1').children().length; i++) {
                formData.append('file', document.getElementById('photoFile').files[0]);
                //}
                formData.append('fileType', 2);
                $.ajax({
                    url: "rest/leagueCurriculum/uploadLeagueCurriculumFile",
                    type: "post",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (data) {
                        console.log(data)
                        //var img = data
                        //return data
                        alert(data.message)
                        $('#photoFile').attr('class',data.rows[0].path)
                        $('#videovideo').html('http://test.physicalclub.com/crm/videos/' + data.rows[0].path)

                        $('#videoshow').show()

                        $('#videovideo').click(function(){
                            openVideo('http://test.physicalclub.com/crm/videos/' + data.rows[0].path)
                        })

                        $('#videohide').click(function(){
                            $(this).parent().parent().hide()
                            $('#photoFile').attr('class','')
                        })

                         function openVideo(src) {

                            var page = window.open();

                            var html = "<body style='background:black'><div style = 'width:80%;margin:auto;'><video controls width='100%' autoplay src='"+src+ "'></video> </div></body > "

                            page.document.write(html);

                        }
                    },
                    error: function (data) {
                        alert("上传失败")
                    }
                });
            }
        }

    //支付
        $(".paypay").click(function () {
            $('.paypay').children('.paypay-show').hide()
            $('.paypay').children('.paypay-hidden').show()
            $(this).parent().parent().children().children('.paypay').removeClass('11')
            if ($(this).children('.paypay-hidden').is(":hidden")) {
                $(this).children('.paypay-hidden').show()
                $(this).children('.paypay-show').hide()
            } else {
                $(this).children('.paypay-hidden').hide()
                $(this).children('.paypay-show').show()
                $(this).addClass('11')
            }
        })

    $('#add-course-sortone-inputten').children().children('.paypay').click(function () {
            $(".inputtwelve-checkbox").unbind()
            woyaowoyao()
            console.log(111111111)
        })

    woyaowoyao()

    function woyaowoyao() {
            if ($('#add-course-sortone-inputten').children().eq(0).children('.paypay').hasClass('11')) {
                $(".inputtwelve-checkbox").click(function () {
                    $(".inputtwelve-checkbox").children('img').hide()
                    if ($(this).children('img').is(":hidden")) {
                        $(this).children('img').show()
                        $(".add-course-checkboxall").children('img').hide()
                    } else {
                        $(this).children('img').hide()
                    }
                })
            } else {
                $(".inputtwelve-checkbox").click(function () {
                    if ($(this).children('img').is(":hidden")) {
                        $(this).children('img').show()
                        $(".add-course-checkboxall").children('img').hide()
                    } else {
                        $(this).children('img').hide()
                    }
                })
            }
        }

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
                url: "rest/wx/dictionnary/getdictionnarylist",
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

                var onPagechange = function (page) {
                    console.log(page)
                    aaaaaa(page)
                }
                for (var i = 1; i < $('#select-menu-ul1').children().length; i++) {
                    if ($('#select-menu-ul1').children().eq(i).html() == $('#select-menu-div1').children('input').val()) {
                        var classifyId = $('#select-menu-ul1').children().eq(i).attr('class')
                    }
                }

                var page = 1;
                aaaaaa(page)

                function aaaaaa(page) {
                    if ($('#select-menu-div1').children('input').val() == "全部") {
                        var params = {
                            page: page,
                            rows: 10,
                            //classifyId : "52cad9c690fb42a7b50bd28b146dc08e",
                            name: $('#course-manage-flex-input').val(),
                            state: smd2input,
                            minCreateDate: $('#course-manage-flex-input-one').val(),
                            maxCreateDate: $('#course-manage-flex-input-two').val(),
                            minPrice: $('#course-manage-flex-input-three').val(),
                            maxPrice: $('#course-manage-flex-input-four').val()
                        }
                    } else {
                        var params = {
                            page: page,
                            rows: 10,
                            classifyId: classifyId,
                            name: $('#course-manage-flex-input').val(),
                            state: smd2input,
                            minCreateDate: $('#course-manage-flex-input-one').val(),
                            maxCreateDate: $('#course-manage-flex-input-two').val(),
                            minPrice: $('#course-manage-flex-input-three').val(),
                            maxPrice: $('#course-manage-flex-input-four').val()
                        }
                    }


                    $.ajax({
                        type: 'POST',
                        url: 'rest/leagueCurriculum/selectLeagueCurriculumList',
                        contentType: "application/json;charset=UTF-8",
                        data: JSON.stringify(params),
                        success: function (result) {
                            var result = result
                            list = result.rows
                            console.log(list)

                            ////////////////////////////////////////////////////////////////////////////
                            str2 = `
                                            <table border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <th style="width:2.4rem"></th>
                                                <th style="width:14.4rem">课程分类</th>
                                                <th style="width:14.4rem">课程名称</th>
                                                <th style="width:14.4rem"><div class="headingsifting">课程价格<div class="headingsifting-column"><img src="../images/simage/headingsifting_up.png"><img src="../images/simage/headingsifting_down.png"></div></div></th>
                                                <th style="width:14.4rem"><div class="headingsifting">创建时间<div class="headingsifting-column"><img src="../images/simage/headingsifting_up.png"><img src="../images/simage/headingsifting_down.png"></div></div></th>
                                                <th style="width:14.4rem">状态</th>
                                                <th style="width:7.4rem">操作</th>
                                            </tr>
                                        `

                            $.each(list, function (i, item) {
                                //通过遍历和if判断上下架的表格行
                                if (item.state == 1) {
                                    str2 += `
                                        <tr class="course-manage-table-tr">
                                            <td style="width:2.4rem"><div style="display:flex;justify-content: center;"><div class="course-manage-table-checkbox"><img style="display:none" src="../images/simage/codeallset_btn.png"></div></div></td>
                                            <td style="width:14.4rem">`+ item.classifyName + `</td>
                                            <td style="width:14.4rem">`+ item.name + `</td>
                                            <td style="width:14.4rem">`+ item.price + `</td>
                                            <td style="width:14.4rem">`+ item.createDate + `</td>
                                            <td style="width:14.4rem">上架</td>
                                            <td style="width:7.4rem" class="`+ item.id + `"><a class="course-manage-table-tr-edit" style="color:#71B2EF">编辑</a>|<a class="course-manage-table-tr-down" style="color:#71B2EF">下架</a></td>
                                        </tr>
                                    `
                                }

                                if (item.state == 2) {
                                    str2 += `
                                        <tr class="course-manage-table-tr">
                                            <td style="width:2.4rem"><div style="display:flex;justify-content: center;"><div class="course-manage-table-checkbox"><img style="display:none" src="../images/simage/codeallset_btn.png"></div></div></td>
                                            <td style="width:14.4rem">`+ item.classifyName + `</td>
                                            <td style="width:14.4rem">`+ item.name + `</td>
                                            <td style="width:14.4rem">`+ item.price + `</td>
                                            <td style="width:14.4rem">`+ item.createDate + `</td>
                                            <td style="width:14.4rem">下架</td>
                                            <td style="width:7.4rem" class="`+ item.id + `"><a class="course-manage-table-tr-edit" style="color:#71B2EF">编辑</a>|<a class="course-manage-table-tr-up" style="color:#71B2EF">上架</a></td>
                                        </tr>
                                    `
                                }
                            })

                            that.table.html(str2)

                            var obj = {
                                wrapid: 'boxpage', //页面显示分页器容器id
                                total: result.total, //总条数
                                pagesize: 10, //每页显示10条
                                currentPage: page, //当前页
                                onPagechange: onPagechange
                                //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                            }

                            pagination.init(obj);

                            var str3
                            str3 = `
                                <p>共`+ result.total + `条，每页` + params.rows + `条</p>
                            `
                            that.input_four.html(str3)

                            //批量上架下架

                            $('.course-manage-table-tr-up').click(function () {

                                var id = [];

                                    id.push($(this).parent().attr('class'))

                                    var params1 = {
                                        state: 1,
                                        ids: id
                                    }

                                    $.ajax({
                                        type: 'POST',
                                        url: 'rest/leagueCurriculum/updateAllLeagueCurriculumState',
                                        contentType: "application/json;charset=UTF-8",
                                        data: JSON.stringify(params1),
                                        success: function (resule) {
                                            //console.log(resule)
                                            //console.log(list)
                                            alert(resule.message)
                                        },
                                        error: function (e) {
                                            console.log(e.status);
                                            console.log(e.responseText)
                                        }
                                    })
                                window.location.reload()
                            })

                            $('.course-manage-table-tr-down').click(function(){
                                var id = [];

                                    id.push($(this).parent().attr('class'))

                                    var params1 = {
                                        state: 2,
                                        ids: id
                                    }

                                    $.ajax({
                                        type: 'POST',
                                        url: 'rest/leagueCurriculum/updateAllLeagueCurriculumState',
                                        contentType: "application/json;charset=UTF-8",
                                        data: JSON.stringify(params1),
                                        success: function (resule) {
                                            //console.log(resule)
                                            //console.log(list)
                                            alert(resule.message)
                                        },
                                        error: function (e) {
                                            console.log(e.status);
                                            console.log(e.responseText)
                                        }
                                    })
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
                                    url: 'rest/leagueCurriculum/updateAllLeagueCurriculumState',
                                    contentType: "application/json;charset=UTF-8",
                                    data: JSON.stringify(params1),
                                    success: function (resule) {
                                        //console.log(resule)
                                        //console.log(list)
                                        alert(resule.message)
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
                                    url: 'rest/leagueCurriculum/updateAllLeagueCurriculumState',
                                    contentType: "application/json;charset=UTF-8",
                                    data: JSON.stringify(params1),
                                    success: function (resule) {
                                        //console.log(resule)
                                        //console.log(list)
                                        alert(resule.message)
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
                            ///////////////////////////////////////////////////////////////////////////////////
                            //console.log(pagination.init)
                            new computed().init()
                        },

                        error: function (e) {
                            console.log(e.status);
                            console.log(e.responseText)
                        }
                    })

                }

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
            this.paypay = $(".paypay")
            this.it_checkbox = $(".inputtwelve-checkbox")
            this.zhankai_show = $("#zhankai-show")
            this.zhankai_hide = $("#zhankai-hide")
            this.ac_checkboxall = $(".add-course-checkboxall")
            this.acsip = $(".add-course-sortone-inputthree-p")
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
            var that = this;
            $('.course-manage-table-tr-edit').click(function () {
                $('.course-manage-body').hide()
                $('.add-course-body').show()

                var a = $(this).parent().parent().children().eq(4).html()
                //new add_course().init(a)
                var paramsall = {
                    rows: 10000,
                    page: 1
                }
                $.ajax({
                    type: 'POST',
                    url: 'rest/leagueCurriculum/selectLeagueCurriculumList',
                    contentType: "application/json;charset=UTF-8",
                    data: JSON.stringify(paramsall),
                    success: function (resultall) {
                        console.log(resultall.rows)

                        $.each(resultall.rows, function (i, item) {
                            if (item.createDate == a) {
                                var id = item.id

                                $('#select-menu-input-GroupType').val(item.classifyName)
                                $('#select-menu-input-GCourseType').val(item.modeName)
                                $('#area2').val(item.name)
                                $('#kcbzj').val(item.price)
                                $('#area').val(item.description)

                                for (var i = 0; i < $('#GroupCourseGole').children().length; i++) {
                                    for (var j = 0; j < item.curriculumTagList.length; j++) {
                                        if ($('#GroupCourseGole').children().eq(i).attr('class').split(' ')[1] == item.curriculumTagList[j].dictionaryId) {
                                            $('#GroupCourseGole').children().eq(i).addClass('add-course-sortone-inputthree-p-active')
                                        }
                                    }
                                }

                                for (var i = 0; i < item.difficultyId; i++) {
                                    $('#rating').children().eq(i).css("background-position", "0px 0px")
                                    $('#rating').children().eq(i).children().hide()
                                }
                                for (var i = item.difficultyId; i < $('#rating').children().length; i++) {
                                    $('#rating').children().eq(i).css("background-position", "0px -58px")
                                    $('#rating').children().eq(i).children().show()
                                }

                                $('#kllxh').val(item.calorieConsumption)
                                $('#syrq').val(item.suitableForCrowd)

                                //console.log($('.oneinput').eq(0).html())

                                for (var i = 0; i < item.curriculumEffectList.length; i++) {
                                    $('.oneinput').eq(i).children('.input').val(item.curriculumEffectList[i].effectValue)
                                    $('.oneinput').eq(i).children('.add-course-sortone-selectone').children().children().children('.select-menu-input').val(item.curriculumEffectList[i].name)
                                    //console.log(111)
                                }

                                $('#area1').val(item.announcements)

                                for (var i = 1; i < item.leagueCurriculumFaqList.length; i++) {
                                    $('#addOneRow').click()
                                }

                                for (var i = 0; i < item.leagueCurriculumFaqList.length; i++) {
                                    $('#faq').children().children().children().eq(i + 1).children().eq(0).children('textarea').html(item.leagueCurriculumFaqList[i].problem)
                                    $('#faq').children().children().children().eq(i + 1).children().eq(1).children('textarea').html(item.leagueCurriculumFaqList[i].answer)
                                }

                                if (item.curriculumPayTypeList[0].payTypeName == '付现') {
                                    $('#add-course-sortone-inputten').children().eq(0).children('.paypay').click()
                                }else{
                                    $('#add-course-sortone-inputten').children().eq(1).children('.paypay').click()
                                }

                                for (var i = 0; i < $('#inputtwelve-flex').children().length; i++) {
                                    for(var j=0;j< item.curriculumPayTypeList[0].curriculumGuangxinList.length;j++){
                                        if (parseInt($('#inputtwelve-flex').children().eq(i).children('p').html()) == item.curriculumPayTypeList[0].curriculumGuangxinList[j].itemId) {
                                            $('#inputtwelve-flex').children().eq(i).children('img').show()
                                        }
                                    }
                                    
                                }
                                
                                //图片的渲染

                                console.log(item)
                                var html = ''
                                for(var i=0;i<item.leagueCurriculumImgList.length;i++){
                                    var index = i
                                    
                                    html += '		<div class="zhegeshenmedoumeiyou '+ item.leagueCurriculumImgList[index].imgUrl +'" style="position:relative">';
                                    html += '           <img id="deldel" style="position:absolute;top:0.15rem;left:10rem;display:none" src="../image/palyitdel_btn.png">'
                                    html += '			<img style="height:8rem;width:10.25rem;margin-left:1rem" src="images/'+item.leagueCurriculumImgList[index].imgUrl+'" />';
                                    html += '		</div>';

                                }

                                $('#preview1').html(html)

                                $('.zhegeshenmedoumeiyou').hover(function(){
                                    $(this).children('#deldel').show()
                                },function(){
                                    $(this).children('#deldel').hide()
                                })

                                $('.zhegeshenmedoumeiyou').children('#deldel').click(function(){
                                    $(this).parent().css('display','none')
                                    $(this).parent().attr('class','')
                                })

                                //视频展示

                                if(item.leagueCurriculumVideoList == ''){

                                }else{
                                    $('#photoFile').addClass(item.leagueCurriculumVideoList[0].videoUrl)
                                    $('#videovideo').html('http://test.physicalclub.com/crm/videos/' + item.leagueCurriculumVideoList[0].videoUrl)

                                    $('#videoshow').show()

                                    $('#videovideo').click(function () {
                                        openVideo('http://test.physicalclub.com/crm/videos/' + item.leagueCurriculumVideoList[0].videoUrl)
                                    })

                                    $('#videohide').click(function () {
                                        $(this).parent().hide()
                                        $('#photoFile').attr('class', '')
                                    })

                                    function openVideo(src) {

                                        var page = window.open();

                                        var html = "<body style='background:black'><div style = 'width:80%;margin:auto;'><video controls width='100%' autoplay src='" + src + "'></video> </div></body > "

                                        page.document.write(html);

                                    }
                                }

                                new paypay().pay_pay()
                                new paypay().init(id)

                                //////////////////////////////////////////////
                                ///////////////////////////////////////////////                          
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
            //this.acsip()
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
                url: "rest/wx/dictionnary/getdictionnarylist",
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
                url: "rest/wx/dictionnary/getdictionnarylist",
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
                url: "rest/wx/dictionnary/getdictionnarylist",
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
                url: "rest/wx/dictionnary/getdictionnarylist",
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
                url: "rest/leagueCurriculum/selectGxFitListByCondition",
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
                                <p>`+ item.mediid + ' ' +'|' + ' ' +item.mediname + `</p>
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

            $('#scsp').click(function(){
                $("#photoFile").click();
            })

            setTimeout(() => {
                new paypay().init()
                // new paypay().pay_pay()
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

        // acsip() {
        //     $('.add-course-sortone-inputthree-p').click(function () {
        //         if ($(this).hasClass('add-course-sortone-inputthree-p-active')) {
        //             $(this).removeClass('add-course-sortone-inputthree-p-active')
        //         } else {
        //             $(this).addClass('add-course-sortone-inputthree-p-active')
        //         }
        //     })
        // }

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
                $(this).parent().parent().parent().children("tr:last").children().eq(0).children().html(' ')
                $(this).parent().parent().parent().children("tr:last").children().eq(1).children().html(' ')
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
            selectMenu(9);

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
                window.location.reload()
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

        init(id) {
            this.pay_pay()
            this.save(id)
        }

        pay_pay() {

            //console.log($(".add-course-sortone-inputthree-p"))

            $(".add-course-sortone-inputthree-p").click(function () {
                if ($(this).hasClass('add-course-sortone-inputthree-p-active')) {
                    $(this).removeClass('add-course-sortone-inputthree-p-active')
                } else {
                    $(this).addClass('add-course-sortone-inputthree-p-active')
                }
            })

            // $('#GroupCourseGole').children('add-course-sortone-inputthree-p').click(function () {
            //     if ($(this).hasClass('add-course-sortone-inputthree-p-active')) {
            //         $(this).removeClass('add-course-sortone-inputthree-p-active')
            //     } else {
            //         $(this).addClass('add-course-sortone-inputthree-p-active')
            //     }
            // })
            
            // if ($('#add-course-sortone-inputten').children().eq(1).children('.paypay').hasClass('11')) {
                
            // }

            //广信标签展开
            this.zhankai_show.click(function () {
                $(".inputtwelve-flex").css('height', 'auto')
                //$('#inputtwelve-flex').css('overflow','visible')
                $('.add-course-sortone-inputtwelve').css('height','auto')
                $('.add-course-sortthree').css('height', 'auto')
                $(this).hide()
                $("#zhankai-hide").show()
            })
            //广信标签闭合
            this.zhankai_hide.click(function () {
                $(".inputtwelve-flex").css('height', '4rem')
                $(this).hide()
                $("#zhankai-show").show()
            })

            //全部取消
            this.ac_checkboxall.click(function () {
                if ($(this).children('img').is(":hidden")) {
                    $(this).children('img').show()
                    $(".inputtwelve-checkbox").children('img').hide()
                } else {
                    $(this).children('img').hide()
                }
            })
        }

        save(id) {
            console.log(id)
            var that = this;
            ////////////////////////////////////////////////////////////////
            $('#add-course-footer-save').click(function () {
                //支付方式的参数

                for (var i = 0; i < that.paypay.length; i++) {
                    if (that.paypay.eq(i).children('.paypay-show').is(':visible')) {
                        var payMode = i + 1
                    }
                }

                var payTypeId = ''

                if(payMode == 1){
                    payTypeId = 'e65fcb162bf4475598476ee48e2a44c4'
                }
                else if(payMode == 2){
                    payTypeId = 'ac07a37132804c61bbfc6ee02aa4ca30'
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

                //视频上传

                var videos = []

                if($('#photoFile').attr('class')){
                    var videos1 = $('#photoFile').attr('class')
                    videos.push({ videoUrl : videos1})
                }

                //图片上传

                var Imgs = []

                if($('#preview1').children()){
                    for(var i=0;i< $('#preview1').children().length;i++){
                        if($('#preview1').children().eq(i).is(':hidden')){

                        }else{
                            Imgs.push({ imgUrl: $('#preview1').children().eq(i).attr('class').split(' ')[1] })
                        }
                        
                    }
                }

                if (id) {
                    var fd = {
                        id: id,
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
                        curriculumPayTypeList: [
                            { payTypeId: payTypeId, curriculumGuangxinList: curriculumGuangxinList }
                        ],
                        leagueCurriculumVideoList: videos,
                        leagueCurriculumImgList: Imgs
                    }

                    $.ajax({
                        type: 'POST',
                        url: "rest/leagueCurriculum/updateLeagueCurriculum",
                        contentType: "application/json",  //multipart/form-data;boundary=--xxxxxxx   application/json,
                        data: JSON.stringify(fd),
                        success: function (result) {
                            console.log(result)
                            alert(result.message)
                            window.location.reload()
                        },
                        error: function (e) {
                            console.log(e.status);
                            console.log(e.responseText)
                        }
                    })
                
                }
                //if (!id) 
                else{
                    var fd = {
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
                        curriculumPayTypeList : [
                            {payTypeId : payTypeId , curriculumGuangxinList: curriculumGuangxinList}
                        ],
                        leagueCurriculumVideoList: videos,
                        leagueCurriculumImgList : Imgs
                    }

                    console.log(fd)

                    $.ajax({
                        type: 'POST',
                        url: "rest/leagueCurriculum/insertLeagueCurriculum",
                        contentType: "application/json",  //multipart/form-data;boundary=--xxxxxxx   application/json,
                        data: JSON.stringify(fd),
                        success: function (result) {
                            console.log(result)
                            alert(result.message)
                            window.location.reload()
                        },
                        error: function (e) {
                            console.log(e.status);
                            console.log(e.responseText)
                        }
                    })


                }
            
                //window.location.reload()
                
            })
        }

    }

</script>

</html>