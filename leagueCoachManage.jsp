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
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script src="easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
    
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

        .course-coach-manage-flex {
            display: flex;
            align-items: center;
        }

        .course-coach-manage-flex .course-coach-manage-flex-input {
            width: 120px;
            height: 30px;
            border-radius: 4px;
            margin-left: 18px;
            margin-right: 25px;
            box-sizing: border-box;
            border: 1px solid #d5d5d7
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
            border: 1px solid #d5d5d7;
            box-sizing: border-box;
            text-align: center;
            line-height: 30px;
            color: black;
            margin-left: 15px;
            font-size: 16px;
            cursor: pointer;
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
            margin-left: 853px;
        }

        .course-coach-manage-body .course-coach-manage-addone {
            position: absolute;
            width: 920px;
            height: 820px;
            top: 30px;
            left: 340px;
            z-index: 100;
            background: #eeffff;
            border-radius: 9px;
            padding: 18px;
            box-sizing: border-box;
            border:1px solid #c7dbff
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
            border: 2px solid #c7dbff;
            box-sizing: border-box;
            margin-top: 10px;
            background: #FFFFFF;
            overflow-y: scroll;
            position: relative;
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
            overflow: hidden;
        }

        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blockone #area {
            width: 250px;
            height: 36px;
            border: 0;
            padding-left:20px;
            box-sizing: border-box;
        }

        .coach-manage-addone-flexthree-blockone .flexthree-blockone-inputtwo {
            margin-left: -30px
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
            padding:0 10px 0 10px;
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
            left: 100%;
            display: none;
        }

        .coach-manage-addone-flexthree-blocktwo .flexthree-blocktwo-pfive {
            display: flex;
            flex-wrap: wrap;
            width: 572px;
        }



        .flexthree-blocktwo-pfive .blocktwo-pfive-p {
            height: 30px;
            padding:0 10px 0 10px;
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
            left: 100%;
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
            margin-right: 45px
        }

        .course-coach-manage-addone .coach-manage-addone-flexfour {
            width: 859px;
            height: 100px;
            box-sizing: border-box;
            position: relative;
            top: -102px;
            left:2px;
            background: #FFFFFF;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .course-coach-manage-addone .coach-manage-addone-flexfour #coach-manage-addone-flexfour-save {
            width: 100px;
            height: 40px;
            background: #71B2EF;
            color: white;
            font-size: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 4px;
            cursor: pointer;
        }

        .course-coach-manage-addone .coach-manage-addone-flexfour #coach-manage-addone-flexfour-quxiao {
            width: 100px;
            height: 40px;
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
            background: #eeffff;
            border-radius: 9px;
            padding: 18px;
            box-sizing: border-box;
            border:1px solid #c7dbff
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
            border: 1px solid #c7dbff;
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
            background: #eeffff;
            border-radius: 9px;
            padding: 18px;
            box-sizing: border-box;
            border:1px solid #c7dbff
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
            border: 1px solid #c7dbff;
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
            bottom: 4px;
            width: 646px;
            box-sizing: border-box;
            background: white
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
            font-size: 18px;
        }

        #coach-manage-addthree-flexthree-list {
            height: 598px;
            padding-bottom: 100px;
            overflow-y: scroll;
            box-sizing: border-box;
        }
        .course-coach-manage-bottom{
            display:flex;
            justify-content: center;
        }
        #boxpage{
        	position: relative;
        	z-index: 100;
        }

        .select_wrap {
            position: relative;
            margin-left: 20px;
            margin-right: 39px
        }

        #kcgl-body-kclx {
            width: 120px;
            height: 30px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 16px;
            padding-left: 13px;
            box-sizing: border-box;
            -webkit-appearance: none
        }

        #kcgl-body-gzxz {
            width: 250px;
            height: 36px;
            border: 1px solid #d5d5d7;
            border-radius: 4px;
            font-size: 16px;
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
            right: 10px;
            top: 3px;
        }

        .triangle_border_down2 {
            display: inline-block;
            width: 0;
            height: 0;
            border-width: 8px 5px 0;
            border-style: solid;
            border-color: #444444 transparent transparent;
            position: absolute;
            right: 10px;
            top: 13px;
        }

        .table-header th {
            font-size: 14px;
            color: #444444;
            height: 70px;
            text-align: center;
        }

        .table-body1 tr td {
            font-size: 14px;
            color: #444444;
            height: 70px;
            text-align: center;
            border-left: 1px dotted #CCCCCC;
            border-bottom: 1px dotted #CCCCCC;
        }

        .table-body1 tr td:last-child {
            border-right: 1px dotted #CCCCCC;
        }

        .item1{
            width:2.5%
        }

        .item2{
            width:6.25%
        }
        .item3{
            width:13.0208%
        }
        .item4{
            width:25.5208%
        }
        .item5{
            width:25.4167%;
            
        }
    </style>
