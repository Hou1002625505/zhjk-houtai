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
    <script type="text/javascript" src="easyui/moment.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script src="easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
    <!-- <link rel="stylesheet" href="imgui/zyUpload.css" type="text/css"> -->
    <!-- 引用核心层插件 -->
    <!-- <script src="imgui/zyFile.js"></script> -->
    
    <!-- 引用控制层插件 -->
    <!-- <script src="imgui/zyUpload.js"></script> -->
    
    <!-- 引用初始化JS -->
    <!-- <script src="imgui/jq22.js"></script> -->
    <style>

        html{
            font-size:calc(100vw / 88.11);
        }

        * {
            margin: 0;
            padding: 0;
        }

        .course-arranging-body {
            position: relative
        }

        .course-arranging-header-one {
            display: flex
        }

        #course-arranging-header-one-pone {
            font-size: 1rem;
            color: #444444;
            padding-bottom: 0.35rem;
            margin-left: 1.15rem;
            cursor: pointer;
        }

        .course-arranging-header-one-pone-active {
            border-bottom: 0.1rem solid #71B2EF;
        }

        #course-arranging-header-one-ptwo {
            font-size: 1rem;
            color: #444444;
            margin-left: 2rem;
            padding-bottom: 0.35rem;
            cursor: pointer;
        }

        .course-arranging-header-one-ptwo-active {
            border-bottom: 0.1rem solid #71B2EF;
        }

        .course-arranging-header-two {
            height: 1px;
            background: #BFBFBF;
            padding: 0 0.9rem 0 0.9rem;
            box-sizing: border-box;
            margin-bottom: 0.9rem
        }

        .course-arranging-header-three {
            display: flex;
        }

        .course-arranging-header-three p:nth-child(1) {
            width: 5rem;
            height: 1.5rem;
            background: #71B2EF;
            color: white;
            border-radius: 0.2rem;
            margin-left: 0;
            font-size: 0.8rem;
            text-align: center;
            line-height: 1.5rem;
        }

        .course-arranging-header-three p {
            width: 5rem;
            height: 1.5rem;
            background: #71B2EF;
            color: white;
            border-radius: 0.2rem;
            margin-left: 0.9rem;
            font-size: 0.8rem;
            text-align: center;
            line-height: 1.5rem;
            margin-bottom: 1rem
        }

        .course-arranging-flex {
            display: flex;
            align-items: center;
        }

        /* .course-arranging-flex .course-arranging-flex-input {
            width: 176px;
            height: 26px;
            border-radius: 4px;
            margin-left: 18px;
            margin-right: 34px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        } */

        .course-arranging-flextwo {
            display: flex;
            margin-top: 0.9rem;
            justify-content: space-between;
        }

        .course-arranging-flexthree {
            display: flex
        }

        .course-arranging-flexthree p:nth-child(1) {
            width: 4rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            background: #71B2EF;
            text-align: center;
            line-height: 1.5rem;
            color: white;
            font-size: 0.8rem
        }

        .course-arranging-flexthree p:nth-child(2) {
            width: 4rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            text-align: center;
            line-height: 1.5rem;
            color: black;
            margin-left: 0.75rem;
            font-size: 0.8rem
        }

        .course-arranging-flextwo .course-arranging-flextwo-pthree {
            width: 4rem;
            height: 1.5rem;
            color: white;
            background: #71B2EF;
            text-align: center;
            line-height: 1.5rem;
            border-radius: 0.2rem;
            margin-right: 10rem;
            font-size: 0.8rem;
        }

        .select-menu {
            margin-left: 0.5rem;
            margin-right: 2rem;
            cursor: pointer;
            width: 8.8rem;
            height: 1.3rem;
            box-sizing: border-box;
        }

        .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 5.3rem;
            text-align: left;
            border: 1px solid #ddd;
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
            height: 1.3rem;
            width: 8.8rem;
            border: 1px solid #ddd;
            border-radius: 0.2rem;
            box-sizing: border-box;
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
            width: 2.25rem;
            height: 2.2rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem
        }

        .course-arranging-flex-select-two {
            width: 6rem;
            height: 1.5rem;
            border: 1px solid #BFBFBF;
            border-radius: 0.2rem;
            margin-left: 1rem;
            margin-right: 2rem
        }

        .course-arranging-flex-select-three {
            width: 6rem;
            height: 1.5rem;
            border: 1px solid #BFBFBF;
            border-radius: 0.2rem;
            margin-left: 1rem;
            margin-right: 2rem
        }

        .course-arranging-flex-input-one {
            width: 6rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            margin-left: 1.05rem;
            margin-right: 0.35rem;
            padding: 0 0 0 0.5rem;
            box-sizing: border-box;
            font-size: 0.7rem;
            border: 1px solid #BFBFBF;
            line-height: 1.5rem;
        }

        .course-arranging-flex-input-two {
            width: 6rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            margin-left:0.35rem;
            margin-right: 1.9rem;
            padding: 0 0 0 0.5rem;
            box-sizing: border-box;
            font-size: 0.7rem;
            border: 1px solid #BFBFBF;
            line-height: 1.5rem;
        }

        .course-arranging-flex-input-three {
            width: 3.5rem;
            height: 1.3rem;
            border-radius: 0.2rem;
            margin-left: 1.05rem;
            margin-right: 0.3rem;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }

        .course-arranging-flex-input-four {
            width: 3.5rem;
            height: 1.3rem;
            border-radius: 0.2rem;
            margin-left: 0.3rem;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }

        .course-arranging-table {
            margin-top: 0.9rem;
            font-size: 0.7rem;
        }

        .course-arranging-table table tr:nth-child(2) td {
            border-top: none
        }

        .course-arranging-table table td {
            border-left: 1px dashed #CCCCCC;
            border-bottom: 1px dashed #CCCCCC;
            height: 2rem;
            text-align: center;
        }

        .course-arranging-table table td:last-child {
            border-right: 1px dashed #CCCCCC;
            text-align: center;
        }

        .course-arranging-table table th {
            background: #D0E8F2;
            text-align: center;
            height: 2rem;
        }

        .course-arranging-table .course-arranging-table-tr td:last-child {
            cursor: pointer;
            color: #71B2EF;
        }

        .course-arranging-table .course-arranging-table-tr td:last-child a:nth-child(1) {
            margin-right: 0.25rem;
        }

        .course-arranging-table .course-arranging-table-tr td:last-child a:nth-child(2) {
            margin-left: 0.25rem;
        }

        .course-arranging-table .course-arranging-table-checkbox {
            width: 0.8rem;
            height: 0.8rem;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
        }

        .course-arranging-table .course-arranging-table-checkbox img {
            width: 0.8rem;
            height: 0.8rem;
            margin-left: -0.05rem;
            margin-top: -0.05rem;
        }

        .course-arranging-footer {
            display: flex;
            margin-top: 0.85rem;
            height: 1.3rem;
            display: flex;
            align-items: center;
            padding-left: 0.7rem;
        }

        .course-arranging-table-checkbox {
            width: 0.8rem;
            height: 0.8rem;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
            line-height: 0.7rem;
        }

        .course-arranging-table-checkbox img {
            width: 0.8rem;
            height: 0.8rem;
            margin-top: -0.05rem;
            margin-left: -0.05rem;
        }

        .course-arranging-footer .course-arranging-footer-pone {
            font-size: 0.7rem;
            margin-left: 0.4rem;
        }

        .course-arranging-footer .course-arranging-footer-ptwo {
            width: 3.5rem;
            height: 1.5rem;
            border: 1px solid #BFBFBF;
            margin-left: 0.45rem;
            font-size: 0.7rem;
            color: #444444;
            text-align: center;
            line-height: 1.5rem;
            border-radius: 0.1rem;
        }

        .course-arranging-footer .course-arranging-footer-pthree {
            font-size: 0.7rem;
            margin-left: 44.65rem;
        }

        .td-del {
            width: 16.3rem;
            height: 4.85rem;
            border-radius: 0.2rem;
            background: white;
            position: absolute;
            left: -15rem;
            top: -0px;
            z-index: 10;
            padding: 0.9rem 0 0 0.9rem
        }

        .td-del .td-del-flex {
            display: flex;
            align-items: center;
            justify-content: left;
        }

        .td-del .td-del-flex p:nth-child(1) {
            font-size: 0.7rem
        }

        .td-del .td-del-flex p:nth-child(2) {
            width: 3.1rem;
            height: 1.6rem;
            background: #71B2EF;
            color: white;
            font-size: 0.7rem;
            text-align: center;
            line-height: 1.6rem;
            border-radius: 0.2rem;
            margin-left: 1.3rem;
            margin-right: 0.65rem;
            cursor: pointer;
        }

        .td-del .td-del-flex p:nth-child(3) {
            width: 3.1rem;
            height: 1.6rem;
            font-size: 0.7rem;
            text-align: center;
            line-height: 1.6rem;
            border-radius: 0.2rem;
            border: 1px solid #BFBFBF;
            cursor: pointer;
        }

        .td-del .td-del-line {
            height: 1px;
            background: #BFBFBF;
            padding: 0 0.9rem 0 0.9rem;
            margin-top: 0.45rem;
            margin-bottom: 0.4rem
        }

        .td-del .td-del-left {
            color: red;
            display: flex;
            justify-content: left;
        }

        .select-menu {
            margin-right: 2rem;
            cursor: pointer;
            width: 10rem;
            height: 1.5rem;
            box-sizing: border-box;
        }

        .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 10rem;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .select-menu-ul li {
            height: 1.5rem;
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
            width: 10rem;
            border: 1px solid #ddd;
            border-radius: 0.2rem;
            box-sizing: border-box;
        }

        .select-this {
            background: #71B2EF;
        }

        .select-this:hover {
            background: #71B2EF !important;
        }

        .select-menu-img {
            width: 0.6rem;
            height: 0.4rem;
            margin-right: 0.5rem;
            position: absolute;
            right: 0;
            top: 0.5rem;
        }

        .select-menu-input {
            padding-left: 0.7rem;
            border: 0;
            width: 2.5rem;
            height: 1.4rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem
        }



        .select-menu3 {
            cursor: pointer;
            width: 7.5rem;
            height: 1.8rem;
            box-sizing: border-box;
            margin-left: 3.85rem;
            margin-right: 3rem
        }

        .select-menu3 .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 7.5rem;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .select-menu3 .select-menu-ul .select-menu-ul li {
            height: 1.8rem;
            font-size: 0.7rem;
            padding: 0 0.75rem;
            box-sizing: border-box;
            line-height: 1.8rem;
        }

        .select-menu3 .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .select-menu3 .select-menu-div {
            position: relative;
            height: 1.8rem;
            width: 7.5rem;
            border: 1px solid #ddd;
            border-radius: 0.2rem;
            box-sizing: border-box;
        }

        .select-menu3 .select-menu-ul .select-this {
            background: #71B2EF;
        }

        .select-menu3 .select-menu-ul .select-this:hover {
            background: #71B2EF !important;
        }

        .select-menu3 .select-menu-div .select-menu-img {
            width: 0.6rem;
            height: 0.45rem;
            margin-right: 10px;
            position: absolute;
            right: 0;
            top: 0.5rem;
        }

        .select-menu3 .select-menu-div .select-menu-input {
            padding-left: 0.7rem;
            border: 0;
            width: 2.5rem;
            height: 1.5rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem
        }



        .select-menu4 {
            cursor: pointer;
            width: 6rem;
            height: 1.8rem;
            box-sizing: border-box;
        }

        .select-menu4 .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 6rem;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .select-menu4 .select-menu-ul .select-menu-ul li {
            height: 1.6rem;
            font-size: 0.7rem;
            padding: 0 0.75rem;
            box-sizing: border-box;
            line-height: 1.6rem;
        }

        .select-menu4 .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .select-menu4 .select-menu-div {
            position: relative;
            height: 1.8rem;
            width: 6rem;
            border: 1px solid #ddd;
            border-radius: 0.2rem;
            box-sizing: border-box;
        }

        .select-menu4 .select-menu-ul .select-this {
            background: #71B2EF;
        }

        .select-menu4 .select-menu-ul .select-this:hover {
            background: #71B2EF !important;
        }

        .select-menu4 .select-menu-div .select-menu-img {
            width: 0.6rem;
            height: 0.4rem;
            margin-right: 0.5rem;
            position: absolute;
            right: 0;
            top: 0.5rem;
        }

        .select-menu4 .select-menu-div .select-menu-input {
            padding-left: 0.7rem;
            border: 0;
            width: 2.5rem;
            height: 1.5rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem
        }


        .select-menu5 {
            cursor: pointer;
            width: 12.5rem;
            height: 1.8rem;
            box-sizing: border-box;
        }

        .select-menu5 .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 12.5rem;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .select-menu5 .select-menu-ul li {
            height: 1.8rem;
            font-size: 0.7rem;
            padding: 0 0.75rem;
            box-sizing: border-box;
            line-height: 1.8rem;
        }

        .select-menu5 .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .select-menu5 .select-menu-div {
            position: relative;
            height: 1.8rem;
            width: 12.5rem;
            border: 1px solid #ddd;
            border-radius: 0.2rem;
            box-sizing: border-box;
            line-height: 1.8rem;
        }

        .select-menu5 .select-menu-ul .select-this {
            background: #71B2EF;
        }

        .select-menu5 .select-menu-ul .select-this:hover {
            background: #71B2EF !important;
        }

        .select-menu5 .select-menu-div .select-menu-img {
            width: 0.6rem;
            height: 0.4rem;
            margin-right: 0.5rem;
            position: absolute;
            right: 0;
            top: 0.5rem;
        }

        .select-menu5 .select-menu-div .select-menu-input {
            padding-left: 0.7rem;
            border: 0;
            width: 6.5rem;
            height: 1.5rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem
        }



        .edit-course {
            width: 40rem;
            height: 38rem;
            border: 1px solid #71B2EF;
            background: #E0ECFF;
            border-radius: 0.2rem;
            padding: 0.9rem;
            box-sizing: border-box;
            position: absolute;
            top: -2rem;
            left: 20%;
            z-index: 10;
            display: none
        }

        .edit-course .edit-course-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 0.8rem
        }

        .edit-course-header .edit-course-header-one {
            display: flex;
            align-items: center;
        }

        .edit-course-header-one .edit-course-header-imgone {
            width: 1.1rem;
            height: 1.05rem
        }

        .edit-course-header-one .edit-course-header-pone {
            font-size: 1.2rem;
            margin-left: 0.75rem
        }

        .edit-course .edit-course-context {
            width: 37.8rem;
            height: 34rem;
            border: 1px solid #71B2EF;
            background: #FFFFFF;
            overflow-y: scroll;
            position: relative;
        }

        .edit-course-context .edit-course-context-flex {
            width: 100%;
            height: 3rem;
            display: flex;
            box-sizing: border-box;
            align-items: center;
            border-bottom: 1px solid #BFBFBF;
        }

        .edit-course-context-flex .edit-course-context-one {
            padding: 0 0 0 1rem;
            font-size: 0.9rem
        }

        .edit-course-context-flex #edit-course-context-two {
            width: 12.5rem;
            height: 1.8rem;
            border: 1px solid #BFBFBF;
            border-right: none;
            margin-left: 3.7rem;
            border-radius: 0.2rem 0 0 0.2rem;
            padding: 0.45rem 0 0.45rem 0;
            box-sizing: border-box;
            display: flex;
            align-items: center;
        }

        .edit-course-context-flex .edit-course-context-three-pp {
            width: 2rem;
            height: 1.8rem;
            background: #71B2EF;
            border-radius: 0 0.2rem 0.2rem 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .edit-course-context-flex .edit-course-context-three-pp img {
            width: 0.9rem;
            height: 0.85rem
        }

        /* #edit-course-context-two .edit-course-context-two-pp {
            font-size: 14px;
        } */

        .edit-course-context .edit-course-context-flextwo {
            width: 100%;
            height: auto;
            display: flex;
            box-sizing: border-box;
            align-items: center;
            border-bottom: 1px solid #BFBFBF;
            justify-content: space-between;
            padding: 0 1rem 0 1rem;
        }

        .edit-course-context-flextwo .edit-course-context-twoall {
            width: 22.5rem;
            display: flex;
            flex-wrap: wrap;
            margin-top: 0.6rem
        }

        .edit-course-context-flextwo .edit-course-context-one {
            font-size: 0.9rem
        }

        .edit-course-context-twoall .edit-course-context-twoone {
            padding:0 0.5rem 0 0.5rem;
            box-sizing: border-box;
            height: 1.8rem;
            border: 1px solid #BFBFBF;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.6rem;
            margin-left: 0.9rem;
            margin-bottom: 0.9rem;
            font-size: 0.7rem;
        }

        .edit-course-context-flextwo .edit-course-context-three {
            width: 3rem;
            height: 1.8rem;
            border: 1px solid #71B2EF;
            border-radius: 0.2rem;
            color: #71B2EF;
            text-align: center;
            line-height: 1.8rem;
            font-size: 0.7rem
        }

        .edit-course-context-flex3 {
            padding: 0.55rem 0 0.55rem 1rem;
            width: 100%;
            height: 2.65rem;
            display: flex;
            box-sizing: border-box;
            align-items: center;
            border-bottom: 1px solid #BFBFBF;
        }

        .edit-course-context-flex3 .add-course-sortone-inputtwo {
            display: flex;
            width: 7.5rem;
            height: 1.8rem;
            border: 1px solid #CCCCCC;
            margin-left: 3.85rem;
            border-radius: 0.2rem;
            box-sizing: border-box;
        }

        .edit-course-context-flex3-pone {
            font-size: 0.9rem
        }

        .edit-course-context-flex3-ptwo {
            font-size: 0.9rem;
            margin-left: 3rem
        }

        .edit-course-context-flex3 .add-course-sortone-inputtwo p {
            width: 1rem;
            height: 1.7rem;
            background: #F7F7F7;
            border-right: 1px solid #CCCCCC;
            line-height: 1.7rem;
            text-align: center;
        }

        .edit-course-context-flex3 .add-course-sortone-inputtwo input {
            border: none;
            outline: none;
            -webkit-appearance: none;
            width: 4.4rem;
            padding-left: 0.25rem;
            box-sizing: border-box;
        }

        .edit-course-context-flex3 .add-course-sortone-inputthree {
            display: flex;
            width: 6rem;
            height: 1.8rem;
            border: 1px solid #CCCCCC;
            margin-left: 1.75rem;
            border-radius: 0.2rem;
        }

        .edit-course-context-flex3 .add-course-sortone-inputthree p {
            width: 1rem;
            height: 1.8rem;
            background: #F7F7F7;
            border-right: 1px solid #CCCCCC;
            box-sizing: border-box;
            line-height: 1.8rem;
            text-align: center;
        }

        .edit-course-context-flex3 .add-course-sortone-inputthree .add-course-sortone-inputthree-input {
            border: none;
            outline: none;
            -webkit-appearance: none;
            width: 4.4rem;
            padding-left: 0.25rem;
            box-sizing: border-box;
            background: #F7F7F7;
            text-decoration: line-through;
            color: #BFBFBF;
            font-size: 0.7rem
        }

        .edit-course-context-flex3 .add-course-sortone-inputthree input {
            border: none;
            outline: none;
            -webkit-appearance: none;
            width: 4.4rem;
            padding-left: 0.25rem;
            box-sizing: border-box;
            text-decoration: line-through;
            color: #BFBFBF
        }

        .edit-course-context-flex3 .paypay {
            width: 1.2rem;
            height: 1.2rem;
            margin-left: 2.2rem;
            margin-right: 0.9rem
        }

        .edit-course-context-flex3 .paypay .paypay-show {
            width: 1.2rem;
            height: 1.2rem
        }

        .edit-course-context-flex3 .paypay .paypay-hidden {
            width: 1.2rem;
            height: 1.2rem;
            display: none;
        }

        .edit-course-context .edit-course-footer {
            width: 36.9rem;
            display: flex;
            justify-content: center;
            padding: 1.35rem 0 1.35rem 0;
            box-sizing: border-box;
            position: fixed;
            bottom: 5rem;
            background: white
        }

        .edit-course-footer #edit-course-footer-pone {
            width: 5rem;
            height: 2rem;
            border-radius: 0.2rem;
            background: #71B2EF;
            font-size: 0.9rem;
            text-align: center;
            line-height: 2rem;
            color: white
        }

        .edit-course-footer #edit-course-footer-ptwo {
            width: 5rem;
            height: 2rem;
            border-radius: 0.2rem;
            border: 1px solid #BFBFBF;
            font-size: 0.9rem;
            text-align: center;
            line-height: 2rem;
            margin-left: 1.3rem
        }

        .edit-course-footer .edit-course-footer-pone {
            width: 5rem;
            height: 2rem;
            border-radius: 0.2rem;
            background: #71B2EF;
            font-size: 0.9rem;
            text-align: center;
            line-height: 1.75rem;
            color: white
        }

        .edit-course-footer .edit-course-footer-ptwo {
            width: 5rem;
            height: 2rem;
            border-radius: 0.2rem;
            border: 1px solid #BFBFBF;
            font-size: 0.9rem;
            text-align: center;
            line-height: 2rem;
            margin-left: 1.3rem
        }

        .edit-course-context-flex4 {
            padding: 0.55rem 0 0.55rem 1rem;
            width: 100%;
            height: auto;
            display: flex;
            box-sizing: border-box;
            border-bottom: 1px solid #BFBFBF;
            margin-bottom: 5.5rem
        }

        .edit-course-context-flex4 .edit-course-context-flex4-pone {
            font-size: 0.8rem
        }

        .edit-course-context-flex4 .edit-course-context-flex4-ptwo {
            width: 25.5rem;
            height: auto;
            margin-left: 3.3rem;
            display: flex;
            flex-wrap: wrap;
        }

        .edit-course-context-flex4 .edit-course-context-flex4-pthree {
            width: 6rem;
            height: 1.8rem;
            border: 1px solid #BFBFBF;
            border-radius: 0.2rem;
            box-sizing: border-box;
            margin-left: 0.9rem;
            margin-bottom: 0.65rem;
            display: flex;
            font-size: 0.7rem
        }

        .edit-course-context-flex4 .edit-course-context-flex4-pfour {
            width: 3.4rem;
            height: 1.8rem;
            border-right: 1px solid #BFBFBF;
            text-align: center;
            line-height: 1.8rem;
            color: #BFBFBF
        }

        .edit-course-context-flex4 .edit-course-context-flex4-pfive {
            width:2.5rem;
            height: 1.65rem;
            text-align: center;
            line-height: 1.8rem;
            border:0
        }

        .course-arranging-body .add-edit-course {
            position: absolute;
            top: 15rem;
            left: 24rem;
            z-index: 100;
            width: 21.05rem;
            height: 18.8rem;
            background: #E0ECFF;
            border: 1px solid #71B2EF;
            border-radius: 0.2rem;
            padding: 0.65rem;
            box-sizing: border-box;
            display: none
        }

        .add-edit-course .add-edit-course-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .add-edit-course-header .add-edit-course-header-one {
            display: flex;
            align-items: center;
        }

        .add-edit-course-header-pone {
            margin-left: 0.55rem;
            font-size: 0.9rem;
        }

        .add-edit-course-header-imgone {
            width: 1.15rem;
            height: 1.1rem
        }

        .add-edit-course-header-context {
            width: 19.55rem;
            height: 15.7rem;
            border: 1px solid #71B2EF;
            background: white;
            margin-top: 0.55rem;
            overflow-y: scroll;
        }

        .add-edit-course-header-context .add-edit-course-header-context-one {
            height: 2.5rem;
            width: 100%;
            border-bottom: 1px solid #BFBFBF;
            display: flex;
            justify-content: center;
            align-items: center;
            box-sizing: border-box;
        }

        .add-edit-course-header-context-one .add-edit-course-header-context-oneflex {
            width: 15rem;
            height: 1.75rem;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            border-radius: 0.2rem;
            display: flex;
            align-items: center
        }

        .add-edit-course-header-context-one input {
            width: 13rem;
            border: none;
            outline: none;
            padding-left: 0.75rem;
            box-sizing: border-box;
        }

        .add-edit-course-header-context-oneflex .add-edit-course-header-context-one-blue {
            flex: 1;
            height: 100%;
            background: #71B2EF;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .add-edit-course-header-context .add-edit-course-header-context-two {
            height: auto;
            width: 100%;
            padding: 0.6rem 0.2rem 0 0.2rem;
            box-sizing: border-box;
            margin-bottom: 3.5rem;
        }

        .add-edit-course-header-context-two .add-edit-course-header-context-two-pone {
            font-size: 0.7rem;
            margin-left: 0.9rem
        }

        .add-edit-course-header-context-two .add-edit-course-header-context-twoflex {
            margin-top: 0.9rem;
            display: flex;
            flex-wrap: wrap;
            height: auto
        }

        .add-edit-course-header-context-twoflex .add-edit-course-header-context-two-ptwo {
            width: 3.5rem;
            height: 1.2rem;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.2rem;
            margin-left: 0.9rem;
            margin-bottom: 0.9rem;
            box-sizing: border-box;
            font-size: 0.7rem;
            position: relative;
        }

        .add-edit-course-header-context-twoflex .add-edit-course-header-context-two-ptwo img {
            position: absolute;
            top: -0.5rem;
            left: 3rem;
            display: none
        }

        .aechctp-active {
            border: 1px solid #71B2EF;
            text-align: center;
            box-sizing: border-box;
        }

        .add-edit-course-header-context .add-edit-course-header-context-three {
            width: 18.75rem;
            display: flex;
            justify-content: center;
            padding: 0.75rem 0 0.75rem 0;
            position: fixed;
            top: 33.05rem;
            background: white;
        }

        .add-edit-course-header-context-three #add-edit-course-header-context-three-pone {
            width: 3.35rem;
            height: 1.3rem;
            background: #71B2EF;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.3rem;
            color: white
        }

        .add-edit-course-header-context-three #add-edit-course-header-context-three-ptwo {
            width: 3.35rem;
            height: 1.3rem;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.3rem;
            border: 1px solid #BFBFBF;
            margin-left: 1rem
        }

        .add-edit-course-header-context-three .add-edit-course-header-context-three-pone {
            width: 3.35rem;
            height: 1.3rem;
            background: #71B2EF;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.3rem;
            color: white
        }

        .add-edit-course-header-context-three .add-edit-course-header-context-three-ptwo {
            width: 3.35rem;
            height: 1.3rem;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.3rem;
            border: 1px solid #BFBFBF;
            margin-left: 1rem
        }

        .course-arranging-body .add-course-name {
            width: 34.4rem;
            height: 33.9rem;
            border: 1px solid #71B2EF;
            position: absolute;
            left: 1.6rem;
            top: 0.1rem;
            z-index: 200;
            background: #E0ECFF;
            padding: 0.9rem;
            border-radius: 0.2rem;
            box-sizing: border-box;
            display: none
        }

        .add-course-name .add-course-name-header {
            display: flex;
            justify-content: space-between;
        }

        .add-course-name-header .add-course-name-header-left {
            display: flex;
            align-items: center;
        }

        .add-course-name-header .add-course-name-header-left img {
            width: 1.05rem;
            height: 1.05rem
        }

        .add-course-name-header .add-course-name-header-left p {
            font-size: 0.8rem;
            margin-left: 0.65rem
        }

        .add-course-name .add-course-name-context {
            width: 32.5rem;
            height: 30rem;
            border: 1px solid #71B2EF;
            margin-top: 1.5rem;
            background: white;
            padding: 1.1rem 1.1rem 1.1rem 0.2rem;
            box-sizing: border-box;
            position : relative;
            overflow-y: scroll;
        }

        .add-course-name-context .add-course-name-context-flex {
            display: flex;
            flex-wrap: wrap;
        }

        .add-course-name-context-p {
            padding: 0.4rem 0.5rem 0.4rem 0.5rem;
            background: #F5F5F5;
            border-radius: 0.2rem;
            margin-left: 0.9rem;
            margin-bottom: 0.65rem;
        }

        .add-course-name-context-p-active {
            background: #71B2EF;
            color: white
        }

        .add-course-name-context .add-course-name-context-bottom {
            display: flex;
            justify-content: center;
            padding: 1.3rem 0 1.3rem 0;
            box-sizing: border-box;
            position: fixed;
            bottom: 15.5rem;
            left: 29.3rem
        }

        .add-course-name-context-bottom #add-course-name-context-bottom-pone {
            width: 4.4rem;
            height: 1.75rem;
            background: rgb(8, 8, 8);
            border-radius: 0.2rem;
            font-size: 0.8rem;
            color: white;
            text-align: center;
            line-height: 1.75rem;
        }

        .add-course-name-context-bottom #add-course-name-context-bottom-ptwo {
            width: 4.4rem;
            height: 1.75rem;
            border-radius: 0.2rem;
            font-size: 0.8rem;
            text-align: center;
            line-height: 1.75rem;
            border: 1px solid #BFBFBF;
            margin-left: 1.3rem
        }

        .add-course-name-context-bottom1 #add-course-name-context-bottom-pone2 {
            width: 4.4rem;
            height: 1.75rem;
            background: #71B2EF;
            border-radius: 0.2rem;
            font-size: 0.8rem;
            color: white;
            text-align: center;
            line-height: 1.75rem;
        }

        .add-course-name-context-bottom1 #add-course-name-context-bottom-ptwo2 {
            width: 4.4rem;
            height: 1.75rem;
            border-radius: 0.2rem;
            font-size: 0.8rem;
            text-align: center;
            line-height: 1.75rem;
            border: 1px solid #BFBFBF;
            margin-left: 1.3rem
        }

        .add-edit-course-label {
            position: absolute;
            width: 23.35rem;
            height: 18.15rem;
            background: #E0ECFF;
            z-index: 388;
            border-radius: 0.2rem;
            top: 12rem;
            left: 28.3rem;
            padding: 0.9rem;
            box-sizing: border-box;
        }

        .add-edit-course-label .add-edit-course-label-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .add-edit-course-label-header .add-edit-course-label-header-flex {
            display: flex;
            align-items: center;
        }

        .add-edit-course-label-header .add-edit-course-label-header-flex img {
            width: 1.1rem;
            height: 1.1rem;
            margin-right: 0.9rem
        }

        .add-edit-course-label-header .add-edit-course-label-header-flex p {
            font-size: 1.2rem
        }

        .add-edit-course-label .add-edit-course-label-context {
            width: 21.35rem;
            height: 14.1rem;
            border: 1px solid #71B2EF;
            margin-top: 0.8rem;
            background: white
        }

        .add-edit-course-label-context .add-edit-course-label-context-pone {
            margin-top: 1.3rem;
            font-size: 0.9rem;
            display: flex;
            justify-content: center;
        }

        .add-edit-course-label-context .add-edit-course-label-context-flexone {
            display: flex;
            padding: 0 1.35rem 0 1.35rem;
            align-items: center;
            justify-content: center;
            margin-top: 3.05rem
        }

        .add-edit-course-label-context-flexone .paypaypay {
            width: 1.2rem;
            height: 1.2rem;
            margin-right: 0.65rem;
            margin-left: 3.5rem;
        }

        .add-edit-course-label-context-flexone .paypaypay:nth-child(1) {
            margin-right: 0.65rem;
            margin-left: 0
        }

        .add-edit-course-label-context .add-edit-course-label-context-footer {
            display: flex;
            justify-content: center;
            padding: 1.35rem 0 1.35rem 0;
            box-sizing: border-box;
            position: absolute;
            bottom: 0.75rem;
            width: 21.35rem;
        }

        .add-edit-course-label-context-footer #add-edit-course-label-context-footer-pone {
            width: 4.4rem;
            height: 1.75rem;
            background: #71B2EF;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.75rem;
            font-size: 0.8rem;
            color: white
        }

        .add-edit-course-label-context-footer #add-edit-course-label-context-footer-ptwo {
            width: 4.4rem;
            height: 1.75rem;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.75rem;
            margin-left: 1.3rem
        }

        .add-edit-course-label-context-footer #add-edit-course-label-context-footer-ptwo {
            width: 4.4rem;
            height: 1.75rem;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.75rem;
            margin-left: 1.3rem
        }


        .add-edit-course-change {
            position: absolute;
            width: 31rem;
            height: 29.85rem;
            background: #E0ECFF;
            z-index: 9999;
            border-radius:0.2rem;
            top: 2rem;
            left: 3.7rem;
            padding: 0.9rem;
            box-sizing: border-box;
            border: 1px solid #71B2EF
        }

        .add-edit-course-change .add-edit-course-change-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .add-edit-course-change-header .add-edit-course-change-header-flex {
            display: flex;
            align-items: center;
        }

        .add-edit-course-change-header .add-edit-course-change-header-flex img {
            width: 0.95rem;
            height: 0.95rem;
            margin-right: 0.9rem
        }

        .add-edit-course-change-header .add-edit-course-change-header-flex p {
            font-size: 0.9rem
        }

        .add-edit-course-change .add-edit-course-change-context {
            width: 29rem;
            height: 25.8rem;
            border: 1px solid #71B2EF;
            box-sizing: border-box;
            margin-top: 0.8rem;
            padding: 0 0.9rem 0 0.9rem;
            background: white;
        }

        .add-edit-course-change-context .add-edit-course-change-context-pone {
            border-bottom: 1px solid #BFBFBF;
            padding: 0.7rem 0 0.7rem 0;
            font-size: 1rem;
            display: flex;
            justify-content: center;
            box-sizing: border-box;
        }

        .add-edit-course-change-context .add-edit-course-change-context-ptwo {
            border-bottom: 1px solid #BFBFBF;
            display: flex;
            justify-content: space-between;
            padding: 0.6rem 0 0.6rem 0;
        }

        .add-edit-course-change-context .add-edit-course-change-context-ptwo p:nth-child(1) {
            margin-left: 0.45rem;
            font-size: 0.8rem;
        }

        .add-edit-course-change-context .add-edit-course-change-context-ptwo p:nth-child(2) {
            margin-right: 0.45rem
        }

        .add-edit-course-change-context .add-edit-course-change-context-textarea {
            resize: none;
            width: 27rem;
            height: 5rem;
            margin-top: 0.85rem;
            border-radius: 0.2rem;
            padding: 0.6rem 0 0 0.4rem;
            box-sizing: border-box;
        }

        .add-edit-course-change-context .add-edit-course-change-context-footer {
            display: flex;
            justify-content: center;
            margin-top: 0.9rem
        }

        .add-edit-course-change-context-footer .add-edit-course-change-context-footer-pone {
            width: 5rem;
            height: 1.8rem;
            background: #71B2EF;
            font-size: 0.9rem;
            text-align: center;
            line-height: 1.8rem;
            border-radius: 0.2;
            color: white
        }

        .add-edit-course-change-context-footer .add-edit-course-change-context-footer-ptwo {
            width: 5rem;
            height: 1.8rem;
            font-size: 0.9rem;
            text-align: center;
            line-height: 1.8rem;
            border-radius: 0.2rem;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            margin-left: 0.9rem
        }

        /* /////////////////////////////////////////////////////////表单的第一个按钮 */
        .course-arranging-table .course-arranging-not-table-checkbox {
            width: 0.8rem;
            height: 0.8rem;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
        }

        .course-arranging-table .course-arranging-not-table-checkbox img {
            width: 0.8rem;
            height: 0.8rem;
            margin-left: -0.05rem;
            margin-top: -0.05rem;
        }

        .course-arranging-footer {
            display: flex;
            margin-top: 0.85rem;
            height: 1.3rem;
            display: flex;
            align-items: center;
            padding-left: 0.7rem;
        }

        .course-arranging-not-table-checkbox {
            width: 0.8rem;
            height: 0.8rem;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
            line-height: 0.7rem;
        }

        .course-arranging-not-table-checkbox img {
            width: 0.8rem;
            height: 0.8rem;
            margin-top: -0.05rem;
            margin-left: -0.05rem;
        }

        .course-arranging-not-table-checkbox1 {
            width: 0.8rem;
            height: 0.8rem;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
            line-height: 0.7rem;
        }

        .course-arranging-not-table-checkbox1 img {
            width: 0.8rem;
            height: 0.8rem;
            margin-top: -0.05rem;
            margin-left: -0.05rem;
        }

        /* ///////////////////////////////////////////// */

        /* 111111111111111111111111 */
        .course-arranging-footer .course-arranging-not-footer-ptwo {
            width: 4rem;
            height: 1.3rem;
            border: 1px solid #BFBFBF;
            margin-left: 0.45rem;
            font-size: 0.6rem;
            color: #444444;
            text-align: center;
            line-height: 1.3rem;
            border-radius: 0.1rem;
        }

        /* ////////////////////////////////// */

        /* 22222222222222222222222222222 */
        /* .edit-course-context-flex .edit-course-not-context-three-pp {
            width: 35px;
            height: 32px;
            background: #71B2EF;
            border-radius: 0 4px 4px 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .edit-course-context-flex .edit-course-not-context-three-pp img {
            width: 15px;
            height: 14px
        } */

        /* ////////////////////////////////// */

        /* /////////////////////////////////////////////////////// 支付按钮的显示隐藏*/


        .edit-course-context-flex3 .paypay-not {
            width: 1.05rem;
            height:1.05rem;
            margin-left: 2.2rem;
            margin-right: 0.9rem
        }

        .edit-course-context-flex3 .paypay-not .paypay-not-show {
            width: 1.05rem;
            height: 1.05rem
        }

        .edit-course-context-flex3 .paypay-not .paypay-not-hidden {
            width: 1.05rem;
            height: 1.05rem;
            display: none;
        }


        /* ////////////////////////////////////////////// */

        /* 111111111111111111111111111 */
        .edit-course-footer #edit-course-not-footer-pone {
            width: 4.4rem;
            height: 1.75rem;
            border-radius: 0.2rem;
            background: #71B2EF;
            font-size: 0.8rem;
            text-align: center;
            line-height: 1.75rem;
            color: white
        }

        .edit-course-footer #edit-course-not-footer-ptwo {
            width: 4.4rem;
            height: 1.75rem;
            border-radius: 0.2rem;
            border: 1px solid #BFBFBF;
            font-size: 0.8rem;
            text-align: center;
            line-height: 1.75rem;
            margin-left: 1.3rem
        }

        /* /////////////////////////// */

        /* //////////////////////////////////////// aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa*/

        .add-edit-course-header-context-twoflex .add-edit-course-not-header-context-two-ptwo {
            width: 3.1rem;
            height: 1.05rem;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.05rem;
            margin-left: 0.9rem;
            margin-bottom: 0.9rem;
            box-sizing: border-box;
        }

        .add-edit-course-header-context-twoflex .add-edit-course-not-header-context-two-ptwo img {
            position: relative;
            top: -1.5rem;
            left: 1.5rem;
            display: none
        }

        /* /////////////////////////////////////// xianshi-notxianshi-not*/

        .aechctp-not-active {
            border: 1px solid #71B2EF;
            box-sizing: border-box;
        }

        /* ///////////////////////////////////////// */

        /* .add-edit-course-header-context .add-edit-course-header-context-three {
            width: 324px;
            display: flex;
            justify-content: center;
            padding: 15px 0 15px 0;
            position: fixed;
            top: 610px;
            background: white;
        } */

        /* /////////////////////////////////////222222222222222222 */
        .add-edit-course-header-context-three #add-edit-course-header-not-context-three-pone {
            width: 3.35rem;
            height: 1.3rem;
            background: #71B2EF;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.3rem;
            color: white
        }

        .add-edit-course-header-context-three #add-edit-course-header-context-not-three-ptwo {
            width: 3.35rem;
            height: 1.3rem;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.3rem;
            border: 1px solid #BFBFBF;
            margin-left: 1rem
        }

        /* /////////////////////////////////// */

        /* ////////////////////////////////ppppppppppppppppp */
        .add-course-not-name-context-p {
            padding: 0.4rem 0.5rem 0.4rem 0.5rem;
            background: #F5F5F5;
            border-radius: 0.2rem;
            margin-left: 0.9rem;
            margin-bottom: 0.65rem;
            
        }

        .add-course-not-name-context-p-active {
            background: #71B2EF;
            color: white
        }

        /* //////////////////////////////////////// */
        .add-course-name-context .add-course-name-context-bottom {
            display: flex;
            justify-content: center;
            padding: 1.3rem 0 1.3rem 0;
            box-sizing: border-box;
            position: fixed;
            bottom: 15.5rem;
            left: 29.3rem
        }

        /* ///////////////////////111111111111111111111111111 */
        .add-course-name-context-bottom #add-course-not-name-context-bottom-pone {
            width: 4.4rem;
            height: 1.75rem;
            background: #71B2EF;
            border-radius: 0.2rem;
            font-size: 0.8rem;
            color: white;
            text-align: center;
            line-height: 1.75rem;
        }

        .add-course-name-context-bottom #add-course-not-name-context-bottom-ptwo {
            width: 4.4rem;
            height: 1.75rem;
            border-radius:0.2rem;
            font-size: 0.8rem;
            text-align: center;
            line-height: 1.75rem;
            border: 1px solid #BFBFBF;
            margin-left: 1.3rem
        }

        /* ///////////////////////// */

        /* ////////////////////////////////////////////////// paypaypay*/

        .add-edit-course-label-context-flexone .paypaypay-not {
            margin-right: 0.65rem;
            margin-left: 3.5rem;
            
        }

        .add-edit-course-label-context-flexone .paypaypay-not:nth-child(1) {
            margin-right: 0.65rem;
            margin-left: 0
        }

        /* /////////////////////////////////////////////////// */

        /* 111111111111111111111111 */
        .add-edit-course-label-context-footer #add-edit-course-label-not-context-footer-pone {
            width: 4.4rem;
            height: 1.75rem;
            background: #71B2EF;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.75rem;
            font-size: 0.8rem;
            color: white
        }

        .add-edit-course-label-context-footer #add-edit-course-label-not-context-footer-ptwo {
            width: 4.4rem;
            height: 1.75rem;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.75rem;
            margin-left: 1.3rem;
        }

        /* //////////////////////////// */

        .coach-manage-addthree-flexthree-flex {
            padding: 1.25rem 1.25rem 0 0.35rem;
            box-sizing: border-box;
        }

        .coach-manage-addthree-flexthree-flex-p {
            margin: 0 0 1rem 0.9rem;
            font-size: 0.9rem;
            color: black
        }

        .addthree-flexfour {
            display: flex;
            flex-wrap: wrap;
        }

        .flexthree-tags1 {
            padding: 0.5rem;
            border-radius: 0.2rem;
            background: #F5F5F5;
            margin-left: 0.9rem;
            height: 1.5rem;
            box-sizing: border-box;
            margin-bottom: 0.9rem;
            display: flex;
            align-items: center;
            cursor: pointer;
            font-size: 0.7rem
        }

        .active1 {
            background: #71B2EF;
            color: white
        }

        .add-course-name-context-bottom1{
            width:31.35rem;
            background: white;
            top:32.55rem;
            display: flex;
            justify-content: center;
            padding: 1.3rem 0 1.3rem 0;
            box-sizing: border-box;
            position: fixed;
        }

        .add-course-name-context-bottom1 #add-course-name-context-bottom-pone {
            width: 4.4rem;
            height: 1.75rem;
            background: #71B2EF;
            border-radius: 0.2rem;
            font-size: 0.8rem;
            color: white;
            text-align: center;
            line-height: 1.75rem;
        }

        .add-course-name-context-bottom1 #add-course-name-context-bottom-ptwo {
            width: 4.4rem;
            height: 1.75rem;
            border-radius: 0.2rem;
            font-size: 0.8rem;
            text-align: center;
            line-height: 1.75rem;
            border: 1px solid #BFBFBF;
            margin-left: 1.3rem
        }

        /* .add-course-name-context-flex{
            height: 600px;
            padding-bottom: 100px;
            overflow-y: scroll;
            box-sizing: border-box;
        } */

        #add-course-name-context-flex-coursename{
            padding-bottom:5rem;
            box-sizing: border-box;
        }

        .select-menu-input-coursename-div{
            width:12.5rem;
            height:1.8rem;
            border-radius: 0.2rem;
            border:1px solid #BFBFBF;
            margin-left:3.7rem;
            display:flex;
            justify-content: left;
            align-items: center;
        }

        .select-menu5 {
            cursor: pointer;
            width: 12.5rem;
            height: 1.8rem;
            box-sizing: border-box;
        }

        .select-menu5 .select-menu-ul1 {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 12.5rem;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .select-menu5 .select-menu-ul1 li {
            height: 1.8rem;
            font-size: 0.7rem;
            padding: 0 0.75rem;
            box-sizing: border-box;
            line-height: 1.8rem;
        }

        .select-menu5 .select-menu-ul1 li:hover {
            background: #f2f2f2;
        }

        .select-menu5 .select-menu-div1 {
            position: relative;
            height: 1.8rem;
            width: 12.5rem;
            border: 1px solid #ddd;
            border-radius: 0.2rem;
            box-sizing: border-box;
            line-height: 1.8rem;
        }

        .select-menu5 .select-menu-ul1 .select-this1 {
            background: #71B2EF;
        }

        .select-menu5 .select-menu-ul1 .select-this:hover {
            background: #71B2EF !important;
        }

        .select-menu5 .select-menu-div1 .select-menu-img1 {
            width: 0.6rem;
            height: 0.4rem;
            margin-right: 0.5rem;
            position: absolute;
            right: 0;
            top: 0.5rem;
        }

        .select-menu5 .select-menu-div1 .select-menu-input1 {
            padding-left: 0.7rem;
            border: 0;
            width: 6.5rem;
            height: 1.5rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem
        }
    </style>
</head>

<body>
    <div class="course-arranging-header-one">
        <p id="course-arranging-header-one-pone" class="course-arranging-header-one-pone-active">待发布</p>
        <p id="course-arranging-header-one-ptwo">已发布</p>
    </div>
    <div class="course-arranging-body" id="course-arranging-body-left">
        <div class="course-arranging-header-two"></div>
        <div class="course-arranging-header-three">
            <p id="leadlead">导入课程</p>
            <input id="filelead" style="display:none" accept=".xlsx,.xls" type="file" onchange="filelead()">
            <p id="addaddadd">新增</p>
            <p id='publishpublish'>发布</p>
        </div>
        <div class="course-arranging-flex">
            <div style="font-size:16px;margin-right:10px">上课门店</div>
            <div class="course-arranging-flex-select-zero">
                <div class="select-menu">
                    <div class="select-menu-div">
                        <input class="select-menu-input" id="select-menu-input-mendian" style="width:5rem"/>
                
                        <img class="select-menu-img" src="./image/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul-pulishmendian" style="height:10rem;overflow-y: scroll;">

                    </ul>
                </div>
            </div>
            <div style="font-size:0.8rem;margin-right:0.5rem">上课房间</div>
            <div class="course-arranging-flex-select-one">
                <div class="select-menu">
                    <div class="select-menu-div" id="select-menu-div-room">
                        <input class="select-menu-input" id="select-menu-input-room" />
                
                        <img class="select-menu-img" src="./image/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul-room" style="height:10rem;overflow-y: scroll;">
                
                    </ul>
                </div>
            </div>
            <div style="font-size:0.8rem">上课教练</div>
            <input class="course-arranging-flex-select-two" id="teaching-course-coach"></input>
            <div style="font-size:0.8rem">教练工号</div>
            <input class="course-arranging-flex-select-three" id="coach-id"></input>
            <div style="font-size:0.8rem">创建时间</div>
            <div class="J-datepicker-day">
                <input type="text" class="course-arranging-flex-input-one" id="create-course-time" placeholder="开始时间">
            </div>
            <p>-</p>
            <div class="J-datepicker-day">
                <input type="text" class="course-arranging-flex-input-two" id="end-course-time" placeholder="结束时间">
            </div>
        </div>
        <div class="course-arranging-flextwo">
            <div class="course-arranging-flexthree">
                <p id="publish-search">查询</p>
                <p id="cxsx">清除</p>
            </div>
            <p class="course-arranging-flextwo-pthree" id='derivederive'>导出课程</p>
        </div>
        <div class="course-arranging-table" id="course-arranging-table"></div>
        <div class="course-arranging-footer">
            <div class="course-arranging-table-checkbox" id="course-arranging-table-checkbox-all">
                <img style="display:none" src="./image/codeallset_btn.png">
            </div>
            <div class="course-arranging-footer-pone">当页全选</div>
            <div class="course-arranging-footer-pone">已选课程<span></span></div>
            <div class="course-arranging-footer-ptwo" id="recommended">推荐</div>
            <div class="course-arranging-footer-ptwo" id="qx-recommended">取消推荐</div>
            <div class="course-arranging-footer-ptwo" id="tiebiao-show">贴标</div>
            <div class="course-arranging-footer-ptwo" id="shanchudel">删除</div>
            <div class="course-arranging-footer-pthree"></div>
        </div>
        <div class="edit-course" id="edit-course1">

        </div>
        <div class="add-edit-course" id="add-edit-course1">

        </div>

        <div class="add-edit-course-label" id="add-edit-course-label1" style="display:none">

        </div>

        <div class="box" id="boxpage"></div>
    </div>

    <div class="course-arranging-body" id="course-arranging-body-right" style="display:none">
        <div class="course-arranging-header-two"></div>
        <div class="course-arranging-flex">
            <div style="font-size:0.8rem;margin-right:0.5rem">上课门店</div>
            <div id="course-arranging-not-flex-select-one">
                <div class="select-menu" id="select-menu">
                    <div class="select-menu-div" id="select-menu-div1">
                        <input class="select-menu-input" id="select-menu-input-mendian2" style="width:5rem" />
                
                        <img class="select-menu-img" src="./image/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul-pulishmendian1" style="height:10rem;overflow-y: scroll;">
                
                    </ul>
                </div>
            </div>
            <div style="font-size:0.8rem;margin-right:0.5rem">上课房间</div>
            <div class="course-arranging-not-flex-select-one">
                <div class="select-menu">
                    <div class="select-menu-div" id="select-menu-div-room1">
                        <input class="select-menu-input" id="select-menu-input-room1" />
                
                        <img class="select-menu-img" src="./image/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul-room1" style="height:10rem;overflow-y: scroll;">
                
                    </ul>
                </div>
            </div>
            <div style="font-size:0.8rem">上课教练</div>
            <input class="course-arranging-flex-select-two" id="teaching-course-coach1"/>
            <div style="font-size:0.8rem">教练工号</div>
            <input class="course-arranging-flex-select-three" id="coach-id1"/>
            <div style="font-size:0.8rem">创建时间</div>
            <div class="J-datepicker-day1">
                <input type="text" class="course-arranging-flex-input-one" id="create-course-time1" placeholder="开始时间">
            </div>
            <p>-</p>
            <div class="J-datepicker-day1">
                <input type="text" class="course-arranging-flex-input-two" id="end-course-time1" placeholder="结束时间">
            </div>
        </div>
        <div class="course-arranging-flextwo">
            <div class="course-arranging-flexthree">
                <p id="publish-search1">查询</p>
                <p id="cxsx2">清除</p>
            </div>
            <p class="course-arranging-flextwo-pthree" id='derivederive11'>导出课程</p>
        </div>
        <div class="course-arranging-table" id="course-arranging-table2"></div>
        <!-- <div class="course-arranging-footer">
            <div class="course-arranging-not-table-checkbox">
                <img style="display:none" src="./image/codeallset_btn.png">
            </div>
            <div class="course-arranging-footer-pone">当页全选</div>
            <div class="course-arranging-footer-pone">已选课程<span>115</span></div>
            <div class="course-arranging-not-footer-ptwo">贴标</div>
            <div class="course-arranging-not-footer-ptwo">删除</div>
            <div class="course-arranging-footer-pthree"></div>
        </div> -->
        <div class="edit-course" id="edit-course2">

        </div>
        <div class="add-edit-course" id="add-edit-course2">

        </div>

        <div class="add-course-name" id="add-course-name">

        </div>

        <div class="add-edit-course-label" id="add-edit-course-label" style="display:none">

        </div>

        <!-- <div class="add-edit-course-change" id="add-edit-course-change" style="display:none">

        </div> -->

        <div class="box" id="boxpage1"></div>
    </div>
</body>

<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>
<script type="text/javascript">

    $('#derivederive').click(function(){

            // var clubid = $('#clubId').val()
            // var userCode = $('#usernum').val();
            // var userName = $('#username').val();
            // var data = {
            //     club: clubid,
            //     user: userCode,
            //     name: userName
            // }

            // var storeId = ''

            // if ($('#select-menu-input-mendian').val() == "全部") {
            //     alert('请选择门店')
            //     return;
            // } else {
            //     for (var i = 0; i < $('#select-menu-ul-pulishmendian').children().length; i++) {
            //         if ($('#select-menu-ul-pulishmendian').children().eq(i).html() == $('#select-menu-input-mendian').val()) {
            //             storeId = $('#select-menu-ul-pulishmendian').children().eq(i).attr('class').split(' ')[0]
            //         }
            //     }
            // }

            startDate = $('#create-course-time').val()

            endDate = $('#end-course-time').val()

            console.log(startDate,endDate)

            // var clubid = $('#clubId').val()
            // var userCode = $('#usernum').val();
            // var userName = $('#username').val();
            var data = {
                strParam3 : startDate,
                strParam4 : endDate
            }
            $.ajax({
                type: "post",
                url: "https://test.physicalclub.com/crm/rest/coach/coursetime/exportReport",
                async: false,
                //contentType: "application/json;charset=UTF-8",
                dataType: "json",
                data: data,
                success: function (res) {
                    if (res.status) {
                        window.open(res.message);
                    }
                },
                error: function (res) {
                    console.log(res)
                }
            });

            // $.ajax({
            //     type: "get",
            //     url: "http://test.physicalclub.com/rest/courseScheduling/exportCourseScheduling?storeId="+storeId,
            //     async: false,
            //     //contentType: "application/json;charset=UTF-8",
            //     dataType: "json",
            //     success: function (res) {
            //         if (res.status) {
            //             window.open(res.message);
            //         }
            //     },
            //     error: function (res) {
            //         console.log(res)
            //     }
            // });

        // var storeId = ''
        // var roomId = ''
        // var realName = ''
        // var userName = ''
        // var startDate = ''
        // var endDate = ''

        // if ($('#select-menu-input-mendian').val() == "全部") {
        //     alert('请选择门店')
        //     return;
        // } else {
        //     for (var i = 0; i < $('#select-menu-ul-pulishmendian').children().length; i++) {
        //         if ($('#select-menu-ul-pulishmendian').children().eq(i).html() == $('#select-menu-input-mendian').val()) {
        //             storeId = $('#select-menu-ul-pulishmendian').children().eq(i).attr('class').split(' ')[0]
        //         }
        //     }
        // }

        // if ($('#select-menu-input-room').val() == '') {
        //     roomId = ''
        // } else {
        //     for (var i = 0; i < $('#select-menu-ul-room').children().length; i++) {
        //         if ($('#select-menu-ul-room').children().eq(i).html() == $('#select-menu-input-room').val()) {
        //             roomId = $('#select-menu-ul-room').children().eq(i).attr('class')
        //             //roomId = "c0f6b689-0375-4d7c-b1f8-01b86d55e57a"
        //         }
        //     }
        // }

        // realName = $('#teaching-course-coach').val()

        // userName = $('#coach-id').val()

        // startDate = $('#create-course-time').val()

        // endDate = $('#end-course-time').val()

        //location.href = 'http://test.physicalclub.com/rest/courseScheduling/exportCourseScheduling?storeId='+storeId

        // var derivederive = {
        //     storeId : storeId,
        //     roomId : roomId,
        //     realName : realName,
        //     userName : userName,
        //     startDate : startDate,
        //     endDate : endDate
        // }

        // $.ajax({
        //     url: 'http://test.physicalclub.com/rest/courseScheduling/exportCourseScheduling?storeId='+storeId,
        //     type: 'GET',
        //     success: function (result) {
        //         console.log(result)
        //     },
        //     error: function (e) {
        //         console.log(e.status)
        //     }
        // })
    })

    $('#leadlead').click(function(){
        $('#filelead').click()
    })

    function filelead(){
        if ($("#filelead").val() == '') {
            return;
        }

        let file = $("#filelead").val()
        let filename = file.substr(file.lastIndexOf("."));
        if (filename != '.xlsx' && filename != '.xls') {
            alert("请上传excel格式的文件");
            return;
        }

        var formData = new FormData();
        // for (var i = 0; i < $('#preview1').children().length; i++) {
        formData.append('file', document.getElementById('filelead').files[0])
        // }
        $.ajax({
            url: "http://test.physicalclub.com/rest/courseScheduling/insertImportCourseScheduling",
            type: "post",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                console.log(data)
                //var img = data
                //return data
                console.log(data)
            },
            error: function (data) {
                alert("上传失败")
            }
        });
    }

    //新增
    $('#addaddadd').click(function () {

            $('#edit-course1').show()

            var editstr;
            var addeditstr;
            var acn_str;
            var aecl_str;
            //新增窗口的动态渲染
            editstr = `
                    <div class="edit-course-header">
                        <div class="edit-course-header-one">
                            <img class="edit-course-header-imgone" src="./image/editor_icon.png" alt="" />
                            <p class="edit-course-header-pone">新增未发布</p>
                        </div>
                        <img class="edit-course-header-imgone" style="width:1.1rem;height:1.15rem" id="edit-course-hide" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="edit-course-context">
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one" style="margin-right:5.55rem">门店</div>
                            <div id="edit-course-context-first">
                                <div class="select-menu5">
                                    <div class="select-menu-div1" id="select-menu-div-mendian">
                                        <input class="select-menu-input1" id="select-menu-input-mendian11" value=""/>
                                        <img class="select-menu-img1" src="./image/sifting_icon.png"/>
                                    </div>
                                    <ul class="select-menu-ul1" id="select-menu-ul-one" style="height:10rem;overflow-y:scroll">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one" style="margin-right:5.55rem">房间</div>
                            <div id="edit-course-context-second">
                                <div class="select-menu5">
                                    <div class="select-menu-div1" id="select-menu-div-inputroom2">
                                        <input class="select-menu-input1" id="select-menu-inputroom2" value=''/>
                                        <img class="select-menu-img1" src="./image/sifting_icon.png"/>
                                    </div>
                                    <ul class="select-menu-ul1" id="select-menu-ul-RoomList" style="height:10rem;overflow-y:scroll">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one">课程名称</div>
                            <div class="select-menu-input-coursename-div">
                                <input id="select-menu-input-coursename" style="margin-left:0.5rem;border:0;font-size:0.7rem"/>   
                            </div> 
                        </div>
                        <div class="edit-course-context-flextwo">
                            <div class="edit-course-context-one">上课教练</div>
                            <div class="edit-course-context-twoall" id="all-coach">
                                
                            </div>
                            <p class="edit-course-context-three" id="edit-course-addadd">添加</p>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one">上课日期</div>
                            <div style="width:7.5rem;height:1.8rem;border:1px solid #BFBFBF;border-radius:0.2rem;margin:0 2.95rem 0 3.85rem">
                            <input id="edit-course-context-three" style="width:7.5rem;height:1.8rem;border:0;padding-left:0.5rem;box-sizing:border-box"></input>
                            </div>
                            <p style="font-size:0.9rem;margin-right:0.9rem">上课时间</p>
                            <div style="width:6rem;height:1.8rem;border:1px solid #BFBFBF;border-radius:0.2rem;">
                            <input id="edit-course-context-four" style="width:6rem;height:1.8rem;border:0;padding-left:0.5rem;box-sizing:border-box"></input>
                            </div>
                            <p style="margin:0 0.3rem 0 0.3rem">-</p>
                            <div style="width:6rem;height:1.8rem;border:1px solid #BFBFBF;border-radius:0.2rem;">
                            <input id="edit-course-context-five" style="width:6rem;height:1.8rem;border:0;padding-left:0.5rem;box-sizing:border-box"></input>
                            </div>
                        </div>

                        <div class="edit-course-context-flex3">
                            <p class="edit-course-context-flex3-pone">课程售价</p>
                            <div class="add-course-sortone-inputtwo">
                                <p>￥</p>
                                <input type="text" id="course-price">
                            </div>
                            <p class="edit-course-context-flex3-ptwo">标准价</p>
                            <div class="add-course-sortone-inputthree">
                                <p>￥</p>
                                <p class="add-course-sortone-inputthree-input">188.00</p>
                            </div>
                        </div>

                        <div class="edit-course-context-flex3">
                            <p class="edit-course-context-flex3-pone">开课人数</p>
                            <div class="add-course-sortone-inputtwo">
                                <input type="text" id="mincount">
                            </div>
                            <p style="margin-left:-1rem;margin-right:0.4rem;">人</p>
                            <p class="edit-course-context-flex3-ptwo">最大人数</p>
                            <div class="add-course-sortone-inputthree" style="margin-left:0.85rem;">
                                <input type="text" id="maxcount" style="text-decoration:none;color:black">
                            </div>
                            <p style="margin-left:-1rem">人</p>
                        </div>

                        <div class="edit-course-context-flex3" id="is-Queue">
                            <p class="edit-course-context-flex3-pone" style="margin-right:1.75rem">是否排队</p>
                            <div class="paypay paypayisQueue">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">是</p>
                            <div class="paypay paypayisQueue">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">否</p>
                        </div>

                        <div class="edit-course-context-flex3" id="tag-Name">
                            <p class="edit-course-context-flex3-pone" style="margin-right:3.5rem">贴标</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">无</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">热门</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">体验</p>
                        </div>
                        <div class="edit-course-context-flex4">
                            <p class="edit-course-context-flex4-pone">业绩比例</p>
                            <div class="edit-course-context-flex4-ptwo" id="coach-performance">
                                
                            </div>
                        </div>

                        <div class="add-course-name" id="add-course-name1">

                        </div>

                        <div class="edit-course-footer">
                            <p id="edit-course-footer-pone" class="addcfpone">保存</p>
                            <p id="edit-course-footer-ptwo" class="addcfptwo">取消</p>
                        </div>
                        </div>
                    </div>
                `
            //添加教练窗口的动态渲染
            addeditstr = `
                    <div class="add-edit-course-header">
                        <div class="add-edit-course-header-one">
                            <img class="add-edit-course-header-imgone" src="./image/editor_icon.png" alt="" />
                            <p class="add-edit-course-header-pone">添加教练</p>
                        </div>
                        <img class="add-edit-course-header-imgone" id="add-edit-course-hide" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="add-edit-course-header-context">
                        <div class="add-edit-course-header-context-one">
                            <div class="add-edit-course-header-context-oneflex">
                                <input / id="search-value">
                                <div class="add-edit-course-header-context-one-blue">
                                    <img src="./image/search_btn.png" alt=""/ id="search-search">
                                </div>
                            </div>
                        </div>
                        <div class="add-edit-course-header-context-one" id="coach-show" style="justify-content: left;padding-left:1.1rem">

                        </div>
                        <div class="add-edit-course-header-context-two">
                            <p class="add-edit-course-header-context-two-pone">已选择教练</p>
                            <div class="add-edit-course-header-context-twoflex" id="select-coach">
                                
                            </div>
                        </div>
                        <div class="add-edit-course-header-context-three">
                            <p id="add-edit-course-header-context-three-pone">确定</p>
                            <p id="add-edit-course-header-context-three-ptwo">取消</p>
                        </div>
                    </div>
                `
            acn_str = `
                    <div class="add-course-name-header">
                        <div class="add-course-name-header-left">
                            <img src="./image/tags_icon.png" alt=""/>
                            <p>课程名称</p>
                        </div>
                        <img style="width:1.1rem;height:1.1rem" id="add-course-name-header-img" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="add-course-name-context">
                        <div class="add-course-name-context-flex" id="add-course-name-context-flex-coursename">
                            
                        </div>
                        <div class="add-course-name-context-bottom1">
                            <p id="add-course-name-context-bottom-pone">确定</p>
                            <p id="add-course-name-context-bottom-ptwo">取消</p>
                        </div>
                    </div>
                `

            $('#edit-course1').html(editstr)
            $('#add-edit-course1').html(addeditstr)
            $('#add-course-name1').html(acn_str)

            // $('#select-menu-input-coursename').click(function(){
            //     $('#add-course-name1').show()
            // })

            //添加教练的叉叉关闭
            $('#add-edit-course-hide').click(function () {
                $(this).parent().parent().hide()
            })

            //添加教练的点击取消事件
            $('#add-edit-course-header-context-three-ptwo').click(function () {
                $(this).parent().parent().parent().hide()
            })

            //教练课程的显示隐藏
            $('.add-course-name-context-p').click(function () {
                $('.add-course-name-context-p').each(function () {
                    $(this).removeClass('add-course-name-context-p-active')
                })
                $(this).addClass('add-course-name-context-p-active')
            })

            //新增窗口的叉叉关闭
            $('#edit-course-hide').click(function () {
                $(this).parent().parent().hide()
                $('.paypay').each(function () {
                    $(this).children('.paypay-show').hide()
                    $(this).children('.paypay-hide').show()
                })
            })

            //新增窗口的取消关闭
            $('#edit-course-footer-ptwo').click(function () {
                $(this).parent().parent().parent().hide()
                $('.paypay').each(function () {
                    $(this).children('.paypay-show').hide()
                    $(this).children('.paypay-hide').show()
                })
            })

            //新增窗口单选框的显示及排他
            $(".paypay").click(function () {
                $(this).parent().children('.paypay').removeClass('1')
                $(this).parent().children('.paypay').children('.paypay-show').hide()
                $(this).parent().children('.paypay').children('.paypay-hidden').show()
                if ($(this).children('.paypay-hidden').is(":hidden")) {
                    $(this).children('.paypay-hidden').show()
                    $(this).children('.paypay-show').hide()
                } else {
                    $(this).children('.paypay-hidden').hide()
                    $(this).children('.paypay-show').show()
                    $(this).addClass('1')
                }
            })
            console.log($('#select-menu-input-mendian11').val())
            setTimeout(() => {
                console.log($('#select-menu-input-mendian11').val())
                setTimeout(() => {
                    $('#select-menu-input-mendian11').val(' ')
                    $('#select-menu-inputroom2').val(' ')
                }, 100);
                
            }, 100);
            

            setTimeout(() => {

                //门店列表渲染
                setTimeout(() => {
                    var strfirstfirst = '';
                    $.ajax({
                        url: 'http://test.physicalclub.com/rest/club/getClubInfo',
                        type: 'GET',
                        dataType: 'json',
                        success: function (data) {
                            $.each(data.rows, function (i, item) {
                                strfirstfirst += `
                                    <li class="`+ item.clubId + `">` + item.clubName + `</li>
                                `
                            })
                            
                                $('#select-menu-ul-one').html(strfirstfirst)
                                //console.log(222)
                        },
                        error: function (msg) {
                            console.log(msg)
                        }
                    })

                }, 100);

                //房间列表渲染

                setTimeout(() => {

                $('#select-menu-div-inputroom2').click(function(){
                        console.log(11)
                            setTimeout(() => {
                                var storeId = ''
                                if ($('#select-menu-input-mendian11').val() == "全部") {
                                    storeId = ''
                                } else {
                                    for (var i = 0; i < $('#select-menu-ul-one').children().length; i++) {
                                        if ($('#select-menu-ul-one').children().eq(i).html() == $('#select-menu-input-mendian11').val()) {
                                            storeId = $('#select-menu-ul-one').children().eq(i).attr('class')
                                            var storeId1 = storeId.split(' ')[0]
                                        }
                                    }
                                    // var RoomList = { clubId: storeId1 }
                                    // console.log(RoomList)
                                    $.ajax({
                                        url: 'http://test.physicalclub.com/crm/rest/club/getClubRoomList?clubId='+storeId1,
                                        type: 'POST',
                                        success: function (result) {
                                            console.log(result)
                                            var strsecond = ''

                                            for (var i = 0; i < result.rows.length; i++) {
                                                strsecond += `
                                                                    <li class="`+ result.rows[i].roomId + `">` + result.rows[i].roomName + `</li>
                                                                `
                                            }

                                            setTimeout(() => {
                                                $('#select-menu-ul-RoomList').html(strsecond)
                                            }, 100);
                                        },
                                        error: function (e) {
                                            console.log(e.status)
                                        }
                                    })
                                }

                            }, 100);
                    })
                    
                }, 100);

                //课程名称的请求及渲染
                $('#select-menu-input-coursename').click(function () {
                    $('#add-course-name1').show()

                    var ad_ft1 = '';

                    $.ajax({
                        type: 'GET',
                        contentType: "application/json;charset=UTF-8",
                        url: "http://test.physicalclub.com/crm/rest/leagueCurriculum/getReleaseLeagueCurriculumListGroupByType",
                        success: function (results) {
                            console.log(results)
                            var result = results.rows
                            //console.log(list)
                            for (var i = 0; i < result.length; i++) {
                                var ad_str2 = '';
                                for (var j = 0; j < result[i].children.length; j++) {
                                    ad_str2 += `
                                                    <div class="flexthree-tags1 `+ result[i].children[j].id + `">
                                                        `+ result[i].children[j].name + `
                                                    </div>
                                                `
                                }

                                ad_ft1 += `
                                                <div class="coach-manage-addthree-flexthree-flex">
                                                    <p class="coach-manage-addthree-flexthree-flex-p">`+ result[i].classifyName + `</p>
                                                    <div class="addthree-flexfour">
                                                    `+ ad_str2 + `
                                                    </div>
                                                </div>  
                                            `

                            }
                            setTimeout(() => {
                                $('#add-course-name-context-flex-coursename').html(ad_ft1)

                                $('.flexthree-tags1').click(function () {
                                    $('#add-course-name-context-flex-coursename').children().children('.addthree-flexfour').children('.flexthree-tags1').removeClass('active1')
                                    if ($(this).hasClass('active1')) {
                                        setTimeout(() => {
                                            $(this).removeClass('active1')
                                        }, 50);

                                    } else {
                                        setTimeout(() => {
                                            $(this).addClass('active1')
                                        }, 50);
                                    }
                                })

                                //console.log(list)
                                console.log(result)
                                for (var i = 0; i < result.length; i++) {
                                    for (var j = 0; j < result[i].children.length; j++) {
                                        if (result[i].children[j].name == $('#select-menu-input-coursename').val()) {
                                            $('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).click()

                                        }
                                        // console.log(111)
                                    }
                                }

                                $('#add-course-name-context-bottom-pone').click(function () {
                                    $(this).parent().parent().parent().hide()
                                    //$('#select-menu-input-coursename').val($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).html())
                                    //$('#select-menu-input-coursename').addClass($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).attr('class').split(' ')[1])

                                    for (var i = 0; i < $('#add-course-name-context-flex-coursename').children().length; i++) {
                                        for (var j = 0; j < $('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().length; j++) {
                                            if ($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).hasClass('active1')) {
                                                $('#select-menu-input-coursename').val($.trim($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).html()))
                                                $('#select-menu-input-coursename').attr('class',$('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).attr('class').split(' ')[1])
                                                //console.log($.trim($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).html()))
                                            }
                                        }
                                    }

                                })

                            }, 100);

                            //课程名称的取消和叉叉关闭页面
                            $('#add-course-name-header-img').click(function () {
                                $(this).parent().parent().hide()
                            })

                            // //课程名称的取消按钮事件
                            $('#add-course-name-context-bottom-ptwo').click(function () {
                                $(this).parent().parent().parent().hide()
                            })

                            // //课程名称页面的显示
                            // $('.edit-course-context-three-pp').click(function () {
                            //     $('#add-course-name1').show()
                            // })

                            // console.log($('#coach-manage-addthree-flexthree-list').html())
                        },
                        error: function (e) {
                            console.log(e.status);
                            console.log(e.responseText)
                        }
                    })
                })

                //点击添加按钮显示添加教练
                $('#edit-course-addadd').click(function () {
                    $('#add-edit-course1').show()
                    //教练选择页面
                    var strselect = ''
                    for (var i = 0; i < $('#all-coach').children().length; i++) {
                        strselect = `
                                <p class="add-edit-course-header-context-two-ptwo `+ $('#all-coach').children().eq(i).attr('class').split(' ')[1] + `">
                                    `+ $('#all-coach').children().eq(i).html() + `
                                    <img src="./image/classdel_btn.png" alt=""/>
                                </p>
                            `
                    }

                    $('#select-coach').html(strselect)

                    //添加教练鼠标移入事件
                    $('.add-edit-course-header-context-two-ptwo').mouseover(function () {
                        $(this).addClass('aechctp-active')
                        $(this).children('img').show()
                    })
                    //添加教练的鼠标移除事件
                    $('.add-edit-course-header-context-two-ptwo').mouseout(function () {
                        $(this).removeClass('aechctp-active')
                        $(this).children('img').hide()
                    })
                    //添加教练的标签，点击叉叉关闭
                    $('.add-edit-course-header-context-two-ptwo').children('img').click(function () {
                        $(this).parent().remove()
                    })

                    $('#search-search').click(function () {
                        setTimeout(() => {
                            $.ajax({
                                url: 'http://test.physicalclub.com/crm/rest/leagueCoach/getLeagueCoachByJobNumber/' + $('#search-value').val(),
                                type: 'GET',
                                dataType: 'json',
                                success: function (result) {
                                    console.log(result)
                                    //console.log(strselect)

                                    var strcoachone = `
                                            <p id="coach-p" class="`+ result.rows[0].userName + `" style="width:3.5rem;height:1.2rem;border-radius:0.2rem;background:#71B2EF;color:white;text-align:center;line-height:1.2rem">
                                            `+ result.rows[0].realName + `
                                            </p>
                                        `
                                    //点击查询渲染的教练名
                                    $('#coach-show').html(strcoachone)

                                    //var strselect = ''
                                    $('#coach-p').click(function () {
                                        //console.log(strselect)
                                        //console.log($('#select-coach').html())

                                        for (var i = 0; i < $('#select-coach').children().length; i++) {
                                            if ($.trim($('#coach-p').html()) == $.trim($('#select-coach').children().eq(i).text())) {
                                                return;
                                            }
                                            else{
                                                var strselect = ''
                                                for (var j = 0; j < $('#select-coach').children().length; j++) {
                                                    strselect += `
                                                        <p class="add-edit-course-header-context-two-ptwo `+ $('#select-coach').children().eq(j).attr('class').split(' ')[1] +`"> `+$.trim($('#select-coach').children().eq(j).text())+`<img src="./image/classdel_btn.png" alt=""/></p>
                                                    `
                                                }
                                            }
                                            
                                        }

                                        if($.trim($('#select-coach').html()) == ''){
                                            strselect = ''
                                        }

                                        // for (var i = 0; i < $('#select-coach').children().length; i++) {
                                        //     if ($.trim($('#coach-p').html()) !== $.trim($('#select-coach').children().eq(i).text())) {
                                        //         var strselect111 = ''
                                        //         for (var j = 0; j < $('#select-coach').children().length; j++) {
                                        //             strselect111 += `
                                        //                 <p class="add-edit-course-header-context-two-ptwo `+ $(this).attr('class') + `">
                                        //                     `+ $.trim($('#select-coach').children().eq(j).text()) + `
                                        //                     <img src="./image/classdel_btn.png" alt=""/>
                                        //                 </p>
                                        //             `
                                        //         }
                                        //         var strselect = strselect111
                                        //         console.log(strselect)
                                        //     }
                                        //     //console.log($.trim($('#select-coach').children().eq(i).text()))
                                        // }
                                        
                                        console.log(strselect)
                                        strselect += `
                                                    <p class="add-edit-course-header-context-two-ptwo `+ $(this).attr('class') +`">
                                                        `+ $(this).html() + `
                                                        <img src="./image/classdel_btn.png" alt=""/>
                                                    </p>
                                                `
                                        console.log(strselect)
                                            //点击查询出的教练名进行渲染
                                            setTimeout(() => {
                                            $('#select-coach').html(strselect)
                                            
                                            //console.log($('#select-coach').html())

                                            //console.log($('#select-coach').html())

                                            // for(var j=0;j< $('#select-coach').children().length;j++){
                                            //     for (var i = 1; i < $('#select-coach').children().length; i++) {
                                            //         if ($.trim($('#select-coach').children().eq(j).text()) == $.trim($('#select-coach').children().eq(i).text())) {
                                            //             $('#select-coach').children().eq(i).remove()
                                            //         }
                                            //     }
                                            // }

                                            //console.log($('#select-coach').html())

                                            
                                            //添加教练鼠标移入事件
                                            $('.add-edit-course-header-context-two-ptwo').mouseover(function () {
                                                $(this).addClass('aechctp-active')
                                                $(this).children('img').show()
                                            })
                                            //添加教练的鼠标移除事件
                                            $('.add-edit-course-header-context-two-ptwo').mouseout(function () {
                                                $(this).removeClass('aechctp-active')
                                                $(this).children('img').hide()
                                            })
                                            //添加教练的标签，点击叉叉关闭
                                            $('.add-edit-course-header-context-two-ptwo').children('img').click(function () {
                                                $(this).parent().remove()
                                            })
                                        }, 100);
                                    })

                                    //添加教练的点击确认事件
                                    $('#add-edit-course-header-context-three-pone').click(function () {
                                        $(this).parent().parent().parent().hide()
                                        var againcoach = ''
                                        for (var i = 0; i < $('#select-coach').children().length; i++) {
                                            againcoach += `
                                                        <p class="edit-course-context-twoone `+ $('#select-coach').children().eq(i).attr('class').split(' ')[1] + `">` + $('#select-coach').children().eq(i).text() + `</p>
                                                    `
                                        }
                                        $('#all-coach').html(againcoach)

                                        var strperformance = ''

                                        //比例的渲染
                                        if ($('#all-coach').children().length > 1) {
                                            for (var i = 0; i < $('#all-coach').children().length; i++) {
                                                strperformance += `
                                                            <div class="edit-course-context-flex4-pthree `+ $('#all-coach').children().eq(i).attr('class').split(' ')[1] + `">
                                                                <p class="edit-course-context-flex4-pfour">`+ $('#all-coach').children().eq(i).html() + `</p>
                                                                <input class="edit-course-context-flex4-pfive" />
                                                            </div>
                                                        `
                                            }
                                        } else {
                                            strperformance = ''
                                        }

                                        $('#coach-performance').html(strperformance)

                                    })
                                    console.log($('#select-coach').html())

                                },
                                error: function (e) {
                                    console.log(e.status)
                                }
                            })
                        }, 100);
                    })
                })

                setTimeout(() => {
                    //第一个下拉菜单的动态
                    $("#select-menu-input-mendian11").eq(0).val($(".select-this1").eq(0).html()); //在输入框中自动填充第一个选项的值
                    $("#select-menu-div-mendian").eq(0).on("click", function (e) {
                        e.stopPropagation();
                        if ($("#select-menu-ul-one").eq(0).css("display") === "block") {
                            setTimeout(() => {
                                $("#select-menu-ul-one").eq(0).hide();
                                $("#select-menu-div-mendian").eq(0).find("i").removeClass("select-menu-i");
                                $("#select-menu-ul-one").eq(0).animate({
                                    marginTop: "0",
                                    opacity: "0"
                                }, "fast");
                            }, 50);

                        } else {
                            setTimeout(() => {
                                $("#select-menu-ul-one").eq(0).show();
                                $("#select-menu-div-mendian").eq(0).find("i").addClass("select-menu-i");
                                $("#select-menu-ul-one").eq(0).animate({
                                    marginTop: "5px",
                                    opacity: "1"
                                }, "fast");
                            }, 50);

                        }
                        for (var i = 0; i < $("#select-menu-ul-one").length; i++) {
                            if (i !== 0 && $("#select-menu-ul-one").eq(i).css("display") === "block") {
                                setTimeout(() => {
                                    $("#select-menu-ul-one").eq(i).hide();
                                    $("#select-menu-div-mendian").eq(i).find("i").removeClass("select-menu-i");
                                    $("#select-menu-ul-one").eq(i).animate({
                                        marginTop: "0",
                                        opacity: "0"
                                    }, "fast");
                                }, 50);
                            }
                        }
                    });
                    $("#select-menu-ul-one").eq(0).on("click", "li", function () { //给下拉选项绑定点击事件
                        setTimeout(() => {
                            $("#select-menu-input-mendian11").eq(0).val($(this).html()); //把被点击的选项的值填入输入框中
                            $("#select-menu-div-mendian").eq(0).click();
                            $(this).siblings(".select-this1").removeClass("select-this1");
                            $(this).addClass("select-this1");
                        }, 50);

                    });
                    $("body").on("click", function (event) {
                        setTimeout(() => {
                            event.stopPropagation();
                            if ($("#select-menu-ul-one").eq(0).css("display") === "block") {
                                console.log(1);
                                $("#select-menu-ul-one").eq(0).hide();
                                $("#select-menu-div-mendian").eq(0).find("i").removeClass("select-menu-i");
                                $("#select-menu-ul-one").eq(0).animate({
                                    marginTop: "0",
                                    opacity: "0"
                                }, "fast");

                            }
                        }, 50);
                    });

                    //第二个下拉菜单的动态
                    $("#select-menu-inputroom2").eq(0).val($(".select-this1").eq(0).html()); //在输入框中自动填充第一个选项的值
                    $("#select-menu-div-inputroom2").eq(0).on("click", function (e) {
                        e.stopPropagation();
                        if ($("#select-menu-ul-RoomList").eq(0).css("display") === "block") {
                            setTimeout(() => {
                                $("#select-menu-ul-RoomList").eq(0).hide();
                                $("#select-menu-div-inputroom2").eq(0).find("i").removeClass("select-menu-i");
                                $("#select-menu-ul-RoomList").eq(0).animate({
                                    marginTop: "0",
                                    opacity: "0"
                                }, "fast");
                            }, 50);

                        } else {
                            setTimeout(() => {
                                $("#select-menu-ul-RoomList").eq(0).show();
                                $("#select-menu-div-inputroom2").eq(0).find("i").addClass("select-menu-i");
                                $("#select-menu-ul-RoomList").eq(0).animate({
                                    marginTop: "5px",
                                    opacity: "1"
                                }, "fast");
                            }, 50);

                        }
                        for (var i = 0; i < $("#select-menu-ul-RoomList").length; i++) {
                            if (i !== 0 && $("#select-menu-ul-RoomList").eq(i).css("display") === "block") {
                                setTimeout(() => {
                                    $("#select-menu-ul-RoomList").eq(i).hide();
                                    $("#select-menu-div-inputroom2").eq(i).find("i").removeClass("select-menu-i");
                                    $("#select-menu-ul-RoomList").eq(i).animate({
                                        marginTop: "0",
                                        opacity: "0"
                                    }, "fast");
                                }, 50);
                            }
                        }
                    });
                    $("#select-menu-ul-RoomList").eq(0).on("click", "li", function () { //给下拉选项绑定点击事件
                        setTimeout(() => {
                            $("#select-menu-inputroom2").eq(0).val($(this).html()); //把被点击的选项的值填入输入框中
                            $("#select-menu-div-inputroom2").eq(0).click();
                            $(this).siblings(".select-this").removeClass("select-this1");
                            $(this).addClass("select-this");
                        }, 50);

                    });
                    $("body").on("click", function (event) {
                        setTimeout(() => {
                            event.stopPropagation();
                            if ($("#select-menu-ul-RoomList").eq(0).css("display") === "block") {
                                console.log(1);
                                $("#select-menu-ul-RoomList").eq(0).hide();
                                $("#select-menu-div-inputroom2").eq(0).find("i").removeClass("select-menu-i");
                                $("#select-menu-ul-RoomList").eq(0).animate({
                                    marginTop: "0",
                                    opacity: "0"
                                }, "fast");

                            }
                        }, 50);
                    });

                }, 100);

                //$('#select-menu-div-mendian').html(' ')

                $('.addcfpone').click(function(){
                    //获取门店id
                    for(var i=0;i<$('#select-menu-ul-one').children().length;i++){
                        if($('#select-menu-ul-one').children().eq(i).html() == $('#select-menu-input-mendian11').val()){
                            var storeId = $('#select-menu-ul-one').children().eq(i).attr('class').split(' ')[0]
                        }
                    }

                    for(var j=0;j<$('#select-menu-ul-RoomList').children().length;j++){
                        if($('#select-menu-ul-RoomList').children().eq(j).html() == $('#select-menu-inputroom2').val()){
                            var roomId = $('#select-menu-ul-RoomList').children().eq(j).attr('class').split(' ')[0]
                        }
                    }
                    //课程id获取
                    var leagueCurriculumId = $('#select-menu-input-coursename').attr('class')

                    //获取员工工号及比例
                    var courseSchedulingItemList = []
                    if ($('#coach-performance').html() == '') {
                        courseSchedulingItemList.push({ coachId: $('#all-coach').children().eq(0).attr('class').split(' ')[1], performance: 1 })
                    } else {
                        for (var i = 0; i < $('#coach-performance').children().length; i++) {
                            courseSchedulingItemList.push({ coachId: $('#coach-performance').children().eq(i).attr('class').split(' ')[1], performance: $('#coach-performance').children().eq(i).children('input').val() })
                        }
                    }

                    //获取课程开始和结束时间
                    var start = $('#edit-course-context-three').val() + " " + $('#edit-course-context-four').val() + ":00"
                    var end = $('#edit-course-context-three').val() + " " + $('#edit-course-context-five').val() + ":59"
                    var data1 = new Date(start)
                    var data2 = new Date(end)
                    var startDate = data1.getTime()
                    var endDate = data2.getTime()

                    //获取课程价格
                    var price = Number($('#course-price').val())

                    //获取开课最大和最小人数
                    var maxNumber = Number($('#maxcount').val())
                    var minNumber = Number($('#mincount').val())

                    //是否排队             
                    if ($('#is-Queue').children('.paypayisQueue').eq(0).hasClass('1')) {
                        var isQueue = 1
                        //console.log(isQueue)
                    } else {
                        var isQueue = 0
                        //console.log(isQueue)
                    }

                    //标签id
                    var tagId = ''
                    if ($('#tag-Name').children('.paypay').eq(0).hasClass('1')) {
                        tagId = 0
                    }
                    else if ($('#tag-Name').children('.paypay').eq(1).hasClass('1')) {
                        tagId = "8222a8d209a24520b116747a047529b3"
                    } else {
                        tagId = "941660f44ced4aefa8b5b24809a0d43b"
                    }

                    setTimeout(() => {
                        var addcfpone = {
                            storeId : storeId,
                            roomId : roomId,
                            leagueCurriculumId : leagueCurriculumId,
                            courseSchedulingItemList : courseSchedulingItemList,
                            startDate : startDate,
                            endDate : endDate,
                            price : price,
                            maxNumber : maxNumber,
                            minNumber : minNumber,
                            isQueue : isQueue,
                            tagId : tagId
                        }

                        console.log(addcfpone)

                        $.ajax({
                            url: 'http://test.physicalclub.com/rest/courseScheduling/insertCourseScheduling',
                            type: 'POST',
                            contentType: 'application/json;charset=UTF-8',
                            data: JSON.stringify(addcfpone),
                            success: function (result) {
                                console.log(result)
                            },
                            error: function (e) {
                                console.log(e.status)
                            }
                        })
                    }, 100);
                })

            }, 100);
        })

    //推荐
    $('#recommended').click(function () {
        var ids = []
        for (var i = 1; i < $('#course-arranging-table').children().children().children().length; i++) {
            if ($('#course-arranging-table').children().children().children().eq(i).children().eq(0).children().children().children().hasClass('11')) {
            var ids1 = $('#course-arranging-table').children().children().children().eq(i).children().eq(0).attr('class')
            $('#course-arranging-table').children().children().children().eq(i).children().eq(1).children('img').show()
                //console.log(ids)
                ids.push(ids1)
            }
        }

        var recommended = {
            operationType: 3,
            ids: ids,
            isRecommend : 1
        }
        console.log(recommended)
        $.ajax({
            url: 'http://test.physicalclub.com/rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(recommended),
            success: function (result) {
                console.log(result)
            },
            error: function (e) {
                console.log(e.status)
            }
        })
    })

    //取消推荐
    $('#qx-recommended').click(function () {
        var ids = []
        for (var i = 1; i < $('#course-arranging-table').children().children().children().length; i++) {
            if ($('#course-arranging-table').children().children().children().eq(i).children().eq(0).children().children().children().hasClass('11')) {
                var ids1 = $('#course-arranging-table').children().children().children().eq(i).children().eq(0).attr('class')
                $('#course-arranging-table').children().children().children().eq(i).children().eq(1).children('img').hide()
                //console.log(ids)
                ids.push(ids1)
            }
        }

        var recommended = {
            operationType: 3,
            ids: ids,
            isRecommend: 0
        }

        $.ajax({
        url: 'http://test.physicalclub.com/rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
        type: 'POST',
        contentType: 'application/json;charset=UTF-8',
        data: JSON.stringify(recommended),
        success: function (result) {
            console.log(result)
        },
        error: function (e) {
            console.log(e.status)
        }

        })

        })

    //点击贴边按钮显示贴标
    $('#tiebiao-show').click(function () {
            setTimeout(() => {
                $('#add-edit-course-label1').show()
                var aecl_str;
                aecl_str = `
                    <div class="add-edit-course-label-header">
                        <div class="add-edit-course-label-header-flex">
                            <img src="./image/tags_icon.png" alt=""/>
                            <p>贴标</p>
                        </div>
                        <img style="width:1.2rem;height:1.2rem" id="label-header-imgtwo" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="add-edit-course-label-context">
                        <p class="add-edit-course-label-context-pone">请对课程进行贴标</p>
                        <div class="add-edit-course-label-context-flexone">
                            <div class="paypaypay">
                                <img class="paypaypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypaypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p>无</p>
                            <div class="paypaypay">
                                <img class="paypaypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypaypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p>热门</p>
                            <div class="paypaypay">
                                <img class="paypaypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypaypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p>体验</p>
                        </div>
                        <div class="add-edit-course-label-context-footer">
                            <p id="add-edit-course-label-context-footer-pone">保存</p>
                            <p id="add-edit-course-label-context-footer-ptwo">取消</p>
                        </div>
                    </div>
                `
                $('.add-edit-course-label').html(aecl_str)

                $(".paypaypay").click(function () {
                    $(this).parent().children('.paypaypay').removeClass('2')
                    $(this).parent().children('.paypaypay').children('.paypaypay-show').hide()
                    $(this).parent().children('.paypaypay').children('.paypaypay-hidden').show()
                    if ($(this).children('.paypaypay-hidden').is(":hidden")) {
                        $(this).children('.paypaypay-hidden').show()
                        $(this).children('.paypaypay-show').hide()
                    } else {
                        $(this).children('.paypaypay-hidden').hide()
                        $(this).children('.paypaypay-show').show()
                        $(this).addClass('2')
                    }
                })

                $(".paypaypay").eq(0).click()

                //console.log($('#course-arranging-table'))

                //贴标点击叉叉和取消关闭页面
                $('#label-header-imgtwo').click(function () {
                    $(this).parent().parent().hide()
                })

                //贴标点击取消关闭页面
                $('#add-edit-course-label-context-footer-ptwo').click(function () {
                    $(this).parent().parent().parent().hide()
                })

                //贴标点击保存按钮
                $('#add-edit-course-label-context-footer-pone').click(function () {

                    var ids = []

                    for (var i = 0; i < $('#course-arranging-table').children().children().children().length; i++) {
                        if ($('#course-arranging-table').children().children().children().eq(i).children().eq(0).children().children().children().is(':visible')) {
                            var ids1 = $('#course-arranging-table').children().children().children().eq(i).children().eq(0).attr('class')
                            ids.push(ids1)
                        }
                    }

                    var tagId = ''
                    $(this).parent().parent().parent().hide()
                    for (var i = 0; i < $(this).parent().parent().children().eq(1).children('.paypaypay').length; i++) {
                        if ($(this).parent().parent().children().eq(1).children('.paypaypay').eq(i).hasClass('2')) {
                            if (i == 0) {
                                tagId = 0
                            } else if (i == 1) {
                                tagId = '8222a8d209a24520b116747a047529b3'
                            } else {
                                tagId = "941660f44ced4aefa8b5b24809a0d43b"
                            }
                        }
                    }

                    var taglist = {
                        operationType: 2,
                        ids: ids,
                        tagId: tagId
                    }

                    console.log(taglist)

                    $.ajax({
                        url: 'http://test.physicalclub.com/rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
                        type: 'POST',
                        contentType: 'application/json;charset=UTF-8',
                        data: JSON.stringify(taglist),
                        success: function (result) {
                            console.log(result)
                            window.location.reload()
                        },
                        error: function (e) {
                            console.log(e.status)
                        }
                    })
                })

            }, 100);
        })

    //点击删除按钮
    $('#shanchudel').click(function(){
        var ids = []
        for (var i = 1; i < $('#course-arranging-table').children().children().children().length; i++) {
            if ($('#course-arranging-table').children().children().children().eq(i).children().eq(0).children().children().children().hasClass('11')) {
                var ids1 = $('#course-arranging-table').children().children().children().eq(i).children().eq(0).attr('class')
                //console.log(ids)
                ids.push(ids1)
            }
        }

        var recommended = {
            operationType: 1,
            ids: ids
        }

        $.ajax({
            url: 'http://test.physicalclub.com/rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(recommended),
            success: function (result) {
                console.log(result)
                window.location.reload()
            },
            error: function (e) {
                console.log(e.status)
            }

        })
    })

    //发布
    $('#publishpublish').click(function(){
        var ids = []
        for (var i = 1; i < $('#course-arranging-table').children().children().children().length; i++) {
            if ($('#course-arranging-table').children().children().children().eq(i).children().eq(0).children().children().children().hasClass('11')) {
                var ids1 = $('#course-arranging-table').children().children().children().eq(i).children().eq(0).attr('class')
                //console.log(ids)
                ids.push(ids1)
            }
        }

        var recommended = {
            operationType: 4,
            ids: ids,
            state : 1
        }

        $.ajax({
            url: 'http://test.physicalclub.com/rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(recommended),
            success: function (result) {
                console.log(result)
                window.location.reload()
            },
            error: function (e) {
                console.log(e.status)
            }

        })
    })

    $('#cxsx').click(function(){
        window.location.reload()
    })

    $('#cxsx2').click(function(){
        window.location.reload()
    })

    window.onload = function () {
        new course_arranging().init();
        new course_arranging_not().init();
    }

    class course_arranging {
        constructor() {
            this.select_one = $(".course-arranging-flex-select-one")
            this.select_two = $(".course-arranging-flex-select-two")
            this.table = $("#course-arranging-table")
            this.input_four = $(".course-arranging-footer-pthree")
            this.paypay = $(".paypay")
            this.paypaypay = $(".paypaypay")
        }

        init() {
            this.select_all1()
            
            //this.input_all4()
            this.select_option()
            this.publishshowhide()
            this.ajax()
            this.edit_course()
            this.time()
            this.table_all()
        }

        ajax(){
            //选择会所请求
            // $.ajax({
            //     url : 'http://test.physicalclub.com/rest/club/getClubInfo',
            //     type : 'GET',
            //     dataType : 'json',
            //     success : function(data){
            //         console.log(data)
            //     },
            //     error : function(msg){
            //         console.log(msg)
            //     }
            // })

            // var RoomList = { storeId: 19 }
            // $.ajax({
            //     url: 'http://test.physicalclub.com/crm/rest/club/getClubRoomList',
            //     type: 'POST',
            //     contentType: 'application/json;charset=UTF-8',
            //     data: JSON.stringify(RoomList),
            //     success: function (result) {
            //         // var strsecond = ''
            //         // //console.log(result)
            //         // for (var i = 0; i < result.rows.length; i++) {
            //         //     strsecond += `
            //         //                     <li class="`+ result.rows[i].roomId + `">` + result.rows[i].roomName + `</li>
            //         //                 `
            //         // }
            //         // setTimeout(() => {
            //         //     $('#select-menu-ul-room1').html(strsecond)
            //         // }, 100);

            //         console.log(result)
            //     },
            //     error: function (e) {
            //         console.log(e.status)
            //     }
            // })

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

        select_all1() {
            setTimeout(() => {
            var pulishmendian = '';
            //门店列表渲染
            $.ajax({
                url: 'http://test.physicalclub.com/rest/club/getClubInfo',
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    $.each(data.rows, function (i, item) {
                        pulishmendian += `
                            <li class="`+ item.clubId + `">` + item.clubName + `</li>
                        `
                    })          
                        $('#select-menu-ul-pulishmendian').html(pulishmendian)
                        $('#select-menu-input-mendian').val("全部")
                        console.log("diyige")
                },
                error: function (msg) {
                    console.log(msg)
                }
            })
            }, 100);

            //房间下拉菜单渲染
            $('#select-menu-div-room').click(function(){
            setTimeout(() => {
                setTimeout(() => {
                    var storeId = ''
                    if($('#select-menu-input-mendian').val() == "全部"){
                        storeId = ''
                    }else{
                        for(var i=0;i<$('#select-menu-ul-pulishmendian').children().length;i++){
                            if($('#select-menu-ul-pulishmendian').children().eq(i).html() == $('#select-menu-input-mendian').val()){
                                storeId = $('#select-menu-ul-pulishmendian').children().eq(i).attr('class')
                                var storeId1 = storeId.split(' ')[0]
                            }
                        }
                    //var RoomList = { clubId = storeId1 }
                    $.ajax({
                        url: 'http://test.physicalclub.com/crm/rest/club/getClubRoomList?clubId='+storeId1,
                        type: 'POST',
                        success: function (result) {
                            console.log(result)
                            var strsecond = ''
                            //console.log(result)
                            for (var i = 0; i < result.rows.length; i++) {
                                strsecond += `
                                        <li class="`+ result.rows[i].roomId + `">` + result.rows[i].roomName + `</li>
                                    `
                            }
                            setTimeout(() => {
                                $('#select-menu-ul-room').html(strsecond)
                            }, 100);


                        },
                        error: function (e) {
                            console.log(e.status)
                        }
                    })
                     }
                    
                }, 100);
            }, 100);
            })
        }

        select_option() {
            selectMenu(0);
            selectMenu(1)
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

        table_all() {
            var that = this

            var onPagechange = function (page) {
                console.log(page)
                aaaaaa(page)
            }

            var page = 1;
            aaaaaa(page)

            function aaaaaa(page){

            //排课管理列表请求

            $('#publish-search').click(function(){
                var storeId = ''
                var roomId = ''
                var realName = ''
                var userName = ''
                var startDate = ''
                var endDate = ''

                if($('#select-menu-input-mendian').val() == "全部"){
                            storeId = ''
                }else{
                    for(var i=0;i<$('#select-menu-ul-pulishmendian').children().length;i++){
                        if($('#select-menu-ul-pulishmendian').children().eq(i).html() == $('#select-menu-input-mendian').val()){
                            storeId = $('#select-menu-ul-pulishmendian').children().eq(i).attr('class').split(' ')[0]
                        }
                    }
                }
                
                if($('#select-menu-input-room').val() == ''){
                    roomId = ''
                }else{
                    for(var i=0;i< $('#select-menu-ul-room').children().length;i++){
                        if($('#select-menu-ul-room').children().eq(i).html() == $('#select-menu-input-room').val()){
                            roomId = $('#select-menu-ul-room').children().eq(i).attr('class')
                            //roomId = "c0f6b689-0375-4d7c-b1f8-01b86d55e57a"
                        }
                    }
                }

                realName = $('#teaching-course-coach').val()

                userName = $('#coach-id').val()

                startDate = $('#create-course-time').val()

                endDate = $('#end-course-time').val()

                console.log(roomId)
                var SchedulingList = {
                    state: 0,
                    page: page,
                    rows: 10,
                    storeId : storeId,
                    roomId : roomId,
                    realName : realName,
                    userName : userName,
                    startDate : startDate,
                    endDate : endDate
                }
                $.ajax({
                    url: 'http://test.physicalclub.com/rest/courseScheduling/selectCourseSchedulingList',
                    type: 'POST',
                    contentType: 'application/json;charset=UTF-8',
                    data: JSON.stringify(SchedulingList),
                    success: function (result) {
                        console.log(result)

                        //表格的动态渲染
                        var str2 = `
                        <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th style="width:2.4rem"></th>
                            <th style="width:9rem">门店</th>
                            <th style="width:9rem">房间</th>
                            <th style="width:6.7rem">日期</th>
                            <th style="width:6.7rem">时间</th>
                            <th style="width:6rem">上课教练</th>
                            <th style="width:6rem">教练工号</th>
                            <th style="width:6rem">课程名称</th>
                            <th style="width:6rem">课程售价</th>
                            <th style="width:6rem">最大人数</th>
                            <th style="width:6rem">开课人数</th>
                            <th style="width:6rem">贴标</th>
                            <th></th>
                            <th style="width:6rem">操作</th>
                        </tr>
                    `

                        //教练姓名格式判断

                        function coachname(arr) {
                            var coachname;
                            if (arr == '') {
                                return coachname = ''
                            }
                            else if (arr) {
                                return coachname = arr[0].realName
                            }
                        }
                        //教练工号格式判断

                        function username(arr) {
                            var username;
                            if (arr == '') {
                                return username = ''
                            }
                            else if (arr) {
                                return username = arr[0].userName
                            }
                        }

                        //贴标判断
                        function tiebiao(arr) {
                            var tiebiao = '';
                            if (!arr) {
                                return tiebiao = ''
                            } else {
                                return tiebiao = arr
                            }
                        }

                        $.each(result.rows, function (i, item) {
                            str2 += `
                        <tr class="course-arranging-table-tr">
                            <td style="width:2.4rem" class="`+ item.id +`"><div style="display:flex;justify-content: center;"><div class="course-arranging-table-checkbox"><img style="display:none" src="./image/codeallset_btn.png"></div></div></td>
                            <td style="width:9rem;position:relative">`+ item.storeName +`<img style="position:absolute;left:6.65rem;top:0;display:none" src="image/recommended_img.png"></td>
                            <td style="width:9rem">`+ item.roomName + `</td>
                            <td style="width:6.7rem">`+ item.dateStr + `</td>
                            <td style="width:6.7rem">`+ item.timeStr + `</td>
                            <td style="width:6rem">`+ coachname(item.courseSchedulingItemList) + `</td>
                            <td style="width:6rem">`+ username(item.courseSchedulingItemList) + `</td>
                            <td style="width:6rem">`+ item.leagueCurriculumName + `</td>
                            <td style="width:6rem">￥`+ item.price + `</td>
                            <td style="width:6rem">`+ item.maxNumber + `人</td>
                            <td style="width:6rem">`+ item.minNumber + `人</td>
                            <td style="width:6rem">`+ tiebiao(item.tagName) +`</td>
                            <td width="0" style="position:relative;border:none">
                                <div class="td-del" style="display:none">
                                    <div class="td-del-flex">
                                        <p>是否删除该课程?</p>
                                        <p class="td-del-flex-yes">确定</p>
                                        <p class="td-del-flex-no">取消</p>
                                    </div>
                                    <p class="td-del-line"></p>
                                    <p class="td-del-left">移除课表后，教练将不会看到该课程!</p>
                                </div
                            </td>
                            <td style="width:6rem">
                                <a class="a-add `+ i + `">编辑</a>|<a class="a-del">删除</a>
                            </td>
                        </tr>
                    `
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
                        //var cccccccc ="woshiwoshwisowhi"
                        var list = result
                        //console.log(list)
                        setTimeout(() => {
                            new computed().init()
                            new course_arranging().edit_course(list)
                        }, 100);

                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText)
                    }
                })

            })

            var SchedulingList = {
                    state: 0,
                    page: page,
                    rows: 10
                } 

            $.ajax({
                url : 'http://test.physicalclub.com/rest/courseScheduling/selectCourseSchedulingList',
                type : 'POST',
                contentType : 'application/json;charset=UTF-8',
                data : JSON.stringify(SchedulingList),
                success : function(result){
                    console.log(result)
                    
                    //表格的动态渲染
                    var str2 = `
                        <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th style="width:2.4rem"></th>
                            <th style="width:9rem">门店</th>
                            <th style="width:9rem">房间</th>
                            <th style="width:6.7rem">日期</th>
                            <th style="width:6.7rem">时间</th>
                            <th style="width:6rem">上课教练</th>
                            <th style="width:6rem">教练工号</th>
                            <th style="width:6rem">课程名称</th>
                            <th style="width:6rem">课程售价</th>
                            <th style="width:6rem">最大人数</th>
                            <th style="width:6rem">开课人数</th>
                            <th style="width:6rem">贴标</th>
                            <th></th>
                            <th style="width:6rem">操作</th>
                        </tr>
                    `

                    //教练姓名格式判断

                    function coachname(arr){
                        var coachname;
                        if(arr == ''){
                            return coachname = ''
                        }
                        else if(arr){
                            return coachname = arr[0].realName
                        }
                    }
                    //教练工号格式判断

                    function username(arr) {
                        var username;
                        if (arr == '') {
                            return username = ''
                        }
                        else if (arr) {
                            return username = arr[0].userName
                        }
                    }

                    //贴标判断
                    function tiebiao(arr){
                        var tiebiao = '';
                        if(!arr){
                            return tiebiao = ''
                        }else{
                            return tiebiao = arr
                        }
                    }

                    $.each(result.rows,function(i,item){
                        str2 += `
                        <tr class="course-arranging-table-tr">
                            <td style="width:2.4rem" class="`+ item.id +`"><div style="display:flex;justify-content: center;"><div class="course-arranging-table-checkbox"><img style="display:none" src="./image/codeallset_btn.png"></div></div></td>
                            <td style="width:9rem;position:relative">`+ item.storeName +`<img style="position:absolute;top:0;left:6.65rem;display:none" src="image/recommended_img.png"></td>
                            <td style="width:9rem">`+ item.roomName +`</td>
                            <td style="width:6.7rem">`+ item.dateStr +`</td>
                            <td style="width:6.7rem">`+ item.timeStr +`</td>
                            <td style="width:6rem">`+ coachname(item.courseSchedulingItemList) +`</td>
                            <td style="width:6rem">`+ username(item.courseSchedulingItemList) +`</td>
                            <td style="width:6rem">`+ item.leagueCurriculumName +`</td>
                            <td style="width:6rem">￥`+ item.price +`</td>
                            <td style="width:6rem">`+ item.maxNumber +`人</td>
                            <td style="width:6rem">`+ item.minNumber +`人</td>
                            <td style="width:6rem">`+ tiebiao(item.tagName) +`</td>
                            <td width="0" style="position:relative;border:none">
                                <div class="td-del" style="display:none">
                                    <div class="td-del-flex">
                                        <p>是否删除该课程?</p>
                                        <p class="td-del-flex-yes">确定</p>
                                        <p class="td-del-flex-no">取消</p>
                                    </div>
                                    <p class="td-del-line"></p>
                                    <p class="td-del-left">移除课表后，教练将不会看到该课程!</p>
                                </div
                            </td>
                            <td style="width:6rem">
                                <a class="a-add `+ i +`">编辑</a>|<a class="a-del">删除</a>
                            </td>
                        </tr>
                    `
                    })
                    that.table.html(str2)

                    for(var i=0;i<result.rows.length;i++){
                        if(result.rows[i].isRecommend == 1){
                            $('#course-arranging-table').children().children().children().eq(i+1).children().eq(1).children('img').show()
                            //console.log(11)
                        }
                    }

                    var obj = {
                        wrapid: 'boxpage', //页面显示分页器容器id
                        total: result.total, //总条数
                        pagesize: 10, //每页显示10条
                        currentPage: page, //当前页
                        onPagechange: onPagechange
                        //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                    }

                    pagination.init(obj);
                    //var cccccccc ="woshiwoshwisowhi"
                    var list = result
                    //console.log(list)
                    setTimeout(() => {
                        new computed().init()
                        new course_arranging().edit_course(list)
                    }, 100);

                },
                error : function(e){
                    console.log(e.status);
                    console.log(e.responseText)
                }
            })

            }
        }

        publishshowhide() {
            $('#course-arranging-header-one-ptwo').click(function () {
                $('#course-arranging-header-one-pone').removeClass('course-arranging-header-one-pone-active')
                $(this).addClass('course-arranging-header-one-ptwo-active')
                $('#course-arranging-body-left').hide()
                $('#course-arranging-body-right').show()
            })
        }

        edit_course(list) {
            var that = this
            
            setTimeout(() => {
 
            //点击编辑按钮事件
            $('.a-add').click(function () {
                console.log(list)
                if(list){
                    var count = $(this).attr('class').split(' ')[1]
                    //console.log($('.a-add').length)

                    var listdata = list.rows[count]
                }                

                console.log(listdata)

                $('#edit-course1').show()

                var editstr;
                var addeditstr;
                var acn_str;
                //新增窗口的动态渲染
                editstr = `
                    <div class="edit-course-header">
                        <div class="edit-course-header-one">
                            <img class="edit-course-header-imgone" src="./image/editor_icon.png" alt="" />
                            <p class="edit-course-header-pone">新增未发布</p>
                        </div>
                        <img class="edit-course-header-imgone" style="width:1.1rem;height:1.15rem" id="edit-course-hide" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="edit-course-context" style="position:relative">
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one" style="margin-right:5.55rem">门店</div>
                            <div id="edit-course-context-first">
                                <div class="select-menu5">
                                    <div class="select-menu-div">
                                        <input class="select-menu-input" id="select-menu-input-mendian1"/>

                                        <img class="select-menu-img" src="./image/sifting_icon.png"/>
                                    </div>
                                    <ul class="select-menu-ul" id="select-menu-ul-one" style="height:10rem;overflow-y:scroll">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one" style="margin-right:5.55rem">房间</div>
                            <div id="edit-course-context-second">
                                <div class="select-menu5">
                                    <div class="select-menu-div">
                                        <input class="select-menu-input" id="select-menu-inputroom"/>

                                        <img class="select-menu-img" src="./image/sifting_icon.png"/>
                                    </div>
                                    <ul class="select-menu-ul" id="select-menu-ul-RoomList" style="height:10rem;overflow-y:scroll">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one">课程名称</div>
                            <div class="select-menu-input-coursename-div">
                                <input id="select-menu-input-coursename" style="margin-left:0.5rem;border:0;font-size:0.7rem"/>   
                            </div>    
                        </div>
                        <div class="edit-course-context-flextwo">
                            <div class="edit-course-context-one">上课教练</div>
                            <div class="edit-course-context-twoall" id="all-coach">
                                
                            </div>
                            <p class="edit-course-context-three" id="edit-course-addadd">添加</p>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one">上课日期</div>
                            <div style="width:7.5rem;height:1.8rem;border:1px solid #BFBFBF;border-radius:0.2rem;margin:0 2.95rem 0 3.85rem">
                            <input id="edit-course-context-three" style="width:7.5rem;height:1.8rem;border:0;padding-left:0.5rem;box-sizing:border-box"></input>
                            </div>
                            <p style="font-size:0.9rem;margin-right:0.9rem">上课时间</p>
                            <div style="width:6rem;height:1.8rem;border:1px solid #BFBFBF;border-radius:0.2rem;">
                            <input id="edit-course-context-four" style="width:6rem;height:1.8rem;border:0;padding-left:0.5rem;box-sizing:border-box"></input>
                            </div>
                            <p style="margin:0 0.3rem 0 0.3rem">-</p>
                            <div style="width:6rem;height:1.8rem;border:1px solid #BFBFBF;border-radius:0.2rem;">
                            <input id="edit-course-context-five" style="width:6rem;height:1.8rem;border:0;padding-left:0.5rem;box-sizing:border-box"></input>
                            </div>
                        </div>

                        <div class="edit-course-context-flex3">
                            <p class="edit-course-context-flex3-pone">课程售价</p>
                            <div class="add-course-sortone-inputtwo">
                                <p>￥</p>
                                <input type="text" id="course-price">
                            </div>
                            <p class="edit-course-context-flex3-ptwo">标准价</p>
                            <div class="add-course-sortone-inputthree">
                                <p>￥</p>
                                <p class="add-course-sortone-inputthree-input">188.00</p>
                            </div>
                        </div>

                        <div class="edit-course-context-flex3">
                            <p class="edit-course-context-flex3-pone">开课人数</p>
                            <div class="add-course-sortone-inputtwo">
                                <input type="text" id="mincount">
                            </div>
                            <p style="margin-left:-1rem;margin-right:0.4rem;">人</p>
                            <p class="edit-course-context-flex3-ptwo">最大人数</p>
                            <div class="add-course-sortone-inputthree" style="margin-left:0.85rem;">
                                <input type="text" id="maxcount" style="text-decoration:none;color:black">
                            </div>
                            <p style="margin-left:-1rem">人</p>
                        </div>

                        <div class="edit-course-context-flex3" id="is-Queue">
                            <p class="edit-course-context-flex3-pone" style="margin-right:1.75rem">是否排队</p>
                            <div class="paypay paypayisQueue">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">是</p>
                            <div class="paypay paypayisQueue">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">否</p>
                        </div>

                        <div class="edit-course-context-flex3" id="tag-Name">
                            <p class="edit-course-context-flex3-pone" style="margin-right:3.5rem">贴标</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">无</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">热门</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">体验</p>
                        </div>
                        <div class="edit-course-context-flex4">
                            <p class="edit-course-context-flex4-pone">业绩比例</p>
                            <div class="edit-course-context-flex4-ptwo" id="coach-performance">
                                
                            </div>
                        </div>
                        <div class="add-course-name" id="add-course-name1">

                        </div>
                        <div class="edit-course-footer">
                            <p id="edit-course-footer-pone">保存</p>
                            <p id="edit-course-footer-ptwo">取消</p>
                        </div>
                        </div>
                    </div>
                `
                //添加教练窗口的动态渲染
                addeditstr = `
                    <div class="add-edit-course-header">
                        <div class="add-edit-course-header-one">
                            <img class="add-edit-course-header-imgone" src="./image/editor_icon.png" alt="" />
                            <p class="add-edit-course-header-pone">添加教练</p>
                        </div>
                        <img class="add-edit-course-header-imgone" id="add-edit-course-hide" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="add-edit-course-header-context">
                        <div class="add-edit-course-header-context-one">
                            <div class="add-edit-course-header-context-oneflex">
                                <input / id="search-value">
                                <div class="add-edit-course-header-context-one-blue">
                                    <img src="./image/search_btn.png" alt=""/ id="search-search">
                                </div>
                            </div>
                        </div>
                        <div class="add-edit-course-header-context-one" id="coach-show" style="justify-content: left;padding-left:1.1rem">

                        </div>
                        <div class="add-edit-course-header-context-two">
                            <p class="add-edit-course-header-context-two-pone">已选择教练</p>
                            <div class="add-edit-course-header-context-twoflex" id="select-coach">
                                
                            </div>
                        </div>
                        <div class="add-edit-course-header-context-three">
                            <p id="add-edit-course-header-context-three-pone">确定</p>
                            <p id="add-edit-course-header-context-three-ptwo">取消</p>
                        </div>
                    </div>
                `
                acn_str = `
                    <div class="add-course-name-header">
                        <div class="add-course-name-header-left">
                            <img src="./image/tags_icon.png" alt=""/>
                            <p>课程名称</p>
                        </div>
                        <img style="width:1.1rem;height:1.1rem" id="add-course-name-header-img" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="add-course-name-context">
                        <div class="add-course-name-context-flex" id="add-course-name-context-flex-coursename">
                            
                        </div>
                        <div class="add-course-name-context-bottom1">
                            <p id="add-course-name-context-bottom-pone">确定</p>
                            <p id="add-course-name-context-bottom-ptwo">取消</p>
                        </div>
                    </div>
                `
                
                $('.edit-course').html(editstr)
                $('.add-edit-course').html(addeditstr)
                $('.add-course-name').html(acn_str)

                //添加教练的叉叉关闭
                $('#add-edit-course-hide').click(function () {
                    $(this).parent().parent().hide()
                })

                //添加教练的点击取消事件
                $('#add-edit-course-header-context-three-ptwo').click(function () {
                    $(this).parent().parent().parent().hide()
                })

                //教练课程的显示隐藏
                $('.add-course-name-context-p').click(function () {
                    $('.add-course-name-context-p').each(function () {
                        $(this).removeClass('add-course-name-context-p-active')
                    })
                    $(this).addClass('add-course-name-context-p-active')
                })
                
                //新增窗口的叉叉关闭
                $('#edit-course-hide').click(function () {
                    $(this).parent().parent().hide()
                    $('.paypay').each(function () {
                        $(this).children('.paypay-show').hide()
                        $(this).children('.paypay-hide').show()
                    })
                })
                
                //新增窗口的取消关闭
                $('#edit-course-footer-ptwo').click(function () {
                    $(this).parent().parent().parent().hide()
                    $('.paypay').each(function () {
                        $(this).children('.paypay-show').hide()
                        $(this).children('.paypay-hide').show()
                    })
                })

                //新增窗口单选框的显示及排他
                $(".paypay").click(function () {
                        $(this).parent().children('.paypay').removeClass('1')
                        $(this).parent().children('.paypay').children('.paypay-show').hide()
                        $(this).parent().children('.paypay').children('.paypay-hidden').show()
                        if ($(this).children('.paypay-hidden').is(":hidden")) {
                            $(this).children('.paypay-hidden').show()
                            $(this).children('.paypay-show').hide()
                        } else {
                            $(this).children('.paypay-hidden').hide()
                            $(this).children('.paypay-show').show()
                            $(this).addClass('1')
                        }
                    })
            
                setTimeout(() => {
                        var strfirstfirst = '';
                        //门店列表渲染
                        $.ajax({
                            url: 'http://test.physicalclub.com/rest/club/getClubInfo',
                            type: 'GET',
                            dataType: 'json',
                            success: function (data) {
                                $.each(data.rows, function (i, item) {
                                    strfirstfirst += `
                                    <li class="`+ item.clubId + `">` + item.clubName + `</li>
                                `
                                })
                                setTimeout(() => {
                                    $('#select-menu-ul-one').html(strfirstfirst)
                                    $('#select-menu-input-mendian1').val(listdata.storeName)
                                    //console.log(222)
                                }, 100);
                            },
                            error: function (msg) {
                                console.log(msg)
                            }
                        })
                        
                        //房间下拉菜单渲染
                        var strsecond = '';                  
                        //var RoomList = { clubId : listdata.storeId }
                        $.ajax({
                            url: 'http://test.physicalclub.com/crm/rest/club/getClubRoomList?clubId='+listdata.storeId,
                            type: 'POST',
                            success: function (result) {
                                console.log(result)
                                for(var i=0;i< result.rows.length;i++){
                                    strsecond += `
                                        <li class="`+ result.rows[i].roomId +`">`+ result.rows[i].roomName +`</li>
                                    `
                                }
                                
                                setTimeout(() => {
                                    $('#select-menu-ul-RoomList').html(strsecond)
                                    $('#select-menu-inputroom').val(listdata.roomName)
                                },100);
                            
                            
                            },
                            error: function (e) {
                                console.log(e.status)
                            }
                        })
                        
                        //课程名称下拉渲染
                        setTimeout(() => {
                            $('#select-menu-input-coursename').val(listdata.leagueCurriculumName)
                            $('#select-menu-input-coursename').addClass(listdata.leagueCurriculumId)
                        },100);                  

                        //课程名称的请求及渲染
                        $('#select-menu-input-coursename').click(function () {
                            $('#add-course-name1').show()

                            var ad_ft1 = '';

                            $.ajax({
                                type: 'GET',
                                contentType: "application/json;charset=UTF-8",
                                url: "http://test.physicalclub.com/crm/rest/leagueCurriculum/getReleaseLeagueCurriculumListGroupByType",
                                success: function (results) {
                                    console.log(results)
                                    var result = results.rows
                                    //console.log(list)
                                    for (var i = 0; i < result.length; i++) {
                                        var ad_str2 = '';
                                        for (var j = 0; j < result[i].children.length; j++) {
                                            ad_str2 += `
                                                    <div class="flexthree-tags1 `+ result[i].children[j].id + `">
                                                        `+ result[i].children[j].name + `
                                                    </div>
                                                `
                                        }

                                        ad_ft1 += `
                                                <div class="coach-manage-addthree-flexthree-flex">
                                                    <p class="coach-manage-addthree-flexthree-flex-p">`+ result[i].classifyName + `</p>
                                                    <div class="addthree-flexfour">
                                                    `+ ad_str2 + `
                                                    </div>
                                                </div>  
                                            `

                                    }
                                    setTimeout(() => {
                                        $('#add-course-name-context-flex-coursename').html(ad_ft1)

                                        $('.flexthree-tags1').click(function () {
                                            $('#add-course-name-context-flex-coursename').children().children('.addthree-flexfour').children('.flexthree-tags1').removeClass('active1')
                                            if ($(this).hasClass('active1')) {
                                                setTimeout(() => {
                                                    $(this).removeClass('active1')
                                                }, 50);

                                            } else {
                                                setTimeout(() => {
                                                    $(this).addClass('active1')
                                                }, 50);
                                            }
                                        })

                                        console.log(list)
                                        console.log(result)
                                        for (var i = 0; i < result.length; i++) {
                                            for (var j = 0; j < result[i].children.length; j++) {
                                                if (result[i].children[j].name == $('#select-menu-input-coursename').val()) {
                                                    $('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).click()
                                                    
                                                }
                                                // console.log(111)
                                            }
                                        }

                                        $('#add-course-name-context-bottom-pone').click(function () {
                                            $(this).parent().parent().parent().hide()
                                            //$('#select-menu-input-coursename').val($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).html())
                                            //$('#select-menu-input-coursename').addClass($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).attr('class').split(' ')[1])
                                            
                                            for(var i=0;i< $('#add-course-name-context-flex-coursename').children().length;i++){
                                                for(var j=0;j< $('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().length;j++){
                                                    if($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).hasClass('active1')){
                                                        $('#select-menu-input-coursename').val($.trim($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).html()))
                                                        $('#select-menu-input-coursename').addClass($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).attr('class').split(' ')[1])
                                                        //console.log($.trim($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).html()))
                                                    }
                                                }
                                            }
                                            
                                        })

                                    }, 100);

                                    //课程名称的取消和叉叉关闭页面
                                    $('#add-course-name-header-img').click(function () {
                                        $(this).parent().parent().hide()
                                    })

                                    // //课程名称的取消按钮事件
                                    $('#add-course-name-context-bottom-ptwo').click(function () {
                                        $(this).parent().parent().parent().hide()
                                    })

                                    // //课程名称页面的显示
                                    // $('.edit-course-context-three-pp').click(function () {
                                    //     $('#add-course-name1').show()
                                    // })
                                    
                                    // console.log($('#coach-manage-addthree-flexthree-list').html())
                                },
                                error: function (e) {
                                    console.log(e.status);
                                    console.log(e.responseText)
                                }
                            })
                        })

                        //教练名遍历渲染
                        var strcoach = '';
                        if(listdata.courseSchedulingItemList){
                            for (var i = 0; i < listdata.courseSchedulingItemList.length; i++) {
                                strcoach += `
                                    <p class="edit-course-context-twoone `+ listdata.courseSchedulingItemList[i].userName + ' ' + listdata.courseSchedulingItemList[i].performance +`">`+ listdata.courseSchedulingItemList[i].realName + `</p>
                                `
                            }
                        }else{
                            strcoach = ''
                        }

                        //新增未发布教练的渲染
                        $('#all-coach').html(strcoach)

                        //业绩比例展示
                        setTimeout(() => {
                            var strperformance = ''
                            if ($('#all-coach').children().length > 1) {
                                for (var i = 0; i < $('#all-coach').children().length; i++) {
                                    strperformance += `
                                        <div class="edit-course-context-flex4-pthree">
                                            <p class="edit-course-context-flex4-pfour `+$('#all-coach').children().eq(i).attr('class').split(' ')[1] +`">`+ $('#all-coach').children().eq(i).html() + `</p>
                                            <input class="edit-course-context-flex4-pfive" value="`+ $('#all-coach').children().eq(i).attr('class').split(' ')[2] +`"/>
                                        </div>
                                    `
                                }
                            } else {
                                strperformance = ''
                            }
                            $('#coach-performance').html(strperformance)
                        }, 100);

                        //点击添加按钮显示添加教练
                        $('#edit-course-addadd').click(function () {
                            $('#add-edit-course1').show()
                            //教练选择页面
                            var strselect = ''
                            for (var i = 0; i < $('#all-coach').children().length; i++) {
                                strselect += `
                                <p class="add-edit-course-header-context-two-ptwo `+ $('#all-coach').children().eq(i).attr('class').split(' ')[1] +`">
                                    `+ $('#all-coach').children().eq(i).html() + `
                                    <img src="./image/classdel_btn.png" alt=""/>
                                </p>
                            `
                            }

                            $('#select-coach').html(strselect)

                            //添加教练鼠标移入事件
                            $('.add-edit-course-header-context-two-ptwo').mouseover(function () {
                                $(this).addClass('aechctp-active')
                                $(this).children('img').show()
                            })
                            //添加教练的鼠标移除事件
                            $('.add-edit-course-header-context-two-ptwo').mouseout(function () {
                                $(this).removeClass('aechctp-active')
                                $(this).children('img').hide()
                            })
                            //添加教练的标签，点击叉叉关闭
                            $('.add-edit-course-header-context-two-ptwo').children('img').click(function () {
                                $(this).parent().remove()
                            })

                            $('#search-search').click(function(){
                                setTimeout(() => {
                                    $.ajax({
                                        url: 'http://test.physicalclub.com/crm/rest/leagueCoach/getLeagueCoachByJobNumber/'+$('#search-value').val(),
                                        type: 'GET',
                                        dataType: 'json',
                                        success: function (result) {
                                            console.log(result)
                                            //console.log(strselect)

                                            var strcoachone = `
                                            <p id="coach-p" class="`+ result.rows[0].userName +`" style="width:3.5rem;height:1.2rem;border-radius:0.2rem;background:#71B2EF;color:white;text-align:center;line-height:1.2rem">
                                            `+ result.rows[0].realName + `
                                            </p>
                                        `
                                            //点击查询渲染的教练名
                                            $('#coach-show').html(strcoachone)

                                            $('#coach-p').click(function(){

                                                //console.log($('#select-coach').html())

                                                for(var i=0;i< $('#select-coach').children().length;i++){
                                                    if($.trim($('#coach-p').html()) == $.trim($('#select-coach').children().eq(i).text())){
                                                        return;
                                                    }else{
                                                        var strselect = ''
                                                        for (var j = 0; j < $('#select-coach').children().length; j++) {
                                                            strselect += `
                                                        <p class="add-edit-course-header-context-two-ptwo `+ $('#select-coach').children().eq(j).attr('class').split(' ')[1] + `"> ` + $.trim($('#select-coach').children().eq(j).text()) + `<img src="./image/classdel_btn.png" alt=""/></p>
                                                    `
                                                        }
                                                    }
                                                    //console.log($.trim($('#select-coach').children().eq(i).text()))
                                                }
                                                //console.log($('#coach-p').html())
                                                if ($.trim($('#select-coach').html()) == '') {
                                                    strselect = ''
                                                }

                                                strselect += `
                                                    <p class="add-edit-course-header-context-two-ptwo `+ $(this).attr('class') +`">
                                                        `+ $(this).html() + `
                                                        <img src="./image/classdel_btn.png" alt=""/>
                                                    </p>
                                                `
                                                setTimeout(() => {
                                                //点击查询出的教练名进行渲染
                                                $('#select-coach').html(strselect)

                                                // for (var j = 0; j < $('#select-coach').children().length; j++) {
                                                //     for (var i = 1; i < $('#select-coach').children().length; i++) {
                                                //         if ($.trim($('#select-coach').children().eq(j).text()) == $.trim($('#select-coach').children().eq(i).text())) {
                                                //             $('#select-coach').children().eq(i).remove()
                                                //         }
                                                //     }
                                                // }

                                                

                                                //添加教练鼠标移入事件
                                                $('.add-edit-course-header-context-two-ptwo').mouseover(function () {
                                                    $(this).addClass('aechctp-active')
                                                    $(this).children('img').show()
                                                })
                                                //添加教练的鼠标移除事件
                                                $('.add-edit-course-header-context-two-ptwo').mouseout(function () {
                                                    $(this).removeClass('aechctp-active')
                                                    $(this).children('img').hide()
                                                })
                                                //添加教练的标签，点击叉叉关闭
                                                $('.add-edit-course-header-context-two-ptwo').children('img').click(function () {
                                                    $(this).parent().remove()
                                                })
                                                }, 100);
                                            })

                                            //添加教练的点击确认事件
                                            $('#add-edit-course-header-context-three-pone').click(function () {
                                                $(this).parent().parent().parent().hide()
                                                var againcoach = ''
                                                for(var i=0;i<$('#select-coach').children().length;i++){
                                                    againcoach += `
                                                        <p class="edit-course-context-twoone `+ $('#select-coach').children().eq(i).attr('class').split(' ')[1] +`">`+ $('#select-coach').children().eq(i).text() + `</p>
                                                    `
                                                }
                                                $('#all-coach').html(againcoach)

                                                var strperformance = ''

                                                //比例的渲染
                                                if ($('#all-coach').children().length > 1) {
                                                    for (var i = 0; i < $('#all-coach').children().length; i++) {
                                                        strperformance += `
                                                            <div class="edit-course-context-flex4-pthree `+ $('#all-coach').children().eq(i).attr('class').split(' ')[1] +`">
                                                                <p class="edit-course-context-flex4-pfour">`+ $('#all-coach').children().eq(i).html() + `</p>
                                                                <input class="edit-course-context-flex4-pfive" />
                                                            </div>
                                                        `
                                                    }
                                                } else {
                                                    strperformance = ''
                                                }

                                                $('#coach-performance').html(strperformance)

                                            })
                                            console.log($('#select-coach').html())

                                        },
                                        error: function (e) {
                                            console.log(e.status)
                                        }
                                    })
                                }, 100);
                            })
                        })

                        //上课日期时间
                        setTimeout(() => {
                            $('#edit-course-context-three').val(listdata.dateStr)
                            $('#edit-course-context-four').val(listdata.timeStr.split('-')[0])
                            $('#edit-course-context-five').val(listdata.timeStr.split('-')[1])
                        }, 100);

                        //课程零售价渲染
                        setTimeout(() => {
                            $('#course-price').val(listdata.leagueCurriculumPrice)
                        }, 100);

                        //课程标准价渲染
                        setTimeout(() => {
                            $('.add-course-sortone-inputthree-input').html(listdata.price)
                        }, 100);

                        //开课人数渲染
                        setTimeout(() => {
                            $('#mincount').val(listdata.minNumber)
                        }, 100);

                        //最大开课人数
                        setTimeout(() => {
                            $('#maxcount').val(listdata.maxNumber)
                        }, 100);

                        //是否排队
                        setTimeout(() => {
                            if(listdata.isQueue == 1){
                                $('#is-Queue').children('.paypay').eq(0).click()
                            }else{
                                $('#is-Queue').children('.paypay').eq(1).click()
                            }
                        }, 100);

                        //贴标
                        setTimeout(() => {
                            if(!listdata.tagName){
                                $('#tag-Name').children('.paypay').eq(0).click()
                            }
                            else if(listdata.tagName == "热门"){
                                $('#tag-Name').children('.paypay').eq(1).click()
                            }else if(listdata.tagName == "体验"){
                                $('#tag-Name').children('.paypay').eq(2).click()
                            }
                        }, 100);

                        setTimeout(() => {
                            //下拉菜单的动态
                            selectMenu(2);
                            selectMenu(3);

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
                            
                        }, 100);

                    }, 100);

                //发送参数
                $('#edit-course-footer-pone').click(function () {
                    setTimeout(() => {             
                        $(this).parent().parent().parent().hide()
                        //获取门店id
                        for (var i = 0; i < $('#select-menu-ul-one').children().length; i++) {
                            if ($('#select-menu-ul-one').children().eq(i).html() == $('#select-menu-input-mendian1').val()) {
                                var storeId = $('#select-menu-ul-one').children().eq(i).attr('class')
                                //console.log(111)
                            }
                            //console.log($('#select-menu-input-mendian1').val())
                        }
                        console.log(storeId)

                        //获取房间id
                        for (var i = 0; i < $('#select-menu-ul-RoomList').children().length; i++) {
                            if ($('#select-menu-ul-RoomList').children().eq(i).html() == $('#select-menu-inputroom').val()) {
                                var roomId = $('#select-menu-ul-RoomList').children().eq(i).attr('class').split(' ')[0]
                                //console.log("mendiandm")
                            }
                        }

                        //获取课程名称
                        var leagueCurriculumId = $('#select-menu-input-coursename').attr('class')

                        //获取课程开始和结束时间
                        var start = $('#edit-course-context-three').val()+" "+$('#edit-course-context-four').val()+":00"
                        var end = $('#edit-course-context-three').val()+" "+$('#edit-course-context-five').val()+":59"
                        var data1 = new Date(start)
                        var data2 = new Date(end)
                        var startDate = data1.getTime()
                        var endDate = data2.getTime()
                        //获取课程价格
                        var price = Number($('#course-price').val())

                        //获取开课最大和最小人数
                        var maxNumber = Number($('#maxcount').val())
                        var minNumber = Number($('#mincount').val())

                        //是否排队             
                        if ($('#is-Queue').children('.paypayisQueue').eq(0).hasClass('1')) {
                            var isQueue = 1
                            //console.log(isQueue)
                        } else {
                            var isQueue = 0
                            //console.log(isQueue)
                        }

                        //标签id
                        var tagId = ''
                        if($('#tag-Name').children('.paypay').eq(0).hasClass('1')){
                            tagId = 0
                        }
                        else if($('#tag-Name').children('.paypay').eq(1).hasClass('1')){
                            tagId = "8222a8d209a24520b116747a047529b3"
                        }else{
                            tagId =  "941660f44ced4aefa8b5b24809a0d43b"
                        }

                        //获取员工工号及比例
                        var courseSchedulingItemList = []
                        if($('#coach-performance').html() == ''){
                            courseSchedulingItemList.push({ coachId : $('#all-coach').children().eq(0).attr('class').split(' ')[1], performance : 1})
                        }else{
                            for (var i = 0; i < $('#coach-performance').children().length; i++) {
                            courseSchedulingItemList.push({ coachId: $('#coach-performance').children().eq(i).children().eq(0).attr('class').split(' ')[1], performance: $('#coach-performance').children().eq(i).children('input').val()})
                            }
                        }                

                        setTimeout(() => {
                            var paramsrevise = {
                                storeId: storeId,
                                roomId: roomId,
                                leagueCurriculumId: leagueCurriculumId,
                                startDate: startDate,
                                endDate: endDate,
                                price: price,
                                maxNumber: maxNumber,
                                minNumber: minNumber,
                                isQueue: isQueue,
                                tagId: tagId,
                                courseSchedulingItemList: courseSchedulingItemList,
                                id : listdata.id
                            }
                            console.log(paramsrevise)

                            $.ajax({
                                url : 'http://test.physicalclub.com/rest/courseScheduling/updateCourseScheduling',
                                type : 'POST',
                                contentType : 'application/json;charset=UTF-8',
                                data : JSON.stringify(paramsrevise),
                                success : function(result){
                                    console.log(result)
                                },
                                error : function(e){
                                    console.log(e.status)
                                }
                            })
                        }, 200);

                    }, 200);

                    // var paramsrevise = {
                    //     storeId : storeId,
                    //     roomId : roomId,
                    // }

                    })

                })
                
            }, 100);
        
        }
    }

    class computed {
        constructor() {
            // this.checkbox = $(".course-arranging-table-checkbox")
            
        }
        init() {
            this.checkbox_click()
            this.a_del()
            this.select_all1()
            //this.select_option()
            this.pay()
            this.adch_showhide()
        }

        checkbox_click() {
            //表格第一列显示或隐藏打钩
            $(".course-arranging-table-checkbox").click(function () {
                if ($(this).children('img').is(":hidden")) {
                    setTimeout(() => {
                        $(this).children('img').show()
                        $(this).children('img').addClass('11')
                    }, 50);
                } else {
                    setTimeout(() => {
                        $(this).children('img').hide()
                        $(this).children('img').removeClass('11')
                        $('#course-arranging-table-checkbox-all').children('img').hide()
                    }, 50);
                }
            })

            $('#course-arranging-table-checkbox-all').click(function(){
                if($(this).children('img').is(':hidden')){
                    $(".course-arranging-table-checkbox").children('img').show()
                }else{
                    $(".course-arranging-table-checkbox").children('img').hide()
                }
            })
        }

        a_del() {
            //点击删除按钮事件
            $('.a-del').click(function () {
                $(this).parent().parent().children().eq(12).children().show()
            })

            new a_del().init()
        }

        select_all1() {
            //下拉菜单的动态渲染
        }

        pay() {
            

        }

        adch_showhide() {
        }
    }

    class a_del {
        init() {
            this.a_del_click()
            this.edit_course_showhide()
        }
        //删除表格的确定或取消
        a_del_click() {
            $('.td-del-flex-yes').click(function () {
                $(this).parent().parent().parent().parent().remove()
                //if($(this).parent().parent().parent().parent())
                console.log($(this).parent().parent().parent().parent().children().eq(0).attr('class'))

                var ids = []

                var ids1 = $(this).parent().parent().parent().parent().children().eq(0).attr('class')

                ids.push(ids1)

                var idsstr = {
                    operationType : 1,
                    ids : ids
                }

                console.log(idsstr)

                $.ajax({
                    url : 'http://test.physicalclub.com/rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
                    type : 'POST',
                    contentType : 'application/json;charset=UTF-8',
                    data : JSON.stringify(idsstr),
                    success : function(result){
                        console.log(result)
                    },
                    error : function(e){
                        console.log(e.status)
                    }
                })

                // setTimeout(() => {
                //     window.location.reload()
                // }, 100);
            })
            $('.td-del-flex-no').click(function () {
                $(this).parent().parent().hide()
                //console.log($(this).parent().parent().parent().parent().children().eq(0).attr('class'))
            })
        }

        edit_course_showhide() {
            
        }
    }

    class course_arranging_not {
        constructor() {
            this.select_one = $(".course-arranging-not-flex-select-one")
            //this.select_two = $(".course-arranging-flex-select-two")
            this.table = $("#course-arranging-table2")
            //this.input_four = $(".course-arranging-footer-pthree")
        }

        init() {
            this.time()
            this.select_all1()
            this.table_all()
            //this.input_all4()
            
            this.edit_course()
            this.publishshowhide()
            this.select_option()
        }

        time() {
            $('.J-datepicker-day1').datePicker({
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

        select_all1() {
            //下拉菜单动态渲染

            setTimeout(() => {
                var pulishmendian = '';
                //门店列表渲染
                $.ajax({
                    url: 'http://test.physicalclub.com/rest/club/getClubInfo',
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        $.each(data.rows, function (i, item) {
                            pulishmendian += `
                            <li class="`+ item.clubId + `">` + item.clubName + `</li>
                        `
                        })
                        setTimeout(() => {
                            $('#select-menu-ul-pulishmendian1').html(pulishmendian)
                            $('#select-menu-input-mendian1').val("全部")
                        }, 100);
                        
                        console.log("diyige")
                    },
                    error: function (msg) {
                        console.log(msg)
                    }
                })
            }, 100);

            //房间下拉菜单渲染

            $('#select-menu-div-room1').click(function () {
                console.log(11)
                setTimeout(() => {
                    var storeId = ''
                    if ($('#select-menu-input-mendian2').val() == "全部") {
                        storeId = ''
                    } else {
                        for (var i = 0; i < $('#select-menu-ul-pulishmendian1').children().length; i++) {
                            if ($('#select-menu-ul-pulishmendian1').children().eq(i).html() == $('#select-menu-input-mendian2').val()) {
                                storeId = $('#select-menu-ul-pulishmendian1').children().eq(i).attr('class')
                                var storeId1 = storeId.split(' ')[0]
                            }
                        }
                        //var RoomList = { clubId: storeId1 }
                        //console.log(RoomList)
                        $.ajax({
                            url: 'http://test.physicalclub.com/crm/rest/club/getClubRoomList?clubId='+storeId1,
                            type: 'POST',
                            success: function (result) {
                                console.log(result)
                                var strsecond = ''

                                for (var i = 0; i < result.rows.length; i++) {
                                    strsecond += `
                                        <li class="`+ result.rows[i].roomId + `">` + result.rows[i].roomName + `</li>
                                    `
                                }

                                setTimeout(() => {
                                    $('#select-menu-ul-room1').html(strsecond)
                                }, 100);
                            },
                            error: function (e) {
                                console.log(e.status)
                            }
                        })
                    }

                }, 100);
            })
        }

        select_option() {
            //第一个下拉菜单的动态
            $("#select-menu-input-mendian2").eq(0).val($(".select-this").eq(0).html()); //在输入框中自动填充第一个选项的值
            $("#select-menu-div1").eq(0).on("click", function (e) {
                e.stopPropagation();
                if ($("#select-menu-ul-pulishmendian1").eq(0).css("display") === "block") {
                    setTimeout(() => {
                        $("#select-menu-ul-pulishmendian1").eq(0).hide();
                        $("#select-menu-div1").eq(0).find("i").removeClass("select-menu-i");
                        $("#select-menu-ul-pulishmendian1").eq(0).animate({
                            marginTop: "0",
                            opacity: "0"
                        }, "fast");
                    }, 50);

                } else {
                    setTimeout(() => {
                        $("#select-menu-ul-pulishmendian1").eq(0).show();
                        $("#select-menu-div1").eq(0).find("i").addClass("select-menu-i");
                        $("#select-menu-ul-pulishmendian1").eq(0).animate({
                            marginTop: "5px",
                            opacity: "1"
                        }, "fast");
                    }, 50);

                }
                for (var i = 0; i < $("#select-menu-ul-pulishmendian1").length; i++) {
                    if (i !== 0 && $("#select-menu-ul-pulishmendian1").eq(i).css("display") === "block") {
                        setTimeout(() => {
                            $("#select-menu-ul-pulishmendian1").eq(i).hide();
                            $("#select-menu-div1").eq(i).find("i").removeClass("select-menu-i");
                            $("#select-menu-ul-pulishmendian1").eq(i).animate({
                                marginTop: "0",
                                opacity: "0"
                            }, "fast");
                        }, 50);
                    }
                }
            });
            $("#select-menu-ul-pulishmendian1").eq(0).on("click", "li", function () { //给下拉选项绑定点击事件
                setTimeout(() => {
                    $("#select-menu-input-mendian2").eq(0).val($(this).html()); //把被点击的选项的值填入输入框中
                    $("#select-menu-div1").eq(0).click();
                    $(this).siblings(".select-this").removeClass("select-this");
                    $(this).addClass("select-this");
                }, 50);

            });
            $("body").on("click", function (event) {
                setTimeout(() => {
                    event.stopPropagation();
                    if ($("#select-menu-ul-pulishmendian1").eq(0).css("display") === "block") {
                        console.log(1);
                        $("#select-menu-ul-pulishmendian1").eq(0).hide();
                        $("#select-menu-div1").eq(0).find("i").removeClass("select-menu-i");
                        $("#select-menu-ul-pulishmendian1").eq(0).animate({
                            marginTop: "0",
                            opacity: "0"
                        }, "fast");

                    }
                }, 50);
            });

            //第二个下拉菜单的动态
            $("#select-menu-input-room1").eq(0).val($(".select-this").eq(0).html()); //在输入框中自动填充第一个选项的值
            $("#select-menu-div-room1").eq(0).on("click", function (e) {
                e.stopPropagation();
                if ($("#select-menu-ul-room1").eq(0).css("display") === "block") {
                    setTimeout(() => {
                        $("#select-menu-ul-room1").eq(0).hide();
                        $("#select-menu-div-room1").eq(0).find("i").removeClass("select-menu-i");
                        $("#select-menu-ul-room1").eq(0).animate({
                            marginTop: "0",
                            opacity: "0"
                        }, "fast");
                    }, 50);

                } else {
                    setTimeout(() => {
                        $("#select-menu-ul-room1").eq(0).show();
                        $("#select-menu-div-room1").eq(0).find("i").addClass("select-menu-i");
                        $("#select-menu-ul-room1").eq(0).animate({
                            marginTop: "5px",
                            opacity: "1"
                        }, "fast");
                    }, 50);

                }
                for (var i = 0; i < $("#select-menu-ul-room1").length; i++) {
                    if (i !== 0 && $("#select-menu-ul-room1").eq(i).css("display") === "block") {
                        setTimeout(() => {
                            $("#select-menu-ul-room1").eq(i).hide();
                            $("#select-menu-div-room1").eq(i).find("i").removeClass("select-menu-i");
                            $("#select-menu-ul-room1").eq(i).animate({
                                marginTop: "0",
                                opacity: "0"
                            }, "fast");
                        }, 50);
                    }
                }
            });
            $("#select-menu-ul-room1").eq(0).on("click", "li", function () { //给下拉选项绑定点击事件
                setTimeout(() => {
                    $("#select-menu-input-room1").eq(0).val($(this).html()); //把被点击的选项的值填入输入框中
                    $("#select-menu-div-room1").eq(0).click();
                    $(this).siblings(".select-this").removeClass("select-this");
                    $(this).addClass("select-this");
                }, 50);

            });
            $("body").on("click", function (event) {
                setTimeout(() => {
                    event.stopPropagation();
                    if ($("#select-menu-ul-room1").eq(0).css("display") === "block") {
                        console.log(1);
                        $("#select-menu-ul-room1").eq(0).hide();
                        $("#select-menu-div-room1").eq(0).find("i").removeClass("select-menu-i");
                        $("#select-menu-ul-room1").eq(0).animate({
                            marginTop: "0",
                            opacity: "0"
                        }, "fast");

                    }
                }, 50);
            });

        }

        table_all() {
            var that = this

            var onPagechange = function (page) {
                console.log(page)
                aaaaaa(page)
            }

            var page = 1;
            aaaaaa(page)

            function aaaaaa(page) {

             $('#publish-search1').click(function () {
                    var storeId = ''
                    var roomId = ''
                    var realName = ''
                    var userName = ''
                    var startDate = ''
                    var endDate = ''

                    if ($('#select-menu-input-mendian2').val() == "全部") {
                        storeId = ''
                    } else {
                        for (var i = 0; i < $('#select-menu-ul-pulishmendian1').children().length; i++) {
                            if ($('#select-menu-ul-pulishmendian1').children().eq(i).html() == $('#select-menu-input-mendian2').val()) {
                                storeId = $('#select-menu-ul-pulishmendian1').children().eq(i).attr('class').split(' ')[0]
                            }
                        }
                    }
                    console.log(storeId)
                    if ($('#select-menu-input-room1').val() == '') {
                        roomId = ''
                    } else {
                        for (var i = 0; i < $('#select-menu-ul-room1').children().length; i++) {
                            if ($('#select-menu-ul-room1').children().eq(i).html() == $('#select-menu-input-room1').val()) {
                                roomId = $('#select-menu-ul-room1').children().eq(i).attr('class')
                                //roomId = "c0f6b689-0375-4d7c-b1f8-01b86d55e57a"
                            }
                        }
                    }

                    realName = $('#teaching-course-coach1').val()

                    userName = $('#coach-id1').val()

                    startDate = $('#create-course-time1').val()

                    endDate = $('#end-course-time1').val()

                    console.log(roomId)
                    var SchedulingList = {
                        state: 1,
                        page: page,
                        rows: 10,
                        storeId: storeId,
                        roomId: roomId,
                        realName: realName,
                        userName: userName,
                        startDate: startDate,
                        endDate: endDate
                    }

                    console.log(SchedulingList)

                    $.ajax({
                        url: 'http://test.physicalclub.com/rest/courseScheduling/selectCourseSchedulingList',
                        type: 'POST',
                        contentType: 'application/json;charset=UTF-8',
                        data: JSON.stringify(SchedulingList),
                        success: function (result) {
                            console.log(result)

                            //表格的动态渲染
                        var str2 = `
                        <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th style="width:2.4rem"></th>
                            <th style="width:9rem">门店</th>
                            <th style="width:9rem">房间</th>
                            <th style="width:6.7rem">日期</th>
                            <th style="width:6.7rem">时间</th>
                            <th style="width:6rem">上课教练</th>
                            <th style="width:6rem">教练工号</th>
                            <th style="width:6rem">课程名称</th>
                            <th style="width:6rem">课程售价</th>
                            <th style="width:6rem">最大人数</th>
                            <th style="width:6rem">开课人数</th>
                            <th style="width:6rem">贴标</th>
                            <th></th>
                            <th style="width:6rem">操作</th>
                        </tr>
                    `

                            //教练姓名格式判断

                            function coachname(arr) {
                                var coachname;
                                if (arr == '') {
                                    return coachname = ''
                                }
                                else if (arr) {
                                    return coachname = arr[0].realName
                                }
                            }
                            //教练工号格式判断

                            function username(arr) {
                                var username;
                                if (arr == '') {
                                    return username = ''
                                }
                                else if (arr) {
                                    return username = arr[0].userName
                                }
                            }

                            //贴标判断
                            function tiebiao(arr) {
                                var tiebiao = '';
                                if (!arr) {
                                    return tiebiao = ''
                                } else {
                                    return tiebiao = arr
                                }
                            }

                            $.each(result.rows, function (i, item){
                            str2 += `
                            <tr class="course-arranging-table-tr">
                            <td style="width:2.4rem" class="`+ item.id + `"><div style="display:flex;justify-content: center;"><div class="course-arranging-table-checkbox"><img style="display:none" src="./image/codeallset_btn.png"></div></div></td>
                            <td style="width:9rem" style="position:relative">`+ item.storeName + `<img style="position:absolute;left:6.7rem;top:0px;display:none" src="image/recommended_img.png"></td>
                            <td style="width:9rem">`+ item.roomName + `</td>
                            <td style="width:6.7rem">`+ item.dateStr + `</td>
                            <td style="width:6.7rem">`+ item.timeStr + `</td>
                            <td style="width:6rem">`+ coachname(item.courseSchedulingItemList) + `</td>
                            <td style="width:6rem">`+ username(item.courseSchedulingItemList) + `</td>
                            <td style="width:6rem">`+ item.leagueCurriculumName + `</td>
                            <td style="width:6rem">￥`+ item.price + `</td>
                            <td style="width:6rem">`+ item.maxNumber + `人</td>
                            <td style="width:6rem">`+ item.minNumber + `人</td>
                            <td style="width:6rem">`+ tiebiao(item.tagName) + `</td>
                            <td width="0" style="position:relative;border:none">
                                <div class="td-del" style="display:none">
                                    <div class="td-del-flex">
                                        <p>是否删除该课程?</p>
                                        <p class="td-del-not-flex-yes">确定</p>
                                        <p class="td-del-not-flex-no">取消</p>
                                    </div>
                                    <p class="td-del-line"></p>
                                    <p class="td-del-left">移除课表后，教练将不会看到该课程!</p>
                                </div
                            </td>
                            <td style="width:6rem">
                                <a class="a-add1 `+ i + `" style="display:none">编辑</a><a class="a-del">删除</a>
                            </td>
                        </tr>
                    `
                            })
                            that.table.html(str2)

                            var obj = {
                                wrapid: 'boxpage1', //页面显示分页器容器id
                                total: result.total, //总条数
                                pagesize: 10, //每页显示10条
                                currentPage: page, //当前页
                                onPagechange: onPagechange
                                //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                            }

                            pagination.init(obj);
                            //var cccccccc ="woshiwoshwisowhi"
                            var list = result
                            //console.log(list)
                            setTimeout(() => {
                                new computed_not().init()
                                new course_arranging_not().edit_course(list)
                            }, 100);

                        },
                        error: function (e) {
                            console.log(e.status);
                            console.log(e.responseText)
                        }
                    })

                })

            var SchedulingList = {
                state: 1,
                page: page,
                rows: 10
            }

            $.ajax({
                url: 'http://test.physicalclub.com/rest/courseScheduling/selectCourseSchedulingList',
                type: 'POST',
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify(SchedulingList),
                success: function (result) {
                    console.log(result)

                    //表格的动态渲染
                    var str2 = `
                        <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th style="width:2.4rem"></th>
                            <th style="width:9rem">门店</th>
                            <th style="width:9rem">房间</th>
                            <th style="width:6.7rem">日期</th>
                            <th style="width:6.7rem">时间</th>
                            <th style="width:6rem">上课教练</th>
                            <th style="width:6rem">教练工号</th>
                            <th style="width:6rem">课程名称</th>
                            <th style="width:6rem">课程售价</th>
                            <th style="width:6rem">最大人数</th>
                            <th style="width:6rem">开课人数</th>
                            <th style="width:6rem">贴标</th>
                            <th></th>
                            <th style="width:6rem">操作</th>
                        </tr>
                    `

                    //教练姓名格式判断

                    function coachname(arr) {
                        var coachname;
                        if (arr == '') {
                            return coachname = ''
                        }
                        else if (arr) {
                            return coachname = arr[0].realName
                        }
                    }
                    //教练工号格式判断

                    function username(arr) {
                        var username;
                        if (arr == '') {
                            return username = ''
                        }
                        else if (arr) {
                            return username = arr[0].userName
                        }
                    }

                    //贴标判断
                    function tiebiao(arr) {
                        var tiebiao = '';
                        if (!arr) {
                            return tiebiao = ''
                        } else {
                            return tiebiao = arr
                        }
                    }

                    $.each(result.rows, function (i, item) {
                        str2 += `
                        <tr class="course-arranging-table-tr">
                            <td style="width:2.4rem" class="`+ item.id + `"><div style="display:flex;justify-content: center;"><div class="course-arranging-table-checkbox"><img style="display:none" src="./image/codeallset_btn.png"></div></div></td>
                            <td tyle="width:9rem" style="position:relative">`+ item.storeName + `<img style="position:absolute;left:6.7rem;top:0px;display:none" src="image/recommended_img.png"></td>
                            <td tyle="width:9rem">`+ item.roomName + `</td>
                            <td style="width:6.7rem">`+ item.dateStr + `</td>
                            <td style="width:6.7rem">`+ item.timeStr + `</td>
                            <td style="width:6rem">`+ coachname(item.courseSchedulingItemList) + `</td>
                            <td style="width:6rem">`+ username(item.courseSchedulingItemList) + `</td>
                            <td style="width:6rem">`+ item.leagueCurriculumName + `</td>
                            <td style="width:6rem">￥`+ item.price + `</td>
                            <td style="width:6rem">`+ item.maxNumber + `人</td>
                            <td style="width:6rem">`+ item.minNumber + `人</td>
                            <td style="width:6rem">`+ tiebiao(item.tagName) + `</td>
                            <td width="0" style="position:relative;border:none">
                                <div class="td-del" style="display:none">
                                    <div class="td-del-flex">
                                        <p>是否变更该课程?</p>
                                        <p class="td-del-not-flex-yes">确定</p>
                                        <p class="td-del-not-flex-no">取消</p>
                                    </div>
                                    <p class="td-del-line"></p>
                                    <p class="td-del-left">变更课表后，将不会看到该课程!</p>
                                </div
                            </td>
                            <td style="width:6rem">
                                <a class="a-add1 `+ i + `" style="display:none">变更</a>
                                <a class="a-del">下架</a>
                            </td>
                        </tr>
                    `
                    })
                    that.table.html(str2)

                    var obj = {
                        wrapid: 'boxpage1', //页面显示分页器容器id
                        total: result.total, //总条数
                        pagesize: 10, //每页显示10条
                        currentPage: page, //当前页
                        onPagechange: onPagechange
                        //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                    }

                    pagination.init(obj);
                    //var cccccccc ="woshiwoshwisowhi"
                    var list = result
                    //console.log(list)
                    setTimeout(() => {
                        new computed_not().init()
                        new course_arranging_not().edit_course(list)
                    }, 100);

                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText)
                }
            })

            }

        }

        publishshowhide() {
            $('#course-arranging-header-one-pone').click(function () {
                $('#course-arranging-header-one-ptwo').removeClass('course-arranging-header-one-ptwo-active')
                $(this).addClass('course-arranging-header-one-pone-active')
                $('#course-arranging-body-left').show()
                $('#course-arranging-body-right').hide()
            })
        }

        edit_course(list) {
            var that = this

            setTimeout(() => {
                //点击编辑按钮事件
                $('.a-add1').click(function () {
                    console.log(list)
                    if (list) {
                        var count = $(this).attr('class').split(' ')[1]
                        //console.log($('.a-add').length)

                        var listdata = list.rows[count]
                    }

                    console.log(listdata)

                    $('#edit-course2').show()

                    var editstr;
                    var addeditstr;
                    var acn_str;
                    //新增窗口的动态渲染
                    editstr = `
                    <div class="edit-course-header">
                        <div class="edit-course-header-one">
                            <img class="edit-course-header-imgone" src="./image/editor_icon.png" alt="" />
                            <p class="edit-course-header-pone">新增发布发布</p>
                        </div>
                        <img class="edit-course-header-imgone" style="width:1.1rem;height:1.15rem" id="edit-course-hide2" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="edit-course-context">
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one" style="margin-right:5.55rem">门店</div>
                            <div id="edit-course-context-first">
                                <div class="select-menu5">
                                    <div class="select-menu-div" id="select-menu-div-mendian3">
                                        <input class="select-menu-input" id="select-menu-input-mendian3"/>

                                        <img class="select-menu-img" src="./image/sifting_icon.png"/>
                                    </div>
                                    <ul class="select-menu-ul" id="select-menu-ul-one1" style="height:10rem;overflow-y:scroll">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one" style="margin-right:5.55rem">房间</div>
                            <div id="edit-course-context-second">
                                <div class="select-menu5">
                                    <div class="select-menu-div" id="select-menu-div-inputroom3">
                                        <input class="select-menu-input" id="select-menu-inputroom3"/>
                                        <img class="select-menu-img" src="./image/sifting_icon.png"/>
                                    </div>
                                    <ul class="select-menu-ul" id="select-menu-ul-RoomList1" style="height:10rem;overflow-y:scroll">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one">课程名称</div>  
                            <div class="select-menu-input-coursename-div">
                                <input id="select-menu-input-coursename2" style="margin-left:0.5rem;border:0;font-size:0.7rem"/>   
                            </div> 
                        </div>
                        <div class="edit-course-context-flextwo">
                            <div class="edit-course-context-one">上课教练</div>
                            <div class="edit-course-context-twoall" id="all-coach2">
                                
                            </div>
                            <p class="edit-course-context-three" id="edit-course-addadd1">添加</p>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one">上课日期</div>
                            <div style="width:7.5rem;height:1.8rem;border:1px solid #BFBFBF;border-radius:0.2rem;margin:0 2.95rem 0 3.85rem">
                            <input id="edit-course-context-three2" style="width:7.5rem;height:1.8rem;border:0;padding-left:0.5rem;box-sizing:border-box"></input>
                            </div>
                            <p style="font-size:0.9rem;margin-right:0.9rem">上课时间</p>
                            <div style="width:6rem;height:1.8rem;border:1px solid #BFBFBF;border-radius:0.2rem;">
                            <input id="edit-course-context-four2" style="width:6rem;height:1.8rem;border:0;padding-left:0.5rem;box-sizing:border-box"></input>
                            </div>
                            <p style="margin:0 0.3rem 0 0.3rem">-</p>
                            <div style="width:6rem;height:1.8rem;border:1px solid #BFBFBF;border-radius:0.2rem;">
                            <input id="edit-course-context-five2" style="width:6rem;height:1.8rem;border:0;padding-left:0.5rem;box-sizing:border-box"></input>
                            </div>
                        </div>

                        <div class="edit-course-context-flex3">
                            <p class="edit-course-context-flex3-pone">课程售价</p>
                            <div class="add-course-sortone-inputtwo">
                                <p>￥</p>
                                <input type="text" id="course-price2">
                            </div>
                            <p class="edit-course-context-flex3-ptwo">标准价</p>
                            <div class="add-course-sortone-inputthree">
                                <p>￥</p>
                                <p class="add-course-sortone-inputthree-input" id="add-course-sortone-inputthree-input2">188.00</p>
                            </div>
                        </div>

                        <div class="edit-course-context-flex3">
                            <p class="edit-course-context-flex3-pone">开课人数</p>
                            <div class="add-course-sortone-inputtwo">
                                <input type="text" id="mincount2">
                            </div>
                            <p style="margin-left:-1rem;margin-right:0.4rem;">人</p>
                            <p class="edit-course-context-flex3-ptwo">最大人数</p>
                            <div class="add-course-sortone-inputthree" style="margin-left:0.85rem;">
                                <input type="text" id="maxcount2" style="text-decoration:none;color:black">
                            </div>
                            <p style="margin-left:-1rem">人</p>
                        </div>

                        <div class="edit-course-context-flex3" id="is-Queue2">
                            <p class="edit-course-context-flex3-pone" style="margin-right:1.75rem">是否排队</p>
                            <div class="paypay paypayisQueue2">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">是</p>
                            <div class="paypay paypayisQueue2">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">否</p>
                        </div>

                        <div class="edit-course-context-flex3" id="tag-Name2">
                            <p class="edit-course-context-flex3-pone" style="margin-right:3.5rem">贴标</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">无</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">热门</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:0.7rem">体验</p>
                        </div>
                        <div class="edit-course-context-flex4">
                            <p class="edit-course-context-flex4-pone">业绩比例</p>
                            <div class="edit-course-context-flex4-ptwo" id="coach-performance2">
                                
                            </div>
                        </div>

                        <div class="add-course-name" id="add-course-name3">

                        </div>

                        <div class="edit-course-footer">
                            <p class="edit-course-footer-pone" id="edit-course-footer-pone2">保存</p>
                            <p class="edit-course-footer-ptwo" id="edit-course-footer-ptwo2">取消</p>
                        </div>
                        <div class="add-edit-course-change" id="add-edit-course-change" style="display:none">
                            <div class="add-edit-course-change-header">
                                <div class="add-edit-course-change-header-flex">
                                    <img src="./image/tags_icon.png" alt=""/>
                                    <p>课程变更</p>
                                </div>
                                <img style="width:1.1rem;height:1.1rem" id="change-header-not-imgtwo" src="./image/popupclose_btn.png" alt=""/>
                            </div>
                            <div class="add-edit-course-change-context">
                                <p class="add-edit-course-change-context-pone">变更原因</p>
                                <div class="add-edit-course-change-context-ptwo">
                                    <p>门店停电</p>
                                    <p class="course-arranging-not-table-checkbox1"><img style="display:none" src="./image/codeallset_btn.png"></p>
                                </div>
                                <div class="add-edit-course-change-context-ptwo">
                                    <p>公司会议</p>
                                    <p class="course-arranging-not-table-checkbox1"><img style="display:none" src="./image/codeallset_btn.png"></p>
                                </div>
                                <div class="add-edit-course-change-context-ptwo">
                                    <p>身体不适</p>
                                    <p class="course-arranging-not-table-checkbox1"><img style="display:none" src="./image/codeallset_btn.png"></p>
                                </div>
                                <div class="add-edit-course-change-context-ptwo">
                                    <p>临时有事</p>
                                    <p class="course-arranging-not-table-checkbox1"><img style="display:none" src="./image/codeallset_btn.png"></p>
                                </div>
                                <div class="add-edit-course-change-context-ptwo">
                                    <p>个人休假</p>
                                    <p class="course-arranging-not-table-checkbox1"><img style="display:none" src="./image/codeallset_btn.png"></p>
                                </div>
                                <textarea placeholder="其他原因" class="add-edit-course-change-context-textarea"></textarea>
                                <div class="add-edit-course-change-context-footer">
                                    <p class="add-edit-course-change-context-footer-pone">确定</p>
                                    <p class="add-edit-course-change-context-footer-ptwo">取消</p>
                                </div>
                            </div>
                    </div>
                `
                    //添加教练窗口的动态渲染
                    addeditstr = `
                    <div class="add-edit-course-header">
                        <div class="add-edit-course-header-one">
                            <img class="add-edit-course-header-imgone" src="./image/editor_icon.png" alt="" />
                            <p class="add-edit-course-header-pone">添加教练</p>
                        </div>
                        <img class="add-edit-course-header-imgone" id="add-edit-course-hide2" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="add-edit-course-header-context">
                        <div class="add-edit-course-header-context-one">
                            <div class="add-edit-course-header-context-oneflex">
                                <input / id="search-value2">
                                <div class="add-edit-course-header-context-one-blue">
                                    <img src="./image/search_btn.png" alt=""/ id="search-search2">
                                </div>
                            </div>
                        </div>
                        <div class="add-edit-course-header-context-one" id="coach-show2" style="justify-content: left;padding-left:1.1rem">

                        </div>
                        <div class="add-edit-course-header-context-two">
                            <p class="add-edit-course-header-context-two-pone">已选择教练</p>
                            <div class="add-edit-course-header-context-twoflex" id="select-coach2">
                                
                            </div>
                        </div>
                        <div class="add-edit-course-header-context-three">
                            <p id="add-edit-course-header-context-three-pone2" class="add-edit-course-header-context-three-pone">确定</p>
                            <p id="add-edit-course-header-context-three-ptwo" class="add-edit-course-header-context-three-ptwo">取消</p>
                        </div>
                    </div>
                `

                    acn_str = `
                    <div class="add-course-name-header">
                        <div class="add-course-name-header-left">
                            <img src="./image/tags_icon.png" alt=""/>
                            <p>课程名称</p>
                        </div>
                        <img style="width:1.1rem;height:1.1rem" id="add-course-name-header-img2" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="add-course-name-context">
                        <div class="add-course-name-context-flex" id="add-course-name-context-flex-coursename3">
                            
                        </div>
                        <div class="add-course-name-context-bottom1">
                            <p id="add-course-name-context-bottom-pone2">确定</p>
                            <p id="add-course-name-context-bottom-ptwo2">取消</p>
                        </div>
                    </div>
                `
                    $('#edit-course2').html(editstr)
                    $('#add-edit-course2').html(addeditstr)
                    $('#add-course-name3').html(acn_str)

                    //添加教练的叉叉关闭
                    $('#add-edit-course-hide2').click(function () {
                        $(this).parent().parent().hide()
                    })

                    //添加教练的点击取消事件
                    $('#add-edit-course-header-context-three-ptwo').click(function () {
                        $(this).parent().parent().parent().hide()
                    })

                    //教练课程的显示隐藏
                    $('.add-course-name-context-p').click(function () {
                        $('.add-course-name-context-p').each(function () {
                            $(this).removeClass('add-course-name-context-p-active')
                        })
                        $(this).addClass('add-course-name-context-p-active')
                    })

                    //新增窗口的叉叉关闭
                    $('#edit-course-hide2').click(function () {
                        $(this).parent().parent().hide()
                        $('.paypay').each(function () {
                            $(this).children('.paypay-show').hide()
                            $(this).children('.paypay-hide').show()
                        })
                    })

                    //新增窗口的取消关闭
                    $('#edit-course-footer-ptwo2').click(function () {
                        $(this).parent().parent().parent().hide()
                        $('.paypay').each(function () {
                            $(this).children('.paypay-show').hide()
                            $(this).children('.paypay-hide').show()
                        })
                    })

                    //新增窗口单选框的显示及排他
                    $(".paypay").click(function () {
                        $(this).parent().children('.paypay').removeClass('1')
                        $(this).parent().children('.paypay').children('.paypay-show').hide()
                        $(this).parent().children('.paypay').children('.paypay-hidden').show()
                        if ($(this).children('.paypay-hidden').is(":hidden")) {
                            $(this).children('.paypay-hidden').show()
                            $(this).children('.paypay-show').hide()
                        } else {
                            $(this).children('.paypay-hidden').hide()
                            $(this).children('.paypay-show').show()
                            $(this).addClass('1')
                        }
                    })

                    setTimeout(() => {
                        var strfirstfirst = '';
                        //门店列表渲染
                        $.ajax({
                            url: 'http://test.physicalclub.com/rest/club/getClubInfo',
                            type: 'GET',
                            dataType: 'json',
                            success: function (data) {
                                $.each(data.rows, function (i, item) {
                                    strfirstfirst += `
                                    <li class="`+ item.clubId + `">` + item.clubName + `</li>
                                `
                                })
                                setTimeout(() => {
                                    $('#select-menu-ul-one1').html(strfirstfirst)
                                    $('#select-menu-input-mendian3').val(listdata.storeName)
                                    //console.log(222)
                                }, 100);
                            },
                            error: function (msg) {
                                console.log(msg)
                            }
                        })

                        //房间下拉菜单渲染
                        var strsecond = '';
                        var RoomList = { clubId: listdata.storeId }
                        $.ajax({
                            url: 'http://test.physicalclub.com/crm/rest/club/getClubRoomList',
                            type: 'POST',
                            contentType: 'application/json;charset=UTF-8',
                            data: JSON.stringify(RoomList),
                            success: function (result) {
                                //console.log(result)
                                for (var i = 0; i < result.rows.length; i++) {
                                    strsecond += `
                                        <li class="`+ result.rows[i].roomId + `">` + result.rows[i].roomName + `</li>
                                    `
                                }

                                setTimeout(() => {
                                    $('#select-menu-ul-RoomList1').html(strsecond)
                                    $('#select-menu-inputroom3').val(listdata.roomName)

                                }, 100);


                            },
                            error: function (e) {
                                console.log(e.status)
                            }
                        })

                        //课程名称下拉渲染
                        setTimeout(() => {
                            $('#select-menu-input-coursename2').val(listdata.leagueCurriculumName)
                            $('#select-menu-input-coursename2').addClass(listdata.leagueCurriculumId)
                        }, 100);

                        //课程名称的请求及渲染
                        $('#select-menu-input-coursename2').click(function () {
                            $('#add-course-name3').show()

                            var ad_ft1 = '';

                            $.ajax({
                                type: 'GET',
                                contentType: "application/json;charset=UTF-8",
                                url: "http://test.physicalclub.com/crm/rest/leagueCurriculum/getReleaseLeagueCurriculumListGroupByType",
                                success: function (results) {
                                    console.log(results)
                                    var result = results.rows
                                    //console.log(list)
                                    for (var i = 0; i < result.length; i++) {
                                        var ad_str2 = '';
                                        for (var j = 0; j < result[i].children.length; j++) {
                                            ad_str2 += `
                                                    <div class="flexthree-tags1 `+ result[i].children[j].id + `">
                                                        `+ result[i].children[j].name + `
                                                    </div>
                                                `
                                        }

                                        ad_ft1 += `
                                                <div class="coach-manage-addthree-flexthree-flex">
                                                    <p class="coach-manage-addthree-flexthree-flex-p">`+ result[i].classifyName + `</p>
                                                    <div class="addthree-flexfour">
                                                    `+ ad_str2 + `
                                                    </div>
                                                </div>  
                                            `

                                    }
                                    setTimeout(() => {
                                        $('#add-course-name-context-flex-coursename3').html(ad_ft1)

                                        $('.flexthree-tags1').click(function () {
                                            $('#add-course-name-context-flex-coursename3').children().children('.addthree-flexfour').children('.flexthree-tags1').removeClass('active1')
                                            if ($(this).hasClass('active1')) {
                                                setTimeout(() => {
                                                    $(this).removeClass('active1')
                                                }, 50);

                                            } else {
                                                setTimeout(() => {
                                                    $(this).addClass('active1')
                                                }, 50);
                                            }
                                        })

                                        console.log(list)
                                        console.log(result)
                                        for (var i = 0; i < result.length; i++) {
                                            for (var j = 0; j < result[i].children.length; j++) {
                                                if (result[i].children[j].name == $('#select-menu-input-coursename2').val()) {
                                                    $('#add-course-name-context-flex-coursename3').children().eq(i).children('.addthree-flexfour').children().eq(j).click()

                                                }
                                                // console.log(111)
                                            }
                                        }

                                        $('#add-course-name-context-bottom-pone2').click(function () {
                                            $(this).parent().parent().parent().hide()
                                            //$('#select-menu-input-coursename2').val($('#add-course-name-context-flex-coursename3').children().eq(i).children('.addthree-flexfour').children().eq(j).html())
                                            //$('#select-menu-input-coursename2').addClass($('#add-course-name-context-flex-coursename3').children().eq(i).children('.addthree-flexfour').children().eq(j).attr('class').split(' ')[1])

                                            for (var i = 0; i < $('#add-course-name-context-flex-coursename3').children().length; i++) {
                                                for (var j = 0; j < $('#add-course-name-context-flex-coursename3').children().eq(i).children('.addthree-flexfour').children().length; j++) {
                                                    if ($('#add-course-name-context-flex-coursename3').children().eq(i).children('.addthree-flexfour').children().eq(j).hasClass('active1')) {
                                                        $('#select-menu-input-coursename2').val($.trim($('#add-course-name-context-flex-coursename3').children().eq(i).children('.addthree-flexfour').children().eq(j).html()))
                                                        $('#select-menu-input-coursename2').addClass($('#add-course-name-context-flex-coursename3').children().eq(i).children('.addthree-flexfour').children().eq(j).attr('class').split(' ')[1])
                                                        //console.log($.trim($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).html()))
                                                    }
                                                }
                                            }

                                        })

                                    }, 100);

                                    //课程名称的取消和叉叉关闭页面
                                    $('#add-course-name-header-img2').click(function () {
                                        $(this).parent().parent().hide()
                                    })

                                    // //课程名称的取消按钮事件
                                    $('#add-course-name-context-bottom-ptwo2').click(function () {
                                        $(this).parent().parent().parent().hide()
                                    })

                                    // //课程名称页面的显示
                                    // $('.edit-course-context-three-pp').click(function () {
                                    //     $('#add-course-name1').show()
                                    // })

                                    // console.log($('#coach-manage-addthree-flexthree-list').html())
                                },
                                error: function (e) {
                                    console.log(e.status);
                                    console.log(e.responseText)
                                }
                            })
                        })

                        //教练名遍历渲染
                        var strcoach = '';
                        if (listdata.courseSchedulingItemList) {
                            for (var i = 0; i < listdata.courseSchedulingItemList.length; i++) {
                                strcoach += `
                                    <p class="edit-course-context-twoone `+ listdata.courseSchedulingItemList[i].userName + `">` + listdata.courseSchedulingItemList[i].realName + `</p>
                                `
                            }
                        } else {
                            strcoach = ''
                        }

                        //新增未发布教练的渲染
                        $('#all-coach2').html(strcoach)

                        //业绩比例展示
                        setTimeout(() => {
                            var strperformance = ''
                            if ($('#all-coach2').children().length > 1) {
                                for (var i = 0; i < $('#all-coach2').children().length; i++) {
                                    strperformance += `
                                        <div class="edit-course-context-flex4-pthree">
                                            <p class="edit-course-context-flex4-pfour">`+ $('#all-coach2').children().eq(i).html() + `</p>
                                            <input class="edit-course-context-flex4-pfive" />
                                        </div>
                                    `
                                }
                            } else {
                                strperformance = ''
                            }
                            $('#coach-performance').html(strperformance)
                        }, 100);

                        //点击添加按钮显示添加教练
                        $('#edit-course-addadd1').click(function () {
                            $('#add-edit-course2').show()
                            //教练选择页面
                            var strselect = ''
                            for (var i = 0; i < $('#all-coach2').children().length; i++) {
                                strselect += `
                                <p class="add-edit-course-header-context-two-ptwo `+ $('#all-coach2').children().eq(i).attr('class').split(' ')[1] + `">
                                    `+ $('#all-coach2').children().eq(i).html() + `
                                    <img src="./image/classdel_btn.png" alt=""/>
                                </p>
                            `
                            }

                            $('#select-coach2').html(strselect)

                            //添加教练鼠标移入事件
                            $('.add-edit-course-header-context-two-ptwo').mouseover(function () {
                                $(this).addClass('aechctp-active')
                                $(this).children('img').show()
                            })
                            //添加教练的鼠标移除事件
                            $('.add-edit-course-header-context-two-ptwo').mouseout(function () {
                                $(this).removeClass('aechctp-active')
                                $(this).children('img').hide()
                            })
                            //添加教练的标签，点击叉叉关闭
                            $('.add-edit-course-header-context-two-ptwo').children('img').click(function () {
                                $(this).parent().remove()
                            })

                            $('#search-search2').click(function () {
                                setTimeout(() => {
                                    $.ajax({
                                        url: 'http://test.physicalclub.com/crm/rest/leagueCoach/getLeagueCoachByJobNumber/' + $('#search-value2').val(),
                                        type: 'GET',
                                        dataType: 'json',
                                        success: function (result) {
                                            console.log(result)
                                            //console.log(strselect)

                                            var strcoachone = `
                                            <p id="coach-p2" class="`+ result.rows[0].userName + `" style="width:3.5rem;height:1.2rem;border-radius:0.2rem;background:#71B2EF;color:white;text-align:center;line-height:1.2rem">
                                            `+ result.rows[0].realName + `
                                            </p>
                                        `
                                            //点击查询渲染的教练名
                                            $('#coach-show2').html(strcoachone)

                                            $('#coach-p2').click(function () {
                                                strselect += `
                                                    <p class="add-edit-course-header-context-two-ptwo `+ $(this).attr('class') + `">
                                                        `+ $(this).html() + `
                                                        <img src="./image/classdel_btn.png" alt=""/>
                                                    </p>
                                                `
                                                setTimeout(() => {
                                                    //点击查询出的教练名进行渲染
                                                    $('#select-coach2').html(strselect)

                                                    //添加教练鼠标移入事件
                                                    $('.add-edit-course-header-context-two-ptwo').mouseover(function () {
                                                        $(this).addClass('aechctp-active')
                                                        $(this).children('img').show()
                                                    })
                                                    //添加教练的鼠标移除事件
                                                    $('.add-edit-course-header-context-two-ptwo').mouseout(function () {
                                                        $(this).removeClass('aechctp-active')
                                                        $(this).children('img').hide()
                                                    })
                                                    //添加教练的标签，点击叉叉关闭
                                                    $('.add-edit-course-header-context-two-ptwo').children('img').click(function () {
                                                        $(this).parent().remove()
                                                    })
                                                }, 100);
                                            })

                                            //添加教练的点击确认事件
                                            $('#add-edit-course-header-context-three-pone2').click(function () {
                                                $(this).parent().parent().parent().hide()
                                                var againcoach = ''
                                                for (var i = 0; i < $('#select-coach2').children().length; i++) {
                                                    againcoach += `
                                                        <p class="edit-course-context-twoone `+ $('#select-coach2').children().eq(i).attr('class').split(' ')[1] + `">` + $('#select-coach2').children().eq(i).text() + `</p>
                                                    `
                                                }
                                                $('#all-coach2').html(againcoach)

                                                var strperformance = ''

                                                //比例的渲染
                                                if ($('#all-coach2').children().length > 1) {
                                                    for (var i = 0; i < $('#all-coach2').children().length; i++) {
                                                        strperformance += `
                                                            <div class="edit-course-context-flex4-pthree `+ $('#all-coach2').children().eq(i).attr('class').split(' ')[1] + `">
                                                                <p class="edit-course-context-flex4-pfour">`+ $('#all-coach2').children().eq(i).html() + `</p>
                                                                <input class="edit-course-context-flex4-pfive" />
                                                            </div>
                                                        `
                                                    }
                                                } else {
                                                    strperformance = ''
                                                }

                                                $('#coach-performance2').html(strperformance)

                                            })
                                            //console.log($('#select-coach2').html())

                                        },
                                        error: function (e) {
                                            console.log(e.status)
                                        }
                                    })
                                }, 100);
                            })
                        })

                        //上课日期时间
                        setTimeout(() => {
                            $('#edit-course-context-three2').val(listdata.dateStr)
                            $('#edit-course-context-four2').val(listdata.timeStr.split('-')[0])
                            $('#edit-course-context-five2').val(listdata.timeStr.split('-')[1])
                        }, 100);

                        //课程零售价渲染
                        setTimeout(() => {
                            $('#course-price2').val(listdata.leagueCurriculumPrice)
                        }, 100);

                        //课程标准价渲染
                        setTimeout(() => {
                            $('#add-course-sortone-inputthree-input2').html(listdata.price)
                        }, 100);

                        //开课人数渲染
                        setTimeout(() => {
                            $('#mincount2').val(listdata.minNumber)
                        }, 100);

                        //最大开课人数
                        setTimeout(() => {
                            $('#maxcount2').val(listdata.maxNumber)
                        }, 100);

                        //是否排队
                        setTimeout(() => {
                            if (listdata.isQueue == 1) {
                                $('#is-Queue2').children('.paypay').eq(0).click()
                            } else {
                                $('#is-Queue2').children('.paypay').eq(1).click()
                            }
                        }, 100);

                        //贴标
                        setTimeout(() => {
                            if (!listdata.tagName) {
                                $('#tag-Name2').children('.paypay').eq(0).click()
                            }
                            else if (listdata.tagName == "热门") {
                                $('#tag-Name2').children('.paypay').eq(1).click()
                            } else if (listdata.tagName == "体验") {
                                $('#tag-Name2').children('.paypay').eq(2).click()
                            }
                        }, 100);

                        setTimeout(() => {
                           //第一个下拉菜单的动态
                            $("#select-menu-input-mendian3").eq(0).val($(".select-this").eq(0).html()); //在输入框中自动填充第一个选项的值
                            $("#select-menu-div-mendian3").eq(0).on("click", function (e) {
                                e.stopPropagation();
                                if ($("#select-menu-ul-one1").eq(0).css("display") === "block") {
                                    setTimeout(() => {
                                        $("#select-menu-ul-one1").eq(0).hide();
                                        $("#select-menu-div-mendian3").eq(0).find("i").removeClass("select-menu-i");
                                        $("#select-menu-ul-one1").eq(0).animate({
                                            marginTop: "0",
                                            opacity: "0"
                                        }, "fast");
                                    }, 50);

                                } else {
                                    setTimeout(() => {
                                        $("#select-menu-ul-one1").eq(0).show();
                                        $("#select-menu-div-mendian3").eq(0).find("i").addClass("select-menu-i");
                                        $("#select-menu-ul-one1").eq(0).animate({
                                            marginTop: "5px",
                                            opacity: "1"
                                        }, "fast");
                                    }, 50);

                                }
                                for (var i = 0; i < $("#select-menu-ul-one1").length; i++) {
                                    if (i !== 0 && $("#select-menu-ul-one1").eq(i).css("display") === "block") {
                                        setTimeout(() => {
                                            $("#select-menu-ul-one1").eq(i).hide();
                                            $("#select-menu-div-mendian3").eq(i).find("i").removeClass("select-menu-i");
                                            $("#select-menu-ul-one1").eq(i).animate({
                                                marginTop: "0",
                                                opacity: "0"
                                            }, "fast");
                                        }, 50);
                                    }
                                }
                            });
                            $("#select-menu-ul-one1").eq(0).on("click", "li", function () { //给下拉选项绑定点击事件
                                setTimeout(() => {
                                    $("#select-menu-input-mendian3").eq(0).val($(this).html()); //把被点击的选项的值填入输入框中
                                    $("#select-menu-div-mendian3").eq(0).click();
                                    $(this).siblings(".select-this").removeClass("select-this");
                                    $(this).addClass("select-this");
                                }, 50);

                            });
                            $("body").on("click", function (event) {
                                setTimeout(() => {
                                    event.stopPropagation();
                                    if ($("#select-menu-ul-one1").eq(0).css("display") === "block") {
                                        console.log(1);
                                        $("#select-menu-ul-one1").eq(0).hide();
                                        $("#select-menu-div-mendian3").eq(0).find("i").removeClass("select-menu-i");
                                        $("#select-menu-ul-one1").eq(0).animate({
                                            marginTop: "0",
                                            opacity: "0"
                                        }, "fast");

                                    }
                                }, 50);
                            });

                            //第二个下拉菜单的动态
                            $("#select-menu-inputroom3").eq(0).val($(".select-this").eq(0).html()); //在输入框中自动填充第一个选项的值
                            $("#select-menu-div-inputroom3").eq(0).on("click", function (e) {
                                e.stopPropagation();
                                if ($("#select-menu-ul-RoomList1").eq(0).css("display") === "block") {
                                    setTimeout(() => {
                                        $("#select-menu-ul-RoomList1").eq(0).hide();
                                        $("#select-menu-div-inputroom3").eq(0).find("i").removeClass("select-menu-i");
                                        $("#select-menu-ul-RoomList1").eq(0).animate({
                                            marginTop: "0",
                                            opacity: "0"
                                        }, "fast");
                                    }, 50);

                                } else {
                                    setTimeout(() => {
                                        $("#select-menu-ul-RoomList1").eq(0).show();
                                        $("#select-menu-div-inputroom3").eq(0).find("i").addClass("select-menu-i");
                                        $("#select-menu-ul-RoomList1").eq(0).animate({
                                            marginTop: "5px",
                                            opacity: "1"
                                        }, "fast");
                                    }, 50);

                                }
                                for (var i = 0; i < $("#select-menu-ul-RoomList1").length; i++) {
                                    if (i !== 0 && $("#select-menu-ul-RoomList1").eq(i).css("display") === "block") {
                                        setTimeout(() => {
                                            $("#select-menu-ul-RoomList1").eq(i).hide();
                                            $("#select-menu-div-inputroom3").eq(i).find("i").removeClass("select-menu-i");
                                            $("#select-menu-ul-RoomList1").eq(i).animate({
                                                marginTop: "0",
                                                opacity: "0"
                                            }, "fast");
                                        }, 50);
                                    }
                                }
                            });
                            $("#select-menu-ul-RoomList1").eq(0).on("click", "li", function () { //给下拉选项绑定点击事件
                                setTimeout(() => {
                                    $("#select-menu-inputroom3").eq(0).val($(this).html()); //把被点击的选项的值填入输入框中
                                    $("#select-menu-div-inputroom3").eq(0).click();
                                    $(this).siblings(".select-this").removeClass("select-this");
                                    $(this).addClass("select-this");
                                }, 50);

                            });
                            $("body").on("click", function (event) {
                                setTimeout(() => {
                                    event.stopPropagation();
                                    if ($("#select-menu-ul-RoomList1").eq(0).css("display") === "block") {
                                        console.log(1);
                                        $("#select-menu-ul-RoomList1").eq(0).hide();
                                        $("#select-menu-div-inputroom3").eq(0).find("i").removeClass("select-menu-i");
                                        $("#select-menu-ul-RoomList1").eq(0).animate({
                                            marginTop: "0",
                                            opacity: "0"
                                        }, "fast");

                                    }
                                }, 50);
                            });

                        }, 100);

                    }, 100);

                    //发送参数
                    $('#edit-course-footer-pone2').click(function () {
                        setTimeout(() => {
                            $('#add-edit-course-change').show()

                            //$(this).parent().parent().parent().hide()
                            //获取门店id
                            for (var i = 0; i < $('#select-menu-ul-one1').children().length; i++) {
                                if ($('#select-menu-ul-one1').children().eq(i).html() == $('#select-menu-input-mendian3').val()) {
                                    var storeId = $('#select-menu-ul-one1').children().eq(i).attr('class')
                                }
                            }
                            //console.log(storeId)

                            //获取房间id
                            for (var i = 0; i < $('#select-menu-ul-RoomList1').children().length; i++) {
                                if ($('#select-menu-ul-RoomList1').children().eq(i).html() == $('#select-menu-inputroom3').val()) {
                                    var roomId = $('#select-menu-ul-RoomList1').children().eq(i).attr('class')
                                    //console.log("mendiandm")
                                }
                            }

                            //获取课程名称
                            var leagueCurriculumId = $('#select-menu-input-coursename2').attr('class')

                            //获取课程开始和结束时间
                            var start = $('#edit-course-context-three2').val() + " " + $('#edit-course-context-four2').val() + ":00"
                            var end = $('#edit-course-context-three2').val() + " " + $('#edit-course-context-five2').val() + ":59"
                            var data1 = new Date(start)
                            var data2 = new Date(end)
                            var startDate = data1.getTime()
                            var endDate = data2.getTime()
                            //获取课程价格
                            var price = Number($('#course-price2').val())

                            //获取开课最大和最小人数
                            var maxNumber = Number($('#maxcount2').val())
                            var minNumber = Number($('#mincount2').val())

                            //是否排队             
                            if ($('#is-Queue2').children('.paypayisQueue2').eq(0).hasClass('1')) {
                                var isQueue = 1
                                //console.log(isQueue)
                            } else {
                                var isQueue = 0
                                //console.log(isQueue)
                            }

                            //标签id
                            var tagId = ''
                            if ($('#tag-Name2').children('.paypay').eq(0).hasClass('1')) {
                                tagId = 0
                            }
                            else if ($('#tag-Name2').children('.paypay').eq(1).hasClass('1')) {
                                tagId = "8222a8d209a24520b116747a047529b3"
                            } else {
                                tagId = "941660f44ced4aefa8b5b24809a0d43b"
                            }

                            //获取员工工号及比例
                            var courseSchedulingItemList = []

                            //console.log($('#coach-performance2'))

                            if ($('#coach-performance2')[0].innerText == '') {
                                courseSchedulingItemList.push({ coachId : $('#all-coach2').children().eq(0).attr('class').split(' ')[1], performance: 1 })
                                console.log('weishenm')
                            } 
                            else {
                                for (var i = 0; i < $('#coach-performance2').children().length; i++) {
                                    courseSchedulingItemList.push({ coachId: $('#coach-performance2').children().eq(i).attr('class').split(' ')[1], performance: $('#coach-performance2').children().eq(i).children('input').val() })
                                }
                            }
                            //console.log(courseSchedulingItemList)

                            //课程变更点击叉叉关闭
                            $('#change-header-not-imgtwo').click(function () {
                                $(this).parent().parent().hide()
                            })

                            //课程变更点击取消关闭
                            $('.add-edit-course-change-context-footer-ptwo').click(function () {
                                $(this).parent().parent().parent().hide()
                            })

                            $(".course-arranging-not-table-checkbox1").click(function () {
                                $(this).parent().parent().children('.add-edit-course-change-context-ptwo').children('.course-arranging-not-table-checkbox1').children('img').hide()
                                $(this).parent().parent().children('.add-edit-course-change-context-ptwo').children('.course-arranging-not-table-checkbox1').removeClass('3')
                                if ($(this).children('img').is(":hidden")) {
                                    setTimeout(() => {
                                        $(this).children('img').show()
                                        $(this).addClass('3')
                                    }, 50);
                                } else {
                                    setTimeout(() => {
                                        $(this).children('img').hide()
                                    }, 50);
                                }

                                $('.add-edit-course-change-context-textarea').focus(function(){
                                    $('.add-edit-course-change-context-ptwo').children('.course-arranging-not-table-checkbox1').children('img').hide()
                                })
                            })

                            //课程变更点击确定关闭
                            $('.add-edit-course-change-context-footer-pone').click(function () {
                                $(this).parent().parent().parent().hide()
                                $('.edit-course').hide()

                                var changeReasonId = ''

                                //获取变更原因
                                if($('.add-edit-course-change-context-ptwo').eq(0).children('.course-arranging-not-table-checkbox1').hasClass('3')){
                                    changeReasonId = "门店停电"
                                }
                                else if($('.add-edit-course-change-context-ptwo').eq(1).children('.course-arranging-not-table-checkbox1').hasClass('3')){
                                    changeReasonId = "公司会议"
                                }
                                else if($('.add-edit-course-change-context-ptwo').eq(2).children('.course-arranging-not-table-checkbox1').hasClass('3')){
                                    changeReasonId = "身体不适"
                                }
                                else if($('.add-edit-course-change-context-ptwo').eq(3).children('.course-arranging-not-table-checkbox1').hasClass('3')){
                                    changeReasonId = "临时有事"
                                }
                                else if($('.add-edit-course-change-context-ptwo').eq(4).children('.course-arranging-not-table-checkbox1').hasClass('3')){
                                    changeReasonId = "个人休假"
                                }
                                else{
                                    changeReasonId = $('.add-edit-course-change-context-textarea').val()
                                }
                                
                                setTimeout(() => {
                                    var paramsrevise = {
                                        storeId: storeId,
                                        roomId: roomId,
                                        leagueCurriculumId: leagueCurriculumId,
                                        startDate: startDate,
                                        endDate: endDate,
                                        price: price,
                                        maxNumber: maxNumber,
                                        minNumber: minNumber,
                                        isQueue: isQueue,
                                        tagId: tagId,
                                        courseSchedulingItemList: courseSchedulingItemList,
                                        id: listdata.id,
                                        changeReasonId : changeReasonId
                                    }
                                    //console.log($('.course-arranging-not-table-checkbox1').length)
                                    // console.log(paramsrevise)

                                    $.ajax({
                                        url: 'http://test.physicalclub.com/rest/courseScheduling/updateCourseScheduling',
                                        type: 'POST',
                                        contentType: 'application/json;charset=UTF-8',
                                        data: JSON.stringify(paramsrevise),
                                        success: function (result) {
                                            console.log(result)
                                        },
                                        error: function (e) {
                                            console.log(e.status)
                                        }
                                    })

                                }, 200);

                            })

                            

                        }, 200);

                        // var paramsrevise = {
                        //     storeId : storeId,
                        //     roomId : roomId,
                        // }

                    })

                })

            }, 100);

            
        }
    }

    class computed_not {
        constructor() {
            // this.checkbox = $(".course-arranging-table-checkbox")
            this.paypay = $(".paypay-not")
            this.paypaypay = $(".paypaypay-not")
        }
        init() {
            this.checkbox_click()
            this.a_del()
            this.select_all1()
            //this.select_option()
            this.pay()
            this.adch_showhide()
        }

        checkbox_click() {
            //表格第一列显示或隐藏打钩
            $(".course-arranging-not-table-checkbox").click(function () {
                if ($(this).children('img').is(":hidden")) {
                    setTimeout(() => {
                        $(this).children('img').show()
                    }, 50);
                } else {
                    setTimeout(() => {
                        $(this).children('img').hide()
                    }, 50);
                }
            })

            $(".course-arranging-not-table-checkbox1").click(function () {
                if ($(this).children('img').is(":hidden")) {
                    setTimeout(() => {
                        $(this).children('img').show()
                    }, 50);
                } else {
                    setTimeout(() => {
                        $(this).children('img').hide()
                    }, 50);
                }
            })
        }

        a_del() {
            //点击删除按钮事件
            $('.a-not-del').click(function () {
                $(this).parent().parent().children().eq(12).children().show()
            })
            //点击编辑按钮事件
            $('.a-not-add').click(function () {
                $('#edit-course').show()

                $('.paypay-not').each(function () {
                    if ($(this).hasClass('xianshi-not')) {
                        $(this).children('.paypay-not-hidden').hide()
                        $(this).children('.paypay-not-show').show()
                    }
                })
            })
            new a_del_not().init()
        }

        select_all1() {
            
        }

        select_option() {
            //下拉菜单的动态

            selectMenu(6);
            selectMenu(7);

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

        pay() {
            //新增窗口单选框的显示及排他
            this.paypay.children('.paypay-not-show').hide()
            this.paypay.children('.paypay-not-hidden').show()
            this.paypay.click(function () {
                $(this).parent().children('.paypay-not').children('.paypay-not-show').hide()
                $(this).parent().children('.paypay-not').children('.paypay-not-hidden').show()
                if ($(this).children('.paypay-not-hidden').is(":hidden")) {
                    $(this).children('.paypay-not-hidden').show()
                    $(this).children('.paypay-not-show').hide()
                } else {
                    $(this).children('.paypay-not-hidden').hide()
                    $(this).children('.paypay-not-show').show()
                }
            })

            this.paypaypay.children('.paypaypay-not-show').hide()
            this.paypaypay.children('.paypaypay-not-hidden').show()
            this.paypaypay.click(function () {
                $(this).parent().children('.paypaypay-not').children('.paypaypay-not-show').hide()
                $(this).parent().children('.paypaypay-not').children('.paypaypay-not-hidden').show()
                if ($(this).children('.paypaypay-not-hidden').is(":hidden")) {
                    $(this).children('.paypaypay-not-hidden').show()
                    $(this).children('.paypaypay-not-show').hide()
                } else {
                    $(this).children('.paypaypay-not-hidden').hide()
                    $(this).children('.paypaypay-not-show').show()
                }
            })

        }

        adch_showhide() {
            
        }
    }

    class a_del_not {
        init() {
            this.a_del_click()
            //this.edit_course_showhide()
        }
        //删除表格的确定或取消
        a_del_click() {
            $('.td-del-not-flex-yes').click(function () {
                $(this).parent().parent().parent().parent().remove()

                var ids = []

                var ids1 = $(this).parent().parent().parent().parent().children().eq(0).attr('class')

                ids.push(ids1)

                var idsstr = {
                    operationType: 4,
                    ids: ids,
                    state : 0
                }

                console.log(idsstr)

                $.ajax({
                    url: 'http://test.physicalclub.com/rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
                    type: 'POST',
                    contentType: 'application/json;charset=UTF-8',
                    data: JSON.stringify(idsstr),
                    success: function (result) {
                        console.log(result)
                    },
                    error: function (e) {
                        console.log(e.status)
                    }
                })

                setTimeout(() => {
                    window.location.reload()
                }, 100);

            })
            $('.td-del-not-flex-no').click(function () {
                $(this).parent().parent().hide()
            })
        }

    }



    $('.box').pagination({
            mode: 'fixed'
        });
</script>

</html>