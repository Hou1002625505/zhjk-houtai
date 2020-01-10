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
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script src="../easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
        }
    
        .course-coach-manage-body {
            /* padding: 20px 20px 0 20px; */
            position: relative
        }
    
        /* .course-coach-manage-button {
                width: 106px;
                height: 35px;
                background: #71B2EF;
                color: white;
                font-size: 18px;
                text-align: center;
                line-height: 35px;
                cursor: pointer;
                border-radius: 4px;
            } */
    
        .course-coach-manage-flex {
            display: flex;
            align-items: center;
        }
    
        .course-coach-manage-flex .course-coach-manage-flex-input {
            width: 120px;
            height: 30px;
            border-radius: 4px;
            margin-left: 18px;
            margin-right: 35px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }
    
        .course-coach-manage-flextwo {
            display: flex;
        }
    
        .course-coach-manage-flextwo #course-coach-manage-flextwo-pone {
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
    
        .course-coach-manage-flextwo #course-coach-manage-flextwo-ptwo {
            width: 80px;
            height: 30px;
            border-radius: 4px;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            text-align: center;
            line-height: 30px;
            color: black;
            margin-left: 15px;
            font-size: 16px;
            cursor: pointer;
        }
    
        .select-menu {
            margin-left: 10px;
            margin-right: 39px;
            cursor: pointer;
            width: 250px;
            height: 36px;
            box-sizing: border-box;
        }
    
        .select-menu-ul {
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
            height: 36px;
            width: 250px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            line-height: 36px;
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
    
        .course-coach-manage-flex-input-one {
            width: 106px;
            height: 26px;
            border-radius: 4px;
            margin-left: 21px;
            margin-right: 7px;
            padding: 13px 0 7px 10px;
            box-sizing: border-box;
            font-size: 12px;
            border: 1px solid #BFBFBF
        }
    
        .course-coach-manage-flex-input-two {
            width: 106px;
            height: 26px;
            border-radius: 4px;
            margin-left: 7px;
            margin-right: 38px;
            padding: 13px 0 7px 10px;
            box-sizing: border-box;
            font-size: 12px;
            border: 1px solid #BFBFBF
        }
    
        .course-coach-manage-flex-input-three {
            width: 70px;
            height: 26px;
            border-radius: 4px;
            margin-left: 21px;
            margin-right: 6px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }
    
        .course-coach-manage-flex-input-four {
            width: 70px;
            height: 26px;
            border-radius: 4px;
            margin-left: 6px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }
    
        .course-coach-manage-table {
            margin-top: 20px;
            font-size: 14px;
        }
    
        .course-coach-manage-table table tr:nth-child(2) td {
            border-top: none
        }
    
        .course-coach-manage-table table td {
            border-left: 1px dashed #CCCCCC;
            border-bottom: 1px dashed #CCCCCC;
            height: 60px;
            text-align: center;
        }
    
        .course-coach-manage-table table td:last-child {
            border-right: 1px dashed #CCCCCC;
            text-align: center;
        }
    
        .course-coach-manage-table table th {
            background: #D0E8F2;
            text-align: center;
            height: 40px;
        }
    
        .course-coach-manage-table .course-coach-manage-table-tr td:last-child {
            cursor: pointer;
            color: #71B2EF;
        }
    
        .course-coach-manage-table .course-coach-manage-table-tr td:last-child a:nth-child(1) {
            margin-right: 5px;
        }
    
        .course-coach-manage-table .course-coach-manage-table-tr td:last-child a:nth-child(2) {
            margin-left: 5px;
        }
    
        .course-coach-manage-table .course-coach-manage-table-checkbox {
            width: 14px;
            height: 14px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
        }
    
        .course-coach-manage-table .course-coach-manage-table-checkbox img {
            width: 14px;
            height: 14px;
            margin-left: -1px;
            margin-top: -1px;
        }
    
        .course-coach-manage-table .headingsifting {
            display: flex;
            justify-content: center;
            align-items: center;
        }
    
        .course-coach-manage-table .headingsifting .headingsifting-column {
            display: flex;
            flex-direction: column;
            margin-left: 6px;
        }
    
        .course-coach-manage-table .headingsifting .headingsifting-column img:nth-child(2) {
            margin-top: 1px
        }
    
        .course-coach-manage-footer {
            display: flex;
            margin-top: 17px;
            height: 26px;
            display: flex;
            align-items: center;
            padding-left: 14px;
        }
    
        .course-coach-manage-table-checkbox {
            width: 14px;
            height: 14px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
            line-height: 14px;
        }
    
        .course-coach-manage-table-checkbox img {
            width: 14px;
            height: 14px;
            margin-top: -1px;
            margin-left: -1px;
        }
    
        .course-coach-manage-footer .course-coach-manage-footer-pone {
            font-size: 12px;
            margin-left: 8px;
        }
    
        .course-coach-manage-footer .course-coach-manage-footer-ptwo {
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
    
        .course-coach-manage-footer .course-coach-manage-footer-pthree {
            font-size: 14px;
            margin-left: 893px;
        }
    
        .course-coach-manage-body .course-coach-manage-addone {
            position: absolute;
            width: 920px;
            height: 820px;
            top: -5px;
            left: 340px;
            z-index: 100;
            background: #D0E8F2;
            border-radius: 9px;
            padding: 18px;
            box-sizing: border-box;
        }
    
        .course-coach-manage-addone .coach-manage-addone-flexone {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
    
        .course-coach-manage-addone .coach-manage-addone-flexone img {
            width: 24px;
            height: 23px
        }
    
        .course-coach-manage-addone .coach-manage-addone-flexone p {
            font-size: 24px;
            margin-left: 12px
        }
    
        .course-coach-manage-addone .coach-manage-addone-flextwo {
            display: flex;
            align-items: center;
        }
    
    
    
    
        .course-coach-manage-addone .coach-manage-addone-flexthree {
            width: 880px;
            height: 738px;
            border: 2px solid #71B2EF;
            box-sizing: border-box;
            margin-top: 10px;
            background: #FFFFFF;
            overflow-y: scroll;
        }
    
        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blockone {
            box-sizing: border-box;
            border-bottom: 1px solid #BFBFBF;
            height: 55px;
            padding: 18px 0 18px 18px;
            display: flex;
            align-items: center;
        }
    
        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blockone .flexthree-blockone-pone {
            font-size: 18px
        }
    
        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blockone .flexthree-blockone-ptwo {
            font-size: 14px;
            margin-left: 73px
        }
    
        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blockone #areaborder {
            width: 250px;
            height: 36px;
            margin-left: 110px;
            border: 1px solid #BFBFBF;
            border-radius: 4px;
        }
    
        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blockone #area {
            width: 250px;
            height: 36px;
            border: 0;
    
        }
    
        .coach-manage-addone-flexthree-blockone .flexthree-blockone-inputtwo {
            margin-left: -24px
        }
    
        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blocktwo {
            display: flex;
            justify-content: space-between;
            box-sizing: border-box;
            border-bottom: 1px solid #BFBFBF;
            height: auto;
            padding: 20px 26px 20px 20px;
            display: flex;
            align-items: center;
        }
    
        .coach-manage-addone-flexthree-blocktwo .flexthree-blocktwo-pone {
            font-size: 16px;
            display: flex;
            width: 70px
        }
    
        .coach-manage-addone-flexthree-blocktwo .flexthree-blocktwo-pthree {
            width: 60px;
            height: 30px;
            border: 1px solid #71B2EF;
            color: #71B2EF;
            text-align: center;
            line-height: 30px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            box-sizing: border-box;
        }
    
        .coach-manage-addone-flexthree-blocktwo .flexthree-blocktwo-pfour {
            display: flex;
            flex-wrap: wrap;
            width: 572px;
        }
    
        .flexthree-blocktwo-pfour .blocktwo-pfour-p {
            width: 80px;
            height: 30px;
            background: #F5F5F5;
            border-radius: 4px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 20px;
            margin-bottom: 10px;
            position: relative;
            font-size: 14px
        }
    
        .flexthree-blocktwo-pfour .blocktwo-pfour-p a {
            position: absolute;
            top: -6px;
            left: 70px;
            display: none;
        }
    
        .coach-manage-addone-flexthree-blocktwo .flexthree-blocktwo-pfive {
            display: flex;
            flex-wrap: wrap;
            width: 572px;
        }
    
    
    
        .flexthree-blocktwo-pfive .blocktwo-pfive-p {
            height: 30px;
            width: 80px;
            box-sizing: border-box;
            background: #F5F5F5;
            border-radius: 4px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 18px;
            margin-bottom: 10px;
            position: relative;
            font-size: 14px
        }
    
        .flexthree-blocktwo-pfive .blocktwo-pfive-p a {
            position: absolute;
            top: -6px;
            left: 75px;
            display: none;
        }
    
        .coach-manage-addone-flexthree-blocktwo .flexthree-blocktwo-psix {
            width: 670px;
            height: 113px;
            display: flex;
            flex-wrap: wrap;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            padding: 13px 8px 0 14px;
            border-radius: 4px;
            font-size: 14px
        }
    
        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blockthree {
            display: flex;
            box-sizing: border-box;
            border-bottom: 1px solid #BFBFBF;
            height: auto;
            padding: 18px 23px 18px 18px;
            display: flex;
            align-items: center;
        }
    
        .coach-manage-addone-flexthree-blockthree .flexthree-blockthree-pone {
            font-size: 16px;
            display: flex;
            width: 83px;
            margin-right: 55px
        }
    
    
    
        .course-coach-manage-addone .coach-manage-addone-flexfour {
            width: 859px;
            height: 100px;
            box-sizing: border-box;
            position: fixed;
            top: 715px;
            left: 380px;
            background: #FFFFFF;
            display: flex;
            justify-content: center;
            align-items: center;
        }
    
        .course-coach-manage-addone .coach-manage-addone-flexfour p:nth-child(1) {
            width: 88px;
            height: 35px;
            background: #71B2EF;
            color: white;
            font-size: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 4px;
            cursor: pointer;
        }
    
        .course-coach-manage-addone .coach-manage-addone-flexfour p:nth-child(2) {
            width: 88px;
            height: 35px;
            font-size: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            border-radius: 4px;
            margin-left: 26px;
            cursor: pointer;
        }
    
        .course-coach-manage-body .course-coach-manage-addtwo {
            position: absolute;
            width: 608px;
            height: 584px;
            top: 175px;
            left: 530px;
            background: #D0E8F2;
            border-radius: 9px;
            padding: 18px;
            box-sizing: border-box;
        }
    
        .course-coach-manage-addtwo .coach-manage-addtwo-flexone {
            display: flex;
            justify-content: space-between;
        }
    
        .coach-manage-addtwo-flexone .coach-manage-addtwo-flextwo {
            display: flex
        }
    
        .coach-manage-addtwo-flexone .coach-manage-addtwo-flextwo img {
            width: 24px;
            height: 24px
        }
    
        .coach-manage-addtwo-flexone .coach-manage-addtwo-flextwo p {
            font-size: 18px;
            margin-left: 15px
        }
    
        .course-coach-manage-addtwo .coach-manage-addtwo-flexthree {
            width: 570px;
            height: 505px;
            border: 1px solid #71B2EF;
            background: white;
            margin-top: 17px;
            padding: 22px 0 0 4px;
            box-sizing: border-box;
            position: relative;
            z-index: -10;
        }
    
        .coach-manage-addtwo-flexthree .addtwo-flexfour {
            display: flex;
            flex-wrap: wrap;
        }
    
        .coach-manage-addtwo-flexthree .flexthree-tags {
            /* padding: 8px 13px 8px 13px; */
            width: 80px;
            border-radius: 4px;
            background: #F5F5F5;
            margin-left: 18px;
            height: 30px;
            box-sizing: border-box;
            margin-bottom: 18px;
            display: flex;
            align-items: center;
            cursor: pointer;
            font-size: 14px;
            justify-content: center;
        }
    
        .coach-manage-addtwo-flexthree .addtwo-flexfour .active {
            background: #71B2EF;
            color: white
        }
    
    
        .coach-manage-addtwo-flexthree .coach-manage-addtwo-flexfour {
            padding: 0 21px 26px 21px;
            position: absolute;
            bottom: 0px;
            width: 100%;
            box-sizing: border-box;
        }
    
        .coach-manage-addtwo-flexthree .coach-manage-addtwo-flexfour p {
            font-size: 16px
        }
    
        .coach-manage-addtwo-flexfour .addtwo-flexfour-flex {
            display: flex;
            justify-content: center;
            margin-top: 43px
        }
    
        .coach-manage-addtwo-flexfour .addtwo-flexfour-flex #flexfour-flex-pone {
            width: 100px;
            height: 40px;
            background: #71B2EF;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px
        }
    
        .coach-manage-addtwo-flexfour .addtwo-flexfour-flex #flexfour-flex-ptwo {
            width: 100px;
            height: 40px;
            border: 1px solid #BFBFBF;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 4px;
            margin-left: 26px;
            cursor: pointer;
            font-size: 18px
        }
    
        .course-coach-manage-body .course-coach-manage-addthree {
            position: absolute;
            width: 688px;
            height: 678px;
            top: 140px;
            left: 485px;
            background: #D0E8F2;
            border-radius: 9px;
            padding: 18px;
            box-sizing: border-box;
        }
    
        .course-coach-manage-addthree .coach-manage-addthree-flexone {
            display: flex;
            justify-content: space-between;
        }
    
        .coach-manage-addthree-flexone .coach-manage-addthree-flextwo {
            display: flex;
            align-items: center;
        }
    
        .coach-manage-addthree-flexone .coach-manage-addthree-flextwo img {
            width: 24px;
            height: 24px
        }
    
        .coach-manage-addthree-flexone .coach-manage-addthree-flextwo p {
            font-size: 18px;
            margin-left: 13px
        }
    
        .course-coach-manage-addthree .coach-manage-addthree-flexthree {
            width: 650px;
            height: 600px;
            border: 1px solid #71B2EF;
            background: white;
            margin-top: 17px;
            box-sizing: border-box;
            position: relative;
            z-index: -10;
        }
    
        .coach-manage-addthree-flexthree .addthree-flexfour {
            display: flex;
            flex-wrap: wrap;
        }
    
        .coach-manage-addthree-flexthree .coach-manage-addthree-flexthree-flex {
            padding: 25px 25px 0 7px;
            box-sizing: border-box;
        }
    
        .coach-manage-addthree-flexthree-flex .coach-manage-addthree-flexthree-flex-p {
            margin: 0 0 20px 18px;
            font-size: 18px;
            color: black
        }
    
        .coach-manage-addthree-flexthree .flexthree-tags {
            width: 80px;
            border-radius: 4px;
            background: #F5F5F5;
            margin-left: 18px;
            height: 30px;
            box-sizing: border-box;
            margin-bottom: 18px;
            display: flex;
            align-items: center;
            cursor: pointer;
        }
    
        .coach-manage-addthree-flexthree .flexthree-tags1 {
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
    
        .coach-manage-addthree-flexthree .addthree-flexfour .active1 {
            background: #71B2EF;
            color: white
        }
    
    
        .coach-manage-addthree-flexthree .coach-manage-addthree-flexfour {
            padding: 0 21px 26px 21px;
            position: absolute;
            bottom: 0px;
            width: 100%;
            box-sizing: border-box;
        }
    
        .coach-manage-addthree-flexfour .addthree-flexfour-flex {
            display: flex;
            justify-content: center;
            margin-top: 43px
        }
    
        .coach-manage-addthree-flexfour .addthree-flexfour-flex #flexfour-flex-pthree {
            width: 100px;
            height: 40px;
            background: #71B2EF;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 4px;
            cursor: pointer;
            font-size: 18px
        }
    
        .coach-manage-addthree-flexfour .addthree-flexfour-flex #flexfour-flex-pfour {
            width: 100px;
            height: 40px;
            border: 1px solid #BFBFBF;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 4px;
            margin-left: 26px;
            cursor: pointer;
            font-size: 18px
        }
    </style>
    </head>
    
    <body>
        <div class="course-coach-manage-body">
            <div class="course-coach-manage-flex">
                <div style="font-size:16px">员工姓名</div>
                <input class="course-coach-manage-flex-input" type="text">
                <div style="font-size:16px">员工工号</div>
                <input class="course-coach-manage-flex-input" type="text">
                <div style="font-size:16px">课程类型</div>
                <div class="course-coach-manage-flex-select-one">
                    <div class="select-menu">
                        <div class="select-menu-div">
                            <input class="select-menu-input" />
                    
                            <img class="select-menu-img" src="./image/sifting_icon.png" />
                        </div>
                        <ul class="select-menu-ul" id="select-menu-ul-GroupType">
                            
                        </ul>
                    </div>
                </div>
                <div style="font-size:16px">课程名称</div>
                <div class="course-coach-manage-flex-select-two">
                    <div style="width:200px;height:30px;border:1px solid #BFBFBF;border-radius: 4px;margin:0 30px 0 20px">
                        <input style="width:200px;height:30px;border:0;" />
                    </div>
                </div>
                <div class="course-coach-manage-flextwo">
                    <p id="course-coach-manage-flextwo-pone">查询</p>
                    <p id="course-coach-manage-flextwo-ptwo">清除</p>
                </div>
            </div>
            <div class="course-coach-manage-table"></div>
            <div class="box" id="ywyboxpage"></div>
            <div class="course-coach-manage-add"></div>
            <div class="course-coach-manage-add1" style="opacity: 0;"></div>
            <div class="course-coach-manage-add2" style="opacity: 0;"></div>
        </div>
    </body>
    <script type="text/javascript">
        window.onload = function () {
            new course_manage().init();
        }

        class course_manage {
            constructor() {
                this.select_one = $("#select-menu-ul-GroupType")
                //this.select_two = $(".course-coach-manage-flex-select-two")
                this.table = $(".course-coach-manage-table")
                this.input_four = $(".course-coach-manage-footer-pthree")
            }

            init() {
                this.select_all1()
                this.select_all2()
                this.table_all()
                this.input_all4()
                this.select_option()
            }

            select_all1() { 
                var that = this
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
                        that.select_one.html(strGroupType)
                        that.select_one.parent().children('.select-menu-div').children('input').val("全部")
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText)
                    }
                })
            }

            select_all2() {
                
            }

            select_option() {
                selectMenu(0);
                selectMenu(1);
                selectMenu(2);

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
                var straddsmall1;
                var straddsmall2;                

                //整个表格的内容
                var str2 = `
                    <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th>序号</th>
                        <th>员工姓名</th>
                        <th>员工工号</th>
                        <th>个人标签</th>
                        <th>上牌课程</th>
                        <th>个人简介</th>
                        <th>操作</th>
                    </tr>
                `

                var paramscoach = {
                    page: 1,
                    rows: 10,
                    param: {
                        name: null,
                        user: null,
                        classifyId: null,
                        leagueCurriculumName: null

                    }

                }

                $.ajax({
                    type: 'POST',
                    contentType: "application/json;charset=UTF-8",
                    url: "http://test.physicalclub.com/rest/leagueCoach/selectLeagueCoachList",
                    data: JSON.stringify(paramscoach),
                    success: function (result) {
                        console.log(result)

                        function biaoqian(arr){
                            var shuzu = '';
                            if(arr == ''){
                                shuzu = ' '
                            }else{
                                for(var i = 0;i<arr.length;i++){
                                    shuzu += arr[i].name
                                }
                            }
                            return shuzu
                        }

                        function kecheng(arr) {
                            var shuzu = '';
                            if (arr == '') {
                                shuzu = ' '
                            } else {
                                for (var i = 0; i < arr.length; i++) {
                                    shuzu += (arr[i].leagueCurriculumName + "、")
                                }
                            }
                            return shuzu
                        }

                        function introduce(arr){
                            var shuzu = ''
                            if(!arr.introduce){
                                shuzu = ' '
                            }else{
                                shuzu = arr.introduce
                            }
                            return shuzu
                        }

                        $.each(result.results,function(i,item){
                            str2 += `
                                        <tr class="course-coach-manage-table-tr">
                                            <td width="49"><div style="display:flex;justify-content: center;">`+ ( i + 1 + ( paramscoach.page - 1)*10) +`</div></td>
                                            <td width="120">`+ item.realName +`</td>
                                            <td width="120">`+ item.userName +`</td>
                                            <td width="250">`+ biaoqian(item.coachTagList) +`</td>
                                            <td width="490">`+ kecheng(item.coachSkillList) +`</td>
                                            <td width="488">`+ introduce(item) +`</td>
                                            <td width="120"><a class="course-coach-manage-a">编辑</a></td>
                                        </tr>
                                    `
                        })
                        that.table.html(str2)

                        //添加标签窗口的表框
                        straddsmall1 = `
                        <div class="course-coach-manage-addtwo">
                            <div class="coach-manage-addtwo-flexone">
                                <div class="coach-manage-addtwo-flextwo">
                                    <img src="./image/tags_icon.png" alt="">
                                    <p>添加个人标签（多选）</p>
                                </div>
                                <img id="addtwo-flexone-chacha" style="width:25px;height:25px" src="./image/popupclose_btn.png" alt="">
                            </div>
                            <div class="coach-manage-addtwo-flexthree">
                                <div class="addtwo-flexfour" id="addtwo-flexfour"></div>
                                <div class="coach-manage-addtwo-flexfour">
                                    <p>注：每个教练最多只能添加10个标签</p>
                                    <div class="addtwo-flexfour-flex">
                                        <p id="flexfour-flex-pone">确定</p>
                                        <p id="flexfour-flex-ptwo">取消</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    `
                        straddsmall2 = `
                        <div class="course-coach-manage-addthree">
                            <div class="coach-manage-addthree-flexone">
                                <div class="coach-manage-addthree-flextwo">
                                    <img src="./image/tags_icon.png" alt="">
                                    <p>添加个人标签（多选）</p>
                                </div>
                                <img id="addthree-flexone-chacha" style="width:25px;height:25px" src="./image/popupclose_btn.png" alt="">
                            </div>
                            <div class="coach-manage-addthree-flexthree">
                                
                                <div id="coach-manage-addthree-flexthree-list"></div>

                                    <div class="coach-manage-addthree-flexfour">
                                        <div class="addthree-flexfour-flex">
                                            <p id="flexfour-flex-pthree">确定</p>
                                            <p id="flexfour-flex-pfour">取消</p>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    `
                        $(".course-coach-manage-add1").html(straddsmall1)
                        $(".course-coach-manage-add2").html(straddsmall2)

                        new credit().init()
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText)
                    }
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

                var str3
                str3 = `
                    <p>共20条，每条15条</p>
                `
                this.input_four.html(str3)
            }
        }

        class credit {
            constructor() {
                this.coach_manage_a = $(".course-coach-manage-a")
            }

            init() {
                this.ccm_a()
            }

            ccm_a() {
                this.coach_manage_a.click(function () {
                    //添加窗口的内容
                    var stradd;
                    stradd = `
                    <div class="course-coach-manage-addone">
                        <div class="coach-manage-addone-flexone">
                            <div class="coach-manage-addone-flextwo">
                                <img src="./image/editor_icon.png" alt="">
                                <p>编辑员工</p>
                            </div>
                            <img id="addone-flexone-chacha" style="width:36px;height:36px" src="./image/popupclose_btn.png" alt="">
                        </div>
                        <div class="coach-manage-addone-flexthree">
                            <div class="coach-manage-addone-flexthree-blockone"><p class="flexthree-blockone-pone">员工工号</p><p class="flexthree-blockone-ptwo">66160</p></div>
                            <div class="coach-manage-addone-flexthree-blockone"><p class="flexthree-blockone-pone">员工姓名</p><p class="flexthree-blockone-ptwo">刘大伟</p></div>
                            <div class="coach-manage-addone-flexthree-blockone"><p class="flexthree-blockone-pone">员工头像</p><p class="flexthree-blockone-ptwo">66160</p></div>
                            <div class="coach-manage-addone-flexthree-blockone"><p class="flexthree-blockone-pone">昵称</p><div id="areaborder"><input id="area"/></div><div class="flexthree-blockone-inputtwo"><span id="text-count">0</span>/7</div></div>
                            <div class="coach-manage-addone-flexthree-blockthree">
                                <p class="flexthree-blockthree-pone">工作性质</p>
                                <div class="flexthree-blocktwo-pseven"></div>
                            </div>
                            <div class="coach-manage-addone-flexthree-blocktwo">
                                <p class="flexthree-blocktwo-pone">个人标签</p>
                                <p class="flexthree-blocktwo-pfour"></p>
                                <p class="flexthree-blocktwo-pthree" id="tianjia1">添加</p>
                            </div>
                            <div class="coach-manage-addone-flexthree-blocktwo">
                                <p class="flexthree-blocktwo-pone">上牌课程</p>
                                <p class="flexthree-blocktwo-pfive"></p>
                                <p class="flexthree-blocktwo-pthree" id="tianjia2">添加</p>
                            </div>
                            <div class="coach-manage-addone-flexthree-blocktwo" style="margin-bottom:100px">
                                <p class="flexthree-blocktwo-pone">个人简介</p>
                                <p class="flexthree-blocktwo-psix">
                                    天然呆萌，权限运动发烧友。专业能力就是一个小宇宙，他说，我们最先衰老的从来不是容颜，来和他一起保持年轻的荷尔蒙吧~莱美BODYPUMP，BODYCOMBAT认证教练，UK儿童体适能认证教练，TRX认证教 练，CORESHAPER认证教练，FIGHTING COMBO认证教练，CXWORX认证。
                                </p>
                            </div>
                        </div>
                        <div class="coach-manage-addone-flexfour">
                            <p>保存</p>
                            <p>取消</p>
                        </div>
                    </div>
                `
                    $(".course-coach-manage-add").html(stradd)
                    new inputcontain().init()
                })
                //添加标签窗口的标签遍历
                var ad_ft = '';
                var ad_ft1 = '';
                var ad_ft2 = '';
                var ad_ft3 = '';

                //课程标签的请求及渲染
                var paramstkCoachIabel = {
                    typeCode: "tkCoachIabel"
                }

                $.ajax({
                    type: 'POST',
                    contentType: "application/json;charset=UTF-8",
                    url: "http://test.physicalclub.com/rest/wx/dictionnary/getdictionnarylist",
                    data: JSON.stringify(paramstkCoachIabel),
                    success: function (result) {
                        $.each(result.rows,function(i,item){
                            ad_ft += `
                                <div class="flexthree-tags">
                                    `+ item.name +`
                                </div>
                            `
                        })
                        $('.addtwo-flexfour').html(ad_ft)
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText)
                    }
                })
                
                //课程名称的请求及渲染

                $.ajax({
                    type: 'GET',
                    contentType: "application/json;charset=UTF-8",
                    url: "http://test.physicalclub.com/crm/rest/leagueCurriculum/getReleaseLeagueCurriculumListGroupByType",
                    success: function (result) {
                        console.log(result)

                        for(var i=0;i< result.length;i++){
                            ad_ft1 += `
                                <div class="coach-manage-addthree-flexthree-flex">
                                    <p class="coach-manage-addthree-flexthree-flex-p">`+ result[i].classifyName +`</p>
                                    <div class="addthree-flexfour">
                                    </div>
                                </div>  
                            `
                        }

                        $('#coach-manage-addthree-flexthree-list').html(ad_ft1)

                        for (var i = 0; i < result.length; i++) {
                            for (var j = 0; j < result[i].children.length; j++) {
                                
                                ad_ft2 += `
                                    <div class="flexthree-tags1">
                                        `+ item.name +`
                                    </div> 
                                `
                            }
                        }
                        
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText)
                    }
                })

                // tags1.forEach(function (item, index) {
                
                // })

                // tags2.forEach(function (item, index) {
                //     ad_ft1 += `
                //         <div class="flexthree-tags1">
                //             ${item}
                //         </div>  
                //     `
                // })


                // $('.addtwo-flexfour').html(ad_ft)
                // $('.addthree-flexfour').html(ad_ft1)


                // $('.addtwo-flexfour').children('.flexthree-tags:first-child').addClass('ac')
                // $('.addtwo-flexfour').children('.flexthree-tags:first-child').addClass('active')
                // $('.addthree-flexfour').children('.flexthree-tags1:first-child').addClass('ac1')
                // $('.addthree-flexfour').children('.flexthree-tags1:first-child').addClass('active1')
            }
        }

        class inputcontain {

            init() {
                this.textare_contain()
                this.add_tags1()
                this.chacha()
                this.smallselect()
            }
            //计算字数
            textare_contain() {
                $("#area").on("input propertychange", function () {
                    var $this = $(this),
                        _val = $this.val(),
                        count = "";
                    if (_val.length > 7) {
                        $this.val(_val.substring(0, 7));
                    }
                    count = $this.val().length;
                    $("#text-count").text(count);
                });
            }

            smallselect() {
                selectMenu(2);

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

            add_tags1() {
                var straddtags1 = '';
                // var straddtags2 = '';
                // var straddtags3 = '';
                //添加窗口第一个标签栏

                for(var i = 0;i<$('#addtwo-flexfour').children().length;i++){
                    if($('#addtwo-flexfour').children().eq(i).hasClass('active')){
                        straddtags1 += `  
                            <p class="blocktwo-pfour-p">
                                `+ $('#addtwo-flexfour').children().eq(i).html() +`
                                <a><img src="./image/classdel_btn.png" alt=""></img></a>
                            </p>`
                    }
                }



                //添加窗口第二个标签栏
                // for (var i = 0; i < tags22; i++) {
                //     straddtags2 += `
                //     <p class="blocktwo-pfive-p">
                //         ${tags2[i].innerText}
                //         <a><img src="./image/classdel_btn.png" alt=""></img></a>
                //     </p>
                // `
                // }
                //添加窗口的下拉菜单
                // straddtags3 = `
                //     <div class="select-menu">
    		    //         <div class="select-menu-div">
    			//             <input class="select-menu-input" />
    
    			//             <img class="select-menu-img" src="./image/sifting_icon.png"/>
    		    //         </div>
                //         <ul class="select-menu-ul">
                //             <li class="select-this">全部</li>
                //             <li>全职</li>
                //             <li>兼职</li>
                //         </ul>
                //     </div>
                // `
                $('.flexthree-blocktwo-pfour').html(straddtags1)
                // $('.flexthree-blocktwo-pfive').html(straddtags2)
                //$('.flexthree-blocktwo-pseven').html(straddtags3)
                new ashow().init()
            }

            chacha() {
                //添加窗口点击叉关闭窗口
                $('#addone-flexone-chacha').click(function () {
                    $(this).parent().parent().hide()
                })

                //点击确定或取消关闭窗口
                $('.coach-manage-addone-flexfour').children('p').click(function () {
                    $(this).parent().parent().hide()
                })

                //点击添加关闭原窗口，打开添加标签窗口
                $('#tianjia1').click(function () {
                    $(this).parent().parent().parent().hide()
                    $('.course-coach-manage-add1').css('opacity', 1)
                    $('.course-coach-manage-addtwo').css('z-index', 10)
                    $('.coach-manage-addtwo-flexthree').css('z-index', 10)
                })

                $('#tianjia2').click(function () {
                    $(this).parent().parent().parent().hide()
                    $('.course-coach-manage-add2').css('opacity', 1)
                    $('.course-coach-manage-addthree').css('z-index', 10)
                    $('.coach-manage-addthree-flexthree').css('z-index', 10)
                })

                //点击标签添加active
                $('.flexthree-tags').click(function () {
                    if ($(this).hasClass('active')) {
                        setTimeout(() => {
                            $(this).removeClass('active')
                        }, 50);
                    } else {
                        setTimeout(() => {
                            $(this).addClass('active')
                        }, 50);
                    }
                })


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

                // new ashow().init()
            }
        }

        class ashow {
            init() {
                this.ashow1()
                this.ashow2()
            }
            //第一个删除添加窗口的标签
            ashow1() {
                $('.blocktwo-pfour-p').mouseover(function () {
                    $(this).children('a').show()
                })
                $('.blocktwo-pfour-p').mouseout(function () {
                    $(this).children('a').hide()
                })

                $('.blocktwo-pfour-p').children('a').click(function () {
                    $(this).parent().hide()
                    for (var i = 0; i < $('.flexthree-tags').length; i++) {
                        if ($('.flexthree-tags')[i].innerText == $(this).parent()[0].innerText.replace(
                            /(^\s*)|(\s*$)/g, "")) {
                            $('.addtwo-flexfour').children().eq(i).removeClass('active')
                        }
                    }
                })

                //点击添加标签窗口的叉关闭窗口
                $('#addtwo-flexone-chacha').click(function () {
                    $('.course-coach-manage-add1').css('opacity', 0)
                    $(".flexthree-tags").each(function () {
                        $(this).removeClass('active')
                        if ($(this).hasClass('ac')) {
                            $(this).addClass('active')
                        }
                    })
                })

                $('#flexfour-flex-pone').click(function () {
                    $('.course-coach-manage-add1').css('opacity', 0)
                    $('.course-coach-manage-addtwo').css('z-index', -10)
                    $(".flexthree-tags").each(function () {
                        if ($(this).hasClass('active')) {
                            $(this).addClass('ac')
                        } else {
                            $(this).removeClass('ac')
                        }
                        $(this).removeClass('active')
                        if ($(this).hasClass('ac')) {
                            $(this).addClass('active')
                        }
                    })
                })

                $('#flexfour-flex-ptwo').click(function () {
                    $('.course-coach-manage-add1').css('opacity', 0)
                    $(".flexthree-tags").each(function () {
                        $(this).removeClass('active')
                        if ($(this).hasClass('ac')) {
                            $(this).addClass('active')
                        }
                    })
                })
            }
            //第二个删除添加窗口标签
            ashow2() {
                $('.blocktwo-pfive-p').mouseover(function () {
                    $(this).children('a').show()
                })
                $('.blocktwo-pfive-p').mouseout(function () {
                    $(this).children('a').hide()
                })
                $('.blocktwo-pfive-p').children('a').click(function () {
                    $(this).parent().hide()
                    for (var i = 0; i < $('.flexthree-tags1').length; i++) {
                        if ($('.flexthree-tags1')[i].innerText == $(this).parent()[0].innerText.replace(
                            /(^\s*)|(\s*$)/g, "")) {
                            $('.addthree-flexfour').children().eq(i).removeClass('active')
                        }
                    }
                })

                //点击添加标签窗口的叉关闭窗口
                $('#addthree-flexone-chacha').click(function () {
                    $('.course-coach-manage-add2').css('opacity', 0)
                    $(".flexthree-tags1").each(function () {
                        $(this).removeClass('active1')
                        if ($(this).hasClass('ac1')) {
                            $(this).addClass('active1')
                        }
                    })
                })

                $('#flexfour-flex-pthree').click(function () {
                    $('.course-coach-manage-add2').css('opacity', 0)
                    $('.course-coach-manage-addthree').css('z-index', -10)
                    $(".flexthree-tags1").each(function () {
                        if ($(this).hasClass('active1')) {
                            $(this).addClass('ac1')
                        }
                        $(this).removeClass('active1')
                        if ($(this).hasClass('ac1')) {
                            $(this).addClass('active1')
                        }
                    })
                })

                $('#flexfour-flex-pfour').click(function () {
                    $('.course-coach-manage-add2').css('opacity', 0)
                    $(".flexthree-tags1").each(function () {
                        $(this).removeClass('active1')
                        if ($(this).hasClass('ac1')) {
                            $(this).addClass('active1')
                        }
                    })
                })
            }
        }

        $('.M-box11').pagination({
            mode: 'fixed'
        });
    </script>
    
    </html>