</head>

<body>
    <div class="course-coach-manage-body">
        <div class="course-coach-manage-add" style="position: relative;"></div>
        <div class="course-coach-manage-add1" style="opacity: 0;"></div>
        <div class="course-coach-manage-add2" style="opacity: 0;"></div>
        <div class="course-coach-manage-flex">
            <div style="font-size:16px">员工姓名</div>
            <input class="course-coach-manage-flex-input" id="ccmfi1" type="text" autocomplete="off">
            <div style="font-size:16px">员工工号</div>
            <input class="course-coach-manage-flex-input" id="ccmfi2" type="text" autocomplete="off" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');">
            <div style="font-size:16px">课程类型</div>
            <div class="course-coach-manage-flex-select-one">
                <span class="select_wrap">
                    <select name="visitstatus" id="kcgl-body-kclx" style="cursor: pointer;">
                
                    </select>
                    <em class="triangle_border_down1"></em>
                </span>
            </div>
            <div style="font-size:16px">课程名称</div>
            <div class="course-coach-manage-flex-select-two">
                <div style="width:200px;height:30px;border:1px solid #d5d5d7;border-radius: 4px;margin:0 30px 0 20px">
                    <input id="jlgl-kcmc" style="width:200px;height:30px;border:0;" autocomplete="off"/>
                </div>
            </div>
            <div class="course-coach-manage-flextwo">
                <p id="course-coach-manage-flextwo-pone">查询</p>
                <p id="course-coach-manage-flextwo-ptwo">清除</p>
            </div>
        </div>
        <table style='border-collapse: collapse;width: 100%;table-layout:fixed;margin-top:20px'>
            <tbody>
                <tr class="table-header" style="background:#f8fafb">
                    <th class="item1">序号</th>
                    <th class="item2">员工姓名</th>
                    <th class="item2">员工工号</th>
                    <th class="item3">个人标签</th>
                    <th class="item4">上牌课程</th>
                    <th class="item5">个人简介</th>
                    <th class="item1">操作</th>
                </tr>
            </tbody>
            <tbody class="table-body1" id="sj-body-body1">
        
            </tbody>
        </table>
        <div class="course-coach-manage-bottom">
            <div class="box" id="boxpage" style="margin-left:0"></div>
        </div>
        
    </div>
</body>

