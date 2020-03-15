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
    <link rel="stylesheet" href="easyui/datouwang.com.css">

    <script type="text/javascript" src="easyui/moment.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script src="easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="easyui/dateTime.min.js"></script>
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

        html {
            border: 1px solid #95B8E7;
        }

        * {
            margin: 0;
            padding: 0;
        }

        body {
            padding: 20px;
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
            margin-left: 40px;
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
            margin-right: 0;
            font-size: 16px;
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
            padding: 0 0 0 20px;
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
            padding: 0 10px 0 10px;
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
            margin-left: 60px
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
            width: 100px;
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

        .edit-course-footer {
            width: 738px;
            display: flex;
            justify-content: center;
            padding: 27px 0 27px 0;
            box-sizing: border-box;
            background: white;
            position: relative;
            top:-97px;
            left:1px
        }

        .edit-course-footer #edit-course-footer-pone {
            width: 100px;
            height: 40px;
            border-radius: 4px;
            background: #71B2EF;
            font-size: 18px;
            text-align: center;
            line-height: 40px;
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
            width: 50px;
            height: 33px;
            text-align: center;
            line-height: 36px;
            border: 0
        }

        .course-arranging-body .add-edit-course {
            position: absolute;
            top: 182px;
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
            height: 35px;
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

        .add-edit-course-header-context-three {
            width: 375px;
            display: flex;
            justify-content: center;
            padding: 15px 0 15px 0;
            position: relative;
            top:-59px;
            left:1px;
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
            margin-top: 30px;
            background: white;
            padding: 22px 22px 22px 4px;
            box-sizing: border-box;
            position: relative;
            overflow-y: scroll;
        }

        .add-course-name-context .add-course-name-context-flex {
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
            background: rgb(8, 8, 8);
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

        .add-course-name-context-bottom1 #add-course-name-context-bottom-pone2 {
            width: 88px;
            height: 35px;
            background: #71B2EF;
            border-radius: 4px;
            font-size: 16px;
            color: white;
            text-align: center;
            line-height: 35px;
        }

        .add-course-name-context-bottom1 #add-course-name-context-bottom-ptwo2 {
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
            border-radius: 0.2;
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

        .add-course-name-context-bottom1 {
            width: 627px;
            background: white;
            top: -90px;
            left:1px;
            display: flex;
            justify-content: center;
            padding: 26px 0 26px 0;
            box-sizing: border-box;
            position: relative;
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

        #add-course-name-context-flex-coursename {
            padding-bottom: 100px;
            box-sizing: border-box;
        }

        .select-menu-input-coursename-div {
            width: 250px;
            height: 36px;
            border-radius: 4px;
            border: 1px solid #BFBFBF;
            margin-left: 74px;
            display: flex;
            justify-content: left;
            align-items: center;
        }

        .select_wrap {
            position: relative;
            margin-left: 20px;
            margin-right: 39px
        }

        #kcgl-body-skmd {
            width: 200px;
            height: 30px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 14px;
            padding-left: 13px;
            box-sizing: border-box;
            -webkit-appearance: none
        }

        #kcgl-body-skfj {
            width: 200px;
            height: 30px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 14px;
            padding-left: 13px;
            box-sizing: border-box;
            -webkit-appearance: none
        }

        #kcgl-body-md {
            width: 250px;
            height: 36px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 14px;
            padding-left: 13px;
            box-sizing: border-box;
            -webkit-appearance: none
        }

        #kcgl-body-fj {
            width: 250px;
            height: 36px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 14px;
            padding-left: 13px;
            box-sizing: border-box;
            -webkit-appearance: none
        }

        #kcgl-body-skmd1 {
            width: 200px;
            height: 30px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 14px;
            padding-left: 13px;
            box-sizing: border-box;
            -webkit-appearance: none
        }

        #kcgl-body-skfj1 {
            width: 200px;
            height: 30px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 14px;
            padding-left: 13px;
            box-sizing: border-box;
            -webkit-appearance: none
        }

        .triangle_border_down1 {
            display: inline-block;
            width: 0;
            height: 0;
            border-width: 8px 5px 0;
            border-style: solid;
            border-color: #444444 transparent transparent;
            position: absolute;
            right: 5px;
            top: 11px;
        }

        .table-header th {
            font-size: 14px;
            color: #444444;
            height: 40px;
            text-align: center;
        }

        .table-body1 tr td {
            font-size: 14px;
            color: #444444;
            height: 40px;
            text-align: center;
            border-left: 1px dotted #CCCCCC;
            border-bottom: 1px dotted #CCCCCC;
        }

        .table-body1 tr td:last-child {
            border-right: 1px dotted #CCCCCC;
        }

        .item1 {
            width: 2.5%
        }

        .item2 {
            width: 9.375%
        }

        .item3 {
            width: 6.9792%
        }

        .item4 {
            width: 6.25%;
            
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
            <p id="leadlead" style="cursor:pointer;">导入课程</p>
            <input id="filelead" style="display:none" accept=".xlsx,.xls" type="file" onchange="filelead()">
            <p id="addaddadd" style="cursor:pointer;">新增</p>
            <p id='publishpublish' style="cursor:pointer;">发布</p>
            <p id="publishpublishall" style="cursor:pointer;">全部发布</p>
        </div>
        <div class="course-arranging-flex" style="height:auto;flex-wrap: wrap;">
            <div style="font-size:16px;margin-right:10px">上课门店</div>
            <span class="select_wrap">
                <select name="visitstatus" id="kcgl-body-skmd" style="cursor:pointer;">

                </select>
                <em class="triangle_border_down1"></em>
            </span>
            <div style="font-size:16px;margin-right:10px">上课房间</div>
            <span class="select_wrap">
                <select name="visitstatus" id="kcgl-body-skfj" style="cursor:pointer;">
                    
                </select>
                <em class="triangle_border_down1"></em>
            </span>
            <div style="font-size:16px">上课教练</div>
            <input class="course-arranging-flex-select-two" id="teaching-course-coach"></input>
            <div style="font-size:16px">教练工号</div>
            <input class="course-arranging-flex-select-three" id="coach-id" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"></input>
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
                <p id="publish-search" style="cursor:pointer;">查询</p>
                <p id="cxsx" style="cursor:pointer;">清除</p>
            </div>
            <p class="course-arranging-flextwo-pthree" id='derivederive' style="cursor:pointer;">导出课程</p>
        </div>
        <table style='border-collapse: collapse;width: 100%;table-layout:fixed;margin-top:20px'>
            <tbody>
                <tr class="table-header" style="background:#f8fafb">
                    <th class="item1"></th>
                    <th class="item2">门店</th>
                    <th class="item2">房间</th>
                    <th class="item3">日期</th>
                    <th class="item3">时间</th>
                    <th class="item4">上课教练</th>
                    <th class="item4">教练工号</th>
                    <th class="item4">课程名称</th>
                    <th class="item4">课程售价</th>
                    <th class="item4">最大人数</th>
                    <th class="item4">开课人数</th>
                    <th class="item4">贴标</th>
                    <th class="item4">操作</th>
                </tr>
            </tbody>
            <tbody class="table-body1" id="sj-body-body1">

            </tbody>
        </table>
        <div class="course-arranging-footer" style="height:auto;flex-wrap: wrap;">
            <div class="course-arranging-table-checkbox" id="course-arranging-table-checkbox-all">
                <img style="display:none" src="./image/codeallset_btn.png">
            </div>
            <div class="course-arranging-footer-pone">当页全选</div>
            <div class="course-arranging-footer-pone">已选课程<span></span></div>
            <div class="course-arranging-footer-ptwo" id="recommended" style="cursor:pointer;">推荐</div>
            <div class="course-arranging-footer-ptwo" id="qx-recommended" style="cursor:pointer;">取消推荐</div>
            <div class="course-arranging-footer-ptwo" id="tiebiao-show" style="cursor:pointer;">贴标</div>
            <div class="course-arranging-footer-ptwo" id="shanchudel" style="cursor:pointer;">删除</div>
            <div class="course-arranging-footer-pthree"></div>
            <div class="box" id="boxpage" style="margin:0"></div>
        </div>
        <div class="edit-course" id="edit-course1">

        </div>
        <div class="add-edit-course" id="add-edit-course1">

        </div>

        <div class="add-edit-course-label" id="add-edit-course-label1" style="display:none">

        </div>

        
    </div>

    <div class="course-arranging-body" id="course-arranging-body-right" style="display:none">
        <div class="course-arranging-header-two"></div>
        <div class="course-arranging-flex" style="height:auto;flex-wrap: wrap;">
            <div style="font-size:16px;margin-right:10px">上课门店</div>
            <span class="select_wrap">
                <select name="visitstatus" id="kcgl-body-skmd1" style="cursor:pointer">
            
                </select>
                <em class="triangle_border_down1"></em>
            </span>
            <div style="font-size:16px;margin-right:10px">上课房间</div>
            <span class="select_wrap">
                <select name="visitstatus" id="kcgl-body-skfj1" style="cursor:pointer">
            
                </select>
                <em class="triangle_border_down1"></em>
            </span>
            <div style="font-size:16px">上课教练</div>
            <input class="course-arranging-flex-select-two" id="teaching-course-coach1" />
            <div style="font-size:16px">教练工号</div>
            <input class="course-arranging-flex-select-three" id="coach-id1" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
            <div style="font-size:16px">创建时间</div>
            <div class="J-datepicker-day">
                <input type="text" class="course-arranging-flex-input-one" id="create-course-time1" placeholder="开始时间">
            </div>
            <p>-</p>
            <div class="J-datepicker-day">
                <input type="text" class="course-arranging-flex-input-two" id="end-course-time1" placeholder="结束时间">
            </div>
        </div>
        <div class="course-arranging-flextwo">
            <div class="course-arranging-flexthree">
                <p id="publish-search1" style="cursor:pointer">查询</p>
                <p id="cxsx2" style="cursor:pointer">清除</p>
            </div>
            <p class="course-arranging-flextwo-pthree" id='derivederive11' style="cursor:pointer">导出课程</p>
        </div>
        <table style='border-collapse: collapse;width: 100%;table-layout:fixed;margin-top:20px'>
            <tbody>
                <tr class="table-header" style="background:#f8fafb">
                    <th class="item1"></th>
                    <th class="item2">门店</th>
                    <th class="item2">房间</th>
                    <th class="item3">日期</th>
                    <th class="item3">时间</th>
                    <th class="item4">上课教练</th>
                    <th class="item4">教练工号</th>
                    <th class="item4">课程名称</th>
                    <th class="item4">课程售价</th>
                    <th class="item4">最大人数</th>
                    <th class="item4">开课人数</th>
                    <th class="item4">贴标</th>
                    <th class="item4">操作</th>
                </tr>
            </tbody>
            <tbody class="table-body1" id="sj-body-body2">
        
            </tbody>
        </table>

        <div class="box" id="boxpage1" style="padding-bottom:20px;margin-left:77rem;width:100%"></div>
        

        <div class="edit-course" id="edit-course2">

        </div>
        <div class="add-edit-course" id="add-edit-course2">

        </div>

        <div class="add-course-name" id="add-course-name">

        </div>

        <div class="add-edit-course-label" id="add-edit-course-label" style="display:none">

        </div>

    </div>
</body>

<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>

<script type="text/javascript">

    //切换至发布页面
    $('#course-arranging-header-one-ptwo').click(function () {
        $('#course-arranging-header-one-pone').removeClass('course-arranging-header-one-pone-active')
        $(this).addClass('course-arranging-header-one-ptwo-active')
        $('#course-arranging-body-left').hide()
        $('#course-arranging-body-right').show()
        shoyen()
    })

    //切换至待发布页面
    $('#course-arranging-header-one-pone').click(function () {
        $('#course-arranging-header-one-ptwo').removeClass('course-arranging-header-one-ptwo-active')
        $(this).addClass('course-arranging-header-one-pone-active')
        $('#course-arranging-body-left').show()
        $('#course-arranging-body-right').hide()
        shoye()
    })

    //待发布页面查询
    $('#publish-search').click(function(){
        shoye()
    })

    //待发布页面清除
    $('#cxsx').click(function(){
        $('#kcgl-body-skmd').find('option[value=""]').prop("selected", true);
        $('#kcgl-body-skfj').html('')
        $('#teaching-course-coach').val('')
        $('#coach-id').val('')
        $('#create-course-time').val('')
        $('#end-course-time').val('')
        shoye()
    })

    //发布页面查询
    $('#publish-search1').click(function () {
        shoyen()
    })

    //发布页面清除
    $('#cxsx2').click(function () {
        $('#kcgl-body-skmd1').find('option[value=""]').prop("selected", true);
        $('#kcgl-body-skfj1').html('')
        $('#teaching-course-coach1').val('')
        $('#coach-id1').val('')
        $('#create-course-time1').val('')
        $('#end-course-time1').val('')
        shoyen()
    })

    $('#course-arranging-table-checkbox-all').click(function () {
        if ($(this).children('img').is(':hidden')) {
            $(".course-arranging-table-checkbox").children('img').show()
        } else {
            $(".course-arranging-table-checkbox").children('img').hide()
        }
    })

    //贴标页面显示
    $('#tiebiao-show').click(function(){
        $('#add-edit-course-label1').show()
    })

    //发布
    $('#publishpublish').click(function () {

        var ids = []

        for (var i = 0; i < $('#sj-body-body1').children().length; i++) {
            if ($('#sj-body-body1').children().eq(i).children().eq(0).children().children().children().is(':visible')) {
                var ids1 = $('#sj-body-body1').children().eq(i).children().eq(0).attr('class')
                ids.push(ids1)
            }
        }

        var recommended = {
            operationType: 4,
            ids: ids,
            state: 1
        }

        $.ajax({
            url: 'rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(recommended),
            success: function (result) {
                if(result.message.substr(0,4) == '发布成功'){
                    alert(result.message)
                    shoye()
                }else{
                    alert('请勾选门店')
                }
                
            },
            error: function (e) {
                console.log(e.status)
            }

        })
    })

    //全部发布
    $('#publishpublishall').click(function () {
        var ids = []
        var data = new Date()
        for (var i = 0; i < $('#sj-body-body1').children().length; i++) {
            if (($('#sj-body-body1').children().eq(i).children().eq(3).html().split('-')[0] >= data.getFullYear() && Number($('#sj-body-body1').children().eq(i).children().eq(3).html().split('-')[1]) > (data.getMonth() + 1)) || (($('#sj-body-body1').children().eq(i).children().eq(3).html().split('-')[0] >= data.getFullYear() && Number($('#sj-body-body1').children().eq(i).children().eq(3).html().split('-')[1]) == (data.getMonth() + 1) && Number($('#sj-body-body1').children().eq(i).children().eq(3).html().split('-')[2]) > data.getDate()))) {

                var ids1 = $('#sj-body-body1').children().eq(i).children().eq(0).attr('class')

                ids.push(ids1)
            }
        }

        var recommended = {
            operationType: 4,
            ids: ids,
            state: 1
        }

        $.ajax({
            url: 'rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(recommended),
            success: function (result) {
                alert(result.message)
                shoye()
            },
            error: function (e) {
                console.log(e.status)
            }

        })
    })

    //推荐按钮
    $('#recommended').click(function () {

            var ids = []
            for (var i = 0; i < $('#sj-body-body1').children().length; i++) {
                if ($('#sj-body-body1').children().eq(i).children().eq(0).children().children().children().is(':visible')) {
                    var ids1 = $('#sj-body-body1').children().eq(i).children().eq(0).attr('class')
                    ids.push(ids1)
                }
            }

            var recommended = {
                operationType: 3,
                ids: ids,
                isRecommend: 1
            }
            console.log(recommended)
            $.ajax({
                url: 'rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
                type: 'POST',
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify(recommended),
                success: function (result) {
                    console.log(result)
                    if(result.message.substr(0,4) == '推荐成功'){
                        alert(result.message)
                        shoye()
                    }else{
                        alert('请勾选门店')
                    }
                    
                    
                },
                error: function (e) {
                    console.log(e.status)
                }
            })
        })

    //取消推荐按钮
    $('#qx-recommended').click(function(){

        var ids = []
        for (var i = 0; i < $('#sj-body-body1').children().length; i++) {
            if ($('#sj-body-body1').children().eq(i).children().eq(0).children().children().children().is(':visible')) {
                var ids1 = $('#sj-body-body1').children().eq(i).children().eq(0).attr('class')
                ids.push(ids1)
            }
        }

        var recommended = {
            operationType: 3,
            ids: ids,
            isRecommend: 0
        }
        console.log(recommended)
        $.ajax({
            url: 'rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(recommended),
            success: function (result) {
                if(result.message.substr(0,4) == '取消推荐'){
                    alert(result.message)
                    shoye()
                }else{
                    alert('请勾选门店')
                }
                
            },
            error: function (e) {
                console.log(e.status)
            }
        })
    })

    //删除按钮
    $('#shanchudel').click(function(){

       var ids = []
        for (var i = 0; i < $('#sj-body-body1').children().length; i++) {
            if ($('#sj-body-body1').children().eq(i).children().eq(0).children().children().children().is(':visible')) {
                var ids1 = $('#sj-body-body1').children().eq(i).children().eq(0).attr('class')
                ids.push(ids1)
            }
        }

        var recommended = {
            operationType: 1,
            ids: ids
        }

        $.ajax({
            url: 'rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(recommended),
            success: function (result) {
                console.log(result.message)
                if(result.message.substr(0,4) == '删除成功'){
                    alert(result.message)
                    shoye()
                }else{
                    alert('请勾选门店')
                }
                
            },
            error: function (e) {
                console.log(e.status)
            }

        })
    })

    //导出课程
    $('#derivederive').click(function () {
        var storeId = $('#kcgl-body-skmd').val()
    
        var roomId = $('#kcgl-body-skfj').val()

        realName = $('#teaching-course-coach').val()

        userName = $('#coach-id').val()

        startDate = $('#create-course-time').val()

        endDate = $('#end-course-time').val()

        location.href = "rest/courseScheduling/exportCourseScheduling?storeId=" + storeId + '&roomId=' + roomId + '&realName=' + realName + '&userName=' + userName + '&startDate=' + startDate + '&endDate=' + endDate
    })

    $('#derivederive11').click(function () {
        var storeId = $('#kcgl-body-skmd1').val()

        var roomId = $('#kcgl-body-skfj1').val()

        realName = $('#teaching-course-coach1').val()

        userName = $('#coach-id1').val()

        startDate = $('#create-course-time1').val()

        endDate = $('#end-course-time1').val()

        location.href = "rest/courseScheduling/exportCourseScheduling?storeId=" + storeId + '&roomId=' + roomId + '&realName=' + realName + '&userName=' + userName + '&startDate=' + startDate + '&endDate=' + endDate
    })

    $('#leadlead').click(function () {
        $('#filelead').click()
    })

    //新建按钮
    $('#addaddadd').click(function(){
        $('#edit-course1').show()

        $('#kcgl-body-md').find('option[value=""]').prop("selected", true);

        $('#kcgl-body-md').click()

        setTimeout(() => {
            $('#kcgl-body-fj').find('option[value=""]').prop("selected", true);
        }, 50);
        

        $('#select-menu-input-coursename').val('')
        $('#select-menu-input-coursename').attr('class','')

        $('#all-coach').html('')

        $('#edit-course-context-three').val('')

        $('#edit-course-context-four').val('')

        $('#edit-course-context-five').val('')

        $('#course-price').val('')

        $('#mincount').val('')

        $('#maxcount').val('')

        $('#is-Queue').children('.paypayisQueue').eq(0).click()

        $('#tag-Name').children('.paypay').eq(0).click()

        $('#edit-course-footer-pone').unbind()
        $('#edit-course-footer-pone').click(function () {
            xjsjxjsj()
        })
    })

    time()

    dfbmdlb()

    dbqymxr()

    shoye()

    shoyen()

    xjjbjymxr()

    //门店下拉列表渲染
    function dfbmdlb(){
        $.ajax({
            url: 'rest/club/getClubInfo',
            type: 'GET',
            dataType: 'json',
            success: function (data) {

                var pulishmendian = `
                    <option value="" selected="selected">全部</option>
                `;

                $.each(data.rows, function (i, item) {
                    pulishmendian += `
                            <option value="`+ item.clubId + `">` + item.clubName + `</option>
                        `
                })
                $('#kcgl-body-skmd').html(pulishmendian)
                $('#kcgl-body-skmd1').html(pulishmendian)

                dfbskfj()
            },
            error: function (msg) {
                console.log(msg)
            }
        })
    }

    //房间下拉列表渲染
    function dfbskfj(){

        $('#kcgl-body-skmd').click(function(){
                var storeId = $('#kcgl-body-skmd').val()

                if (storeId == '') {
                    $('#kcgl-body-skfj').html('')
                    return
                }

                $.ajax({
                    url: 'rest/club/getClubRoomList?clubId=' + storeId,
                    type: 'POST',
                    success: function (result) {
                        var strsecond = `
                    <option value="" selected="selected">全部</option>
                `
                        console.log(result)
                        for (var i = 0; i < result.rows.length; i++) {
                            strsecond += `
                         <option value="`+ result.rows[i].roomId + `">` + result.rows[i].roomName + `</option>
                    `
                        }

                        $('#kcgl-body-skfj').html(strsecond)

                    },
                    error: function (e) {
                        console.log(e.status)
                    }
                })
        })

        $('#kcgl-body-skmd1').click(function () {
            var storeId = $('#kcgl-body-skmd1').val()

            if (storeId == '') {
                $('#kcgl-body-skfj1').html('')
                return
            }

            $.ajax({
                url: 'rest/club/getClubRoomList?clubId=' + storeId,
                type: 'POST',
                success: function (result) {
                    var strsecond = `
                    <option value="" selected="selected">全部</option>
                `
                    console.log(result)
                    for (var i = 0; i < result.rows.length; i++) {
                        strsecond += `
                         <option value="`+ result.rows[i].roomId + `">` + result.rows[i].roomName + `</option>
                    `
                    }

                    $('#kcgl-body-skfj1').html(strsecond)

                },
                error: function (e) {
                    console.log(e.status)
                }
            })
        })
    }

    //新建及编辑门店下拉
    function xjjbjmdxl() {
        $.ajax({
            url: 'rest/club/getClubInfo',
            type: 'GET',
            dataType: 'json',
            success: function (data) {

                var pulishmendian = `
                    <option value="" selected="selected">全部</option>
                `;

                $.each(data.rows, function (i, item) {
                    pulishmendian += `
                        <option value="`+ item.clubId + `">` + item.clubName + `</option>
                    `
                })
                $('#kcgl-body-md').html(pulishmendian)

                xjjbjfjxl()
            },
            error: function (msg) {
                console.log(msg)
            }
        })
    }

    //新建及编辑房间下拉
    function xjjbjfjxl() {

        $('#kcgl-body-md').click(function () {
            var storeId = $('#kcgl-body-md').val()

            if (storeId == '') {
                $('#kcgl-body-fj').html('')
                return
            }

            $.ajax({
                url: 'rest/club/getClubRoomList?clubId=' + storeId,
                type: 'POST',
                success: function (result) {
                    var strsecond = `
                        <option value="" selected="selected"></option>
                    `
                    console.log(result)
                    for (var i = 0; i < result.rows.length; i++) {
                        strsecond += `
                            <option value="`+ result.rows[i].roomId + `">` + result.rows[i].roomName + `</option>
                        `
                    }

                    $('#kcgl-body-fj').html(strsecond)

                },
                error: function (e) {
                    console.log(e.status)
                }
            })
        })

    }

    //打标签页面渲染
    function dbqymxr(){
        var aecl_str = '';
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
                            <img class="paypaypay-hidden" style="display:none" src="./image/paymentnor_btn.png" alt="">
                        </div>
                        <p>无</p>
                        <div class="paypaypay">
                            <img class="paypaypay-show" style="display:none" src="./image/payment_btn.png" alt="">
                            <img class="paypaypay-hidden" src="./image/paymentnor_btn.png" alt="">
                        </div>
                        <p>热门</p>
                        <div class="paypaypay">
                            <img class="paypaypay-show" style="display:none" src="./image/payment_btn.png" alt="">
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
            $(this).parent().children('.paypaypay').children('.paypaypay-show').hide()
            $(this).parent().children('.paypaypay').children('.paypaypay-hidden').show()
            if ($(this).children('.paypaypay-hidden').is(":hidden")) {
                $(this).children('.paypaypay-hidden').show()
                $(this).children('.paypaypay-show').hide()
            } else {
                $(this).children('.paypaypay-hidden').hide()
                $(this).children('.paypaypay-show').show()
            }
        })

        //贴标点击叉叉和取消关闭页面
        $('#label-header-imgtwo').click(function () {
            $(this).parent().parent().hide()
        })

        //贴标点击取消关闭页面
        $('#add-edit-course-label-context-footer-ptwo').click(function () {
            $(this).parent().parent().parent().hide()
        })

        //贴标点击保存
        $('#add-edit-course-label-context-footer-pone').click(function(){
            var tagId = ''
                if ($(this).parent().parent().children().eq(1).children('.paypaypay').eq(0).children().eq(0).is(':visible')) {
                    tagId = 0
                }else if($(this).parent().parent().children().eq(1).children('.paypaypay').eq(1).children().eq(0).is(':visible')){
                    tagId = '8222a8d209a24520b116747a047529b3'
                }else{
                    tagId = "941660f44ced4aefa8b5b24809a0d43b"
                }

            tbsj(tagId)
            $(this).parent().parent().parent().hide()
        })

    }

    //贴标事件
    function tbsj(tagId){

        var ids = []
        for (var i = 0; i < $('#sj-body-body1').children().length; i++) {
            if ($('#sj-body-body1').children().eq(i).children().eq(0).children().children().children().is(':visible')) {
                var ids1 = $('#sj-body-body1').children().eq(i).children().eq(0).attr('class')
                ids.push(ids1)
            }
        }

        var taglist = {
            operationType: 2,
            ids: ids,
            tagId: tagId
        }

        console.log(taglist)

        $.ajax({
            url: 'rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(taglist),
            success: function (result) {
                if(result.message.substr(0,4) == '打标成功'){
                    alert(result.message)
                    shoye()
                }else{
                    alert('请勾选门店')
                }
                
            },
            error: function (e) {
                console.log(e.status)
            }
        })
    }

    //时间组件
    function time() {
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

    //待发布首页
    function shoye() {

        var onPagechange = function (page) {
            aaaaaa(page)
        }

        var page = 1;
        aaaaaa(page)

        function aaaaaa(page) {

            //排课管理列表请求

            var storeId = $('#kcgl-body-skmd').val()

            var roomId = $('#kcgl-body-skfj').val()

            var realName = $('#teaching-course-coach').val()

            var userName = $('#coach-id').val()

            var startDate = $('#create-course-time').val()

            var endDate = $('#end-course-time').val()

            var SchedulingList = {
                state: 0,
                page: page,
                rows: 10,
                storeId: storeId,
                roomId: roomId,
                realName: realName,
                userName: userName,
                startDate: startDate,
                endDate: endDate
            }
            $.ajax({
                url: 'rest/courseScheduling/selectCourseSchedulingList',
                type: 'POST',
                contentType: 'application/json;charset=UTF-8',
                data: JSON.stringify(SchedulingList),
                success: function (result) {
                    console.log(result)

                    //表格的动态渲染
                    var str2 = ''

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
                            <td style="width:2.5%" class="`+ item.id + `"><div style="display:flex;justify-content: center;"><div class="course-arranging-table-checkbox"><img style="display:none" src="./image/codeallset_btn.png"></div></div></td>
                            <td class="item2" style="position:relative">`+ item.storeName + `<img style="position:absolute;right:0;top:0;` + (item.isRecommend == 1 ? '' : 'display:none') +`" src="image/recommended_img.png"></td>
                            <td class="item2">`+ item.roomName + `</td>
                            <td class="item3">`+ item.dateStr + `</td>
                            <td class="item3">`+ item.timeStr + `</td>
                            <td class="item4">`+ coachname(item.courseSchedulingItemList) + `</td>
                            <td class="item4">`+ username(item.courseSchedulingItemList) + `</td>
                            <td class="item4">`+ item.leagueCurriculumName + `</td>
                            <td class="item4">￥`+ item.price + `</td>
                            <td class="item4">`+ item.maxNumber + `人</td>
                            <td class="item4">`+ item.minNumber + `人</td>
                            <td class="item4">`+ tiebiao(item.tagName) + `</td>
                            <td style="position:relative;display:flex;flex:1;justify-content:center;align-items:center">
                                <p style="color:#71B2EF;cursor:pointer;" class="a-add `+ i + `">编辑</p><p style="color:#71B2EF;margin:0 3px 0 3px">|</p><p style="color:#71B2EF;cursor:pointer;" class="a-del">删除</p>
                                <div class="td-del" style="display:none">
                                    <div class="td-del-flex">
                                        <p>是否删除该课程?</p>
                                        <p class="td-del-flex-yes">确定</p>
                                        <p class="td-del-flex-no">取消</p>
                                    </div>
                                    <p class="td-del-line"></p>
                                    <p class="td-del-left">移除课表后，教练将不会看到该课程!</p>
                                </div>
                            </td>
                        </tr>
                    `
                    })
                    $('#sj-body-body1').html(str2)

                    //表格第一列显示或隐藏打钩
                    $(".course-arranging-table-checkbox").click(function () {
                        if ($(this).children('img').is(":hidden")) {
                                $(this).children('img').show()
                                $(this).children('img').addClass('11')
                        } else {
                                $(this).children('img').hide()
                                $(this).children('img').removeClass('11')
                                $('#course-arranging-table-checkbox-all').children('img').hide()
                        }
                    })

                    $('#course-arranging-table-checkbox-all').click(function () {
                        if ($(this).children('img').is(':hidden')) {
                            $(this).children('img').show()
                            $(".course-arranging-table-checkbox").children('img').show()
                        } else {
                            $(this).children('img').hide()
                            $(".course-arranging-table-checkbox").children('img').hide()
                        }
                    })

                    $('.a-add').click(function () {
                        $('#edit-course1').show()
                        var id = $(this).parent().parent().children().eq(0).attr('class')
                        ckkcxxjbj(result,id)
                    })

                    $('.a-del').click(function(){
                        $(this).parent().children('.td-del').show()
                        var ids1 = $(this).parent().parent().parent().parent().children().eq(0).attr('class')

                        $('.td-del-flex-yes').click(function(){
                            sybgzdscsj(ids1)
                        })
                        
                        $('.td-del-flex-no').click(function(){
                            $(this).parent().parent().hide()
                        })

                    })

                    var obj = {
                        wrapid: 'boxpage', //页面显示分页器容器id
                        total: result.total, //总条数
                        pagesize: 10, //每页显示10条
                        currentPage: page, //当前页
                        onPagechange: onPagechange
                        //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
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

    //首页表格中的删除事件
    function sybgzdscsj(ids1){
        var ids = []
                
        ids.push(ids1)
            

        var recommended = {
            operationType: 1,
            ids: ids
        }

        $.ajax({
            url: 'rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(recommended),
            success: function (result) {
                alert(result.message)
                shoye()
            },
            error: function (e) {
                console.log(e.status)
            }

        })
    }

    //发布首页
    function shoyen(){

        var onPagechange = function (page) {
            aaaaaa(page)
        }

        var page = 1;
        aaaaaa(page)

        function aaaaaa(page) {

                var storeId = $('#kcgl-body-skmd1').val()

                var roomId = $('#kcgl-body-skfj1').val()

                var realName = $('#teaching-course-coach1').val()

                var userName = $('#coach-id1').val()

                var startDate = $('#create-course-time1').val()

                var endDate = $('#end-course-time1').val()

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

                $.ajax({
                    url: 'rest/courseScheduling/selectCourseSchedulingList',
                    type: 'POST',
                    contentType: 'application/json;charset=UTF-8',
                    data: JSON.stringify(SchedulingList),
                    success: function (result) {
                        //console.log(result)

                        //表格的动态渲染
                        var str2 = ''

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
                                <td style="width:2.5%" class="`+ item.id + `"><div style="display:flex;justify-content: center;"><div class="course-arranging-not-table-checkbox"><img style="display:none" src="./image/codeallset_btn.png"></div></div></td>
                                <td class="item2" style="position:relative">`+ item.storeName + `<img style="position:absolute;left:6.7rem;top:0px;display:none" src="image/recommended_img.png"></td>
                                <td class="item2">`+ item.roomName + `</td>
                                <td class="item3">`+ item.dateStr + `</td>
                                <td class="item3">`+ item.timeStr + `</td>
                                <td class="item4">`+ coachname(item.courseSchedulingItemList) + `</td>
                                <td class="item4">`+ username(item.courseSchedulingItemList) + `</td>
                                <td class="item4">`+ item.leagueCurriculumName + `</td>
                                <td class="item4">￥`+ item.price + `</td>
                                <td class="item4">`+ item.maxNumber + `人</td>
                                <td class="item4">`+ item.minNumber + `人</td>
                                <td class="item4">`+ tiebiao(item.tagName) + `</td>
                                <td style="position:relative;display:flex;flex:1;justify-content:center;align-items:center">
                                    <p class="a-add1 `+ i + `" style="display:none">编辑</p><p style="color:#71B2EF;cursor:pointer" class="a-xiajia">下架</p>
                                    <div class="td-del" style="display:none">
                                        <div class="td-del-flex">
                                            <p>是否下架该课程?</p>
                                            <p class="td-del-not-flex-yes">确定</p>
                                            <p class="td-del-not-flex-no">取消</p>
                                        </div>
                                        <p class="td-del-line"></p>
                                        <p class="td-del-left">下架课表后，将不会看到该课程!</p>
                                    </div>
                                </td>
                            </tr>
                        `

                        })

                        $('#sj-body-body2').html(str2)

                        //表格第一列显示或隐藏打钩
                        $(".course-arranging-not-table-checkbox").click(function () {
                            if ($(this).children('img').is(":hidden")) {
                                    $(this).children('img').show()
                            } else {
                                    $(this).children('img').hide()
                            }
                        })

                        $('.a-xiajia').click(function(){
                            $(this).parent().children('.td-del').show()

                            $('.td-del-not-flex-yes').click(function(){
                                var ids1 = $(this).parent().parent().parent().parent().children().eq(0).attr('class')
                                fbsyxj(ids1)
                            })

                            $('.td-del-not-flex-no').click(function(){
                                $(this).parent().parent().hide()
                            })
                        })

                        var obj = {
                            wrapid: 'boxpage1', //页面显示分页器容器id
                            total: result.total, //总条数
                            pagesize: 10, //每页显示10条
                            currentPage: page, //当前页
                            onPagechange: onPagechange
                            //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
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

    //发布首页的下架
    function fbsyxj(ids1){
        var ids = []

        ids.push(ids1)

        var recommended = {
            operationType: 4,
            ids: ids,
            state: 0
        }

        $.ajax({
            url: 'rest/courseScheduling/updateBatchCourseSchedulingByOperationType',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(recommended),
            success: function (result) {
                console.log(result)
                alert(result.message)
                shoyen()
            },
            error: function (e) {
                console.log(e.status)
            }

        })
    }

    //导入文件
    function filelead() {
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
            url: "rest/courseScheduling/insertImportCourseScheduling",
            type: "post",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                if(data.message == '导入成功!'){
                    alert(data.message)
                    shoye()
                }else{
                    alert(data.message)
                    return;
                }
                
            },
            error: function (data) {
                alert("上传失败")
            }
        });
    }

    //新建及编辑页面渲染
    function xjjbjymxr(){
        var editstr = '';
        editstr = `
            <div class="edit-course-header">
                <div class="edit-course-header-one">
                    <img class="edit-course-header-imgone" src="./image/editor_icon.png" alt="" />
                    <p class="edit-course-header-pone">新增未发布</p>
                </div>
                <img class="edit-course-header-imgone" style="width:22px;height:23px;cursor:pointer" id="edit-course-hide" src="./image/popupclose_btn.png" alt=""/>
            </div>
            <div class="edit-course-context">
                <div class="edit-course-context-flex">
                    <div class="edit-course-context-one" style="margin-right:111px">门店</div>
                    <span class="select_wrap" style="margin:0">
                        <select name="visitstatus" id="kcgl-body-md" style="cursor:pointer">

                        </select>
                        <em class="triangle_border_down1"></em>
                    </span>
                </div>
                <div class="edit-course-context-flex">
                    <div class="edit-course-context-one" style="margin-right:111px">房间</div>
                    <span class="select_wrap" style="margin:0">
                        <select name="visitstatus" id="kcgl-body-fj" style="cursor:pointer">

                        </select>
                        <em class="triangle_border_down1"></em>
                    </span>
                </div>
                <div class="edit-course-context-flex">
                    <div class="edit-course-context-one">课程名称</div>
                    <div class="select-menu-input-coursename-div">
                        <input id="select-menu-input-coursename" style="margin-left:10px;border:0;font-size:14px;cursor:pointer"/>   
                    </div> 
                </div>
                <div class="edit-course-context-flextwo">
                    <div class="edit-course-context-one">上课教练</div>
                    <div class="edit-course-context-twoall" id="all-coach">
                        
                    </div>
                    <p class="edit-course-context-three" id="edit-course-addadd" style="margin:5px 0;cursor:pointer">添加</p>
                </div>
                <div class="edit-course-context-flex">
                    <div class="edit-course-context-one">上课日期</div>
                    <div class="J-datepicker-day" style="width:150px;height:36px;overflow: hidden;border:1px solid #BFBFBF;border-radius:4px;margin:0 39px 0 77px">
                        <input id="edit-course-context-three" style="width:150px;height:36px;border:0;padding-left:10px;box-sizing:border-box;cursor:pointer" />
                    </div>
                    <p style="font-size:18px;margin-right:18px">上课时间</p>
                    <div class="mycontainer" style="width:120px;height:36px;overflow: hidden;border:1px solid #BFBFBF;border-radius:4px;">
                        <input id="edit-course-context-four" style="width:120px;height:36px;border:0;padding-left:10px;box-sizing:border-box;cursor:pointer" />
                    </div>
                    <p style="margin:0 6px 0 6px">-</p>
                    <div class="mycontainer" style="width:120px;height:36px;overflow: hidden;border:1px solid #BFBFBF;border-radius:4px;">
                        <input id="edit-course-context-five" style="width:120px;height:36px;border:0;padding-left:10px;box-sizing:border-box;cursor:pointer" />
                    </div>
                </div>

                <div class="edit-course-context-flex3">
                    <p class="edit-course-context-flex3-pone">课程售价</p>
                    <div class="add-course-sortone-inputtwo">
                        <p>￥</p>
                        <input type="text" id="course-price" style="cursor:pointer" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                    </div>
                    <p class="edit-course-context-flex3-ptwo" style="display:none">标准价</p>
                    <div class="add-course-sortone-inputthree" style="display:none">
                        <p>￥</p>
                        <p class="add-course-sortone-inputthree-input">188.00</p>
                    </div>
                </div>

                <div class="edit-course-context-flex3">
                    <p class="edit-course-context-flex3-pone">开课人数</p>
                    <div class="add-course-sortone-inputtwo">
                        <input type="text" id="mincount" style="cursor:pointer" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                    </div>
                    <p style="margin-left:-20px;margin-right:8px;">人</p>
                    <p class="edit-course-context-flex3-ptwo">最大人数</p>
                    <div class="add-course-sortone-inputthree" style="margin-left:17px;">
                        <input type="text" id="maxcount" style="text-decoration:none;color:black;cursor:pointer" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
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
            </div>
            <div class="edit-course-footer">
                <p id="edit-course-footer-pone" class="addcfpone" style="cursor:pointer">保存</p>
                <p id="edit-course-footer-ptwo" class="addcfptwo" style="cursor:pointer">取消</p>
            </div>
        `

        $('#edit-course1').html(editstr)

        //新增窗口单选框的显示及排他
        $(".paypay").click(function () {
            $(this).parent().children('.paypay').children('.paypay-show').hide()
            $(this).parent().children('.paypay').children('.paypay-hidden').show()
            if ($(this).children('.paypay-hidden').is(":hidden")) {
                $(this).children('.paypay-hidden').show()
                $(this).children('.paypay-show').hide()
            } else {
                $(this).children('.paypay-hidden').hide()
                $(this).children('.paypay-show').show()
            }
        })

        $('#edit-course-footer-ptwo').click(function(){
            $(this).parent().parent().hide()
            $('.dateTimeWrap').hide()
        })

        $('#edit-course-hide').click(function(){
            $(this).parent().parent().hide()
            $('.dateTimeWrap').hide()
        })

        $('#edit-course-footer-pone').unbind()
        $('#edit-course-footer-pone').click(function(){
            xjsjxjsj()
        })

        xjjbjmdxl()

        kcmclbxr()

        time()

        $("#edit-course-context-four").datetime({
            type: "time",
            value: [00,00]
        })

        $("#edit-course-context-five").datetime({
            type: "time",
            value: [00,00]
        })

        $('#edit-course1').click(function(){
            if($(event.target).attr('class') == 'edit-course-context-flex' || $(event.target).attr('class') == 'edit-course-context-flextwo' || $(event.target).attr('class') == 'edit-course-context-flex3' || $(event.target).attr('class') == 'edit-course-context-twoall'){
                if($('.dateTimeWrap').is(':visible')){
                    $('.dateTimeWrap').hide()
                }
            }
        })

        $('#select-menu-input-coursename').click(function(){
            $('#add-course-name1').show()
        })

        $('#edit-course-addadd').click(function(){
            $('#add-edit-course1').show()
            skjllbxr()
        })
    }

    //课程名称列表渲染
    function kcmclbxr(){
        var acn_str = `
            <div class="add-course-name-header">
                <div class="add-course-name-header-left">
                    <img src="./image/tags_icon.png" alt=""/>
                    <p>课程名称</p>
                </div>
                <img style="width:22px;height:22px;cursor:pointer" id="add-course-name-header-img" src="./image/popupclose_btn.png" alt=""/>
            </div>
            <div class="add-course-name-context">
                <div class="add-course-name-context-flex" id="add-course-name-context-flex-coursename">
                    
                </div>
            </div>
            <div class="add-course-name-context-bottom1">
                <p id="add-course-name-context-bottom-pone" style="cursor:pointer">确定</p>
                <p id="add-course-name-context-bottom-ptwo" style="cursor:pointer">取消</p>
            </div>
        `
        $('#add-course-name1').html(acn_str)

        setTimeout(() => {
            kcmclbnr()
        }, 50);
        
    }

    //课程名称列表内容及js
    function kcmclbnr(){
        
        $.ajax({
            type: 'GET',
            contentType: "application/json;charset=UTF-8",
            url: "rest/leagueCurriculum/getReleaseLeagueCurriculumListGroupByType",
            success: function (results) {
                console.log(results)
                var ad_ft1 = '';
                var result = results.rows
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
                $('#add-course-name-context-flex-coursename').html(ad_ft1)

                $('.flexthree-tags1').click(function () {
                    $('#add-course-name-context-flex-coursename').children().children('.addthree-flexfour').children('.flexthree-tags1').removeClass('active1')
                    if ($(this).hasClass('active1')) {
                            $(this).removeClass('active1')
                    } else {
                            $(this).addClass('active1')
                    }
                })

                for (var i = 0; i < result.length; i++) {
                    for (var j = 0; j < result[i].children.length; j++) {
                        if (result[i].children[j].name == $('#select-menu-input-coursename').val()) {
                            $('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).click()

                        }
                        // console.log(111)
                    }
                }

                $('#add-course-name-context-bottom-pone').click(function () {
                    $(this).parent().parent().hide()
                    //$('#select-menu-input-coursename').val($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).html())
                    //$('#select-menu-input-coursename').addClass($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).attr('class').split(' ')[1])

                    for (var i = 0; i < $('#add-course-name-context-flex-coursename').children().length; i++) {
                        for (var j = 0; j < $('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().length; j++) {
                            if ($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).hasClass('active1')) {
                                $('#select-menu-input-coursename').val($.trim($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).html()))
                                $('#select-menu-input-coursename').attr('class', $('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).attr('class').split(' ')[1])
                                //console.log($.trim($('#add-course-name-context-flex-coursename').children().eq(i).children('.addthree-flexfour').children().eq(j).html()))
                            }
                        }
                    }

                })

                //课程名称的取消和叉叉关闭页面
                $('#add-course-name-header-img').click(function () {
                    $(this).parent().parent().hide()
                })

                //课程名称的取消按钮事件
                $('#add-course-name-context-bottom-ptwo').click(function () {
                    $(this).parent().parent().hide()
                })
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText)
            }
        })
    }

    //上课教练列表渲染
    function skjllbxr(){
        var addeditstr = `
                    <div class="add-edit-course-header">
                        <div class="add-edit-course-header-one">
                            <img class="add-edit-course-header-imgone" src="./image/editor_icon.png" alt="" />
                            <p class="add-edit-course-header-pone">添加教练</p>
                        </div>
                        <img class="add-edit-course-header-imgone" style="cursor:pointer" id="add-edit-course-hide" src="./image/popupclose_btn.png" alt=""/>
                    </div>
                    <div class="add-edit-course-header-context">
                        <div class="add-edit-course-header-context-one">
                            <div class="add-edit-course-header-context-oneflex">
                                <input / id="search-value">
                                <div class="add-edit-course-header-context-one-blue">
                                    <img src="./image/search_btn.png" style="cursor:pointer" alt=""/ id="search-search">
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
                    </div>
                    <div class="add-edit-course-header-context-three">
                        <p id="add-edit-course-header-context-three-pone" style="cursor:pointer">确定</p>
                        <p id="add-edit-course-header-context-three-ptwo" style="cursor:pointer">取消</p>
                    </div>
                `
        $('#add-edit-course1').html(addeditstr)

        $('#add-edit-course-header-context-three-ptwo').click(function(){
            $(this).parent().parent().hide()
            $(document).unbind()
        })

        $('#add-edit-course-hide').click(function(){
            $(this).parent().parent().hide()
            $(document).unbind()
        })

        skjllbnr()
    }
    
    //上课教练列表内容及js
    function skjllbnr(){
        //教练选择页面
        var strselect = ''
        for (var i = 0; i < $('#all-coach').children().length; i++) {
            strselect += `
                                <p class="add-edit-course-header-context-two-ptwo `+ $('#all-coach').children().eq(i).attr('class').split(' ')[1] + `">
                                    `+ $('#all-coach').children().eq(i).html() + `
                                    <img style="cursor:pointer" src="./image/classdel_btn.png" alt=""/>
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

        //添加教练的点击确认事件
        $('#add-edit-course-header-context-three-pone').click(function () {
            $(this).parent().parent().hide()
            var againcoach = ''
            for (var i = 0; i < $('#select-coach').children().length; i++) {
                againcoach += `
                    <p style="cursor:pointer" class="edit-course-context-twoone `+ $('#select-coach').children().eq(i).attr('class').split(' ')[1] + `">` + $('#select-coach').children().eq(i).text() + `</p>
                `
            }
            $('#all-coach').html(againcoach)

            var strperformance = ''

            //比例的渲染
            if ($('#all-coach').children().length > 1) {
                for (var i = 0; i < $('#all-coach').children().length; i++) {
                    strperformance += `
                        <div style="overflow:hidden" class="edit-course-context-flex4-pthree `+ $('#all-coach').children().eq(i).attr('class').split(' ')[1] + `">
                            <p class="edit-course-context-flex4-pfour">`+ $('#all-coach').children().eq(i).html() + `</p>
                            <input class="edit-course-context-flex4-pfive" style="cursor:pointer"/>
                        </div>
                    `
                }
            } else {
                strperformance = ''
            }

            $('#coach-performance').html(strperformance)

            $(document).unbind()

        })

        $('#search-search').click(function () {
            //setTimeout(() => {
                $.ajax({
                    url: 'rest/leagueCoach/getLeagueCoachByJobNumber/' + $('#search-value').val(),
                    type: 'GET',
                    dataType: 'json',
                    success: function (result) {
                        console.log(result)
                        //console.log(strselect)
                        //background:#71B2EF;
                        var strcoachone = `
                                            <p id="coach-p" class="`+ result.rows[0].userName + `" style="width:70px;height:24px;border-radius:4px;color:black;text-align:center;line-height:24px;cursor:pointer">
                                            `+ result.rows[0].realName + `
                                            </p>
                                        `
                        //点击查询渲染的教练名
                        $('#coach-show').html(strcoachone)

                        //var strselect = ''
                        $('#coach-p').click(function () {
                            $(this).css('background','#71B2EF')
                            $(this).css('color','white')
                            //console.log(strselect)
                            //console.log($('#select-coach').html())

                            for (var i = 0; i < $('#select-coach').children().length; i++) {
                                if ($.trim($('#coach-p').html()) == $.trim($('#select-coach').children().eq(i).text())) {
                                    return;
                                }
                                else {
                                    var strselect = ''
                                    for (var j = 0; j < $('#select-coach').children().length; j++) {
                                        strselect += `
                                                        <p class="add-edit-course-header-context-two-ptwo `+ $('#select-coach').children().eq(j).attr('class').split(' ')[1] + `"> ` + $.trim($('#select-coach').children().eq(j).text()) + `<img src="./image/classdel_btn.png" alt=""/></p>
                                                    `
                                    }
                                }

                            }

                            if ($.trim($('#select-coach').html()) == '') {
                                strselect = ''
                            }

                            strselect += `
                                            <p class="add-edit-course-header-context-two-ptwo `+ $(this).attr('class') + `">
                                                `+ $(this).html() + `
                                                <img src="./image/classdel_btn.png" alt=""/>
                                            </p>
                                        `
                            //点击查询出的教练名进行渲染
                            //setTimeout(() => {
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
                            //}, 100);
                        })
                    },
                    error: function (e) {
                        console.log(e.status)
                    }
                })
            //}, 100);

        })
    
        if ($('#add-edit-course1').is(':visible')) {
            $(document).unbind()
            $(document).keydown(function (event) {
                if (event.keyCode == 13) {
                    $('#search-search').click()
                }
            });
        }

    }

    //新建事件
    function xjsjxjsj(){

        if($('#kcgl-body-md').val() == ''){
            alert('请选择门店')
            return;
        }

        if($('#kcgl-body-fj').val() == ''){
            alert('请选择房间')
            return;
        }

        if($('#select-menu-input-coursename').attr('class') == ''){
            alert('请选择课程')
            return;
        }

        if($('#all-coach').html() == ''){
            alert('请选择教练')
            return;
        }

        if($('#edit-course-context-three').val() == ''){
            alert('请选择上课日期')
            return;
        }

        if($('#edit-course-context-four').val() == ''){
            alert('请选择开始时间')
            return;
        }

        if ($('#edit-course-context-five').val() == '') {
            alert('请选择结束时间')
            return;
        }

        if($('#course-price').val() == ''){
            alert('请选择价格')
            return;
        }

        if($('#mincount').val() == ''){
            alert('请选择开课人数')
            return;
        }

        if($('#maxcount').val() == ''){
            alert('请选择最大人数')
        }

        //获取门店id
        var storeId = $('#kcgl-body-md').val()

        var roomId = $('#kcgl-body-fj').val()
        
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
        //new Date().getFullYear() + " " + 
        //获取课程开始和结束时间
        var start =  $('#edit-course-context-three').val() + " " + $('#edit-course-context-four').val() + ":00"
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
        if ($('#is-Queue').children('.paypayisQueue').eq(0).children('.paypay-show').is(':visible')) {
            var isQueue = 1
            //console.log(isQueue)
        } else {
            var isQueue = 0
            //console.log(isQueue)
        }

        //标签id
        var tagId = ''
        if ($('#tag-Name').children('.paypay').eq(0).children('.paypay-show').is(':visible')) {
            tagId = 0
        }
        else if ($('#tag-Name').children('.paypay').eq(1).children('.paypay-show').is(':visible')) {
            tagId = "8222a8d209a24520b116747a047529b3"
        } else {
            tagId = "941660f44ced4aefa8b5b24809a0d43b"
        }

        var addcfpone = {
            storeId: storeId,
            roomId: roomId,
            leagueCurriculumId: leagueCurriculumId,
            courseSchedulingItemList: courseSchedulingItemList,
            startDate: startDate,
            endDate: endDate,
            price: price,
            maxNumber: maxNumber,
            minNumber: minNumber,
            isQueue: isQueue,
            tagId: tagId
        }

        console.log(addcfpone)

        $.ajax({
            url: 'rest/courseScheduling/insertCourseScheduling',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(addcfpone),
            success: function (result) {
                if (result.message !== '新增成功!') {
                    alert(result.message)
                    return;
                } else if (result.message == '新增成功!') {
                    $('#edit-course1').hide()
                    alert(result.message)
                    shoye()
                }
            },
            error: function (e) {
                console.log(e.status)
            }
        })

    }

    //查看课程信息及编辑
    function ckkcxxjbj(result,id){
        
        for(var i=0;i< result.rows.length;i++){
            if(id == result.rows[i].id){
                var list = result.rows[i]
            }
        }

        console.log(list)

        $('#kcgl-body-md').find(`option[value="`+ list.storeId +`"]`).prop("selected", true);

        $('#kcgl-body-md').click()

        setTimeout(() => {
            $('#kcgl-body-fj').find(`option[value="` + list.roomId + `"]`).prop("selected", true);
        }, 50);

        $('#select-menu-input-coursename').val(list.leagueCurriculumName)
        $('#select-menu-input-coursename').attr('class', list.leagueCurriculumId)

        //教练姓名渲染
        var againcoach = ''
        for (var i = 0; i < list.courseSchedulingItemList.length; i++) {
            againcoach += `
                <p class="edit-course-context-twoone `+ list.courseSchedulingItemList[i].userName + `">` + list.courseSchedulingItemList[i].realName + `</p>
            `
        }
        $('#all-coach').html(againcoach)

        //比例的渲染
        var strperformance = ''
        if (list.courseSchedulingItemList.length > 1) {
            for (var i = 0; i < list.courseSchedulingItemList.length; i++) {
                strperformance += `
                    <div class="edit-course-context-flex4-pthree `+ list.courseSchedulingItemList[i].userName + `">
                        <p class="edit-course-context-flex4-pfour">`+ list.courseSchedulingItemList[i].realName + `</p>
                        <input class="edit-course-context-flex4-pfive" value='`+ list.courseSchedulingItemList[i].performance  +`'/>
                    </div>
                `
            }
        } else {
            strperformance = ''
        }
        $('#coach-performance').html(strperformance)

        $('#edit-course-context-three').val(list.dateStr)

        $('#edit-course-context-four').val(list.timeStr.split('-')[0])

        $('#edit-course-context-five').val(list.timeStr.split('-')[1])

        $('#course-price').val(list.price)

        $('#mincount').val(list.minNumber)

        $('#maxcount').val(list.maxNumber)

        if(list.isQueue == 1){
            $('#is-Queue').children('.paypayisQueue').eq(0).click()
        }else{
            $('#is-Queue').children('.paypayisQueue').eq(1).click()
        }

        if(list.tagName == '无'){
            $('#tag-Name').children('.paypay').eq(0).click()
        }else if(list.tagName == '热门'){
            $('#tag-Name').children('.paypay').eq(1).click()
        }else{
            $('#tag-Name').children('.paypay').eq(2).click()
        }

        $('#edit-course-footer-pone').unbind()
        $('#edit-course-footer-pone').click(function () {
            bjbj(id)
        })
    }

    //编辑事件
    function bjbj(id){

        if ($('#kcgl-body-md').val() == '') {
            alert('请选择门店')
            return;
        }

        if ($('#kcgl-body-fj').val() == '') {
            alert('请选择房间')
            return;
        }

        if ($('#select-menu-input-coursename').attr('class') == '') {
            alert('请选择课程')
            return;
        }

        if ($('#all-coach').html() == '') {
            alert('请选择教练')
            return;
        }

        if ($('#edit-course-context-three').val() == '') {
            alert('请选择上课日期')
            return;
        }

        if ($('#edit-course-context-four').val() == '') {
            alert('请选择开始时间')
            return;
        }

        if ($('#edit-course-context-five').val() == '') {
            alert('请选择结束时间')
            return;
        }

        if ($('#course-price').val() == '') {
            alert('请选择价格')
            return;
        }

        if ($('#mincount').val() == '') {
            alert('请选择开课人数')
            return;
        }

        if ($('#maxcount').val() == '') {
            alert('请选择最大人数')
        }

        //获取门店id
        var storeId = $('#kcgl-body-md').val()

        var roomId = $('#kcgl-body-fj').val()

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
        if ($('#is-Queue').children('.paypayisQueue').eq(0).children('.paypay-show').is(':visible')) {
            var isQueue = 1
            //console.log(isQueue)
        } else {
            var isQueue = 0
            //console.log(isQueue)
        }

        //标签id
        var tagId = ''
        if ($('#tag-Name').children('.paypay').eq(0).children('.paypay-show').is(':visible')) {
            tagId = 0
        }
        else if ($('#tag-Name').children('.paypay').eq(1).children('.paypay-show').is(':visible')) {
            tagId = "8222a8d209a24520b116747a047529b3"
        } else {
            tagId = "941660f44ced4aefa8b5b24809a0d43b"
        }

        var addcfpone = {
            id : id,
            storeId: storeId,
            roomId: roomId,
            leagueCurriculumId: leagueCurriculumId,
            courseSchedulingItemList: courseSchedulingItemList,
            startDate: startDate,
            endDate: endDate,
            price: price,
            maxNumber: maxNumber,
            minNumber: minNumber,
            isQueue: isQueue,
            tagId: tagId
        }

        $.ajax({
            url: 'rest/courseScheduling/updateCourseScheduling',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(addcfpone),
            success: function (result) {
                if(result.message !== '修改成功!'){
                    alert(result.message)
                    return;
                }else if(result.message == '修改成功!'){
                    $('#edit-course1').hide()
                    alert(result.message)
                    shoye()
                }
                
            },
            error: function (e) {
                console.log(e.status)
            }
        })
    }

</script>

</html>