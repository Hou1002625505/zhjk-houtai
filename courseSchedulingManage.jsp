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
        /* html{
            font-size:calc(100vw / 88.11);
        } */

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
            margin-right: 200px;
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

        .edit-course-context .edit-course-footer {
            width: 738px;
            display: flex;
            justify-content: center;
            padding: 27px 0 27px 0;
            box-sizing: border-box;
            position: fixed;
            bottom: 12%;
            background: white
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
            margin-top: 30px;
            background: white;
            padding: 22px 22px 22px 4px;
            box-sizing: border-box;
            position: relative;
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
            top: 651px;
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
            width: 6.25%
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
            <p id="publishpublishall">全部发布</p>
        </div>
        <div class="course-arranging-flex">
            <div style="font-size:16px;margin-right:10px">上课门店</div>
            <span class="select_wrap">
                <select name="visitstatus" id="kcgl-body-skmd">

                </select>
                <em class="triangle_border_down1"></em>
            </span>
            <div style="font-size:16px;margin-right:10px">上课房间</div>
            <span class="select_wrap">
                <select name="visitstatus" id="kcgl-body-skfj">
                    
                </select>
                <em class="triangle_border_down1"></em>
            </span>
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
                <p id="cxsx">清除</p>
            </div>
            <p class="course-arranging-flextwo-pthree" id='derivederive'>导出课程</p>
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
        <div class="course-arranging-flex">
            <div style="font-size:16px;margin-right:10px">上课门店</div>
            <span class="select_wrap">
                <select name="visitstatus" id="kcgl-body-skmd1">
            
                </select>
                <em class="triangle_border_down1"></em>
            </span>
            <div style="font-size:16px;margin-right:10px">上课房间</div>
            <span class="select_wrap">
                <select name="visitstatus" id="kcgl-body-skfj1">
            
                </select>
                <em class="triangle_border_down1"></em>
            </span>
            <div style="font-size:16px">上课教练</div>
            <input class="course-arranging-flex-select-two" id="teaching-course-coach1" />
            <div style="font-size:16px">教练工号</div>
            <input class="course-arranging-flex-select-three" id="coach-id1" />
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
                <p id="publish-search1">查询</p>
                <p id="cxsx2">清除</p>
            </div>
            <p class="course-arranging-flextwo-pthree" id='derivederive11'>导出课程</p>
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

    //切换至发布页面
    $('#course-arranging-header-one-ptwo').click(function () {
        $('#course-arranging-header-one-pone').removeClass('course-arranging-header-one-pone-active')
        $(this).addClass('course-arranging-header-one-ptwo-active')
        $('#course-arranging-body-left').hide()
        $('#course-arranging-body-right').show()
    })

    //切换至待发布页面
    $('#course-arranging-header-one-pone').click(function () {
        $('#course-arranging-header-one-ptwo').removeClass('course-arranging-header-one-ptwo-active')
        $(this).addClass('course-arranging-header-one-pone-active')
        $('#course-arranging-body-left').show()
        $('#course-arranging-body-right').hide()
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
                console.log(result)
                alert(result.message)
                window.location.reload()
            },
            error: function (e) {
                console.log(e.status)
            }

        })
    })

    time()

    dfbmdlb()

    shoye()

    shoyen()

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
                            <td class="item2" style="position:relative">`+ item.storeName + `<img style="position:absolute;left:6.65rem;top:0;display:none" src="image/recommended_img.png"></td>
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
                                <p style="color:#71B2EF" class="a-add `+ i + `">编辑</p><p style="color:#71B2EF;margin:0 3px 0 3px">|</p><p style="color:#71B2EF" class="a-del">删除</p>
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
                                <p class="a-add1 `+ i + `" style="display:none">编辑</p><p style="color:#71B2EF" class="a-xiajia">下架</p>
                            </td>
                        </tr>
                    `
                        })
                        $('#sj-body-body2').html(str2).html(str2)

                        //表格第一列显示或隐藏打钩
                        $(".course-arranging-not-table-checkbox").click(function () {
                            if ($(this).children('img').is(":hidden")) {
                                    $(this).children('img').show()
                            } else {
                                    $(this).children('img').hide()
                            }
                        })

                        $('.a-xiajia').click(function(){
                            var ids1 = $(this).parent().parent().children().eq(0).attr('class')
                            fbsyxj(ids1)
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
                window.location.reload()
            },
            error: function (e) {
                console.log(e.status)
            }

        })
    }
</script>

</html>