<script type="text/javascript">

    //首页查询按钮
    $('#course-coach-manage-flextwo-pone').click(function(){
        shoye()
    })

    //首页清除按钮
    $('#course-coach-manage-flextwo-ptwo').click(function(){

        $('#ccmfi1').val(''),
        $('#ccmfi2').val(''),
        $('#kcgl-body-kclx').find('option[value=""]').prop("selected", true);
        shoye()
    })

    kclxxl()

    shoye()

    //上传照片
    function upload() {
            if ($("#photoFile").val() == '') {
                return;
            }

            let file = $("#photoFile").val()
            let filename = file.substr(file.lastIndexOf("."));
            if (filename != '.png' && filename != '.jpeg' && filename != '.jpg') {
            alert("请上传图片格式的文件");
            return;
        }

            var formData = new FormData();
            formData.append('file', document.getElementById('photoFile').files[0]);
            $.ajax({
                url: "rest/leagueCoach/uploadLeagueCoachFile",
                type: "post",
                data: formData,
                contentType: false,
                processData: false,
                success: function (data) {
                    console.log(data)
                    $("#preview_photo").attr("src", 'images/' + data.rows[0].path)
                    $('#imageimage').children('img').attr("src", 'images/' + data.rows[0].path)
                    $('#photoFile').attr('class', data.rows[0].path)
                    alert(data.message)
                },
                error: function (data) {
                    alert("上传失败")
                }
            });
        }

    //课程类型的请求及渲染
    function kclxxl(){
        
        var paramsGroupType = {
            typeCode: "GroupType"
        }

        $.ajax({
            type: 'POST',
            contentType: "application/json;charset=UTF-8",
            url: "rest/wx/dictionnary/getdictionnarylist",
            data: JSON.stringify(paramsGroupType),
            success: function (result) {

                var strGroupType = `
                        <option value="" selected="selected">全部</option>
                    `
                $.each(result.rows, function (i, item) {
                    strGroupType += `
                            <option value="`+ item.dictionaryId + `">` + item.name + `</option>
                        `
                })
                $('#kcgl-body-kclx').html(strGroupType)
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText)
            }
        })
    }

    //首页分页渲染
    function shoye(){

        var onPagechange = function (page) {
            aaaaaa(page)
        }

        var page = 1;
        aaaaaa(page)

        function aaaaaa(page){

            var paramscoach = {
                page: page,
                rows: 10,
                param: {
                    name: $('#ccmfi1').val(),
                    user: $('#ccmfi2').val(),
                    classifyId: $('#kcgl-body-kclx').val(),
                    //leagueCurriculumId:$('#jlgl-kcmc').bal()
                }
            }

            $.ajax({
                type: 'POST',
                contentType: "application/json;charset=UTF-8",
                url: "rest/leagueCoach/selectLeagueCoachList",
                data: JSON.stringify(paramscoach),
                success: function (result) {
                    console.log(result)

                    function biaoqian(arr) {
                        var shuzu = '';
                        if (arr == '') {
                            shuzu = ' '
                        } else {
                            for (var i = 0; i < arr.length; i++) {
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

                    function introduce(arr) {
                        var shuzu = ''
                        if (!arr.introduce) {
                            shuzu = ' '
                        } else {
                            shuzu = arr.introduce
                        }
                        return shuzu
                    }
                    //整个表格的内容
                    var str2 = ''
                    $.each(result.rows, function (i, item) {
                    str2 += `
                        <tr class="course-coach-manage-table-tr">
                            <td style="width:item1"><div style="display:flex;justify-content: center;">`+ (i + 1 + (paramscoach.page - 1) * paramscoach.rows) + `</div></td>
                            <td style="width:item2">`+ item.realName + `</td>
                            <td style="width:item2">`+ item.userName + `</td>
                            <td style="width:item3">`+ biaoqian(item.coachTagList) + `</td>
                            <td style="width:item4">`+ kecheng(item.coachSkillList) + `</td>
                            <td style="width:item4">`+ introduce(item) + `</td>
                            <td style="width:item1"><p class="course-coach-manage-a" style="color:#71B2EF;cursor:pointer">编辑</p></td>
                        </tr>
                    `
                    })
                    $('#sj-body-body1').html(str2)

                    //编辑按钮点击事件
                    $('.course-coach-manage-a').click(function () {
                        var jobNumber = $(this).parent().parent().children().eq(2).html()
                        jlck(jobNumber)
                    })

                    var obj = {
                        wrapid: 'boxpage', //页面显示分页器容器id
                        total: result.total, //总条数
                        pagesize: 10, //每页显示10条
                        currentPage: page, //当前页
                        onPagechange: onPagechange,
                        btnCount:5 //页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
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

    //教练查看
    function jlck(jobNumber){

        var paramscoach = {
            page: 1,
            rows: 10,
            param: {
                name: null,
                user: jobNumber,
                classifyId: null,
                leagueCurriculumName: null

            }
        }

        $.ajax({
            type: 'POST',
            contentType: "application/json;charset=UTF-8",
            url: "rest/leagueCoach/selectLeagueCoachList",
            data: JSON.stringify(paramscoach),
            success: function (result) {
                var list = result
                console.log(result)                      

                //添加窗口的内容
                var stradd = '';
                    stradd = `
                            <div class="course-coach-manage-addone">
                                <div class="coach-manage-addone-flexone">
                                    <div class="coach-manage-addone-flextwo">
                                        <img src="./image/editor_icon.png" alt="">
                                        <p style="color:#444444">编辑员工</p>
                                    </div>
                                    <img id="addone-flexone-chacha" style="width:1.8rem;height:1.8rem" src="./image/popupclose_btn.png" alt="">
                                </div>
                                <div class="coach-manage-addone-flexthree">
                                    <div class="coach-manage-addone-flexthree-blockone"><p class="flexthree-blockone-pone">员工工号</p><p class="flexthree-blockone-ptwo `+ result.rows[0].userId + `" id="coach-userid">` + result.rows[0].userName + `</p></div>
                                    <div class="coach-manage-addone-flexthree-blockone"><p class="flexthree-blockone-pone">员工姓名</p><p class="flexthree-blockone-ptwo" id="coach-realName">`+ result.rows[0].realName + `</p></div>
                                    <div class="coach-manage-addone-flexthree-blockone" style="height:auto">
                                        <p class="flexthree-blockone-pone" style="margin-right:110px">头像</p>
                                        <div id="imageimage" style="display:flex;justify-content:space-between;width:670px">
                                            <img style="width:50px;height:50px" src="images/`+ result.rows[0].pictures + `">  
                                            <div id="imageimage1" style="display:flex;align-items:center;cursor:pointer">
                                                <p style="font-size:14px;color:#71B2EF">编辑</p>
                                                <image style="width:13px;height:14px;margin-left:9px" src="image/pulldown_btn.png">
                                            </div>
                                        </div>
                                        <div id="imageimage11" style="display:none">
                                            <div style="display:flex;justify-content:space-between;width:670px">
                                                <div style="display:flex">
                                                    <img id="preview_photo" src="images/`+ result.rows[0].pictures + `" style="width:150px;height:150px">
                                                    <p style="width:80px;height:30px;background:#71B2EF;color:white;text-align:center;line-height:30px;border-radius:4px;margin-left:20px" id="clickclick">上传头像</p>
                                                    <input type="file" accept=".png,.jpeg,.jpg" class="`+ result.rows[0].pictures + `" id="photoFile" style="display: none;" onchange="upload()">
                                                </div>
                                                <div id="shouqishouqi" style="display:flex;cursor:pointer">
                                                    <p style="font-size:14px;color:#71B2EF;margin-right:10px">收起</p>    
                                                    <img style="width:13px;height:14px" src="image/pullup_btn.png">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="coach-manage-addone-flexthree-blockone"><p class="flexthree-blockone-pone">昵称</p><div id="areaborder"><input id="area" autocomplete="off" value="`+ result.rows[0].nickName + `"/></div><div class="flexthree-blockone-inputtwo"><span id="text-count">0</span>/7</div></div>
                                    <div class="coach-manage-addone-flexthree-blockthree">
                                        <p class="flexthree-blockthree-pone">工作性质</p>
                                        <span class="select_wrap">
                                            <select name="visitstatus" id="kcgl-body-gzxz" style="cursor: pointer;">
                                                <option value="1">全职</option>
                                                <option value="2">兼职</option>
                                            </select>
                                            <em class="triangle_border_down2"></em>
                                        </span>
                                    </div>
                                    <div class="coach-manage-addone-flexthree-blocktwo">
                                        <p class="flexthree-blocktwo-pone">个人标签</p>
                                        <p class="flexthree-blocktwo-pfour" id="coach-tag">1111111</p>
                                        <p class="flexthree-blocktwo-pthree" id="tianjia1">添加</p>
                                    </div>
                                    <div class="coach-manage-addone-flexthree-blocktwo">
                                        <p class="flexthree-blocktwo-pone">上牌课程</p>
                                        <p class="flexthree-blocktwo-pfive" id="coach-course"></p>
                                        <p class="flexthree-blocktwo-pthree" id="tianjia2">添加</p>
                                    </div>
                                    <div class="coach-manage-addone-flexthree-blocktwo" style="margin-bottom:100px">
                                        <p class="flexthree-blocktwo-pone">个人简介</p>
                                        <textarea class="flexthree-blocktwo-psix" id="coach-introduce" style="resize:none">`+ $.trim(result.rows[0].introduce) + `</textarea>
                                    </div>
                                </div>
                                <div class="coach-manage-addone-flexfour">
                                    <p id="coach-manage-addone-flexfour-save">保存</p>
                                    <p id="coach-manage-addone-flexfour-quxiao">取消</p>
                                </div>
                            </div>
                        `

                $(".course-coach-manage-add").html(stradd)

                if(result.rows[0].jobCategory == 1){
                    $('#kcgl-body-gzxz').find('option[value="1"]').prop("selected", true);
                }else if(result.rows[0].jobCategory == 2){
                    $('#kcgl-body-gzxz').find('option[value="2"]').prop("selected", true);
                }

                tjgrbq()

                kcbqqqxr(list)

                kcdqq(list)

                jlckjs()

                $('#clickclick').click(function () {
                    $("#photoFile").click()
                })

                $('#imageimage1').click(function () {
                    $('#imageimage').hide()
                    $('#imageimage11').show()
                })

                $('#shouqishouqi').click(function () {
                    $('#imageimage').show()
                    $('#imageimage11').hide()
                })

                $('#tianjia1').click(function () {
                    $('.course-coach-manage-add1').css('opacity', 1)
                    $('.course-coach-manage-addtwo').css('z-index', 999)
                    $('.coach-manage-addtwo-flexthree').css('z-index', 999)

                })

                $('#tianjia2').click(function () {
                    $('.course-coach-manage-add2').css('opacity', 1)
                    $('.course-coach-manage-addthree').css('z-index', 999)
                    $('.coach-manage-addthree-flexthree').css('z-index', 999)
                })

                //编辑员工的点击叉关闭窗口
                $('#addone-flexone-chacha').click(function () {
                    $(this).parent().parent().hide()
                })

                //编辑员工的点击取消关闭窗口
                $('#coach-manage-addone-flexfour-quxiao').click(function () {
                    $(this).parent().parent().hide()
                })

                //点击保存修改事件
                $('#coach-manage-addone-flexfour-save').click(function(){
                    jldbjbc()
                })
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText)
            }
        })
    }

    //教练查看中的个人标签
    function grbqjkc(){
        
        //console.log($('#addtwo-flexfour').html())

        var straddtags1 = '';

        for (var i = 0; i < $('#addtwo-flexfour').children().length; i++) {
            if ($('#addtwo-flexfour').children().eq(i).hasClass('active')) {
                straddtags1 += `  
                <p class="blocktwo-pfour-p `+ $('#addtwo-flexfour').children().eq(i).attr('class').split(' ')[1] + `">
                    `+ $('#addtwo-flexfour').children().eq(i).html() + `
                    <a><img src="./image/classdel_btn.png" alt=""></img></a>
                </p>`
            }
        }

        $('.flexthree-blocktwo-pfour').html(straddtags1)

        //第一个删除添加窗口的标签
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

    }

    //教练查看中的课程标签
    function grbqjkc1(){

        var straddtags2 = '';

        //添加窗口第二个标签栏

        for (var i = 0; i < $('.addthree-flexfour').length; i++) {
            for (var j = 0; j < $('.addthree-flexfour').eq(i).children().length; j++) {
                if ($('.addthree-flexfour').eq(i).children().eq(j).hasClass('active1')) {
                    straddtags2 += `  
                            <p class="blocktwo-pfive-p `+ $('.addthree-flexfour').eq(i).children().eq(j).attr('class').split(' ')[1] + `">
                                `+ $('.addthree-flexfour').eq(i).children().eq(j).html() + `
                                <a><img src="./image/classdel_btn.png" alt=""></img></a>
                            </p>`
                }
            }
        }

        $('.flexthree-blocktwo-pfive').html(straddtags2)

        //第二个删除添加窗口标签
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
    }

    //添加个人标签框及课程
    function tjgrbq(){
        var straddsmall1 = `
                        <div class="course-coach-manage-addtwo">
                            <div class="coach-manage-addtwo-flexone">
                                <div class="coach-manage-addtwo-flextwo">
                                    <img src="./image/tags_icon.png" alt="">
                                    <p>添加个人标签（多选）</p>
                                </div>
                                <img id="addtwo-flexone-chacha" style="width:1.25rem;height:1.25rem" src="./image/popupclose_btn.png" alt="">
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
        var straddsmall2 = `
                        <div class="course-coach-manage-addthree">
                            <div class="coach-manage-addthree-flexone">
                                <div class="coach-manage-addthree-flextwo">
                                    <img src="./image/tags_icon.png" alt="">
                                    <p>添加个人标签（多选）</p>
                                </div>
                                <img id="addthree-flexone-chacha" style="width:1.25rem;height:1.25rem" src="./image/popupclose_btn.png" alt="">
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
    }

    //个人标签的请求及渲染
    function kcbqqqxr(list){
        var paramstkCoachIabel = {
            typeCode: "tkCoachIabel"
        }

        $.ajax({
            type: 'POST',
            contentType: "application/json;charset=UTF-8",
            url: "rest/wx/dictionnary/getdictionnarylist",
            data: JSON.stringify(paramstkCoachIabel),
            success: function (result) {
                // console.log(list)
                console.log(result)
                var ad_ft = ''
                $.each(result.rows, function (i, item) {
                    ad_ft += `
                                <div class="flexthree-tags `+ item.dictionaryId + `">
                                    `+ item.name + `
                                </div>
                            `
                })
                $('.addtwo-flexfour').html(ad_ft)

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

                for (var i = 0; i < result.rows.length; i++) {
                    for (var j = 0; j < list.rows.length; j++) {
                        for (var z = 0; z < list.rows[j].coachTagList.length; z++) {
                            if (result.rows[i].name == list.rows[j].coachTagList[z].name) {
                                $('.addtwo-flexfour').children().eq(i).click()
                            }
                        }

                    }
                }
                setTimeout(() => {
                    grbqjkc()
                }, 50);
                

            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText)
            }
        })
    }

    //课程的请求及渲染
    function kcdqq(list){
        var ad_ft1 = '';

        $.ajax({
            type: 'GET',
            contentType: "application/json;charset=UTF-8",
            url: "rest/leagueCurriculum/getReleaseLeagueCurriculumListGroupByType",
            success: function (results) {
                //console.log(results)
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
                $('#coach-manage-addthree-flexthree-list').html(ad_ft1)

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

                for (var i = 0; i < result.length; i++) {
                    for (var j = 0; j < result[i].children.length; j++) {
                        for (var y = 0; y < list.rows.length; y++) {
                            for (var z = 0; z < list.rows[y].coachSkillList.length; z++) {
                                if (result[i].children[j].name == list.rows[y].coachSkillList[z].leagueCurriculumName) {
                                    //$('#coach-manage-addthree-flexthree-list').children().eq(i).children('.addthree-flexfour').eq(j).click()
                                    //console.log($('#coach-manage-addthree-flexthree-list').children().eq(i).children('.addthree-flexfour').eq(j).html())
                                    $('#coach-manage-addthree-flexthree-list').children().eq(i).children('.addthree-flexfour').children().eq(j).click()
                                }
                            }
                        }
                    }
                }
                
                setTimeout(() => {
                    grbqjkc1()
                }, 50);
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText)
            }
        })

    }

    //教练查看js
    function jlckjs(){
        // $("#area").on("input propertychange", function () {
        //     var $this = $(this),
        //         _val = $this.val(),
        //         count = "";
        //     // if (_val.length > 7) {
        //     //     $this.val(_val.substring(0, 7));
        //     // }
        //     count = $this.val().length;
        //     $("#text-count").text(count);
        // });
        $("#area").on("input propertychange", function () {
            var $this = $(this),
                _val = $this.val(),
                count = "";
            count = $this.val().length;
            $("#text-count").text(count);
        });
        $('#area').blur(function(){
            var $this = $(this),
                _val = $this.val(),
                count = "";
            if (_val.length > 7) {
                $this.val(_val.substring(0, 7));
            }
            count = $this.val().length;
            $("#text-count").text(count);
        })

        //点击添加标签窗口的叉关闭窗口
        $('#addtwo-flexone-chacha').click(function () {
            $('.course-coach-manage-add1').css('opacity', 0)

        })

        $('#flexfour-flex-pone').click(function () {
            $('.course-coach-manage-add1').css('opacity', 0)
            $('.course-coach-manage-addtwo').css('z-index', -10)
            setTimeout(() => {
                grbqjkc()
            }, 50);
        })

        $('#flexfour-flex-ptwo').click(function () {
            $('.course-coach-manage-add1').css('opacity', 0)

        })

        //点击添加标签窗口的叉关闭窗口
        $('#addthree-flexone-chacha').click(function () {
            $('.course-coach-manage-add2').css('opacity', 0)

        })

        $('#flexfour-flex-pthree').one('click', function () {
            $('.course-coach-manage-add2').css('opacity', 0)
            $('.course-coach-manage-addthree').css('z-index', -10)

            setTimeout(() => {
                grbqjkc1()
            }, 50);
        })

        $('#flexfour-flex-pfour').click(function () {
            $('.course-coach-manage-add2').css('opacity', 0)

        })


    }

    //教练的编辑保存
    function jldbjbc(){

        if($('#preview_photo').attr('src') == ''){
            alert('请选择图片')
            return;
        }

        if($('#area').val() == ''){
            alert('请输入昵称')
            return;
        }

        if($('#coach-tag').html() == ''){
            alert('请选择个人标签')
            return;
        }

        if($('#coach-course').html() == ''){
            alert('请选择上牌课程')
            return;
        }

        if($('#coach-introduce').val() == ''){
            alert('请填写个人简介')
            return;
        }

        var TagList = []
        var SkillList = []

        for (var i = 0; i < $('#coach-tag').children().length; i++) {
            TagList.push({ dictionaryId: $('#coach-tag').children().eq(i).attr('class').split(' ')[1] })
        }

        for (var j = 0; j < $('#coach-course').children().length; j++) {
            SkillList.push({ leagueCurriculumId: $('#coach-course').children().eq(j).attr('class').split(' ')[1] })
        }
        // SkillList.push({ leagueCurriculumId:'8f7f4a7d-9cdd-43e8-afce-b6374572a9d0' })

        var jobCategory = ''

        if ($('#kcgl-body-gzxz').val() == 1) {
            jobCategory = 1
        } else {
            jobCategory = 2
        }

        // console.log(TagList)
        // console.log(SkillList)

        var paramcoach = {
            id: $('#coach-userid').attr('class').split(' ')[1],
            nickName: $('#areaborder').children().val(),
            jobCategory: jobCategory,
            introduce: $.trim($('#coach-introduce').val()),
            coachTagList: TagList,
            coachSkillList: SkillList,
            pictures: $('#photoFile').attr('class')
        }
        console.log(paramcoach)

        $.ajax({
            type: 'POST',
            url: "rest/leagueCoach/updateLeagueCoach",
            contentType: "application/json",  //multipart/form-data;boundary=--xxxxxxx   application/json,
            data: JSON.stringify(paramcoach),
            success: function (result) {
                if (result.message !== '修改成功!') {
                    $('.course-coach-manage-addone').hide()
                    alert(result.message)
                    return;
                } else if (result.message == '修改成功!') {
                    alert(result.message)
                    shoye()
                }
            },
            error: function (e) {
                console.log(e.status);
                console.log(e.responseText)
            }
        })
    }

</script>

</html>