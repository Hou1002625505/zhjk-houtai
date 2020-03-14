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

        html {
			border: 1px solid #95B8E7;
		}

        /* html{
            font-size:calc(100vw / 88.11);
        } */

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
            margin-top: 1px;
            align-items: center;
            height:auto;
            flex-wrap: wrap;
        }

        .course-manage-flex #course-manage-flex-input {
            width: 200px;
            height: 30px;
            border-radius: 4px;
            margin-left: 20px;
            margin-right: 40px;
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
            font-size: 16px;
            cursor: pointer;
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
            font-size: 16px;
            cursor: pointer;
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
            background: #CCCCCC;
            text-align: center;
            height: 20px;
            font-size: 14px;
        }

        .course-manage-table .course-manage-table-tr td:last-child {
            cursor: pointer;
            color: #71B2EF;
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

        .headingsifting {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .headingsifting-column {
            display: flex;
            flex-direction: column;
            margin-left: 6px;
        }

        .headingsifting-column img:nth-child(2) {
            margin-top: 1px
        }

        .course-manage-footer {
            display: flex;
            margin-top: 17px;
            height: auto;
            flex-wrap: wrap;
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
            margin-left: 1013px;
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
            margin-left: 71px;
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
            margin-left: 18px;
            border-radius: 3px;
            display: flex;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .input {
            width: 60px;
            border: none;
            outline: none;
            text-align: center;
        }

        .add-course-sortone .add-course-sortone-inputseven .oneinput .add-course-sortone-selectone {
            width: 55px;
            height: 32px;
            border-right: 1px solid #CCCCCC
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
            display: flex
        }

        .add-course-sortone .add-course-sortone-inputeleven input:nth-child(1) {
            width: 240px;
            height: 32px;
            font-size: 14px;
            line-height: 32px;
            box-sizing: border-box;
        }

        .add-course-sortone .add-course-sortone-inputeleven input:nth-child(2) {
            width: 410px;
            height: 32px;
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

        .select_wrap {
            position: relative;
            margin-left: 20px;
            margin-right: 39px
        }

        .select_wrap1 {
            position: relative;
        }

        #kcgl-body-kcfl {
            width: 120px;
            height: 30px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 14px;
            padding-left: 13px;
            box-sizing: border-box;
            -webkit-appearance: none
        }

        #kcgl-body-kcfl1 {
            width: 240px;
            height: 32px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 16px;
            padding-left: 13px;
            box-sizing: border-box;
            -webkit-appearance: none
        }

        #kcgl-body-skfs {
            width: 240px;
            height: 32px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 16px;
            padding-left: 13px;
            box-sizing: border-box;
            -webkit-appearance: none
        }

        #kcgl-body-kczt {
            width: 120px;
            height: 30px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 14px;
            padding-left: 13px;
            box-sizing: border-box;
            -webkit-appearance: none
        }

        .kcgl-body-kcldt{
            width: 60px;
            height: 32px;
            border: 1px solid #d5d5d7;
            border-radius: 4px 0 0 4px;
            font-size: 14px;
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

        .triangle_border_down2 {
            display: inline-block;
            width: 0;
            height: 0;
            border-width: 8px 5px 0;
            border-style: solid;
            border-color: #444444 transparent transparent;
            position: absolute;
            right: 5px;
            top: 13px;
        }

        .table-header th {
            font-size: 14px;
            color: #444444;
            height: 40px;
            text-align: center;
        }

        .table-body tr td {
            font-size: 14px;
            color: #444444;
            height: 40px;
            text-align: center;
            border-left: 1px dotted #CCCCCC;
            border-bottom: 1px dotted #CCCCCC
        }

        .table-body1 tr td:last-child {
            flex: 1;
            border-right: 1px dotted #CCCCCC;
            display: flex;
            justify-content: center;
            position: relative
        }

        .table-body tr td:last-child p {
            line-height: 40px;
            color: #71B2EF
        }

        .item1 {
            width: 2.5%
        }

        .item2 {
            width: 15%
        }

        .item3 {
            width: 7.708%
        }

        .table-body1 td {
            text-align: center;
            font-size: 14px;
            height: 40px
        }

        .table-body1 tr td {
            font-size: 14px;
            color: #444444;
            height: 40px;
            text-align: center;
            border-left: 1px dotted #CCCCCC;
            border-bottom: 1px dotted #CCCCCC;

        }
    </style>
</head>

<body>
    <div class="course-manage-body">
        <div class="course-manage-button" id="course-manage-button" style="margin-bottom:20px">新建课程</div>
        <div class="course-manage-flex">
            <div style="font-size:16px">课程名称</div>
            <input id="course-manage-flex-input" type="text">
            <div style="font-size:16px">课程分类</div>
            <span class="select_wrap">
                <select name="visitstatus" id="kcgl-body-kcfl" style="cursor:pointer">
                    <option value="" selected="selected">全部</option>
                    <option value="0">未核销</option>
                    <option value="1">已核销</option>
                    <option value="2">已赠送</option>
                    <option value="3">撤回</option>
                    <option value="4">已过期</option>
                </select>
                <em class="triangle_border_down1"></em>
            </span>
            <div style="font-size:16px">课程状态</div>
            <span class="select_wrap">
                <select name="visitstatus" id="kcgl-body-kczt" style="cursor:pointer">
                    <option value="" selected="selected">全部</option>
                    <option value="1">上架</option>
                    <option value="2">未上架</option>
                </select>
                <em class="triangle_border_down1"></em>
            </span>
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
        <table style='border-collapse: collapse;width: 100%;table-layout:fixed;margin-top:20px'>
            <tbody>
                <tr class="table-header" style="background:#f8fafb">
                    <th class="item1"></th>
                    <th class="item2">课程分类</th>
                    <th class="item2">课程名称</th>
                    <th class="item2">
                        <div style="display:flex;align-items: center;justify-content: center;">
                            <div class="headingsifting">课程价格</div>
                            <div class="headingsifting-column">
                                <img src="../images/simage/headingsifting_up.png">
                                <img src="../images/simage/headingsifting_down.png"></div>
                        </div>

                    </th>
                    <th class="item2">
                        <div style="display:flex;align-items: center;justify-content: center;">
                            <div class="headingsifting">创建时间</div>
                            <div class="headingsifting-column">
                                <img src="../images/simage/headingsifting_up.png">
                                <img src="../images/simage/headingsifting_down.png"></div>
                        </div>

                    </th>
                    <th class="item2">状态</th>
                    <th class="item3">操作</th>
                </tr>
            </tbody>
            <tbody class="table-body1" id="sj-body-body1">

            </tbody>
        </table>
        <div class="course-manage-footer">
            <div id="course-manage-table-checkbox">
                <img style="display:none" src="../images/simage/codeallset_btn.png">
            </div>
            <div class="course-manage-footer-pone">当页全选</div>
            <div class="course-manage-footer-ptwo" id="batchup" style="cursor: pointer;">批量上传</div>
            <div class="course-manage-footer-ptwo" id="batchdown" style="cursor: pointer;">批量下架</div>
            <div class="course-manage-footer-pthree"></div>
            <div class="box" id="boxpage" style="margin-left:30px;margin-top:0"></div>
        </div>
    </div>

    <div class="add-course-body" style="display:none">
        <p class="add-course-body-pone" id="add-course-body-pone" style="cursor: pointer;">返回上一级</p>
        <div class="add-course-body-line"></div>
        <p class="add-course-body-ptwo">基本信息</p>
        <div class="add-course-body-line"></div>
        <div class="add-course-sortone">
            <p style="font-size:16px;margin-right:66px">课程类型</p>
            <span class="select_wrap">
                <select name="visitstatus" id="kcgl-body-kcfl1" style="cursor: pointer;">

                </select>
                <em class="triangle_border_down1"></em>
            </span>
        </div>
        <div class="add-course-sortone">
            <p style="font-size:16px;margin-right:66px">上课方式</p>
            <span class="select_wrap">
                <select name="visitstatus" id="kcgl-body-skfs" style="cursor: pointer;">
            
                </select>
                <em class="triangle_border_down1"></em>
            </span>
        </div>
        <div class="add-course-sortone">
            <p style="font-size:16px">课程名称</p>
            <div class="add-course-sortone-inputone">
                <input type="text" value="" id="area2">
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
                <div style="font-size:12px;color:#444444;margin-left:14px">(可多选)</div>
            </div>
        </div>
        <div class="add-course-sorttwo">
            <p style="font-size:16px">课程简介</p>
            <div class="add-course-sortone-inputfour">
                <textarea id="area" cols="30" rows="10" placeholder="请输入本节课简介"></textarea>
                <p class="add-course-sortone-inputfour-position"><span id="text-count">0</span>/300</p>
            </div>
        </div>

        <p style="font-size:18px
        ;font-weight:bold;margin-top:53px">课程详情</p>
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
                <input type="text" value="" id="shrq">
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:16px">课程雷达图</p>
            <div class="add-course-sortone-inputseven">
                <div class="oneinput">
                    <span class="select_wrap1">
                        <select name="visitstatus" class="kcgl-body-kcldt" style="cursor: pointer;">
                    
                        </select>
                        <em class="triangle_border_down2"></em>
                    </span>
                    <div style="border:1px solid #d5d5d7;border-left:0;border-radius: 0 4px 4px 0;display:flex;align-items: center;">
                        <input class="input" type="text" value="">
                    </div>
                </div>
                <div class="oneinput">
                    <span class="select_wrap1">
                        <select name="visitstatus" class="kcgl-body-kcldt" style="cursor: pointer;">
                    
                        </select>
                        <em class="triangle_border_down2"></em>
                    </span>
                    <div style="border:1px solid #d5d5d7;border-left:0;border-radius: 0 4px 4px 0;display:flex;align-items: center;">
                        <input class="input" type="text" value="">
                    </div>
                </div>
                <div class="oneinput">
                    <span class="select_wrap1">
                        <select name="visitstatus" class="kcgl-body-kcldt" style="cursor: pointer;">
                    
                        </select>
                        <em class="triangle_border_down2"></em>
                    </span>
                    <div style="border:1px solid #d5d5d7;border-left:0;border-radius: 0 4px 4px 0;display:flex;align-items: center;">
                        <input class="input" type="text" value="">
                    </div>
                </div>
                <div class="oneinput">
                    <span class="select_wrap1">
                        <select name="visitstatus" class="kcgl-body-kcldt" style="cursor: pointer;">
                    
                        </select>
                        <em class="triangle_border_down2"></em>
                    </span>
                    <div style="border:1px solid #d5d5d7;border-left:0;border-radius: 0 4px 4px 0;display:flex;align-items: center;">
                        <input class="input" type="text" value="">
                    </div>
                </div>
                <div class="oneinput">
                    <span class="select_wrap1">
                        <select name="visitstatus" class="kcgl-body-kcldt" style="cursor: pointer;">
                    
                        </select>
                        <em class="triangle_border_down2"></em>
                    </span>
                    <div style="border:1px solid #d5d5d7;border-left:0;border-radius: 0 4px 4px 0;display:flex;align-items: center;">
                        <input class="input" type="text" value="">
                    </div>
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
                        <td><textarea class="textarea11" placeholder="Q :"></textarea></td>
                        <td><textarea class="textarea22" placeholder="A :"></textarea></td>
                        <td>
                            <img id="addOneRow" style="margin-right:6px;cursor: pointer;" src="/image/add_btn.png" alt="" >
                            <img id="delOneRow" src="/image/del_btn.png" alt="" style="cursor: pointer;">
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:16px">课程视频</p>
            <div class="add-course-sortone-inputnine">
                <div id="scsp" style="cursor: pointer;">上传视频</div>
                <p>最多上传1个视频，单个视频不超过20M，视频作品将会展示在团课详情首位</p>
            </div>
            <div>
                <input id="photoFile" accept=".MP4,mp4" style="display:none" type="file" onchange="upload()">
            </div>
        </div>

        <div id="videoshow" style="margin-left:152px;margin-top:25px;display:none;">
            <div style="display:flex;align-items:center;">
                <img style="width:32px;height:32px;" src="image/playit_icon.png" alt="">
                <p id="videovideo" style="font-size:14px;margin-left:8px;"></p>
                <p style="font-size:14px;margin-left:100px">上传成功</p>
                <div style="margin-left:20px;width:240px;height:8px;border-radius: 4px;background:#71B2EF"></div>
                <img id="videohide" style="margin-left:20px" src="image/palyitdel_btn.png" alt="">
            </div>

        </div>

        <div class="add-course-sorttwo">
            <p style="font-size:16px;margin-right:90px">课程图片</p>
            <div id="demo" class="demo"></div>
        </div>

        <p style="font-size:16px;font-weight:bold;margin-top:53px">扣课方式及项目关联</p>
        <div class="add-course-body-line"></div>

        <div class="add-course-sortone">
            <p style="font-size:16px">付款方式</p>
            <div class="add-course-sortone-inputten" id="add-course-sortone-inputten">
                <div class="inputten-paypay">
                    <div class="paypay">
                        <img class="paypay-show" src="/image/codeallset_btn.png" alt="">
                        <img class="paypay-hidden" src="/image/codeallnor_btn.png" alt="">
                    </div>
                    <p style="font-size: 14px;">付现</p>
                </div>
                <div class="inputten-paypay">
                    <div class="paypay">
                        <img class="paypay-show" src="/image/codeallset_btn.png" alt="">
                        <img class="paypay-hidden" src="/image/codeallnor_btn.png" alt="">
                    </div>
                    <p style="font-size: 14px;">会员卡扣</p>
                </div>
            </div>
        </div>

        <div class="add-course-sortone">
            <p style="font-size:16px">课程对应编码</p>
            <div class="add-course-sortone-inputeleven">
                <div style="width:240px;height:32px;border:1px solid #CCCCCC;margin-left:62px">
                    <input placeholder="请输入课程对应广信编码" type="text" id="gxbm" style="border:none">
                </div>
                <div style="width:410px;height:32px;border:1px solid #CCCCCC;margin-left:20px">
                    <input type="text" id="gxmc" style="border:none">
                </div>

            </div>
        </div>

        <div class="add-course-check">
            <div class="add-course-checkboxall">
                <img style="display:none" src="/image/codeallset_btn.png" alt="">
            </div>
            <p id="quanxuan">全选</p>
            <p id="quxiaoqx" style="display:none">取消全选</p>
        </div>

        <div class="add-course-sortthree" style="margin-top:20px">
            <p style="font-size:16px;margin-right:8px">会员卡口对应编码</p>
            <div class="add-course-sortone-inputtwelve">
                <div class="inputtwelve-flex" id="inputtwelve-flex">

                </div>
                <div class="inputtwelve-zhankai" id="zhankai-show" style="cursor: pointer;">
                    <p>展开</p>
                    <img src="/image/pulldown_btn.png" alt="">
                </div>
                <div class="inputtwelve-zhankai" id="zhankai-hide" style="display:none;cursor: pointer;">
                    <p>关闭</p>
                    <img src="/image/pullup_btn.png" alt="">
                </div>
            </div>
        </div>

        <div class="add-course-footer">
            <p id="add-course-footer-save" style="font-size:16px;cursor: pointer;">保存</p>
            <p id="add-course-footer-fanhui" style="font-size:16px;cursor: pointer;">返回</p>
        </div>
    </div>
</body>
<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>


<script type="text/javascript">

    //全选的勾选按钮
    $("#course-manage-table-checkbox").click(function () {
        if ($(this).children('img').is(":hidden")) {
            $(this).children('img').show()
            $(".course-manage-table-checkbox").children('img').show()
        } else {
            $(this).children('img').hide()
            $(".course-manage-table-checkbox").children('img').hide()
        }
    })

    //首页查询按钮
    $('#course-manage-flextwo-search').click(function () {
        shoye()
    })
    
    //首页清除按钮
    $('#course-manage-flextwo-clear').click(function () {
        $('#course-manage-flex-input').val('')
        $('#kcgl-body-kcfl').find('option[value=""]').prop("selected", true);
        $('#kcgl-body-kczt').find('option[value=""]').prop("selected", true);
        $('#course-manage-flex-input-one').val('')
        $('#course-manage-flex-input-two').val('')
        $('#course-manage-flex-input-three').val('')
        $('#course-manage-flex-input-four').val('')
        shoye()
    })

    //点击新建按钮事件
    $('#course-manage-button').click(function () {
        $('.course-manage-body').hide()
        $('.add-course-body').show()

        $('#kcgl-body-kcfl1').find('option[value=""]').prop("selected", true);

        $('#kcgl-body-skfs').find('option[value=""]').prop("selected", true);

        $('#area2').val('')

        $('#kcbzj').val('')

        $('#GroupCourseGole').children().removeClass('add-course-sortone-inputthree-p-active')

        $('#area').val('')

        $('#kllxh').val('')

        $('#shrq').val('')

        // $('.add-course-sortone-inputseven').children().children().eq(0).children().eq(0).find('option[value=""]').prop("selected", true);

        // $('.add-course-sortone-inputseven').children().children().eq(1).children().val('')
        
        $('.kcgl-body-kcldt').find('option[value=""]').prop("selected", true);

        for(var i=0;i< $('.kcgl-body-kcldt').length;i++){
            $('.kcgl-body-kcldt').eq(i).parent().parent().children().eq(1).children().eq(0).val('')
        }

        $('#area1').val('')

        var faqhtml = `
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <th>问题</th>
                    <th>回答</th>
                    <th></th>
                </tr>
                <tr>
                    <td><textarea class="textarea11" placeholder="Q :"></textarea></td>
                    <td><textarea class="textarea22" placeholder="A :"></textarea></td>
                    <td>
                        <img id="addOneRow" style="margin-right:6px;cursor: pointer;" src="/image/add_btn.png" alt="" >
                        <img id="delOneRow" src="/image/del_btn.png" alt="" style="cursor: pointer;">
                    </td>
                </tr>
            </table>
        `
        $('#faq').html(faqhtml)

        $("#addOneRow").click(function () {
            var tempTr = $(this).parent().parent().clone(true);
            $(this).parent().parent().parent().children("tr:last").after(tempTr);
            $(this).parent().parent().parent().children("tr:last").children().eq(0).children().val('')
            $(this).parent().parent().parent().children("tr:last").children().eq(1).children().val('')
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

        $('#videoshow').hide()
        $('#photoFile').attr('class', '')

        $('#preview1').html('')

        $('#inputtwelve-flex').children().children('img').hide()

        $('.add-course-sortone-inputeight').children().children().children().children().eq(0).children().val('')
        $('.add-course-sortone-inputeight').children().children().children().children().eq(1).children().val('')

        $('#add-course-sortone-inputten').children().eq(0).children('.paypay').click()

        $('#add-course-footer-save').unbind()
        $('#add-course-footer-save').click(function(){
            xzhd()
        })
    })

    $('#scsp').click(function(){
        $('#photoFile').click()
    })

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

    //编码的控制事件
    $('#add-course-sortone-inputten').children().children('.paypay').click(function () {
        $(".inputtwelve-checkbox").unbind()
        woyaowoyao()
    })

    //新建课程返回
    $('#add-course-footer-fanhui').click(function(){
        $('.course-manage-body').show()
        $('.add-course-body').hide()
    })

    //新建课程返回上一级
    $('#add-course-body-pone').click(function(){
        $('.course-manage-body').show()
        $('.add-course-body').hide()
    })

    time()

    kcflxl()

    skfsxl()

    kcmbxr()

    xjymjs()

    kcldt()

    xingxing()

    gxjk()

    woyaowoyao()

    shoye()

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

    //课程分类下拉
    function kcflxl() {
        var paramsGroupType = {
            typeCode: "GroupType"
        }

        $.ajax({
            type: 'POST',
            contentType: "application/json;charset=UTF-8",
            url: "rest/wx/dictionnary/getdictionnarylist",
            data: JSON.stringify(paramsGroupType),
            success: function (result) {
                var strGroupType = '';
                //console.log(result)
                strGroupType = `
                       <option value="" selected="selected">全部</option>
                    `
                $.each(result.rows, function (i, item) {
                    strGroupType += `
                            <option value="`+ item.dictionaryId + `">` + item.name + `</option>
                        `
                })
                $('#kcgl-body-kcfl').html(strGroupType)
                $('#kcgl-body-kcfl1').html(strGroupType)
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText)
            }
        })
    }

    //上课方式下拉
    function skfsxl(){
        var paramsGCourseType = {
            typeCode: "GCourseType"
        }

        $.ajax({
            type: 'POST',
            contentType: "application/json;charset=UTF-8",
            url: "rest/wx/dictionnary/getdictionnarylist",
            data: JSON.stringify(paramsGCourseType),
            success: function (result) {
                var strmodel = '';
                //console.log(result)
                strmodel = `
                       <option value="" selected="selected">全部</option>
                    `
                $.each(result.rows, function (i, item) {
                    strmodel += `
                            <option value="`+ item.dictionaryId + `">` + item.name + `</option>
                        `
                })
                $('#kcgl-body-skfs').html(strmodel)
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText)
            }
        })
    }

    //课程目标的渲染
    function kcmbxr(){
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
                            <p class="add-course-sortone-inputthree-p `+ item.dictionaryId + `" style="cursor: pointer;">` + item.name + `</p>
                        `
                })
                $('#GroupCourseGole').html(strmodel)

                $(".add-course-sortone-inputthree-p").click(function () {
                    if ($(this).hasClass('add-course-sortone-inputthree-p-active')) {
                        $(this).removeClass('add-course-sortone-inputthree-p-active')
                    } else {
                        $(this).addClass('add-course-sortone-inputthree-p-active')
                    }
                })
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText)
            }
        })
    }

    //新建页面js操作
    function xjymjs(){
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

        $("#addOneRow").click(function () {
            var tempTr = $(this).parent().parent().clone(true);
            $(this).parent().parent().parent().children("tr:last").after(tempTr);
            $(this).parent().parent().parent().children("tr:last").children().eq(0).children().val('')
            $(this).parent().parent().parent().children("tr:last").children().eq(1).children().val('')
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

        //广信标签展开
        $("#zhankai-show").click(function () {
            $(".inputtwelve-flex").css('height', 'auto')
            //$('#inputtwelve-flex').css('overflow','visible')
            $('.add-course-sortone-inputtwelve').css('height', 'auto')
            $('.add-course-sortthree').css('height', 'auto')
            $(this).hide()
            $("#zhankai-hide").show()
        })
        //广信标签闭合
        $("#zhankai-hide").click(function () {
            $(".inputtwelve-flex").css('height', '80px')
            $(this).hide()
            $("#zhankai-show").show()
        })

        //全部取消
        $(".add-course-checkboxall").click(function () {
            if ($(this).children('img').is(":hidden")) {
                $(this).children('img').show()
                $(".inputtwelve-checkbox").children('img').show()
                $('#quanxuan').hide()
                $('#quxiaoqx').show()
            } else {
                $(this).children('img').hide()
                $(".inputtwelve-checkbox").children('img').hide()
                $('#quanxuan').show()
                $('#quxiaoqx').hide()
            }
        })
    }
    
    //星星
    function xingxing() {
        this.item = $('#rating').find('.rating-item')
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

    //课程雷达图的请求及渲染
    function kcldt(){
        var paramsGroupRadar = {
            typeCode: "GroupRadar"
        }

        $.ajax({
            type: 'POST',
            contentType: "application/json;charset=UTF-8",
            url: "rest/wx/dictionnary/getdictionnarylist",
            data: JSON.stringify(paramsGroupRadar),
            success: function (result) {
                var strGroupRadar = `
                    <option value="" selected="selected"></option>
                `;
                //console.log(result)

                $.each(result.rows, function (i, item) {
                    strGroupRadar += `
                            <option value="`+ item.dictionaryId +' '+ item.name+ `">` + item.name + `</option>
                        `
                })
                $('.kcgl-body-kcldt').html(strGroupRadar)
                //that.acs_select4.parent().parent().children('.select-menu-div').children('input').val("全部")
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText)
            }
        })
    }

    //图片上传
    function imageimage() {
            if ($("#fileImage").val() == '') {
                return;
            }

            let file = $("#fileImage").val()
            let filename = file.substr(file.lastIndexOf("."));
            if (filename != '.png' && filename != '.jpeg' && filename != '.jpg') {
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

    //视频上传
    function upload() {
            uploadvideo()

            function uploadvideo() {
                if ($("#photoFile").val() == '') {
                    return;
                }

                let file = $("#photoFile").val()
                let filename = file.substr(file.lastIndexOf("."));
                if (filename != '.MP4' && filename != '.mp4') {
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
                        $('#photoFile').attr('class', data.rows[0].path)
                        $('#videovideo').html('http://test.physicalclub.com/crm/videos/' + data.rows[0].path)

                        $('#videoshow').show()

                        $('#videovideo').click(function () {
                            openVideo('http://test.physicalclub.com/crm/videos/' + data.rows[0].path)
                        })

                        $('#videohide').click(function () {
                            $('#videoshow').hide()
                            $('#photoFile').attr('class', '')
                        })

                        function openVideo(src) {

                            var page = window.open();

                        var html = 
                        "<body style='background:black'><div style = 'width:80%;margin:auto;'><video controls width='100%' autoplay src='" + src + "'></video> </div></body > "

                            page.document.write(html);

                        }
                    },
                    error: function (data) {
                        alert("上传失败")
                    }
                });
            }
        }

    //广信接口
    function gxjk(){
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
                                <p>`+ item.mediid + ' ' + '|' + ' ' + item.mediname + `</p>
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
    }

    function woyaowoyao() {
        if ($('#add-course-sortone-inputten').children().eq(0).children('.paypay').hasClass('11')) {
            $('.add-course-check').hide()
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
            $('.add-course-check').show()
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

    //首页分页渲染
    function shoye() {

        var onPagechange = function (page) {
            aaaaaa(page)
        }

        var page = 1;
        aaaaaa(page)

        function aaaaaa(page) {

            var params = {
                page: page,
                rows: 10,
                classifyId: $('#kcgl-body-kcfl').val(),
                name: $('#course-manage-flex-input').val(),
                state: $('#kcgl-body-kczt').val(),
                minCreateDate: $('#course-manage-flex-input-one').val(),
                maxCreateDate: $('#course-manage-flex-input-two').val(),
                minPrice: $('#course-manage-flex-input-three').val(),
                maxPrice: $('#course-manage-flex-input-four').val()
            }

            $.ajax({
                type: 'POST',
                url: 'rest/leagueCurriculum/selectLeagueCurriculumList',
                contentType: "application/json;charset=UTF-8",
                data: JSON.stringify(params),
                success: function (result) {
                    var result = result
                    list = result.rows
                    var str2 = ''
                    console.log(list)

                    $.each(list, function (i, item) {
                        //通过遍历和if判断上下架的表格行
                        if (item.state == 1) {
                            str2 += `
                                <tr class="course-manage-table-tr">
                                    <td class="item1"><div style="display:flex;justify-content: center;"><div class="course-manage-table-checkbox"><img style="display:none" src="../images/simage/codeallset_btn.png"></div></div></td>
                                    <td class="item2">`+ item.classifyName + `</td>
                                    <td class="item2">`+ item.name + `</td>
                                    <td class="item2">`+ item.price + `</td>
                                    <td class="item2">`+ item.createDate + `</td>
                                    <td class="item2">上架</td>
                                    <td class="`+ item.id + `" style="display:flex;flex:1;box-sizing: border-box;height:41px;justify-content:center;align-items:center;border-top:1px solid white">
                                    <p class="course-manage-table-tr-edit" style="color:#71B2EF;cursor:pointer">编辑</p><p style="color:#71B2EF;margin:0 2px">|</p><p class="course-manage-table-tr-down" style="color:#71B2EF;cursor:pointer">下架</p>
                                    </td>
                                </tr>
                            `
                        }

                        if (item.state == 2) {
                            str2 += `
                                <tr class="course-manage-table-tr">
                                    <td class="item1"><div style="display:flex;justify-content: center;"><div class="course-manage-table-checkbox"><img style="display:none" src="../images/simage/codeallset_btn.png"></div></div></td>
                                    <td class="item2">`+ item.classifyName + `</td>
                                    <td class="item2">`+ item.name + `</td>
                                    <td class="item2">`+ item.price + `</td>
                                    <td class="item2">`+ item.createDate + `</td>
                                    <td class="item2">下架</td>
                                    <td class="`+ item.id + `" style="display:flex;flex:1;box-sizing: border-box;height:41px;justify-content:center;align-items:center;border-top:1px solid white">
                                        <p class="course-manage-table-tr-edit" style="color:#71B2EF;cursor:pointer">编辑</p>
                                        <p style="color:#71B2EF;margin:0 2px">|</p>
                                        <p class="course-manage-table-tr-up" style="color:#71B2EF;cursor:pointer">上架</p>
                                    </td>
                                </tr>
                            `
                        }
                    })

                    $('#sj-body-body1').html(str2)

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
                    $('.course-manage-footer-pthree').html(str3)

                    //表格中的勾选按钮
                    $(".course-manage-table-checkbox").click(function () {
                        if ($(this).children('img').is(":hidden")) {
                            $(this).children('img').show()
                        } else {
                            $(this).children('img').hide()
                            $("#course-manage-table-checkbox").children('img').hide()
                        }
                    })

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
                                alert(resule.message)
                                shoye()
                            },
                            error: function (e) {
                                console.log(e.status);
                                console.log(e.responseText)
                            }
                        })
                        
                    })

                    $('.course-manage-table-tr-down').click(function () {
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
                                shoye()
                            },
                            error: function (e) {
                                console.log(e.status);
                                console.log(e.responseText)
                            }
                        })
                        
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
                                alert(resule.message)
                                $("#course-manage-table-checkbox").children('img').hide()
                            },
                            error: function (e) {
                                console.log(e.status);
                                console.log(e.responseText)
                            }
                        })

                        shoye()
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
                                alert(resule.message)
                                $("#course-manage-table-checkbox").children('img').hide()
                            },
                            error: function (e) {
                                console.log(e.status);
                                console.log(e.responseText)
                            }
                        })

                        shoye()
                    })
                
                    $('.course-manage-table-tr-edit').click(function () {
                        var aa = $(this).parent().parent().children().eq(4).html()
                        chakan(aa)
                    })
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText)
                }
            })
        }
    }

    //新增活动事件
    function xzhd(){

            if($('#kcgl-body-kcfl1').val() == ''){
                alert('请选择课程类型')
                return;
            }

            if($('#kcgl-body-skfs').val() == ''){
                alert('请选择上课方式')
                return;
            }

            if($('#area2').val() == ''){
                alert('请填写课程名称')
                return;
            }

            if($('#kcbzj').val() == ''){
                alert('请填写课程标准价')
                return;
            }

            if(!$('#GroupCourseGole').children().hasClass('add-course-sortone-inputthree-p-active')){
                alert('请选择课程目标')
                return;
            }

            if($('#area').val() == ''){
                alert('请填写课程简介')
                return;
            }

            if($('#kllxh').val() == ''){
                alert('请填写卡路里消耗')
                return;
            }

            if($('#shrq').val() == ''){
                alert('请填写适用人群')
                return;
            }

            var ldzdcount11 = 0;

            for (var i = 0; i < $('.kcgl-body-kcldt').length; i++) {
                if ($('.kcgl-body-kcldt').eq(i).val().split(' ')[0] !== '') {
                    ldzdcount11++
                }
            }

            if(ldzdcount11 == 0){
                alert('课程雷达不可为空')
                return;
            }else{
                for (var iii = 0; iii < ldzdcount11; iii++) {
                    if ($('.kcgl-body-kcldt').eq(iii).parent().parent().children().eq(1).children().val() == '') {
                        alert('课程雷达图选择格式错误')
                        return;
                    }else{
                        for(var jj = iii+1;jj < ldzdcount11;jj++){
                            if($('.kcgl-body-kcldt').eq(iii).val().split(' ')[1] == $('.kcgl-body-kcldt').eq(jj).val().split(' ')[1]){
                                alert('课程雷达选择不可重复')
                                return;
                            } 
                            // console.log($('.kcgl-body-kcldt').eq(iii).val())
                            // console.log($('.kcgl-body-kcldt').eq(jj).val())
                        }
                    }
                }
            }

            if($('#area1').val() == ''){
                alert('请填写注意事项')
                return;
            }

            for(var zz = 1;zz<$('.add-course-sortone-inputeight').children().children().children().length;zz++){
                if($('.add-course-sortone-inputeight').children().children().children().eq(zz).children().eq(0).children().val() == ''){
                    alert('FAQ不可为空')
                    return;
                }else if($('.add-course-sortone-inputeight').children().children().children().eq(zz).children().eq(1).children().val() == ''){
                    alert('FAQ不可为空')
                    return;
                }
            }

            if($('#preview1').html() == ''){
                alert('请选择上传图片')
                return;
            }else if(!$('#preview1').children('div').is(':visible')){
                 alert('请选择上传图片')
                return;
            }

            //for(var qq = 0;qq< $('#inputtwelve-flex').children().length;qq++){
            if(!$('#inputtwelve-flex').children().children('img').is(':visible')){
                alert('会员卡口对应编码')
                return;
            }
            //}
            

            //支付方式的参数
            for (var i = 0; i < $(".paypay").length; i++) {
                if ($(".paypay").eq(i).children('.paypay-show').is(':visible')) {
                    var payMode = i + 1
                }
            }

            var payTypeId = ''

            if (payMode == 1) {
                payTypeId = 'e65fcb162bf4475598476ee48e2a44c4'
            }
            else if (payMode == 2) {
                payTypeId = 'ac07a37132804c61bbfc6ee02aa4ca30'
            }

            //课程分类id
            var classifyId= $('#kcgl-body-kcfl1').val()

            //适合人群参数

            var suitableForCrowd = $('#shrq').val()

            //注意事项参数

            var announcements = $('#area1').val()

            //卡路里参数

            var calorieConsumption = $('#kllxh').val()

            //上课方式的参数

            var modeId = $('#kcgl-body-skfs').val()

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

            for (var i = 0; i < $('.kcgl-body-kcldt').length; i++) {
                if ($('.kcgl-body-kcldt').eq(i).val().split(' ')[0] !== '') {
                    ldzdcount++
                }
            }

            for (var i = 0; i < ldzdcount; i++) {
                for (var j = 0; j < $('.kcgl-body-kcldt').eq(0).children().length; j++) {
                    if ($('.kcgl-body-kcldt').children().eq(j).val().split(' ')[1] == $('.kcgl-body-kcldt').eq(i).val().split(' ')[1]) {
                        var dictionaryId = $('.kcgl-body-kcldt').eq(i).val().split(' ')[0]
                        var effectValue = $('.kcgl-body-kcldt').eq(i).parent().parent().children().eq(1).children().val()
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

            if ($('#photoFile').attr('class')) {
                var videos1 = $('#photoFile').attr('class')
                videos.push({ videoUrl: videos1 })
            }

            //图片上传

            var Imgs = []

            if ($('#preview1').children()) {
                for (var i = 0; i < $('#preview1').children().length; i++) {
                    if ($('#preview1').children().eq(i).is(':hidden')) {

                    } else {
                        Imgs.push({ imgUrl: $('#preview1').children().eq(i).attr('class').split(' ')[1] })
                    }

                }
            }
            var fd = {
                suitableForCrowd: suitableForCrowd,
                announcements: announcements,
                calorieConsumption: calorieConsumption,
                classifyId: classifyId,
                difficultyId: difficultyId,
                price: price,
                modeId: modeId,
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

            console.log(fd)

            $.ajax({
                type: 'POST',
                url: "rest/leagueCurriculum/insertLeagueCurriculum",
                contentType: "application/json",  //multipart/form-data;boundary=--xxxxxxx   application/json,
                data: JSON.stringify(fd),
                success: function (result) {
                    if (result.message !== '新增成功!') {
                        alert(result.message)
                        return;
                    } else if (result.message == '新增成功!') {
                        alert(result.message)
                        $('.course-manage-body').show()
                        $('.add-course-body').hide()
                        shoye()
                    }
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText)
                }
            })

        

    }

    //编辑活动事件
    function bjhdsj(id){
        if ($('#kcgl-body-kcfl1').val() == '') {
            alert('请选择课程类型')
            return;
        }

        if ($('#kcgl-body-skfs').val() == '') {
            alert('请选择上课方式')
            return;
        }

        if ($('#area2').val() == '') {
            alert('请填写课程名称')
            return;
        }

        if ($('#kcbzj').val() == '') {
            alert('请填写课程标准价')
            return;
        }

        if (!$('#GroupCourseGole').children().hasClass('add-course-sortone-inputthree-p-active')) {
            alert('请选择课程目标')
            return;
        }

        if ($('#area').val() == '') {
            alert('请填写课程简介')
            return;
        }

        if ($('#kllxh').val() == '') {
            alert('请填写卡路里消耗')
            return;
        }

        if ($('#shrq').val() == '') {
            alert('请填写适用人群')
            return;
        }

        var ldzdcount11 = 0;

        for (var i = 0; i < $('.kcgl-body-kcldt').length; i++) {
            if ($('.kcgl-body-kcldt').eq(i).val().split(' ')[0] !== '') {
                ldzdcount11++
            }
        }

        if (ldzdcount11 == 0) {
            alert('课程雷达不可为空')
            return;
        } else {
            for (var iii = 0; iii < ldzdcount11; iii++) {
                if ($('.kcgl-body-kcldt').eq(iii).parent().parent().children().eq(1).children().val() == '') {
                    alert('课程雷达图选择格式错误')
                    return;
                } else {
                    for (var jj = iii+1; jj < ldzdcount11; jj++) {
                        if ($('.kcgl-body-kcldt').eq(iii).val() == $('.kcgl-body-kcldt').eq(jj).val()) {
                            alert('课程雷达选择不可重复')
                            return;
                        }
                    }
                }
            }
        }

        if ($('#area1').val() == '') {
            alert('请填写注意事项')
            return;
        }

        for (var zz = 1; zz < $('.add-course-sortone-inputeight').children().children().children().length; zz++) {
            if ($('.add-course-sortone-inputeight').children().children().children().eq(zz).children().eq(0).children().val() == '') {
                alert('FAQ不可为空')
                return;
            } else if ($('.add-course-sortone-inputeight').children().children().children().eq(zz).children().eq(1).children().val() == '') {
                alert('FAQ不可为空')
                return;
            }
        }

        if ($('#preview1').html() == '') {
            alert('请选择上传图片')
            return;
        } else if (!$('#preview1').children('div').is(':visible')) {
            alert('请选择上传图片')
            return;
        }

        //for(var qq = 0;qq< $('#inputtwelve-flex').children().length;qq++){
        if (!$('#inputtwelve-flex').children().children('img').is(':visible')) {
            alert('会员卡口对应编码')
            return;
        }
        //}


        //支付方式的参数
        for (var i = 0; i < $(".paypay").length; i++) {
            if ($(".paypay").eq(i).children('.paypay-show').is(':visible')) {
                var payMode = i + 1
            }
        }

        var payTypeId = ''

        if (payMode == 1) {
            payTypeId = 'e65fcb162bf4475598476ee48e2a44c4'
        }
        else if (payMode == 2) {
            payTypeId = 'ac07a37132804c61bbfc6ee02aa4ca30'
        }

        //课程分类id
        var classifyId = $('#kcgl-body-kcfl1').val()

        //适合人群参数

        var suitableForCrowd = $('#shrq').val()

        //注意事项参数

        var announcements = $('#area1').val()

        //卡路里参数

        var calorieConsumption = $('#kllxh').val()

        //上课方式的参数

        var modeId = $('#kcgl-body-skfs').val()

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

        for (var i = 0; i < $('.kcgl-body-kcldt').length; i++) {
            if ($('.kcgl-body-kcldt').eq(i).val().split(' ')[0] !== '') {
                ldzdcount++
            }
        }

        for (var i = 0; i < ldzdcount; i++) {
            for (var j = 0; j < $('.kcgl-body-kcldt').eq(0).children().length; j++) {
                if ($('.kcgl-body-kcldt').children().eq(j).val().split(' ')[1] == $('.kcgl-body-kcldt').eq(i).val().split(' ')[1]) {
                    var dictionaryId = $('.kcgl-body-kcldt').eq(i).val().split(' ')[0]
                    var effectValue = $('.kcgl-body-kcldt').eq(i).parent().parent().children().eq(1).children().val()
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

        if ($('#photoFile').attr('class')) {
            var videos1 = $('#photoFile').attr('class')
            videos.push({ videoUrl: videos1 })
        }

        //图片上传

        var Imgs = []

        if ($('#preview1').children()) {
            for (var i = 0; i < $('#preview1').children().length; i++) {
                if ($('#preview1').children().eq(i).is(':hidden')) {

                } else {
                    Imgs.push({ imgUrl: $('#preview1').children().eq(i).attr('class').split(' ')[1] })
                }

            }
        }
        var fd = {
            id:id,
            suitableForCrowd: suitableForCrowd,
            announcements: announcements,
            calorieConsumption: calorieConsumption,
            classifyId: classifyId,
            difficultyId: difficultyId,
            price: price,
            modeId: modeId,
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

        console.log(fd)

        $.ajax({
            type: 'POST',
            url: "rest/leagueCurriculum/updateLeagueCurriculum",
            contentType: "application/json",  //multipart/form-data;boundary=--xxxxxxx   application/json,
            data: JSON.stringify(fd),
            success: function (result) {
                if (result.message !== '修改成功!') {
                    alert(result.message)
                    return;
                } else if (result.message == '修改成功!') {
                    alert(result.message)
                    $('.course-manage-body').show()
                    $('.add-course-body').hide()
                    shoye()
                }
                
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText)
            }
        })

    }

    //查看页面
    function chakan(aa){
        
            $('.course-manage-body').hide()
            $('.add-course-body').show()

            $('#kcgl-body-kcfl1').find('option[value=""]').prop("selected", true);

            $('#kcgl-body-skfs').find('option[value=""]').prop("selected", true);

            $('#area2').val('')

            $('#kcbzj').val('')

            $('#GroupCourseGole').children().removeClass('add-course-sortone-inputthree-p-active')

            $('#area').val('')

            $('#kllxh').val('')

            $('#shrq').val('')

            // $('.add-course-sortone-inputseven').children().children().eq(0).children().eq(0).find('option[value=""]').prop("selected", true);

            // $('.add-course-sortone-inputseven').children().children().eq(1).children().val('')

            $('.kcgl-body-kcldt').find('option[value=""]').prop("selected", true);

            for (var i = 0; i < $('.kcgl-body-kcldt').length; i++) {
                $('.kcgl-body-kcldt').eq(i).parent().parent().children().eq(1).children().eq(0).val('')
            }

            $('#area1').val('')

            $('#videoshow').hide()
            $('#photoFile').attr('class', '')

            $('#preview1').html('')

            $('#inputtwelve-flex').children().children('img').hide()

            $('.add-course-sortone-inputeight').children().children().children().children().eq(0).children().val('')
            $('.add-course-sortone-inputeight').children().children().children().children().eq(1).children().val('')

            $('#add-course-sortone-inputten').children().eq(0).children('.paypay').click()

            var a = aa
            console.log(a)
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

                            $('#kcgl-body-kcfl1').find(`option[value="` + item.classifyId + `"]`).prop("selected", true);
                            
                            $('#kcgl-body-skfs').find(`option[value="` + item.modeId + `"]`).prop("selected", true);
                            
                            $('#area2').val(item.name)
                            $('#kcbzj').val(item.price)
                            $('#area').val(item.description)
                            $('#shrq').val(item.suitableForCrowd)

                            for (var i = 0; i < $('#GroupCourseGole').children().length; i++) {
                                for (var j = 0; j < item.curriculumTagList.length; j++) {
                                    if ($('#GroupCourseGole').children().eq(i).attr('class').split(' ')[1] == item.curriculumTagList[j].dictionaryId) {
                                        $('#GroupCourseGole').children().eq(i).addClass('add-course-sortone-inputthree-p-active')
                                    }
                                }
                            }

                            for(var ee = 0;ee< item.curriculumEffectList.length;ee++){
                                console.log(item.curriculumEffectList[ee].dictionaryId)
                                $('.kcgl-body-kcldt').eq(ee).find(`option[value="` + item.curriculumEffectList[ee].dictionaryId +' '+ item.curriculumEffectList[ee].name + `"]`).prop("selected", true);
                                $('.add-course-sortone-inputseven').children().eq(ee).children().eq(1).children().val(item.curriculumEffectList[ee].effectValue)
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

                            var faqhtml = `
                                <table cellspacing="0" cellpadding="0">
                                    <tr>
                                        <th>问题</th>
                                        <th>回答</th>
                                        <th></th>
                                    </tr>
                                    <tr>
                                        <td><textarea class="textarea11" placeholder="Q :"></textarea></td>
                                        <td><textarea class="textarea22" placeholder="A :"></textarea></td>
                                        <td>
                                            <img id="addOneRow" style="margin-right:6px;cursor: pointer;" src="/image/add_btn.png" alt="" >
                                            <img id="delOneRow" src="/image/del_btn.png" alt="" style="cursor: pointer;">
                                        </td>
                                    </tr>
                                </table>
                            `
                            $('#faq').html(faqhtml)

                            $("#addOneRow").click(function () {
                                var tempTr = $(this).parent().parent().clone(true);
                                $(this).parent().parent().parent().children("tr:last").after(tempTr);
                                $(this).parent().parent().parent().children("tr:last").children().eq(0).children().val('')
                                $(this).parent().parent().parent().children("tr:last").children().eq(1).children().val('')
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
                            
                            for (var i = 1; i < item.leagueCurriculumFaqList.length; i++) {
                                $('#addOneRow').click()
                            }

                            for (var i = 0; i < item.leagueCurriculumFaqList.length; i++) {
                                $('#faq').children().children().children().eq(i + 1).children().eq(0).children('textarea').val(item.leagueCurriculumFaqList[i].problem)
                                $('#faq').children().children().children().eq(i + 1).children().eq(1).children('textarea').val(item.leagueCurriculumFaqList[i].answer)
                            }
                            

                            if (item.curriculumPayTypeList[0].payTypeName == '付现') {
                                $('#add-course-sortone-inputten').children().eq(0).children('.paypay').click()
                            } else {
                                $('#add-course-sortone-inputten').children().eq(1).children('.paypay').click()
                            }

                            $('#inputtwelve-flex').children().children('img').hide()

                            for (var i = 0; i < $('#inputtwelve-flex').children().length; i++) {
                                for (var j = 0; j < item.curriculumPayTypeList[0].curriculumGuangxinList.length; j++) {
                                    if (parseInt($('#inputtwelve-flex').children().eq(i).children('p').html()) == item.curriculumPayTypeList[0].curriculumGuangxinList[j].itemId) {
                                        $('#inputtwelve-flex').children().eq(i).children('img').show()
                                    }
                                }

                            }

                            //图片的渲染

                            console.log(item)
                            var html = ''
                            for (var i = 0; i < item.leagueCurriculumImgList.length; i++) {
                                var index = i

                                html += '		<div class="zhegeshenmedoumeiyou ' + item.leagueCurriculumImgList[index].imgUrl + '" style="position:relative">';
                                html += '           <img id="deldel" style="position:absolute;top:3px;left:192px;display:none" src="../image/palyitdel_btn.png">'
                                html += '			<img style="height:160px;width:200px;margin-left:1rem" src="images/' + item.leagueCurriculumImgList[index].imgUrl + '" />';
                                html += '		</div>';

                            }

                            $('#preview1').html(html)

                            $('.zhegeshenmedoumeiyou').hover(function () {
                                $(this).children('#deldel').show()
                            }, function () {
                                $(this).children('#deldel').hide()
                            })

                            $('.zhegeshenmedoumeiyou').children('#deldel').click(function () {
                                $(this).parent().css('display', 'none')
                                $(this).parent().attr('class', '')
                            })

                            //视频展示

                            if (item.leagueCurriculumVideoList == '') {

                            } else {
                                $('#photoFile').attr('class',item.leagueCurriculumVideoList[0].videoUrl)
                                var strstr = item.leagueCurriculumVideoList[0].videoUrl
                                $('#videovideo').html('http://test.physicalclub.com/crm/videos/' + strstr)

                                $('#videoshow').show()

                                $('#videovideo').click(function () {
                                    openVideo('http://test.physicalclub.com/crm/videos/' + item.leagueCurriculumVideoList[0].videoUrl)
                                })

                                $('#videohide').click(function () {
                                    $('#videoshow').hide()
                                    $('#photoFile').attr('class', '')
                                })

                                function openVideo(src) {

                                    var page = window.open();

                                    var html = "<body style='background:black'><div style = 'width:80%;margin:auto;'><video controls width='100%' autoplay src='" + src + "'></video> </div></body > "

                                    page.document.write(html);

                                }
                            }  

                            $('#add-course-footer-save').unbind()
                            $('#add-course-footer-save').click(function () {
                                bjhdsj(id)
                            })
                        }
                    })
                
                    
                }
            })
        
    }
</script>

</html>