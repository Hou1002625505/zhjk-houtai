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

        .course-arranging-body {
            position: relative
        }

        .course-arranging-header-one {
            display: flex
        }

        #course-arranging-header-one-pone {
            font-size: 20px;
            color: #444444;
            padding-bottom: 7px;
            margin-left: 23px;
            cursor: pointer;
        }

        .course-arranging-header-one-pone-active {
            border-bottom: 2px solid #71B2EF;
        }

        #course-arranging-header-one-ptwo {
            font-size: 20px;
            color: #444444;
            margin-left: 39px;
            padding-bottom: 7px;
            cursor: pointer;
        }

        .course-arranging-header-one-ptwo-active {
            border-bottom: 2px solid #71B2EF;
        }

        .course-arranging-header-two {
            height: 1px;
            background: #BFBFBF;
            padding: 0 18px 0 18px;
            box-sizing: border-box;
            margin-bottom: 18px
        }

        .course-arranging-header-three {
            display: flex;
        }

        .course-arranging-header-three p:nth-child(1) {
            width: 100px;
            height: 30px;
            background: #71B2EF;
            color: white;
            border-radius: 4px;
            margin-left: 0;
            font-size: 16px;
            text-align: center;
            line-height: 30px;
        }

        .course-arranging-header-three p {
            width: 100px;
            height: 30px;
            background: #71B2EF;
            color: white;
            border-radius: 4px;
            margin-left: 18px;
            font-size: 16px;
            text-align: center;
            line-height: 30px;
            margin-bottom: 20px
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
            margin-top: 18px;
            justify-content: space-between;
        }

        .course-arranging-flexthree {
            display: flex
        }

        .course-arranging-flexthree p:nth-child(1) {
            width: 80px;
            height: 30px;
            border-radius: 4px;
            background: #71B2EF;
            text-align: center;
            line-height: 30px;
            color: white;
            font-size: 16px
        }

        .course-arranging-flexthree p:nth-child(2) {
            width: 80px;
            height: 30px;
            border-radius: 4px;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            text-align: center;
            line-height: 30px;
            color: black;
            margin-left: 15px;
            font-size: 16px
        }

        .course-arranging-flextwo .course-arranging-flextwo-pthree {
            width: 80px;
            height: 30px;
            color: white;
            background: #71B2EF;
            text-align: center;
            line-height: 30px;
            border-radius: 4px;
            margin-right: 200px;
            font-size: 16px;
        }

        .select-menu {
            margin-left: 10px;
            margin-right: 39px;
            cursor: pointer;
            width: 176px;
            height: 26px;
            box-sizing: border-box;
        }

        .select-menu-ul {
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
            height: 26px;
            width: 176px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
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
            width: 50px;
            height: 24px;
            cursor: pointer;
            user-select: none;
            font-size: 14px
        }

        .course-arranging-flex-select-two {
            width: 120px;
            height: 30px;
            border: 1px solid #BFBFBF;
            border-radius: 4px;
            margin-left: 20px;
            margin-right: 40px
        }

        .course-arranging-flex-select-three {
            width: 120px;
            height: 30px;
            border: 1px solid #BFBFBF;
            border-radius: 4px;
            margin-left: 20px;
            margin-right: 40px
        }

        .course-arranging-flex-input-one {
            width: 120px;
            height: 30px;
            border-radius: 4px;
            margin-left: 21px;
            margin-right: 7px;
            padding: 0 0 0 10px;
            box-sizing: border-box;
            font-size: 14px;
            border: 1px solid #BFBFBF;
            line-height: 30px;
        }

        .course-arranging-flex-input-two {
            width: 120px;
            height: 30px;
            border-radius: 4px;
            margin-left: 7px;
            margin-right: 38px;
            padding: 0 0 0 10px;
            box-sizing: border-box;
            font-size: 14px;
            border: 1px solid #BFBFBF;
            line-height: 30px;
        }

        .course-arranging-flex-input-three {
            width: 70px;
            height: 26px;
            border-radius: 4px;
            margin-left: 21px;
            margin-right: 6px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }

        .course-arranging-flex-input-four {
            width: 70px;
            height: 26px;
            border-radius: 4px;
            margin-left: 6px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }

        .course-arranging-table {
            margin-top: 18px;
            font-size: 14px;
        }

        .course-arranging-table table tr:nth-child(2) td {
            border-top: none
        }

        .course-arranging-table table td {
            border-left: 1px dashed #CCCCCC;
            border-bottom: 1px dashed #CCCCCC;
            height: 40px;
            text-align: center;
        }

        .course-arranging-table table td:last-child {
            border-right: 1px dashed #CCCCCC;
            text-align: center;
        }

        .course-arranging-table table th {
            background: #D0E8F2;
            text-align: center;
            height: 40px;
        }

        .course-arranging-table .course-arranging-table-tr td:last-child {
            cursor: pointer;
            color: #71B2EF;
        }

        .course-arranging-table .course-arranging-table-tr td:last-child a:nth-child(1) {
            margin-right: 5px;
        }

        .course-arranging-table .course-arranging-table-tr td:last-child a:nth-child(2) {
            margin-left: 5px;
        }

        .course-arranging-table .course-arranging-table-checkbox {
            width: 16px;
            height: 16px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
        }

        .course-arranging-table .course-arranging-table-checkbox img {
            width: 16px;
            height: 16px;
            margin-left: -1px;
            margin-top: -1px;
        }

        .course-arranging-footer {
            display: flex;
            margin-top: 17px;
            height: 26px;
            display: flex;
            align-items: center;
            padding-left: 14px;
        }

        .course-arranging-table-checkbox {
            width: 16px;
            height: 16px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
            line-height: 14px;
        }

        .course-arranging-table-checkbox img {
            width: 16px;
            height: 16px;
            margin-top: -1px;
            margin-left: -1px;
        }

        .course-arranging-footer .course-arranging-footer-pone {
            font-size: 14px;
            margin-left: 8px;
        }

        .course-arranging-footer .course-arranging-footer-ptwo {
            width: 70px;
            height: 30px;
            border: 1px solid #BFBFBF;
            margin-left: 9px;
            font-size: 14px;
            color: #444444;
            text-align: center;
            line-height: 30px;
            border-radius: 2px;
        }

        .course-arranging-footer .course-arranging-footer-pthree {
            font-size: 14px;
            margin-left: 893px;
        }

        .td-del {
            width: 326px;
            height: 97px;
            border-radius: 4px;
            background: white;
            position: absolute;
            left: -300px;
            top: -0px;
            z-index: 10;
            padding: 18px 0 0 18px
        }

        .td-del .td-del-flex {
            display: flex;
            align-items: center;
            justify-content: left;
        }

        .td-del .td-del-flex p:nth-child(1) {
            font-size: 14px
        }

        .td-del .td-del-flex p:nth-child(2) {
            width: 62px;
            height: 32px;
            background: #71B2EF;
            color: white;
            font-size: 14px;
            text-align: center;
            line-height: 32px;
            border-radius: 4px;
            margin-left: 26px;
            margin-right: 13px;
            cursor: pointer;
        }

        .td-del .td-del-flex p:nth-child(3) {
            width: 62px;
            height: 32px;
            font-size: 14px;
            text-align: center;
            line-height: 32px;
            border-radius: 4px;
            border: 1px solid #BFBFBF;
            cursor: pointer;
        }

        .td-del .td-del-line {
            height: 1px;
            background: #BFBFBF;
            padding: 0 18px 0 18px;
            margin-top: 9px;
            margin-bottom: 8px
        }

        .td-del .td-del-left {
            color: red;
            display: flex;
            justify-content: left;
        }

        .select-menu {
            margin-right: 39px;
            cursor: pointer;
            width: 200px;
            height: 30px;
            box-sizing: border-box;
        }

        .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 200px;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .select-menu-ul li {
            height: 30px;
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
            width: 200px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
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
            width: 50px;
            height: 28px;
            cursor: pointer;
            user-select: none;
            font-size: 14px
        }



        .select-menu3 {
            cursor: pointer;
            width: 150px;
            height: 36px;
            box-sizing: border-box;
            margin-left: 77px;
            margin-right: 59px
        }

        .select-menu3 .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 150px;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .select-menu3 .select-menu-ul .select-menu-ul li {
            height: 36px;
            font-size: 14px;
            padding: 0 15px;
            box-sizing: border-box;
            line-height: 36px;
        }

        .select-menu3 .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .select-menu3 .select-menu-div {
            position: relative;
            height: 36px;
            width: 150px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .select-menu3 .select-menu-ul .select-this {
            background: #71B2EF;
        }

        .select-menu3 .select-menu-ul .select-this:hover {
            background: #71B2EF !important;
        }

        .select-menu3 .select-menu-div .select-menu-img {
            width: 11px;
            height: 8px;
            margin-right: 10px;
            position: absolute;
            right: 0;
            top: 10px;
        }

        .select-menu3 .select-menu-div .select-menu-input {
            padding-left: 14px;
            border: 0;
            width: 50px;
            height: 30px;
            cursor: pointer;
            user-select: none;
            font-size: 14px
        }



        .select-menu4 {
            cursor: pointer;
            width: 120px;
            height: 36px;
            box-sizing: border-box;
        }

        .select-menu4 .select-menu-ul {
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

        .select-menu4 .select-menu-ul .select-menu-ul li {
            height: 32px;
            font-size: 14px;
            padding: 0 15px;
            box-sizing: border-box;
            line-height: 32px;
        }

        .select-menu4 .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .select-menu4 .select-menu-div {
            position: relative;
            height: 36px;
            width: 120px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .select-menu4 .select-menu-ul .select-this {
            background: #71B2EF;
        }

        .select-menu4 .select-menu-ul .select-this:hover {
            background: #71B2EF !important;
        }

        .select-menu4 .select-menu-div .select-menu-img {
            width: 11px;
            height: 8px;
            margin-right: 10px;
            position: absolute;
            right: 0;
            top: 10px;
        }

        .select-menu4 .select-menu-div .select-menu-input {
            padding-left: 14px;
            border: 0;
            width: 50px;
            height: 30px;
            cursor: pointer;
            user-select: none;
            font-size: 14px
        }


        .select-menu5 {
            cursor: pointer;
            width: 250px;
            height: 36px;
            box-sizing: border-box;
        }

        .select-menu5 .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 250px;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .select-menu5 .select-menu-ul li {
            height: 36px;
            font-size: 14px;
            padding: 0 15px;
            box-sizing: border-box;
            line-height: 36px;
        }

        .select-menu5 .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .select-menu5 .select-menu-div {
            position: relative;
            height: 36px;
            width: 250px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            line-height: 36px;
        }

        .select-menu5 .select-menu-ul .select-this {
            background: #71B2EF;
        }

        .select-menu5 .select-menu-ul .select-this:hover {
            background: #71B2EF !important;
        }

        .select-menu5 .select-menu-div .select-menu-img {
            width: 11px;
            height: 8px;
            margin-right: 10px;
            position: absolute;
            right: 0;
            top: 10px;
        }

        .select-menu5 .select-menu-div .select-menu-input {
            padding-left: 14px;
            border: 0;
            width: 130px;
            height: 30px;
            cursor: pointer;
            user-select: none;
            font-size: 14px
        }



        .edit-course {
            width: 800px;
            height: 760px;
            border: 1px solid #71B2EF;
            background: #E0ECFF;
            border-radius: 4px;
            padding: 18px;
            box-sizing: border-box;
            position: absolute;
            top: -40px;
            left: 20%;
            z-index: 10;
            display: none
        }

        .edit-course .edit-course-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 16px
        }

        .edit-course-header .edit-course-header-one {
            display: flex;
            align-items: center;
        }

        .edit-course-header-one .edit-course-header-imgone {
            width: 22px;
            height: 21px
        }

        .edit-course-header-one .edit-course-header-pone {
            font-size: 24px;
            margin-left: 15px
        }

        .edit-course .edit-course-context {
            width: 756px;
            height: 680px;
            border: 1px solid #71B2EF;
            background: #FFFFFF;
            overflow-y: scroll;
            position: relative;
        }

        .edit-course-context .edit-course-context-flex {
            width: 100%;
            height: 60px;
            display: flex;
            box-sizing: border-box;
            align-items: center;
            border-bottom: 1px solid #BFBFBF;
        }

        .edit-course-context-flex .edit-course-context-one {
            padding: 0 0 0 19px;
            font-size: 18px
        }

        .edit-course-context-flex #edit-course-context-two {
            width: 250px;
            height: 36px;
            border: 1px solid #BFBFBF;
            border-right: none;
            margin-left: 74px;
            border-radius: 4px 0 0 4px;
            padding: 9px 0 9px 0;
            box-sizing: border-box;
            display: flex;
            align-items: center;
        }

        .edit-course-context-flex .edit-course-context-three-pp {
            width: 40px;
            height: 36px;
            background: #71B2EF;
            border-radius: 0 4px 4px 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .edit-course-context-flex .edit-course-context-three-pp img {
            width: 18px;
            height: 17px
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
            padding: 0 20px 0 20px;
        }

        .edit-course-context-flextwo .edit-course-context-twoall {
            width: 450px;
            display: flex;
            flex-wrap: wrap;
            margin-top: 12px
        }

        .edit-course-context-flextwo .edit-course-context-one {
            font-size: 18px
        }

        .edit-course-context-twoall .edit-course-context-twoone {
            padding:0 10px 0 10px;
            box-sizing: border-box;
            height: 36px;
            border: 1px solid #BFBFBF;
            border-radius: 4px;
            text-align: center;
            line-height: 32px;
            margin-left: 18px;
            margin-bottom: 18px;
            font-size: 14px;
        }

        .edit-course-context-flextwo .edit-course-context-three {
            width: 60px;
            height: 36px;
            border: 1px solid #71B2EF;
            border-radius: 4px;
            color: #71B2EF;
            text-align: center;
            line-height: 36px;
            font-size: 14px
        }

        .edit-course-context-flex3 {
            padding: 11px 0 11px 20px;
            width: 100%;
            height: 53px;
            display: flex;
            box-sizing: border-box;
            align-items: center;
            border-bottom: 1px solid #BFBFBF;
        }

        .edit-course-context-flex3 .add-course-sortone-inputtwo {
            display: flex;
            width: 150px;
            height: 36px;
            border: 1px solid #CCCCCC;
            margin-left: 77px;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .edit-course-context-flex3-pone {
            font-size: 18px
        }

        .edit-course-context-flex3-ptwo {
            font-size: 18px;
            margin-left: 59px
        }

        .edit-course-context-flex3 .add-course-sortone-inputtwo p {
            width: 20px;
            height: 34px;
            background: #F7F7F7;
            border-right: 1px solid #CCCCCC;
            line-height: 34px;
            text-align: center;
        }

        .edit-course-context-flex3 .add-course-sortone-inputtwo input {
            border: none;
            outline: none;
            -webkit-appearance: none;
            width: 88px;
            padding-left: 5px;
            box-sizing: border-box;
        }

        .edit-course-context-flex3 .add-course-sortone-inputthree {
            display: flex;
            width: 120px;
            height: 36px;
            border: 1px solid #CCCCCC;
            margin-left: 35px;
            border-radius: 4px;
        }

        .edit-course-context-flex3 .add-course-sortone-inputthree p {
            width: 20px;
            height: 36px;
            background: #F7F7F7;
            border-right: 1px solid #CCCCCC;
            box-sizing: border-box;
            line-height: 36px;
            text-align: center;
        }

        .edit-course-context-flex3 .add-course-sortone-inputthree .add-course-sortone-inputthree-input {
            border: none;
            outline: none;
            -webkit-appearance: none;
            width: 88px;
            padding-left: 5px;
            box-sizing: border-box;
            background: #F7F7F7;
            text-decoration: line-through;
            color: #BFBFBF;
            font-size: 14px
        }

        .edit-course-context-flex3 .add-course-sortone-inputthree input {
            border: none;
            outline: none;
            -webkit-appearance: none;
            width: 88px;
            padding-left: 5px;
            box-sizing: border-box;
            text-decoration: line-through;
            color: #BFBFBF
        }

        .edit-course-context-flex3 .paypay {
            width: 24px;
            height: 24px;
            margin-left: 44px;
            margin-right: 18px
        }

        .edit-course-context-flex3 .paypay .paypay-show {
            width: 24px;
            height: 24px
        }

        .edit-course-context-flex3 .paypay .paypay-hidden {
            width: 24px;
            height: 24px;
            display: none;
        }

        .edit-course-context .edit-course-footer {
            width: 738px;
            display: flex;
            justify-content: center;
            padding: 27px 0 27px 0;
            box-sizing: border-box;
            position: fixed;
            bottom: 10%;
            background: white
        }

        .edit-course-footer #edit-course-footer-pone {
            width: 100px;
            height: 40px;
            border-radius: 4px;
            background: #71B2EF;
            font-size: 18px;
            text-align: center;
            line-height: 35px;
            color: white
        }

        .edit-course-footer #edit-course-footer-ptwo {
            width: 100px;
            height: 40px;
            border-radius: 4px;
            border: 1px solid #BFBFBF;
            font-size: 18px;
            text-align: center;
            line-height: 40px;
            margin-left: 26px
        }

        .edit-course-footer .edit-course-footer-pone {
            width: 100px;
            height: 40px;
            border-radius: 4px;
            background: #71B2EF;
            font-size: 18px;
            text-align: center;
            line-height: 35px;
            color: white
        }

        .edit-course-footer .edit-course-footer-ptwo {
            width: 100px;
            height: 40px;
            border-radius: 4px;
            border: 1px solid #BFBFBF;
            font-size: 18px;
            text-align: center;
            line-height: 40px;
            margin-left: 26px
        }

        .edit-course-context-flex4 {
            padding: 11px 0 11px 20px;
            width: 100%;
            height: auto;
            display: flex;
            box-sizing: border-box;
            border-bottom: 1px solid #BFBFBF;
            margin-bottom: 110px
        }

        .edit-course-context-flex4 .edit-course-context-flex4-pone {
            font-size: 16px
        }

        .edit-course-context-flex4 .edit-course-context-flex4-ptwo {
            width: 510px;
            height: auto;
            margin-left: 66px;
            display: flex;
            flex-wrap: wrap;
        }

        .edit-course-context-flex4 .edit-course-context-flex4-pthree {
            width: 120px;
            height: 36px;
            border: 1px solid #BFBFBF;
            border-radius: 4px;
            box-sizing: border-box;
            margin-left: 18px;
            margin-bottom: 13px;
            display: flex;
            font-size: 14px
        }

        .edit-course-context-flex4 .edit-course-context-flex4-pfour {
            width: 68px;
            height: 36px;
            border-right: 1px solid #BFBFBF;
            text-align: center;
            line-height: 36px;
            color: #BFBFBF
        }

        .edit-course-context-flex4 .edit-course-context-flex4-pfive {
            width:50px;
            height: 33px;
            text-align: center;
            line-height: 36px;
            border:0
        }

        .course-arranging-body .add-edit-course {
            position: absolute;
            top: 300px;
            left: 480px;
            z-index: 100;
            width: 421px;
            height: 376px;
            background: #E0ECFF;
            border: 1px solid #71B2EF;
            border-radius: 4px;
            padding: 13px;
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
            margin-left: 11px;
            font-size: 18px;
        }

        .add-edit-course-header-imgone {
            width: 23px;
            height: 22px
        }

        .add-edit-course-header-context {
            width: 391px;
            height: 314px;
            border: 1px solid #71B2EF;
            background: white;
            margin-top: 11px;
            overflow-y: scroll;
        }

        .add-edit-course-header-context .add-edit-course-header-context-one {
            height: 50px;
            width: 100%;
            border-bottom: 1px solid #BFBFBF;
            display: flex;
            justify-content: center;
            align-items: center;
            box-sizing: border-box;
        }

        .add-edit-course-header-context-one .add-edit-course-header-context-oneflex {
            width: 300px;
            height: 27px;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            border-radius: 4px;
            display: flex;
            align-items: center
        }

        .add-edit-course-header-context-one input {
            width: 260px;
            border: none;
            outline: none;
            padding-left: 15px;
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
            padding: 12px 4px 0 4px;
            box-sizing: border-box;
            margin-bottom: 70px;
        }

        .add-edit-course-header-context-two .add-edit-course-header-context-two-pone {
            font-size: 14px;
            margin-left: 18px
        }

        .add-edit-course-header-context-two .add-edit-course-header-context-twoflex {
            margin-top: 18px;
            display: flex;
            flex-wrap: wrap;
            height: auto
        }

        .add-edit-course-header-context-twoflex .add-edit-course-header-context-two-ptwo {
            width: 70px;
            height: 24px;
            border-radius: 4px;
            text-align: center;
            line-height: 24px;
            margin-left: 18px;
            margin-bottom: 18px;
            box-sizing: border-box;
            font-size: 14px;
            position: relative;
        }

        .add-edit-course-header-context-twoflex .add-edit-course-header-context-two-ptwo img {
            position: absolute;
            top: -10px;
            left: 60px;
            display: none
        }

        .aechctp-active {
            border: 1px solid #71B2EF;
            text-align: center;
            box-sizing: border-box;
        }

        .add-edit-course-header-context .add-edit-course-header-context-three {
            width: 375px;
            display: flex;
            justify-content: center;
            padding: 15px 0 15px 0;
            position: fixed;
            top: 661px;
            background: white;
        }

        .add-edit-course-header-context-three #add-edit-course-header-context-three-pone {
            width: 67px;
            height: 26px;
            background: #71B2EF;
            border-radius: 4px;
            text-align: center;
            line-height: 26px;
            color: white
        }

        .add-edit-course-header-context-three #add-edit-course-header-context-three-ptwo {
            width: 67px;
            height: 26px;
            border-radius: 4px;
            text-align: center;
            line-height: 26px;
            border: 1px solid #BFBFBF;
            margin-left: 20px
        }

        .add-edit-course-header-context-three .add-edit-course-header-context-three-pone {
            width: 67px;
            height: 26px;
            background: #71B2EF;
            border-radius: 4px;
            text-align: center;
            line-height: 26px;
            color: white
        }

        .add-edit-course-header-context-three .add-edit-course-header-context-three-ptwo {
            width: 67px;
            height: 26px;
            border-radius: 4px;
            text-align: center;
            line-height: 26px;
            border: 1px solid #BFBFBF;
            margin-left: 20px
        }

        .course-arranging-body .add-course-name {
            width: 688px;
            height: 678px;
            border: 1px solid #71B2EF;
            position: absolute;
            left: 32px;
            top: 2px;
            z-index: 200;
            background: #E0ECFF;
            padding: 18px;
            border-radius: 4px;
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
            width: 21px;
            height: 21px
        }

        .add-course-name-header .add-course-name-header-left p {
            font-size: 16px;
            margin-left: 13px
        }

        .add-course-name .add-course-name-context {
            width: 650px;
            height: 600px;
            border: 1px solid #71B2EF;
            margin-top: 17px;
            background: white;
            padding: 22px 22px 22px 4px;
            box-sizing: border-box;
            position : relative;
            overflow-y: scroll;
        }

        .add-course-name-context .add-course-name-context-flex {
            display: flex;
            flex-wrap: wrap;
        }

        .add-course-name-context-p {
            padding: 8px 10px 8px 10px;
            background: #F5F5F5;
            border-radius: 4px;
            margin-left: 18px;
            margin-bottom: 13px;
        }

        .add-course-name-context-p-active {
            background: #71B2EF;
            color: white
        }

        .add-course-name-context .add-course-name-context-bottom {
            display: flex;
            justify-content: center;
            padding: 26px 0 26px 0;
            box-sizing: border-box;
            position: fixed;
            bottom: 310px;
            left: 586px
        }

        .add-course-name-context-bottom #add-course-name-context-bottom-pone {
            width: 88px;
            height: 35px;
            background: #71B2EF;
            border-radius: 4px;
            font-size: 16px;
            color: white;
            text-align: center;
            line-height: 35px;
        }

        .add-course-name-context-bottom #add-course-name-context-bottom-ptwo {
            width: 88px;
            height: 35px;
            border-radius: 4px;
            font-size: 16px;
            text-align: center;
            line-height: 35px;
            border: 1px solid #BFBFBF;
            margin-left: 26px
        }

        .add-edit-course-label {
            position: absolute;
            width: 467px;
            height: 363px;
            background: #E0ECFF;
            z-index: 388;
            border-radius: 4px;
            top: 240px;
            left: 566px;
            padding: 18px;
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
            width: 22px;
            height: 22px;
            margin-right: 18px
        }

        .add-edit-course-label-header .add-edit-course-label-header-flex p {
            font-size: 24px
        }

        .add-edit-course-label .add-edit-course-label-context {
            width: 427px;
            height: 282px;
            border: 1px solid #71B2EF;
            margin-top: 16px;
            background: white
        }

        .add-edit-course-label-context .add-edit-course-label-context-pone {
            margin-top: 26px;
            font-size: 18px;
            display: flex;
            justify-content: center;
        }

        .add-edit-course-label-context .add-edit-course-label-context-flexone {
            display: flex;
            padding: 0 27px 0 27px;
            align-items: center;
            justify-content: center;
            margin-top: 61px
        }

        .add-edit-course-label-context-flexone .paypaypay {
            width: 24px;
            height: 24px;
            margin-right: 13px;
            margin-left: 70px;
        }

        .add-edit-course-label-context-flexone .paypaypay:nth-child(1) {
            margin-right: 13px;
            margin-left: 0
        }

        .add-edit-course-label-context .add-edit-course-label-context-footer {
            display: flex;
            justify-content: center;
            padding: 27px 0 27px 0;
            box-sizing: border-box;
            position: absolute;
            bottom: 15px;
            width: 427px;
        }

        .add-edit-course-label-context-footer #add-edit-course-label-context-footer-pone {
            width: 88px;
            height: 35px;
            background: #71B2EF;
            border-radius: 4px;
            text-align: center;
            line-height: 35px;
            font-size: 16px;
            color: white
        }

        .add-edit-course-label-context-footer #add-edit-course-label-context-footer-ptwo {
            width: 88px;
            height: 35px;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            border-radius: 4px;
            text-align: center;
            line-height: 35px;
            margin-left: 26px
        }

        .add-edit-course-label-context-footer #add-edit-course-label-context-footer-ptwo {
            width: 88px;
            height: 35px;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            border-radius: 4px;
            text-align: center;
            line-height: 35px;
            margin-left: 26px
        }


        .add-edit-course-change {
            position: absolute;
            width: 620px;
            height: 597px;
            background: #E0ECFF;
            z-index: 9999;
            border-radius: 4px;
            top: 40px;
            left: 74px;
            padding: 18px;
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
            width: 19px;
            height: 19px;
            margin-right: 18px
        }

        .add-edit-course-change-header .add-edit-course-change-header-flex p {
            font-size: 18px
        }

        .add-edit-course-change .add-edit-course-change-context {
            width: 580px;
            height: 516px;
            border: 1px solid #71B2EF;
            box-sizing: border-box;
            margin-top: 16px;
            padding: 0 18px 0 18px;
            background: white;
        }

        .add-edit-course-change-context .add-edit-course-change-context-pone {
            border-bottom: 1px solid #BFBFBF;
            padding: 14px 0 14px 0;
            font-size: 20px;
            display: flex;
            justify-content: center;
            box-sizing: border-box;
        }

        .add-edit-course-change-context .add-edit-course-change-context-ptwo {
            border-bottom: 1px solid #BFBFBF;
            display: flex;
            justify-content: space-between;
            padding: 12px 0 12px 0;
        }

        .add-edit-course-change-context .add-edit-course-change-context-ptwo p:nth-child(1) {
            margin-left: 9px;
            font-size: 16px;
        }

        .add-edit-course-change-context .add-edit-course-change-context-ptwo p:nth-child(2) {
            margin-right: 9px
        }

        .add-edit-course-change-context .add-edit-course-change-context-textarea {
            resize: none;
            width: 540px;
            height: 100px;
            margin-top: 17px;
            border-radius: 4px;
            padding: 12px 0 0 8px;
            box-sizing: border-box;
        }

        .add-edit-course-change-context .add-edit-course-change-context-footer {
            display: flex;
            justify-content: center;
            margin-top: 18px
        }

        .add-edit-course-change-context-footer .add-edit-course-change-context-footer-pone {
            width: 100px;
            height: 36px;
            background: #71B2EF;
            font-size: 18px;
            text-align: center;
            line-height: 36px;
            border-radius: 4px;
            color: white
        }

        .add-edit-course-change-context-footer .add-edit-course-change-context-footer-ptwo {
            width: 100px;
            height: 36px;
            font-size: 18px;
            text-align: center;
            line-height: 36px;
            border-radius: 4px;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            margin-left: 18px
        }

        /* /////////////////////////////////////////////////////////表单的第一个按钮 */
        .course-arranging-table .course-arranging-not-table-checkbox {
            width: 16px;
            height: 16px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
        }

        .course-arranging-table .course-arranging-not-table-checkbox img {
            width: 16px;
            height: 16px;
            margin-left: -1px;
            margin-top: -1px;
        }

        .course-arranging-footer {
            display: flex;
            margin-top: 17px;
            height: 26px;
            display: flex;
            align-items: center;
            padding-left: 14px;
        }

        .course-arranging-not-table-checkbox {
            width: 16px;
            height: 16px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
            line-height: 14px;
        }

        .course-arranging-not-table-checkbox img {
            width: 16px;
            height: 16px;
            margin-top: -1px;
            margin-left: -1px;
        }

        .course-arranging-not-table-checkbox1 {
            width: 16px;
            height: 16px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
            line-height: 14px;
        }

        .course-arranging-not-table-checkbox1 img {
            width: 16px;
            height: 16px;
            margin-top: -1px;
            margin-left: -1px;
        }

        /* ///////////////////////////////////////////// */

        /* 111111111111111111111111 */
        .course-arranging-footer .course-arranging-not-footer-ptwo {
            width: 80px;
            height: 26px;
            border: 1px solid #BFBFBF;
            margin-left: 9px;
            font-size: 12px;
            color: #444444;
            text-align: center;
            line-height: 26px;
            border-radius: 2px;
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
            width: 21px;
            height: 21px;
            margin-left: 44px;
            margin-right: 18px
        }

        .edit-course-context-flex3 .paypay-not .paypay-not-show {
            width: 21px;
            height: 21px
        }

        .edit-course-context-flex3 .paypay-not .paypay-not-hidden {
            width: 21px;
            height: 21px;
            display: none;
        }


        /* ////////////////////////////////////////////// */

        /* 111111111111111111111111111 */
        .edit-course-footer #edit-course-not-footer-pone {
            width: 88px;
            height: 35px;
            border-radius: 4px;
            background: #71B2EF;
            font-size: 16px;
            text-align: center;
            line-height: 35px;
            color: white
        }

        .edit-course-footer #edit-course-not-footer-ptwo {
            width: 88px;
            height: 35px;
            border-radius: 4px;
            border: 1px solid #BFBFBF;
            font-size: 16px;
            text-align: center;
            line-height: 35px;
            margin-left: 26px
        }

        /* /////////////////////////// */

        /* //////////////////////////////////////// aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa*/

        .add-edit-course-header-context-twoflex .add-edit-course-not-header-context-two-ptwo {
            width: 62px;
            height: 21px;
            border-radius: 4px;
            text-align: center;
            line-height: 21px;
            margin-left: 18px;
            margin-bottom: 18px;
            box-sizing: border-box;
        }

        .add-edit-course-header-context-twoflex .add-edit-course-not-header-context-two-ptwo img {
            position: relative;
            top: -30px;
            left: 30px;
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
            width: 67px;
            height: 26px;
            background: #71B2EF;
            border-radius: 4px;
            text-align: center;
            line-height: 26px;
            color: white
        }

        .add-edit-course-header-context-three #add-edit-course-header-context-not-three-ptwo {
            width: 67px;
            height: 26px;
            border-radius: 4px;
            text-align: center;
            line-height: 26px;
            border: 1px solid #BFBFBF;
            margin-left: 20px
        }

        /* /////////////////////////////////// */

        /* ////////////////////////////////ppppppppppppppppp */
        .add-course-not-name-context-p {
            padding: 8px 10px 8px 10px;
            background: #F5F5F5;
            border-radius: 4px;
            margin-left: 18px;
            margin-bottom: 13px;
            
        }

        .add-course-not-name-context-p-active {
            background: #71B2EF;
            color: white
        }

        /* //////////////////////////////////////// */
        .add-course-name-context .add-course-name-context-bottom {
            display: flex;
            justify-content: center;
            padding: 26px 0 26px 0;
            box-sizing: border-box;
            position: fixed;
            bottom: 310px;
            left: 586px
        }

        /* ///////////////////////111111111111111111111111111 */
        .add-course-name-context-bottom #add-course-not-name-context-bottom-pone {
            width: 88px;
            height: 35px;
            background: #71B2EF;
            border-radius: 4px;
            font-size: 16px;
            color: white;
            text-align: center;
            line-height: 35px;
        }

        .add-course-name-context-bottom #add-course-not-name-context-bottom-ptwo {
            width: 88px;
            height: 35px;
            border-radius: 4px;
            font-size: 16px;
            text-align: center;
            line-height: 35px;
            border: 1px solid #BFBFBF;
            margin-left: 26px
        }

        /* ///////////////////////// */

        /* ////////////////////////////////////////////////// paypaypay*/

        .add-edit-course-label-context-flexone .paypaypay-not {
            margin-right: 13px;
            margin-left: 70px;
            
        }

        .add-edit-course-label-context-flexone .paypaypay-not:nth-child(1) {
            margin-right: 13px;
            margin-left: 0
        }

        /* /////////////////////////////////////////////////// */

        /* 111111111111111111111111 */
        .add-edit-course-label-context-footer #add-edit-course-label-not-context-footer-pone {
            width: 88px;
            height: 35px;
            background: #71B2EF;
            border-radius: 4px;
            text-align: center;
            line-height: 35px;
            font-size: 16px;
            color: white
        }

        .add-edit-course-label-context-footer #add-edit-course-label-not-context-footer-ptwo {
            width: 88px;
            height: 35px;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            border-radius: 4px;
            text-align: center;
            line-height: 35px;
            margin-left: 26px;
        }

        /* //////////////////////////// */

        .coach-manage-addthree-flexthree-flex {
            padding: 25px 25px 0 7px;
            box-sizing: border-box;
        }

        .coach-manage-addthree-flexthree-flex-p {
            margin: 0 0 20px 18px;
            font-size: 18px;
            color: black
        }

        .addthree-flexfour {
            display: flex;
            flex-wrap: wrap;
        }

        .flexthree-tags1 {
            padding: 10px;
            border-radius: 4px;
            background: #F5F5F5;
            margin-left: 18px;
            height: 30px;
            box-sizing: border-box;
            margin-bottom: 18px;
            display: flex;
            align-items: center;
            cursor: pointer;
            font-size: 14px
        }

        .active1 {
            background: #71B2EF;
            color: white
        }

        .add-course-name-context-bottom1{
            width:627px;
            background: white;
            top:651px;
            display: flex;
            justify-content: center;
            padding: 26px 0 26px 0;
            box-sizing: border-box;
            position: fixed;
        }

        .add-course-name-context-bottom1 #add-course-name-context-bottom-pone {
            width: 88px;
            height: 35px;
            background: #71B2EF;
            border-radius: 4px;
            font-size: 16px;
            color: white;
            text-align: center;
            line-height: 35px;
        }

        .add-course-name-context-bottom1 #add-course-name-context-bottom-ptwo {
            width: 88px;
            height: 35px;
            border-radius: 4px;
            font-size: 16px;
            text-align: center;
            line-height: 35px;
            border: 1px solid #BFBFBF;
            margin-left: 26px
        }

        /* .add-course-name-context-flex{
            height: 600px;
            padding-bottom: 100px;
            overflow-y: scroll;
            box-sizing: border-box;
        } */

        #add-course-name-context-flex-coursename{
            padding-bottom:100px;
            box-sizing: border-box;
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
            <p>导入课程</p>
            <p id="addaddadd">新增</p>
            <p>发布</p>
        </div>
        <div class="course-arranging-flex">
            <div style="font-size:16px;margin-right:10px">上课门店</div>
            <div class="course-arranging-flex-select-zero">
                <div class="select-menu">
                    <div class="select-menu-div">
                        <input class="select-menu-input" id="select-menu-input-mendian" style="width:100px"/>
                
                        <img class="select-menu-img" src="./image/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul-pulishmendian" style="height:200px;overflow-y: scroll;">

                    </ul>
                </div>
            </div>
            <div style="font-size:16px;margin-right:10px">上课房间</div>
            <div class="course-arranging-flex-select-one">
                <div class="select-menu">
                    <div class="select-menu-div" id="select-menu-div-room">
                        <input class="select-menu-input" id="select-menu-input-room" />
                
                        <img class="select-menu-img" src="./image/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul-room" style="height:200px;overflow-y: scroll;">
                
                    </ul>
                </div>
            </div>
            <div style="font-size:16px">上课教练</div>
            <input class="course-arranging-flex-select-two" id="teaching-course-coach"></input>
            <div style="font-size:16px">教练工号</div>
            <input class="course-arranging-flex-select-three" id="coach-id"></input>
            <div style="font-size:16px">创建时间</div>
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
                <p>清除</p>
            </div>
            <p class="course-arranging-flextwo-pthree">导出课程</p>
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
            <div class="course-arranging-footer-ptwo">删除</div>
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
        <div class="course-arranging-header-three">
            <p>导入课程</p>
            <p>新增</p>
            <p>发布</p>
        </div>
        <div class="course-arranging-flex">
            <div style="font-size:16px;margin-right:10px">上课门店</div>
            <div id="course-arranging-not-flex-select-one">
                <div class="select-menu" id="select-menu">
                    <div class="select-menu-div" id="select-menu-div1">
                        <input class="select-menu-input" id="select-menu-input-mendian2" style="width:100px" />
                
                        <img class="select-menu-img" src="./image/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul-pulishmendian1" style="height:200px;overflow-y: scroll;">
                
                    </ul>
                </div>
            </div>
            <div style="font-size:16px;margin-right:10px">上课房间</div>
            <div class="course-arranging-not-flex-select-one">
                <div class="select-menu">
                    <div class="select-menu-div" id="select-menu-div-room1">
                        <input class="select-menu-input" id="select-menu-input-room1" />
                
                        <img class="select-menu-img" src="./image/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul-room1" style="height:200px;overflow-y: scroll;">
                
                    </ul>
                </div>
            </div>
            <div style="font-size:16px">上课教练</div>
            <input class="course-arranging-flex-select-two" id="teaching-course-coach1"/>
            <div style="font-size:16px">教练工号</div>
            <input class="course-arranging-flex-select-three" id="coach-id1"/>
            <div style="font-size:16px">创建时间</div>
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
                <p>清除</p>
            </div>
            <p class="course-arranging-flextwo-pthree">导出课程</p>
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
            $.ajax({
                url : 'http://test.physicalclub.com/rest/club/getClubInfo',
                type : 'GET',
                dataType : 'json',
                success : function(data){
                    console.log(data)
                },
                error : function(msg){
                    console.log(msg)
                }
            })

            // var paramsGroupType = {
            //     typeCode: "CourseTag"
            // }

            // $.ajax({
            //     type: 'POST',
            //     contentType: "application/json;charset=UTF-8",
            //     url: "http://test.physicalclub.com/rest/wx/dictionnary/getdictionnarylist",
            //     data: JSON.stringify(paramsGroupType),
            //     success: function (result) {
            //         console.log(result)
            //     },
            //     error: function (e) {
            //         console.log(e.status);
            //         console.log(e.responseText)
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
                            }
                        }
                    var RoomList = { storeId:storeId }
                    $.ajax({
                        url: 'http://test.physicalclub.com/crm/rest/club/getClubRoomList',
                        type: 'POST',
                        contentType: 'application/json;charset=UTF-8',
                        data: JSON.stringify(RoomList),
                        success: function (result) {
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
                SchedulingList = {
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
                            <th width="48"></th>
                            <th width="180">门店</th>
                            <th width="180">房间</th>
                            <th width="134">日期</th>
                            <th width="134">时间</th>
                            <th width="120">上课教练</th>
                            <th width="120">教练工号</th>
                            <th width="120">课程名称</th>
                            <th width="120">课程售价</th>
                            <th width="120">最大人数</th>
                            <th width="120">开课人数</th>
                            <th width="120">贴标</th>
                            <th></th>
                            <th width="120">操作</th>
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
                            <td width="48" class="`+ item.id +`"><div style="display:flex;justify-content: center;"><div class="course-arranging-table-checkbox"><img style="display:none" src="./image/codeallset_btn.png"></div></div></td>
                            <td width="180" style="position:relative">`+ item.storeName +`<img style="position:absolute;left:134px;top:0px;display:none" src="image/recommended_img.png"></td>
                            <td width="180">`+ item.roomName + `</td>
                            <td width="134">`+ item.dateStr + `</td>
                            <td width="134">`+ item.timeStr + `</td>
                            <td width="120">`+ coachname(item.courseSchedulingItemList) + `</td>
                            <td width="120">`+ username(item.courseSchedulingItemList) + `</td>
                            <td width="120">`+ item.leagueCurriculumName + `</td>
                            <td width="120">￥`+ item.price + `</td>
                            <td width="120">`+ item.maxNumber + `人</td>
                            <td width="120">`+ item.minNumber + `人</td>
                            <td width="120">`+ tiebiao(item.tagName) +`</td>
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
                            <td width="120">
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
                            <th width="48"></th>
                            <th width="180">门店</th>
                            <th width="180">房间</th>
                            <th width="134">日期</th>
                            <th width="134">时间</th>
                            <th width="120">上课教练</th>
                            <th width="120">教练工号</th>
                            <th width="120">课程名称</th>
                            <th width="120">课程售价</th>
                            <th width="120">最大人数</th>
                            <th width="120">开课人数</th>
                            <th width="120">贴标</th>
                            <th></th>
                            <th width="120">操作</th>
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
                            <td width="48" class="`+ item.id +`"><div style="display:flex;justify-content: center;"><div class="course-arranging-table-checkbox"><img style="display:none" src="./image/codeallset_btn.png"></div></div></td>
                            <td width="180" style="position:relative">`+ item.storeName +`<img style="position:absolute;left:134px;top:0px;display:none" src="image/recommended_img.png"></td>
                            <td width="180">`+ item.roomName +`</td>
                            <td width="134">`+ item.dateStr +`</td>
                            <td width="134">`+ item.timeStr +`</td>
                            <td width="120">`+ coachname(item.courseSchedulingItemList) +`</td>
                            <td width="120">`+ username(item.courseSchedulingItemList) +`</td>
                            <td width="120">`+ item.leagueCurriculumName +`</td>
                            <td width="120">￥`+ item.price +`</td>
                            <td width="120">`+ item.maxNumber +`人</td>
                            <td width="120">`+ item.minNumber +`人</td>
                            <td width="120">`+ tiebiao(item.tagName) +`</td>
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
                            <td width="120">
                                <a class="a-add `+ i +`">编辑</a>|<a class="a-del">删除</a>
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

            //点击新建
            $('#addaddadd').click(function(){

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
                        <img class="edit-course-header-imgone" style="width:22px;height:23px" id="edit-course-hide" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="edit-course-context">
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one" style="margin-right:111px">门店</div>
                            <div id="edit-course-context-first">
                                <div class="select-menu5">
                                    <div class="select-menu-div">
                                        <input class="select-menu-input" id="select-menu-input-mendian"/>

                                        <img class="select-menu-img" src="./image/sifting_icon.png"/>
                                    </div>
                                    <ul class="select-menu-ul" id="select-menu-ul-one" style="height:200px;overflow-y:scroll">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one" style="margin-right:111px">房间</div>
                            <div id="edit-course-context-second">
                                <div class="select-menu5">
                                    <div class="select-menu-div">
                                        <input class="select-menu-input" id="select-menu-inputroom2"/>

                                        <img class="select-menu-img" src="./image/sifting_icon.png"/>
                                    </div>
                                    <ul class="select-menu-ul" id="select-menu-ul-RoomList" style="height:200px;overflow-y:scroll">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one">课程名称</div>
                            <input id="select-menu-input-coursename" style="margin-left:74px"/>    
                        </div>
                        <div class="edit-course-context-flextwo">
                            <div class="edit-course-context-one">上课教练</div>
                            <div class="edit-course-context-twoall" id="all-coach">
                                
                            </div>
                            <p class="edit-course-context-three" id="edit-course-addadd">添加</p>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one">上课日期</div>
                            <div style="width:150px;height:36px;border:1px solid #BFBFBF;border-radius:4px;margin:0 59px 0 77px">
                            <input id="edit-course-context-three" style="width:150px;height:36px;border:0;padding-left:10px;box-sizing:border-box"></input>
                            </div>
                            <p style="font-size:18px;margin-right:18px">上课时间</p>
                            <div style="width:120px;height:36px;border:1px solid #BFBFBF;border-radius:4px;">
                            <input id="edit-course-context-four" style="width:120px;height:36px;border:0;padding-left:10px;box-sizing:border-box"></input>
                            </div>
                            <p style="margin:0 6px 0 6px">-</p>
                            <div style="width:120px;height:36px;border:1px solid #BFBFBF;border-radius:4px;">
                            <input id="edit-course-context-five" style="width:120px;height:36px;border:0;padding-left:10px;box-sizing:border-box"></input>
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
                            <p style="margin-left:-20px;margin-right:8px;">人</p>
                            <p class="edit-course-context-flex3-ptwo">最大人数</p>
                            <div class="add-course-sortone-inputthree" style="margin-left:17px;">
                                <input type="text" id="maxcount" style="text-decoration:none;color:black">
                            </div>
                            <p style="margin-left:-20px">人</p>
                        </div>

                        <div class="edit-course-context-flex3" id="is-Queue">
                            <p class="edit-course-context-flex3-pone" style="margin-right:35px">是否排队</p>
                            <div class="paypay paypayisQueue">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">是</p>
                            <div class="paypay paypayisQueue">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">否</p>
                        </div>

                        <div class="edit-course-context-flex3" id="tag-Name">
                            <p class="edit-course-context-flex3-pone" style="margin-right:70px">贴标</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">无</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">热门</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">体验</p>
                        </div>
                        <div class="edit-course-context-flex4">
                            <p class="edit-course-context-flex4-pone">业绩比例</p>
                            <div class="edit-course-context-flex4-ptwo" id="coach-performance">
                                
                            </div>
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
                        <div class="add-edit-course-header-context-one" id="coach-show" style="justify-content: left;padding-left:22px">

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
                        <img style="width:22px;height:22px" id="add-course-name-header-img" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="add-course-name-context">
                        <div class="add-course-name-context-flex">
                            <p class="add-course-name-context-p">舞林漫步</p>
                            <p class="add-course-name-context-p">舞林漫步</p>
                            <p class="add-course-name-context-p">舞林漫步</p>
                            <p class="add-course-name-context-p">舞林漫步</p>
                            <p class="add-course-name-context-p">舞林漫步</p>
                            <p class="add-course-name-context-p">舞林漫步</p>
                            <p class="add-course-name-context-p">舞林漫步</p>
                            <p class="add-course-name-context-p">舞林漫步</p>
                        </div>
                        <div class="add-course-name-context-bottom">
                            <p id="add-course-name-context-bottom-pone">确定</p>
                            <p id="add-course-name-context-bottom-ptwo">取消</p>
                        </div>
                    </div>
                `                          

                $('#edit-course1').html(editstr)
                $('#add-edit-course1').html(addeditstr)
                //$('#add-course-name1').html(acn_str)

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
                                setTimeout(() => {
                                    $('#select-menu-ul-one').html(strfirstfirst)
                                    //console.log(222)

                                    for (var i = 0; i < $('#select-menu-ul-one').children().length; i++) {
                                        if ($('#select-menu-ul-one').children().eq(i).html() == $('#select-menu-input-mendian').val()) {
                                            var storeId = $('#select-menu-ul-one').children().eq(i).attr('class')
                                        }
                                    }

                                    //房间下拉菜单渲染
                                    var strsecond = '';
                                    var RoomList = { storeId: storeId }
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
                                                $('#select-menu-ul-RoomList').html(strsecond)
                                            }, 100);


                                        },
                                        error: function (e) {
                                            console.log(e.status)
                                        }
                                    })
                                }, 100);
                            },
                            error: function (msg) {
                                console.log(msg)
                            }
                        })

                    }, 100);
                    
                    //课程名称下拉渲染
                    setTimeout(() => {
                        $('#select-menu-input-coursename').val("课程名称")
                        $('#select-menu-input-coursename').addClass("2dc05bb1-854e-41c6-8584-44b9b37d8470")
                    }, 100);

                    //教练名遍历渲染
                    // var strcoach = '';
                    // if (listdata.courseSchedulingItemList) {
                    //     for (var i = 0; i < listdata.courseSchedulingItemList.length; i++) {
                    //         strcoach += `
                    //                 <p class="edit-course-context-twoone `+ listdata.courseSchedulingItemList[i].userName + `">` + listdata.courseSchedulingItemList[i].realName + `</p>
                    //             `
                    //     }
                    // } else {
                    //     strcoach = ''
                    // }

                    //新增未发布教练的渲染
                    //$('#all-coach').html(strcoach)

                    //业绩比例展示
                    // setTimeout(() => {
                    //     var strperformance = ''
                    //     if ($('#all-coach').children().length > 1) {
                    //         for (var i = 0; i < $('#all-coach').children().length; i++) {
                    //             strperformance += `
                    //                     <div class="edit-course-context-flex4-pthree">
                    //                         <p class="edit-course-context-flex4-pfour">`+ $('#all-coach').children().eq(i).html() + `</p>
                    //                         <input class="edit-course-context-flex4-pfive" />
                    //                     </div>
                    //                 `
                    //         }
                    //     } else {
                    //         strperformance = ''
                    //     }
                    //     $('#coach-performance').html(strperformance)
                    // }, 100);

                    //点击添加按钮显示添加教练
                    $('#edit-course-addadd').click(function () {
                        $('#add-edit-course1').show()
                        //教练选择页面
                        var strselect = ''
                        for (var i = 0; i < $('#all-coach').children().length; i++) {
                            strselect += `
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
                                            <p id="coach-p" class="`+ result.userName + `" style="width:70px;height:24px;border-radius:4px;background:#71B2EF;color:white;text-align:center;line-height:24px">
                                            `+ result.realName + `
                                            </p>
                                        `
                                        //点击查询渲染的教练名
                                        $('#coach-show').html(strcoachone)

                                        $('#coach-p').click(function () {
                                            strselect += `
                                                    <p class="add-edit-course-header-context-two-ptwo `+ $(this).attr('class') + `">
                                                        `+ $(this).html() + `
                                                        <img src="./image/classdel_btn.png" alt=""/>
                                                    </p>
                                                `
                                            setTimeout(() => {
                                                //点击查询出的教练名进行渲染
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

                    //上课日期时间
                    // setTimeout(() => {
                    //     $('#edit-course-context-three').val(listdata.dateStr)
                    //     $('#edit-course-context-four').val(listdata.timeStr.split('-')[0])
                    //     $('#edit-course-context-five').val(listdata.timeStr.split('-')[1])
                    // }, 100);

                    //课程零售价渲染
                    // setTimeout(() => {
                    //     $('#course-price').val(listdata.leagueCurriculumPrice)
                    // }, 100);

                    //课程标准价渲染
                    // setTimeout(() => {
                    //     $('.add-course-sortone-inputthree-input').html(listdata.price)
                    // }, 100);

                    //开课人数渲染
                    // setTimeout(() => {
                    //     $('#mincount').val(listdata.minNumber)
                    // }, 100);

                    //最大开课人数
                    // setTimeout(() => {
                    //     $('#maxcount').val(listdata.maxNumber)
                    // }, 100);

                    //是否排队
                    // setTimeout(() => {
                    //     if (listdata.isQueue == 1) {
                    //         $('#is-Queue').children('.paypay').eq(0).click()
                    //     } else {
                    //         $('#is-Queue').children('.paypay').eq(1).click()
                    //     }
                    // }, 100);

                    //贴标
                    // setTimeout(() => {
                    //     if (listdata.tagName == "无") {
                    //         $('#tag-Name').children('.paypay').eq(0).click()
                    //     }
                    //     else if (listdata.tagName == "热门") {
                    //         $('#tag-Name').children('.paypay').eq(1).click()
                    //     } else {
                    //         $('#tag-Name').children('.paypay').eq(2).click()
                    //     }
                    // }, 100);

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

            })

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
                        <img class="edit-course-header-imgone" style="width:22px;height:23px" id="edit-course-hide" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="edit-course-context" style="position:relative">
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one" style="margin-right:111px">门店</div>
                            <div id="edit-course-context-first">
                                <div class="select-menu5">
                                    <div class="select-menu-div">
                                        <input class="select-menu-input" id="select-menu-input-mendian1"/>

                                        <img class="select-menu-img" src="./image/sifting_icon.png"/>
                                    </div>
                                    <ul class="select-menu-ul" id="select-menu-ul-one" style="height:200px;overflow-y:scroll">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one" style="margin-right:111px">房间</div>
                            <div id="edit-course-context-second">
                                <div class="select-menu5">
                                    <div class="select-menu-div">
                                        <input class="select-menu-input" id="select-menu-inputroom"/>

                                        <img class="select-menu-img" src="./image/sifting_icon.png"/>
                                    </div>
                                    <ul class="select-menu-ul" id="select-menu-ul-RoomList" style="height:200px;overflow-y:scroll">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one">课程名称</div>
                            <input id="select-menu-input-coursename" style="margin-left:74px"/>    
                        </div>
                        <div class="edit-course-context-flextwo">
                            <div class="edit-course-context-one">上课教练</div>
                            <div class="edit-course-context-twoall" id="all-coach">
                                
                            </div>
                            <p class="edit-course-context-three" id="edit-course-addadd">添加</p>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one">上课日期</div>
                            <div style="width:150px;height:36px;border:1px solid #BFBFBF;border-radius:4px;margin:0 59px 0 77px">
                            <input id="edit-course-context-three" style="width:150px;height:36px;border:0;padding-left:10px;box-sizing:border-box"></input>
                            </div>
                            <p style="font-size:18px;margin-right:18px">上课时间</p>
                            <div style="width:120px;height:36px;border:1px solid #BFBFBF;border-radius:4px;">
                            <input id="edit-course-context-four" style="width:120px;height:36px;border:0;padding-left:10px;box-sizing:border-box"></input>
                            </div>
                            <p style="margin:0 6px 0 6px">-</p>
                            <div style="width:120px;height:36px;border:1px solid #BFBFBF;border-radius:4px;">
                            <input id="edit-course-context-five" style="width:120px;height:36px;border:0;padding-left:10px;box-sizing:border-box"></input>
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
                            <p style="margin-left:-20px;margin-right:8px;">人</p>
                            <p class="edit-course-context-flex3-ptwo">最大人数</p>
                            <div class="add-course-sortone-inputthree" style="margin-left:17px;">
                                <input type="text" id="maxcount" style="text-decoration:none;color:black">
                            </div>
                            <p style="margin-left:-20px">人</p>
                        </div>

                        <div class="edit-course-context-flex3" id="is-Queue">
                            <p class="edit-course-context-flex3-pone" style="margin-right:35px">是否排队</p>
                            <div class="paypay paypayisQueue">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">是</p>
                            <div class="paypay paypayisQueue">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">否</p>
                        </div>

                        <div class="edit-course-context-flex3" id="tag-Name">
                            <p class="edit-course-context-flex3-pone" style="margin-right:70px">贴标</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">无</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">热门</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">体验</p>
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
                        <div class="add-edit-course-header-context-one" id="coach-show" style="justify-content: left;padding-left:22px">

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
                        <img style="width:22px;height:22px" id="add-course-name-header-img" src="./image/popupclose_btn.png" alt=""/>
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

                //课程名称的请求及渲染

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
                        }, 100);

                        // for (var i = 0; i < result.length; i++) {
                        //     for (var j = 0; j < result[i].children.length; j++) {
                        //         for (var y = 0; y < list.rows.length; y++) {
                        //             for (var z = 0; z < list.rows[y].coachSkillList.length; z++) {
                        //                 if (result[i].children[j].name == list.rows[y].coachSkillList[z].leagueCurriculumName) {
                        //                     //$('#coach-manage-addthree-flexthree-list').children().eq(i).children('.addthree-flexfour').eq(j).click()
                        //                     //console.log($('#coach-manage-addthree-flexthree-list').children().eq(i).children('.addthree-flexfour').eq(j).html())
                        //                     $('#coach-manage-addthree-flexthree-list').children().eq(i).children('.addthree-flexfour').children().eq(j).click()
                        //                 }
                        //             }
                        //         }
                        //         // console.log(111)
                        //     }
                        // }
                        //console.log($('#coach-manage-addthree-flexthree-list').html())
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText)
                    }
                })

                $('#select-menu-input-coursename').click(function(){
                    $('#add-course-name1').show()
                })

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
                        var RoomList = { storeId: listdata.storeId }
                        $.ajax({
                            url: 'http://test.physicalclub.com/crm/rest/club/getClubRoomList',
                            type: 'POST',
                            contentType: 'application/json;charset=UTF-8',
                            data: JSON.stringify(RoomList),
                            success: function (result) {
                                //console.log(result)
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

                        //教练名遍历渲染
                        var strcoach = '';
                        if(listdata.courseSchedulingItemList){
                            for (var i = 0; i < listdata.courseSchedulingItemList.length; i++) {
                                strcoach += `
                                    <p class="edit-course-context-twoone `+ listdata.courseSchedulingItemList[i].userName +`">`+ listdata.courseSchedulingItemList[i].realName + `</p>
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
                                            <p class="edit-course-context-flex4-pfour">`+ $('#all-coach').children().eq(i).html() + `</p>
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
                                            <p id="coach-p" class="`+ result.rows[0].userName +`" style="width:70px;height:24px;border-radius:4px;background:#71B2EF;color:white;text-align:center;line-height:24px">
                                            `+ result.rows[0].realName + `
                                            </p>
                                        `
                                            //点击查询渲染的教练名
                                            $('#coach-show').html(strcoachone)

                                            $('#coach-p').click(function(){
                                                strselect += `
                                                    <p class="add-edit-course-header-context-two-ptwo `+ $(this).attr('class') +`">
                                                        `+ $(this).html() + `
                                                        <img src="./image/classdel_btn.png" alt=""/>
                                                    </p>
                                                `
                                                setTimeout(() => {
                                                //点击查询出的教练名进行渲染
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
                            if ($('#select-menu-ul-one').children().eq(i).html() == $('#select-menu-input-mendian').val()) {
                                var storeId = $('#select-menu-ul-one').children().eq(i).attr('class')
                            }
                        }
                        //console.log(storeId)

                        //获取房间id
                        for (var i = 0; i < $('#select-menu-ul-RoomList').children().length; i++) {
                            if ($('#select-menu-ul-RoomList').children().eq(i).html() == $('#select-menu-inputroom').val()) {
                                var roomId = $('#select-menu-ul-RoomList').children().eq(i).attr('class')
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
                            courseSchedulingItemList.push({ coachId: $('#coach-performance').children().eq(i).attr('class').split(' ')[1], performance: $('#coach-performance').children().eq(i).children('input').val()})
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
                                url : 'http://test.physicalclub.com/rest/courseScheduling/ updateCourseScheduling',
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
                        <img style="width:24px;height:24px" id="label-header-imgtwo" src="./image/popupclose_btn.png" alt=""/>
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

                    for (var i = 0; i < $('#course-arranging-table').children().children().children().length; i++) {
                        if ($('#course-arranging-table').children().children().children().eq(i).children().eq(0).children().children().children().is(':visible')) {
                            var ids = $('#course-arranging-table').children().children().children().eq(i).children().eq(0).attr('class')
                        }
                    } 

                    var tagId = ''
                    $(this).parent().parent().parent().hide()
                    for(var i=0;i<$(this).parent().parent().children().eq(1).children('.paypaypay').length;i++){
                        if($(this).parent().parent().children().eq(1).children('.paypaypay').eq(i).hasClass('2')){
                            if(i == 0){
                                tagId = 0
                            }else if(i == 1){
                                tagId = '8222a8d209a24520b116747a047529b3'
                            }else{
                                tagId = "941660f44ced4aefa8b5b24809a0d43b"
                            }
                        }
                    }
                
                    var taglist = {
                        operationType : 2,
                        ids : ids,
                        tagId : tagId
                    }

                    $.ajax({
                        url : 'http://test.physicalclub.com/rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
                        type : 'POST',
                        contentType : 'application/json;charset=UTF-8',
                        data : JSON.stringify(taglist),
                        success : function(result){
                            console.log(result)
                            window.location.reload()
                        },
                        error : function(e){
                            console.log(e.status)
                        }
                    })
                })
            
            }, 100);
            })
        
            $('#recommended').click(function(){
                for (var i = 0; i < $('#course-arranging-table').children().children().children().length; i++) {
                    if ($('#course-arranging-table').children().children().children().eq(i).children().eq(0).children().children().children().is(':visible')) {
                        var ids = $('#course-arranging-table').children().children().children().eq(i).children().eq(0).attr('class')
                        $('#course-arranging-table').children().children().children().eq(i).children().eq(1).children('img').show()
                        //console.log(ids)
                    }
                }

                var recommended = {
                    operationType : 3,
                    ids : ids
                }

                $.ajax({
                    url : 'http://test.physicalclub.com/rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
                    type : 'POST',
                    contentType : 'application/json;charset=UTF-8',
                    data : JSON.stringify(ids),
                    success : function(result){
                        console.log(result)
                    },
                    error : function(e){
                        console.log(e.status)
                    }
                })
            })

            $('#qx-recommended').click(function(){
                for (var i = 0; i < $('#course-arranging-table').children().children().children().length; i++) {
                    if ($('#course-arranging-table').children().children().children().eq(i).children().eq(0).children().children().children().is(':visible')) {
                        var ids = $('#course-arranging-table').children().children().children().eq(i).children().eq(0).attr('class')
                        $('#course-arranging-table').children().children().children().eq(i).children().eq(1).children('img').hide()
                    }
                }

                var recommended = {
                    operationType: 3,
                    ids: ids
                }

                $.ajax({
                    url: 'http://test.physicalclub.com/rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
                    type: 'POST',
                    contentType: 'application/json;charset=UTF-8',
                    data: JSON.stringify(ids),
                    success: function (result) {
                        console.log(result)
                    },
                    error: function (e) {
                        console.log(e.status)
                    }
                })
            })
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
            this.select_option()
            this.pay()
            this.adch_showhide()
        }

        checkbox_click() {
            //表格第一列显示或隐藏打钩
            $(".course-arranging-table-checkbox").click(function () {
                if ($(this).children('img').is(":hidden")) {
                    setTimeout(() => {
                        $(this).children('img').show()
                    }, 50);
                } else {
                    setTimeout(() => {
                        $(this).children('img').hide()
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

        select_option() {
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
        
        }

        pay() {
            

        }

        adch_showhide() {

            // //课程名称的取消和叉叉关闭页面
            // $('#add-course-name-header-img').click(function () {
            //     $(this).parent().parent().hide()
            // })

            // $('#add-course-name-context-bottom-pone').click(function () {
            //     $(this).parent().parent().parent().hide()
            // })
            // //课程名称的确定按钮事件
            // $('#add-course-name-context-bottom-ptwo').click(function () {
            //     $(this).parent().parent().parent().hide()
            // })

            // //课程名称页面的显示
            // $('.edit-course-context-three-pp').click(function () {
            //     $('#add-course-name1').show()
            // })
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
                var idsstr = {
                    operationType : 1,
                    ids : $(this).parent().parent().parent().parent().children().eq(0).attr('class')
                }

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

                setTimeout(() => {
                    window.location.reload()
                }, 100);
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
                setTimeout(() => {
                    setTimeout(() => {
                        var storeId = ''
                        if ($('#select-menu-input-mendian1').val() == "全部") {
                            storeId = ''
                        } else {
                            for (var i = 0; i < $('#select-menu-ul-pulishmendian1').children().length; i++) {
                                if ($('#select-menu-ul-pulishmendian1').children().eq(i).html() == $('#select-menu-input-mendian1').val()) {
                                    storeId = $('#select-menu-ul-pulishmendian1').children().eq(i).attr('class')
                                }
                            }
                            var RoomList = { storeId: storeId }
                            $.ajax({
                                url: 'http://test.physicalclub.com/crm/rest/club/getClubRoomList',
                                type: 'POST',
                                contentType: 'application/json;charset=UTF-8',
                                data: JSON.stringify(RoomList),
                                success: function (result) {
                                    var strsecond = ''
                                    //console.log(result)
                                    for (var i = 0; i < result.rows.length; i++) {
                                        strsecond += `
                                        <li class="`+ result.rows[i].roomId + `">` + result.rows[i].roomName + `</li>
                                    `
                                    }
                                    setTimeout(() => {
                                        $('#select-menu-ul-room1').html(strsecond)
                                        $('#select-menu-input-room1').val('')
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
            selectMenu(4);
            selectMenu(5);
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

            function aaaaaa(page) {

             $('#publish-search1').click(function () {
                    var storeId = ''
                    var roomId = ''
                    var realName = ''
                    var userName = ''
                    var startDate = ''
                    var endDate = ''

                    if ($('#select-menu-input-mendian1').val() == "全部") {
                        storeId = ''
                    } else {
                        for (var i = 0; i < $('#select-menu-ul-pulishmendian1').children().length; i++) {
                            if ($('#select-menu-ul-pulishmendian1').children().eq(i).html() == $('#select-menu-input-mendian1').val()) {
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
                    SchedulingList = {
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
                            <th width="48"></th>
                            <th width="180">门店</th>
                            <th width="180">房间</th>
                            <th width="134">日期</th>
                            <th width="134">时间</th>
                            <th width="120">上课教练</th>
                            <th width="120">教练工号</th>
                            <th width="120">课程名称</th>
                            <th width="120">课程售价</th>
                            <th width="120">最大人数</th>
                            <th width="120">开课人数</th>
                            <th width="120">贴标</th>
                            <th></th>
                            <th width="120">操作</th>
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
                            <td width="48" class="`+ item.id + `"><div style="display:flex;justify-content: center;"><div class="course-arranging-table-checkbox"><img style="display:none" src="./image/codeallset_btn.png"></div></div></td>
                            <td width="180" style="position:relative">`+ item.storeName + `<img style="position:absolute;left:134px;top:0px;display:none" src="image/recommended_img.png"></td>
                            <td width="180">`+ item.roomName + `</td>
                            <td width="134">`+ item.dateStr + `</td>
                            <td width="134">`+ item.timeStr + `</td>
                            <td width="120">`+ coachname(item.courseSchedulingItemList) + `</td>
                            <td width="120">`+ username(item.courseSchedulingItemList) + `</td>
                            <td width="120">`+ item.leagueCurriculumName + `</td>
                            <td width="120">￥`+ item.price + `</td>
                            <td width="120">`+ item.maxNumber + `人</td>
                            <td width="120">`+ item.minNumber + `人</td>
                            <td width="120">`+ tiebiao(item.tagName) + `</td>
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
                            <td width="120">
                                <a class="a-add1 `+ i + `">编辑</a>|<a class="a-del">删除</a>
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
                            <th width="48"></th>
                            <th width="180">门店</th>
                            <th width="180">房间</th>
                            <th width="134">日期</th>
                            <th width="134">时间</th>
                            <th width="120">上课教练</th>
                            <th width="120">教练工号</th>
                            <th width="120">课程名称</th>
                            <th width="120">课程售价</th>
                            <th width="120">最大人数</th>
                            <th width="120">开课人数</th>
                            <th width="120">贴标</th>
                            <th></th>
                            <th width="120">操作</th>
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
                            <td width="48" class="`+ item.id + `"><div style="display:flex;justify-content: center;"><div class="course-arranging-table-checkbox"><img style="display:none" src="./image/codeallset_btn.png"></div></div></td>
                            <td width="180" style="position:relative">`+ item.storeName + `<img style="position:absolute;left:134px;top:0px;display:none" src="image/recommended_img.png"></td>
                            <td width="180">`+ item.roomName + `</td>
                            <td width="134">`+ item.dateStr + `</td>
                            <td width="134">`+ item.timeStr + `</td>
                            <td width="120">`+ coachname(item.courseSchedulingItemList) + `</td>
                            <td width="120">`+ username(item.courseSchedulingItemList) + `</td>
                            <td width="120">`+ item.leagueCurriculumName + `</td>
                            <td width="120">￥`+ item.price + `</td>
                            <td width="120">`+ item.maxNumber + `人</td>
                            <td width="120">`+ item.minNumber + `人</td>
                            <td width="120">`+ tiebiao(item.tagName) + `</td>
                            <td width="0" style="position:relative;border:none">
                                <div class="td-del" style="display:none">
                                    <div class="td-del-flex">
                                        <p>是否变更该课程?</p>
                                        <p class="td-del-flex-yes">确定</p>
                                        <p class="td-del-flex-no">取消</p>
                                    </div>
                                    <p class="td-del-line"></p>
                                    <p class="td-del-left">变更课表后，将不会看到该课程!</p>
                                </div
                            </td>
                            <td width="120">
                                <a class="a-add1 `+ i + `">变更</a>|<a class="a-del">下架</a>
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
                        <img class="edit-course-header-imgone" style="width:22px;height:23px" id="edit-course-hide2" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="edit-course-context">
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one" style="margin-right:111px">门店</div>
                            <div id="edit-course-context-first">
                                <div class="select-menu5">
                                    <div class="select-menu-div">
                                        <input class="select-menu-input" id="select-menu-input-mendian3"/>

                                        <img class="select-menu-img" src="./image/sifting_icon.png"/>
                                    </div>
                                    <ul class="select-menu-ul" id="select-menu-ul-one1" style="height:200px;overflow-y:scroll">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one" style="margin-right:111px">房间</div>
                            <div id="edit-course-context-second">
                                <div class="select-menu5">
                                    <div class="select-menu-div">
                                        <input class="select-menu-input" id="select-menu-inputroom3"/>
                                        <img class="select-menu-img" src="./image/sifting_icon.png"/>
                                    </div>
                                    <ul class="select-menu-ul" id="select-menu-ul-RoomList1" style="height:200px;overflow-y:scroll">
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one">课程名称</div>
                            <input id="select-menu-input-coursename2" style="margin-left:74px"/>    
                        </div>
                        <div class="edit-course-context-flextwo">
                            <div class="edit-course-context-one">上课教练</div>
                            <div class="edit-course-context-twoall" id="all-coach2">
                                
                            </div>
                            <p class="edit-course-context-three" id="edit-course-addadd1">添加</p>
                        </div>
                        <div class="edit-course-context-flex">
                            <div class="edit-course-context-one">上课日期</div>
                            <div style="width:150px;height:36px;border:1px solid #BFBFBF;border-radius:4px;margin:0 59px 0 77px">
                            <input id="edit-course-context-three2" style="width:150px;height:36px;border:0;padding-left:10px;box-sizing:border-box"></input>
                            </div>
                            <p style="font-size:18px;margin-right:18px">上课时间</p>
                            <div style="width:120px;height:36px;border:1px solid #BFBFBF;border-radius:4px;">
                            <input id="edit-course-context-four2" style="width:120px;height:36px;border:0;padding-left:10px;box-sizing:border-box"></input>
                            </div>
                            <p style="margin:0 6px 0 6px">-</p>
                            <div style="width:120px;height:36px;border:1px solid #BFBFBF;border-radius:4px;">
                            <input id="edit-course-context-five2" style="width:120px;height:36px;border:0;padding-left:10px;box-sizing:border-box"></input>
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
                            <p style="margin-left:-20px;margin-right:8px;">人</p>
                            <p class="edit-course-context-flex3-ptwo">最大人数</p>
                            <div class="add-course-sortone-inputthree" style="margin-left:17px;">
                                <input type="text" id="maxcount2" style="text-decoration:none;color:black">
                            </div>
                            <p style="margin-left:-20px">人</p>
                        </div>

                        <div class="edit-course-context-flex3" id="is-Queue2">
                            <p class="edit-course-context-flex3-pone" style="margin-right:35px">是否排队</p>
                            <div class="paypay paypayisQueue2">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">是</p>
                            <div class="paypay paypayisQueue2">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">否</p>
                        </div>

                        <div class="edit-course-context-flex3" id="tag-Name2">
                            <p class="edit-course-context-flex3-pone" style="margin-right:70px">贴标</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">无</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">热门</p>
                            <div class="paypay">
                                <img class="paypay-show" src="./image/payment_btn.png" alt="">
                                <img class="paypay-hidden" src="./image/paymentnor_btn.png" alt="">
                            </div>
                            <p style="font-size:14px">体验</p>
                        </div>
                        <div class="edit-course-context-flex4">
                            <p class="edit-course-context-flex4-pone">业绩比例</p>
                            <div class="edit-course-context-flex4-ptwo" id="coach-performance2">
                                
                            </div>
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
                                <img style="width:22px;height:22px" id="change-header-not-imgtwo" src="./image/popupclose_btn.png" alt=""/>
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
                        <div class="add-edit-course-header-context-one" id="coach-show2" style="justify-content: left;padding-left:22px">

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
                    // acn_str = `
                    //     <div class="add-course-name-header">
                    //         <div class="add-course-name-header-left">
                    //             <img src="./image/tags_icon.png" alt=""/>
                    //             <p>课程名称</p>
                    //         </div>
                    //         <img style="width:22px;height:22px" id="add-course-name-header-img" src="./image/popupclose_btn.png" alt=""/>
                    //     </div>
                    //     <div class="add-course-name-context">
                    //         <div class="add-course-name-context-flex">
                    //             <p class="add-course-name-context-p">舞林漫步</p>
                    //             <p class="add-course-name-context-p">舞林漫步</p>
                    //             <p class="add-course-name-context-p">舞林漫步</p>
                    //             <p class="add-course-name-context-p">舞林漫步</p>
                    //             <p class="add-course-name-context-p">舞林漫步</p>
                    //             <p class="add-course-name-context-p">舞林漫步</p>
                    //             <p class="add-course-name-context-p">舞林漫步</p>
                    //             <p class="add-course-name-context-p">舞林漫步</p>
                    //         </div>
                    //         <div class="add-course-name-context-bottom">
                    //             <p id="add-course-name-context-bottom-pone">确定</p>
                    //             <p id="add-course-name-context-bottom-ptwo">取消</p>
                    //         </div>
                    //     </div>
                    // `

                    //$('.add-course-name').html(acn_str)
                    $('#edit-course2').html(editstr)
                    $('#add-edit-course2').html(addeditstr)

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
                        var RoomList = { storeId: listdata.storeId }
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
                                            <p id="coach-p2" class="`+ result.rows[0].userName + `" style="width:70px;height:24px;border-radius:4px;background:#71B2EF;color:white;text-align:center;line-height:24px">
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

                        }, 100);

                    }, 100);

                    //发送参数
                    $('#edit-course-footer-pone2').click(function () {
                        setTimeout(() => {
                            $('#add-edit-course-change').show()

                            //$(this).parent().parent().parent().hide()
                            //获取门店id
                            for (var i = 0; i < $('#select-menu-ul-one1').children().length; i++) {
                                if ($('#select-menu-ul-one1').children().eq(i).html() == $('#select-menu-input-mendian1').val()) {
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
                            if ($('#coach-performance2').html() == '') {
                                courseSchedulingItemList.push({ coachId: $('#all-coach').children().eq(0).attr('class').split(' ')[1], performance: 1 })
                            } else {
                                for (var i = 0; i < $('#coach-performance2').children().length; i++) {
                                    courseSchedulingItemList.push({ coachId: $('#coach-performance2').children().eq(i).attr('class').split(' ')[1], performance: $('#coach-performance').children().eq(i).children('input').val() })
                                }
                            }
                            
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
                                    console.log(paramsrevise)

                                    // $.ajax({
                                    //     url: 'http://test.physicalclub.com/rest/courseScheduling/ updateCourseScheduling',
                                    //     type: 'POST',
                                    //     contentType: 'application/json;charset=UTF-8',
                                    //     data: JSON.stringify(paramsrevise),
                                    //     success: function (result) {
                                    //         console.log(result)
                                    //     },
                                    //     error: function (e) {
                                    //         console.log(e.status)
                                    //     }
                                    // })

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
            this.select_option()
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
            //下拉菜单的动态渲染
            // var strstrstr
            // var strstrstrstr
            // var str5
            // var strthird;
            // var strfouth;
            // var strfivety;
            // strstrstr = `
            //     <div class="select-menu3">
		    //         <div class="select-menu-div">
			//             <input class="select-menu-input" />

			//             <img class="select-menu-img" src="./image/sifting_icon.png"/>
		    //         </div>
            //         <ul class="select-menu-ul">
            //             <li class="select-this">3</li>
            //             <li>团操课</li>
            //             <li>莱美课</li>
            //             <li>舞蹈课</li>
            //         </ul>
            //     </div>
            // `
            // strstrstrstr = `
            //     <div class="select-menu4">
		    //         <div class="select-menu-div">
			//             <input class="select-menu-input" />

			//             <img class="select-menu-img" src="./image/sifting_icon.png"/>
		    //         </div>
            //         <ul class="select-menu-ul">
            //             <li class="select-this">4</li>
            //             <li>团操课</li>
            //             <li>莱美课</li>
            //             <li>舞蹈课</li>
            //         </ul>
            //     </div>
            // `
            // str5 = `
            //     <div class="select-menu4">
		    //         <div class="select-menu-div">
			//             <input class="select-menu-input" />

			//             <img class="select-menu-img" src="./image/sifting_icon.png"/>
		    //         </div>
            //         <ul class="select-menu-ul">
            //             <li class="select-this">5</li>
            //             <li>团操课</li>
            //             <li>莱美课</li>
            //             <li>舞蹈课</li>
            //         </ul>
            //     </div>
            // `
            // strthird = `
            //     <div class="select-menu5">
		    //         <div class="select-menu-div">
			//             <input class="select-menu-input" />

			//             <img class="select-menu-img" src="./image/sifting_icon.png"/>
		    //         </div>
            //         <ul class="select-menu-ul">
            //             <li class="select-this">5</li>
            //             <li>团操课</li>
            //             <li>莱美课</li>
            //             <li>舞蹈课</li>
            //         </ul>
            //     </div>
            // `
            // strfouth = `
            //     <div class="select-menu5">
		    //         <div class="select-menu-div">
			//             <input class="select-menu-input" />

			//             <img class="select-menu-img" src="./image/sifting_icon.png"/>
		    //         </div>
            //         <ul class="select-menu-ul">
            //             <li class="select-this">5</li>
            //             <li>团操课</li>
            //             <li>莱美课</li>
            //             <li>舞蹈课</li>
            //         </ul>
            //     </div>
            // `
            // strfivety = `
            //     <div class="select-menu5">
		    //         <div class="select-menu-div">
			//             <input class="select-menu-input" />

			//             <img class="select-menu-img" src="./image/sifting_icon.png"/>
		    //         </div>
            //         <ul class="select-menu-ul">
            //             <li class="select-this">5</li>
            //             <li>团操课</li>
            //             <li>莱美课</li>
            //             <li>舞蹈课</li>
            //         </ul>
            //     </div>
            // `
            // $('#edit-course-context-third').html(strthird)
            // $('#edit-course-context-fourth').html(strfouth)
            // $('#edit-course-context-fivety').html(strfivety)
            // $('#edit-course-not-context-three').html(strstrstr)
            // $('#edit-course-not-context-four').html(strstrstrstr)
            // $('#edit-course-not-context-five').html(str5)
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
            //添加教练鼠标移入事件
            // $('.add-edit-course-not-header-context-two-ptwo').mouseover(function () {
            //     $(this).addClass('aechctp-not-active')
            //     $(this).children('img').show()
            // })
            // //添加教练的鼠标移除事件
            // $('.add-edit-course-not-header-context-two-ptwo').mouseout(function () {
            //     $(this).removeClass('aechctp-not-active')
            //     $(this).children('img').hide()
            // })
            // //添加教练的标签，点击叉叉关闭
            // $('.add-edit-course-not-header-context-two-ptwo').children('img').click(function () {
            //     $(this).parent().remove()
            // })
            // //添加教练的叉叉关闭
            // $('#add-edit-course-not-hide').click(function () {
            //     $(this).parent().parent().hide()
            // })

            // //添加教练的点击确认事件
            // $('#add-edit-course-header-not-context-three-pone').click(function () {
            //     $(this).parent().parent().parent().hide()
            // })
            // //添加教练的点击取消事件
            // $('#add-edit-course-header-context-not-three-ptwo').click(function () {
            //     $(this).parent().parent().parent().hide()
            // })
            // //点击添加按钮显示添加教练
            // $('#edit-course-not-addadd').click(function () {
            //     $('#add-edit-course').show()
            // })
            // //教练课程的显示隐藏
            // $('.add-course-not-name-context-p').click(function () {
            //     $('.add-course-not-name-context-p').each(function () {
            //         $(this).removeClass('add-course-not-name-context-p-active')
            //     })
            //     $(this).addClass('add-course-not-name-context-p-active')
            // })

            // //课程名称的取消和叉叉关闭页面
            // $('#add-course-not-name-header-img').click(function () {
            //     $(this).parent().parent().hide()
            // })

            // $('#add-course-not-name-context-bottom-pone').click(function () {
            //     $(this).parent().parent().parent().hide()
            // })
            // //课程名称的确定按钮事件
            // $('#add-course-not-name-context-bottom-ptwo').click(function () {
            //     $(this).parent().parent().parent().hide()
            // })

            // //课程名称页面的显示
            // $('.edit-course-not-context-three-pp').click(function () {
            //     $('#add-course-name').show()
            // })

            // //点击贴边按钮显示贴标
            // $('.course-arranging-not-footer-ptwo').click(function () {
            //     $('#add-edit-course-label').show()
            // })

            // //贴标点击叉叉和取消关闭页面
            // $('#label-header-not-imgtwo').click(function () {
            //     $(this).parent().parent().hide()
            // })

            // $('#add-edit-course-label-not-context-footer-ptwo').click(function () {
            //     $(this).parent().parent().parent().hide()
            // })

            // //贴标点击保存按钮
            // $('#add-edit-course-label-not-context-footer-pone').click(function () {
            //     $(this).parent().parent().parent().hide()
            // })
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
            })
            $('.td-del-not-flex-no').click(function () {
                $(this).parent().parent().hide()
            })
        }

        // edit_course_showhide() {
        //     //新增窗口的叉叉关闭
        //     $('#edit-course-not-hide').click(function () {
        //         $(this).parent().parent().hide()
        //         $('.paypay-not').each(function () {
        //             $(this).children('.paypay-not-show').hide()
        //             $(this).children('.paypay-not-hide').show()
        //         })
        //     })
        //     //新增窗口的取消关闭
        //     $('#edit-course-not-footer-ptwo').click(function () {
        //         $(this).parent().parent().parent().hide()
        //         $('.paypay-not').each(function () {
        //             $(this).children('.paypay-not-show').hide()
        //             $(this).children('.paypay-not-hide').show()
        //         })
        //     })
        //     //新增窗口的确定按钮
        //     $('#edit-course-not-footer-pone').click(function () {
        //         // $(this).parent().parent().parent().hide()
        //         $('.paypay-not').each(function () {
        //             var display = $(this).children('.paypay-not-show').css('display')
        //             $(this).removeClass('xianshi-not')
        //             if (display == 'inline') {
        //                 $(this).addClass('xianshi-not')
        //             }
        //         })
        //         $('#add-edit-course-change').show()
        //     })
        // }
    }



    $('.box').pagination({
            mode: 'fixed'
        });
</script>

</html>