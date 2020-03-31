<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>

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
    <script src="easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="easyui/moment.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>

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

        * {
            padding: 0;
            margin: 0
        }
    
        .course-anaylse-header {
            display: flex
        }
    
        .course-anaylse-header #course-anaylse-header-pone {
            width: 100px;
            height: 30px;
            border-radius: 4px 0 0 0;
            text-align: center;
            line-height: 30px;
            border: 1px solid #BFBFBF;
            background: #71B2EF;
            border-bottom: 0;
            box-sizing: border-box;
            font-size:16px;
            color:white
        }
    
        .course-anaylse-header #course-anaylse-header-ptwo {
            width: 100px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            border-top: 1px solid #BFBFBF;
            background: #F5F5F5;
            box-sizing: border-box;
            font-size:16px;
        }
    
        .course-anaylse-header #course-anaylse-header-pthree {
            width: 100px;
            height: 30px;
            border-radius: 0 4px 0 0;
            text-align: center;
            line-height: 30px;
            border: 1px solid #BFBFBF;
            border-bottom: 0;
            background: #F5F5F5;
            box-sizing: border-box;
            font-size:16px;
        }
    
        .course-anaylse-header #course-anaylse-header-pfour {
            width: 100px;
            height: 30px;
            border-radius: 0 4px 0 0;
            text-align: center;
            line-height: 30px;
            border: 1px solid #BFBFBF;
            border-bottom: 0;
            background: #F5F5F5;
            box-sizing: border-box;
            font-size:16px;
        }

        .course-anaylse-nav {
            height: 1px;
            background: #BFBFBF;
            padding: 0 30px 0 20px
        }
    
        .course-anaylse-search {
            display: flex;
            align-items: center;
            margin-top: 20px
        }

        .course-anaylse-search .course-anaylse-search-inputone {
            width: 120px;
            height: 30px;
            border: 1px solid #BFBFBF;
            border-radius: 4px;
            margin-left: 21px;
            margin-right: 7px;
            font-size: 12px;
            line-height: 30px;
            padding-left: 11px;
            box-sizing: border-box;
        }
    
        .course-anaylse-search .course-anaylse-search-inputtwo {
            width: 120px;
            height: 30px;
            border: 1px solid #BFBFBF;
            border-radius: 4px;
            margin-left: 7px;
            font-size: 12px;
            line-height: 30px;
            padding-left: 11px;
            box-sizing: border-box;
        }
    
        .course-anaylse-button {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }
    
        .course-anaylse-button .course-anaylse-button-flex {
            display: flex
        }
    
        .course-anaylse-button-flex #course-anaylse-pone {
            width: 80px;
            height: 30px;
            color: white;
            border-radius: 4px;
            background: #71B2EF;
            text-align: center;
            line-height: 30px;
            font-size:16px
        }
    
        .course-anaylse-button-flex #course-anaylse-ptwo {
            width: 80px;
            height: 30px;
            border-radius: 4px;
            text-align: center;
            line-height: 30px;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            margin-left: 15px;
            font-size:16px
        }
    
        .course-anaylse-button #course-anaylse-pthree {
            width: 80px;
            height: 30px;
            border-radius: 4px;
            text-align: center;
            line-height: 30px;
            box-sizing: border-box;
            background: #71B2EF;
            color: white;
            font-size:16px;
            margin-right:36px
        }
        .footer-flex{
            display:flex;
            margin-top:20px
        }

        .course-anaylse-search-selectthree{
            width:200px;
            height:30px;
            border:1px solid #BFBFBF;
            border-radius: 4px;
            line-height: 30px;
            margin:0 40px 0 22px
        }

        .select_wrap {
			position: relative;
		}

        #sj-body-md {
			width: 200px;
			height: 30px;
			border: 1px solid #d5d5d7;
			border-radius: 4px;
			font-size: 14px;
			padding-left:13px;
			box-sizing: border-box;
			-webkit-appearance: none
		}

        #sj-body-md1 {
			width: 200px;
			height: 30px;
			border: 1px solid #d5d5d7;
			border-radius: 4px;
			font-size: 14px;
			padding-left:13px;
			box-sizing: border-box;
			-webkit-appearance: none
		}

        #sj-body-kcfl {
			width: 200px;
			height: 30px;
			border: 1px solid #d5d5d7;
			border-radius: 4px;
			font-size: 14px;
			padding-left:13px;
			box-sizing: border-box;
			-webkit-appearance: none
		}

        .triangle_border_down1 {
			display: inline-block;
			width: 0;
			height: 0;
			border-width: 8px 5px 0;
			border-style: solid;
			border-color: #BFBFBF transparent transparent;
			position: absolute;
			right: 5px;
			top: 11px;
		}

        .table-body1 th {
            font-size: 14px;
            color: #444444;
            height: 40px;
            text-align: center;
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

        .table-body1 tr td:last-child {
            border-right: 1px dotted #CCCCCC;

        }

        .item1{
            width:2.5%
        }

        .item2{
            width:13.0208%
        }

        .item3{
            width:8.85416%
        }

        .item4{
            width:6.09375%
        }

        .item5{
            width:5%
        }

        .item6{
            width:7.552%
        }

        .item7{
            width:4.0104%
        }

        .item8{
            width:13.125%
        }

        #jlxm{
            
        }

        .c-datepicker-date-table td.disabled .cell,
		.c-datepicker-month-table td.disabled .cell,
		.c-datepicker-year-table td.disabled .cell {
			text-decoration: none;
		}
    </style>
</head>

<body>
    <div class="course-anaylse-header">
        <div id="course-anaylse-header-pone" class="1" style="cursor: pointer;">课程分析</div>
        <div id="course-anaylse-header-ptwo" style="cursor: pointer;">学员分析</div>
        <div id="course-anaylse-header-pthree" style="cursor: pointer;">教练分析</div>
        <div id="course-anaylse-header-pfour" style="cursor: pointer;">课程明细</div>
    </div>
    <div class="course-anaylse-nav"></div>
    <div class="course-anaylse-search" id="qlg">
        <p style="font-size:16px;margin-right:20px">上课门店</p>
        <span class="select_wrap">
            <select name="visitstatus" id="sj-body-md" style="cursor: pointer;">

            </select>
            <em class="triangle_border_down1"></em>
        </span>
        <p style="font-size:16px;margin-right:20px;margin-left:39px">课程分类</p>
        <span class="select_wrap">
            <select name="visitstatus" id="sj-body-kcfl" style="cursor: pointer;">
        
            </select>
            <em class="triangle_border_down1"></em>
        </span>
        <p style="font-size:16px;margin-left:39px">课程名称</p>
        <div class="course-anaylse-search-selectthree" style="overflow: hidden;">
            <input id="kcmc" type="text" style="width:200px;height:30px;border:0;"/>
        </div>
        <p style="font-size:16px">日期范围</p>
        <div class="J-datepicker-day" id="startTime">
            <input type="text" class="course-anaylse-search-inputone" id="ksrq" placeholder="开始日期">
        </div>
        <p>-</p>
        <div class="J-datepicker-day" id="endTime">
            <input type="text" class="course-anaylse-search-inputtwo" id="jsrq" placeholder="结束日期">
        </div>
    </div>

    <div class="course-anaylse-search" id="zhy" style="display:none">
        <p style="font-size:16px;margin-right:20px">上课门店</p>
        <span class="select_wrap">
            <select name="visitstatus" id="sj-body-md1">
        
            </select>
            <em class="triangle_border_down1"></em>
        </span>
        <p style="font-size: 16px;margin-left:39px;margin-right:20px">教练姓名</p>
        <div class="course-anaylse-search-selectthree" style="overflow: hidden;width:120px;margin:0">
            <input id="jlxm" type="text" style="width:120px;height:30px;border:0;" />
        </div>
        <p style="font-size: 16px;margin-left:39px;margin-right:20px">教练工号</p>
        <div class="course-anaylse-search-selectthree" style="overflow: hidden;width:120px;margin:0">
            <input id="jlgh" type="text" style="width:120px;height:30px;border:0;" onkeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
        </div>
        <p style="font-size:16px;margin-left:39px">日期范围</p>
        <div class="J-datepicker-day" id="startTime1">
            <input type="text" class="course-anaylse-search-inputone" id="ksrq1" placeholder="开始日期">
        </div>
        <p>-</p>
        <div class="J-datepicker-day" id="endTime1">
            <input type="text" class="course-anaylse-search-inputtwo" id="jsrq1" placeholder="结束日期">
        </div>
    </div>

    <div class="course-anaylse-button">
        <div class="course-anaylse-button-flex">
            <p id="course-anaylse-pone" style="cursor: pointer;">查询</p>
            <p id="course-anaylse-ptwo" style="cursor: pointer;">清除</p>
        </div>
        <p id="course-anaylse-pthree" style="cursor: pointer;">导出数据</p>
    </div>
    <table style='border-collapse: collapse;width: 100%;table-layout:fixed;margin-top:20px'>
        <tbody class="table-body1" id="sj-body-body1">
    
        </tbody>
    </table>

    <div class="footer-flex">
        <div class="count"></div>
        <div class="box" id="boxpage" style="margin-top:0;margin-left:30px"></div>
    </div>
    
</body>

<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>

<script type="text/javascript">

    var oldTime = "";
    oldTime = $("#ksrq").val();
    var oldTime1 = "";
        oldTime1 = $("#ksrq1").val();
    var day2 = new Date();
    day2.setTime(day2.getTime());
    var s2 = day2.getFullYear() + "-" + (day2.getMonth() + 1 < 10 ? "0" + (day2.getMonth() + 1) : day2.getMonth() + 1) + "-" + (day2.getDate() < 10 ? "0" + day2.getDate() : day2.getDate());
    function fun_date(aa) {
            var date1 = new Date();
            //time1 = date1.getFullYear() + "-" + (date1.getMonth() + 1) + "-" + date1.getDate();//time1表示当前时间
            var date2 = new Date(date1);
            date2.setDate(date1.getDate() + aa);
            var time2 = date2.getFullYear() + "-" + (date2.getMonth() + 1 < 10?'0'+(date2.getMonth() + 1):(date2.getMonth() + 1)) + "-" + date2.getDate();
            return time2
        }
    var s3 = fun_date(-7)
    $('#ksrq').val(s3)
    $('#jsrq').val(s2)
    $('#ksrq1').val(s3)
    $('#jsrq1').val(s2)

    $('#startTime').datePicker({
            hasShortcut: false,
            format: 'YYYY-MM-DD',
            max: s2,
            hide: function () {
                if (oldTime != $("#ksrq").val()) {
                    $("#jsrq").val('')
                }
                oldTime = $("#ksrq").val();
                sy()
            }
        });
    
    $('#startTime1').datePicker({
            hasShortcut: false,
            format: 'YYYY-MM-DD',
            max: s2,
            hide: function () {
                if (oldTime1 != $("#ksrq1").val()) {
                    $("#jsrq1").val('')
                }
                oldTime1 = $("#ksrq1").val();
                sy1()
            }
        });

    $("#endTime").on("click", function () {
            if ($("#ksrq").val() == '') {
                alert("请选择开始时间")
                $('.c-datepicker-picker').hide();
            }
        })

    $("#endTime1").on("click", function () {
            if ($("#ksrq1").val() == '') {
                alert("请选择开始时间")
                $('.c-datepicker-picker').hide();
            }
        })

    function sy() {
            var maxTime = "";
            var day2 = new Date();
            day2.setTime(day2.getTime());
            var s2 = day2.getFullYear() + "-" + (day2.getMonth() + 1 < 10 ? "0" + (day2.getMonth() + 1) : day2.getMonth() + 1) + "-" + (day2.getDate() < 10 ? "0" + day2.getDate() : day2.getDate());
            //		alert(s2)
            var t = new Date($("#ksrq").val());
            var iToDay = t.getDate();
            var iToMon = t.getMonth();
            var iToYear = t.getFullYear();
            var newDay = new Date(iToYear, iToMon, (iToDay + 30));
            var hthird = newDay.getFullYear() + "-" + ((newDay.getMonth() + 1) < 10 ? "0" + (newDay.getMonth() + 1) : newDay.getMonth() + 1) + "-" + (newDay.getDate() < 10 ? "0" + newDay.getDate() : newDay.getDate());
            var thetime = hthird;
            var d = new Date(Date.parse(thetime.replace(/-/g, "/")));
            var curDate = day2;
            if (d <= curDate) {
                maxTime = thetime;
            } else {
                maxTime = s2;
            }

            $("#endTime").datePicker({
                hasShortcut: false,
                format: 'YYYY-MM-DD',
                min: $("#ksrq").val(),
                max: maxTime
            });
        }
    
    function sy1() {
            var maxTime = "";
            var day2 = new Date();
            day2.setTime(day2.getTime());
            var s2 = day2.getFullYear() + "-" + (day2.getMonth() + 1 < 10 ? "0" + (day2.getMonth() + 1) : day2.getMonth() + 1) + "-" + (day2.getDate() < 10 ? "0" + day2.getDate() : day2.getDate());
            //		alert(s2)
            var t = new Date($("#ksrq1").val());
            var iToDay = t.getDate();
            var iToMon = t.getMonth();
            var iToYear = t.getFullYear();
            var newDay = new Date(iToYear, iToMon, (iToDay + 30));
            var hthird = newDay.getFullYear() + "-" + ((newDay.getMonth() + 1) < 10 ? "0" + (newDay.getMonth() + 1) : newDay.getMonth() + 1) + "-" + (newDay.getDate() < 10 ? "0" + newDay.getDate() : newDay.getDate());
            var thetime = hthird;
            var d = new Date(Date.parse(thetime.replace(/-/g, "/")));
            var curDate = day2;
            if (d <= curDate) {
                maxTime = thetime;
            } else {
                maxTime = s2;
            }

            $("#endTime1").datePicker({
                hasShortcut: false,
                format: 'YYYY-MM-DD',
                min: $("#ksrq1").val(),
                max: maxTime
            });
        }

    $('#course-anaylse-header-pone').click(function () {
        $('#course-anaylse-header-pthree').css('background', '#F5F5F5')
        $('#course-anaylse-header-pthree').css('color', 'black')
        $('#course-anaylse-header-ptwo').css('background', '#F5F5F5')
        $('#course-anaylse-header-ptwo').css('color', 'black')
        $('#course-anaylse-header-pfour').css('background', '#F5F5F5')
        $('#course-anaylse-header-pfour').css('color', 'black')
        $('#course-anaylse-header-pone').css('background', '#71B2EF')
        $('#course-anaylse-header-pone').css('color', 'white')
        $(this).addClass('1')
        $('#course-anaylse-header-ptwo').removeClass('1')
        $('#course-anaylse-header-pthree').removeClass('1')
        $('#course-anaylse-header-pfour').removeClass('1')
        $('#qlg').show()
        $('#zhy').hide()

        $('#ksrq').val(s3)
        $('#jsrq').val(s2)
        $('#ksrq1').val(s3)
        $('#jsrq1').val(s2)

        $('#course-anaylse-pone').unbind()
        $('#course-anaylse-pone').click(function () {
            if ($('.course-anaylse-header').children().eq(0).hasClass('1')) {

                if ($('#ksrq').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                dygbgxr()
            } else if ($('.course-anaylse-header').children().eq(1).hasClass('1')) {

                if ($('#ksrq').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                degbgxr()
            } else if ($('.course-anaylse-header').children().eq(2).hasClass('1')) {

                if ($('#ksrq1').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq1').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                dsgbgxr()
            }
            else if ($('.course-anaylse-header').children().eq(3).hasClass('1')) {

                if ($('#ksrq1').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq1').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                dssgbgxr()
            }
        })
        $('#course-anaylse-pone').click()
        
    })

    $('#course-anaylse-header-ptwo').click(function () {
        $('#course-anaylse-header-pthree').css('background', '#F5F5F5')
        $('#course-anaylse-header-pthree').css('color', 'black')
        $('#course-anaylse-header-pone').css('background', '#F5F5F5')
        $('#course-anaylse-header-pone').css('color', 'black')
        $('#course-anaylse-header-pfour').css('background', '#F5F5F5')
        $('#course-anaylse-header-pfour').css('color', 'black')
        $('#course-anaylse-header-ptwo').css('background', '#71B2EF')
        $('#course-anaylse-header-ptwo').css('color', 'white')
        $(this).addClass('1')
        $('#course-anaylse-header-pone').removeClass('1')
        $('#course-anaylse-header-pthree').removeClass('1')
        $('#course-anaylse-header-pfour').removeClass('1')
        $('#qlg').show()
        $('#zhy').hide()

        $('#ksrq').val(s3)
        $('#jsrq').val(s2)
        $('#ksrq1').val(s3)
        $('#jsrq1').val(s2)

        $('#course-anaylse-pone').unbind()
        $('#course-anaylse-pone').click(function () {
            if ($('.course-anaylse-header').children().eq(0).hasClass('1')) {

                if ($('#ksrq').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                dygbgxr()
            } else if ($('.course-anaylse-header').children().eq(1).hasClass('1')) {

                if ($('#ksrq').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                degbgxr()
            } else if ($('.course-anaylse-header').children().eq(2).hasClass('1')) {

                if ($('#ksrq1').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq1').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                dsgbgxr()
            }
            else if ($('.course-anaylse-header').children().eq(3).hasClass('1')) {

                if ($('#ksrq1').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq1').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                dssgbgxr()
            }
        })
        $('#course-anaylse-pone').click()
        
    })

    $('#course-anaylse-header-pthree').click(function () {
        $('#course-anaylse-header-pone').css('background', '#F5F5F5')
        $('#course-anaylse-header-pone').css('color', 'black')
        $('#course-anaylse-header-ptwo').css('background', '#F5F5F5')
        $('#course-anaylse-header-ptwo').css('color', 'black')
        $('#course-anaylse-header-pfour').css('background', '#F5F5F5')
        $('#course-anaylse-header-pfour').css('color', 'black')
        $('#course-anaylse-header-pthree').css('background', '#71B2EF')
        $('#course-anaylse-header-pthree').css('color', 'white')
        $(this).addClass('1')
        $('#course-anaylse-header-pone').removeClass('1')
        $('#course-anaylse-header-ptwo').removeClass('1')
        $('#course-anaylse-header-pfour').removeClass('1')
        $('#course-anaylse-pthree').show()
        $('#qlg').hide()
        $('#zhy').show()

        $('#ksrq').val(s3)
        $('#jsrq').val(s2)
        $('#ksrq1').val(s3)
        $('#jsrq1').val(s2)

        $('#course-anaylse-pone').unbind()
        $('#course-anaylse-pone').click(function () {
            if ($('.course-anaylse-header').children().eq(0).hasClass('1')) {

                if ($('#ksrq').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                dygbgxr()
            } else if ($('.course-anaylse-header').children().eq(1).hasClass('1')) {

                if ($('#ksrq').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                degbgxr()
            } else if ($('.course-anaylse-header').children().eq(2).hasClass('1')) {

                if ($('#ksrq1').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq1').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                dsgbgxr()
            }
            else if ($('.course-anaylse-header').children().eq(3).hasClass('1')) {

                if ($('#ksrq1').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq1').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                dssgbgxr()
            }
        })
        $('#course-anaylse-pone').click()
        
    })

    $('#course-anaylse-header-pfour').click(function(){
        $('#course-anaylse-header-pthree').css('background', '#F5F5F5')
        $('#course-anaylse-header-pthree').css('color', 'black')
        $('#course-anaylse-header-pone').css('background', '#F5F5F5')
        $('#course-anaylse-header-pone').css('color', 'black')
        $('#course-anaylse-header-ptwo').css('background', '#F5F5F5')
        $('#course-anaylse-header-ptwo').css('color', 'black')
        $('#course-anaylse-header-pfour').css('background', '#71B2EF')
        $('#course-anaylse-header-pfour').css('color', 'white')
        $(this).addClass('1')
        $('#course-anaylse-header-pone').removeClass('1')
        $('#course-anaylse-header-pthree').removeClass('1')
        $('#course-anaylse-header-pthree').removeClass('1')
        $('#qlg').hide()
        $('#zhy').show()

        $('#ksrq').val(s3)
        $('#jsrq').val(s2)
        $('#ksrq1').val(s3)
        $('#jsrq1').val(s2)

        $('#course-anaylse-pone').unbind()
        $('#course-anaylse-pone').click(function () {
            if ($('.course-anaylse-header').children().eq(0).hasClass('1')) {

                if ($('#ksrq').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                dygbgxr()
            } else if ($('.course-anaylse-header').children().eq(1).hasClass('1')) {

                if ($('#ksrq').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                degbgxr()
            } else if ($('.course-anaylse-header').children().eq(2).hasClass('1')) {

                if ($('#ksrq1').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq1').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                dsgbgxr()
            }
            else if ($('.course-anaylse-header').children().eq(3).hasClass('1')) {

                if ($('#ksrq1').val() == '') {
                    alert('请选择开始时间')
                    return;
                }

                if ($('#jsrq1').val() == '') {
                    alert('请选择结束时间')
                    return;
                }

                dssgbgxr()
            }
        })
        $('#course-anaylse-pone').click()
    })

    $('#course-anaylse-pone').click(function(){
        if($('.course-anaylse-header').children().eq(0).hasClass('1')){

            if($('#ksrq').val() == ''){
                alert('请选择开始时间')
                return;
            }

            if($('#jsrq').val() == ''){
                alert('请选择结束时间')
                return;
            }

            dygbgxr()
        }else if($('.course-anaylse-header').children().eq(1).hasClass('1')){

            if ($('#ksrq').val() == '') {
                alert('请选择开始时间')
                return;
            }

            if ($('#jsrq').val() == '') {
                alert('请选择结束时间')
                return;
            }

            degbgxr()
        }else if($('.course-anaylse-header').children().eq(2).hasClass('1')){

            if ($('#ksrq1').val() == '') {
                alert('请选择开始时间')
                return;
            }

            if ($('#jsrq1').val() == '') {
                alert('请选择结束时间')
                return;
            }

            dsgbgxr()
        }
        else if ($('.course-anaylse-header').children().eq(3).hasClass('1')) {

            if ($('#ksrq1').val() == '') {
                alert('请选择开始时间')
                return;
            }

            if ($('#jsrq1').val() == '') {
                alert('请选择结束时间')
                return;
            }

            dssgbgxr()
        }
    })

    $('#course-anaylse-ptwo').click(function(){

        $('#sj-body-md').find('option[value=""]').prop("selected", true);

        $('#sj-body-md1').find('option[value=""]').prop("selected", true);

        $('#sj-body-kcfl').find('option[value=""]').prop("selected", true);
        
        $('#kcmc').val('')

        $('#ksrq').val('')

        $('#jsrq').val('')

        $('#jlxm').val('')

        $('#jlgh').val('')

        $('#ksrq1').val('')

        $('#jsrq1').val('')

        if ($('.course-anaylse-header').children().eq(0).hasClass('1')) {
            dygbgxr()
        } else if ($('.course-anaylse-header').children().eq(1).hasClass('1')) {
            degbgxr()
        } else if ($('.course-anaylse-header').children().eq(2).hasClass('1')) {
            dsgbgxr()
        }
        else if ($('.course-anaylse-header').children().eq(3).hasClass('1')) {
            dssgbgxr()
        }
    })

    $('#course-anaylse-pthree').click(function(){
        
        if($('.course-anaylse-header').children().eq(0).hasClass('1')){
            var storeId = $('#sj-body-md').val()
            var classifyId = $('#sj-body-kcfl').val()
            var leagueCurriculumName = $('#kcmc').val()
            var startDate = $('#ksrq').val()
            var endDate = $('#jsrq').val()

            location.href = 'rest/curriculumAnalyze/exportCurriculumAnalyze?storeId=' + storeId + '&classifyId=' + classifyId + '&leagueCurriculumName=' + leagueCurriculumName + '&startDate=' + startDate + '&endDate=' + endDate
        
        }else if($('.course-anaylse-header').children().eq(1).hasClass('1')){
            var storeId = $('#sj-body-md').val()
            var classifyId = $('#sj-body-kcfl').val()
            var leagueCurriculumName = $('#kcmc').val()
            var startDate = $('#ksrq').val()
            var endDate = $('#jsrq').val()

            location.href = 'rest/curriculumAnalyze/exportStudentAnalyze?storeId=' + storeId + '&classifyId=' + classifyId + '&leagueCurriculumName=' + leagueCurriculumName + '&startDate=' + startDate + '&endDate=' + endDate
        }else if($('.course-anaylse-header').children().eq(2).hasClass('1')){
            var storeId = $('#sj-body-md1').val()
            var realName = $('#jlxm').val()
            var userName = $('#jlgh').val()
            var startDate = $('#ksrq1').val()
            var endDate = $('#jsrq1').val()

            location.href = 'rest/curriculumAnalyze/exportCoachAnalyze?storeId=' + storeId + '&realName=' + realName + '&userName=' + userName + '&startDate=' + startDate + '&endDate=' + endDate
            
        } else if ($('.course-anaylse-header').children().eq(3).hasClass('1')){
            var storeId = $('#sj-body-md1').val()
            var realName = $('#jlxm').val()
            var userName = $('#jlgh').val()
            var startDate = $('#ksrq1').val()
            var endDate = $('#jsrq1').val()

            location.href = 'rest/ curriculumAnalyze/exportCourseSchedulingDetail?storeId=' + storeId + '&realName=' + realName + '&userName=' + userName + '&startDate=' + startDate + '&endDate=' + endDate
        }

        
    })

    $('#course-anaylse-pone').click()
//time()

mdxlxr()

kcflxlxr()

dygbgxr()

//时间
// function time() {
//         $('.J-datepicker-day').datePicker({
//             hasShortcut: true,
//             format: 'YYYY-MM-DD',
//             shortcutOptions: [{
//                 name: '今天',
//                 day: '0'
//             }, {
//                 name: '昨天',
//                 day: '-1'
//             }, {
//                 name: '一周前',
//                 day: '-7'
//             }]
//         });

//         function fchatitylist() {
//             intoPages = 1;
//             visititylist();
//         }

//         function visititylist() {
//             var status = $("#visitstatus").val();
//             var conditionName = '';//顾问姓名
//             var startDate = $("#selectDate1").val();
//             var endDate = $("#selectDate2").val();
//             //var club = $("#clubId").val();
//             var fangcusname = $("#fangcusname").val();
//             var fangmobile = $("#fangmobile").val();
//             if (startDate != '') {
//                 if (endDate == '') {
//                     alert("请选择结束日期");
//                     return;
//                 }
//             }
//         }


//         function getDay(day) {

//             var today = new Date();



//             var targetday_milliseconds = today.getTime() + 1000 * 60 * 60 * 24 * day;



//             today.setTime(targetday_milliseconds); //注意，这行是关键代码



//             var tYear = today.getFullYear();

//             var tMonth = today.getMonth();

//             var tDate = today.getDate();

//             tMonth = doHandleMonth(tMonth + 1);

//             tDate = doHandleMonth(tDate);

//             return tYear + "-" + tMonth + "-" + tDate;

//         }

//         function doHandleMonth(month) {

//             var m = month;

//             if (month.toString().length == 1) {

//                 m = "0" + month;

//             }

//             return m;

//         }
//     }

//门店下拉渲染
function mdxlxr(){
    $.ajax({
        url: 'rest/club/getClubInfo',
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            var pulishmendian = `<option value="" selected="selected">全部</option>`
            $.each(data.rows, function (i, item) {
                pulishmendian += `
                    <option value="`+ item.clubId + `">` + item.clubName + `</option>
                `
            })
            $('#sj-body-md').html(pulishmendian)
            $('#sj-body-md1').html(pulishmendian)
        },
        error: function (msg) {
            console.log(msg)
        }
    })
}

//课程分类下拉渲染
function kcflxlxr(){
    var courselist = {
        typeCode: "GroupType"
    }
    //课程列表渲染
    $.ajax({
        url: 'rest/wx/dictionnary/getdictionnarylist',
        type: 'POST',
        contentType: 'application/json;charset=UTF-8',
        data: JSON.stringify(courselist),
        success: function (result) {
            var coursestr = `<option value="" selected="selected">全部</option>`
            $.each(result.rows, function (i, item) {
                coursestr += `
                    <option value="` + item.dictionaryId + `">` + item.name + `</option>
                `
            })
            $('#sj-body-kcfl').html(coursestr)
        },
        error: function (e) {
            console.log(e.status)
        }
    })
}

//第一个表格渲染
function dygbgxr(){
    var onPagechange = function (page) {
        console.log(page)
        aaaaaa(page)
    }

    var page = 1;
    aaaaaa(page)

    function aaaaaa(page) {

        var storeId = $('#sj-body-md').val()
        var classifyId = $('#sj-body-kcfl').val()
        var leagueCurriculumName = $('#kcmc').val()
        var startDate = $('#ksrq').val()
        var endDate = $('#jsrq').val()

        var list = {
            page: page,
            rows: 15,
            storeId: storeId,
            classifyId: classifyId,
            leagueCurriculumName : leagueCurriculumName,
            startDate : startDate,
            endDate : endDate
        }

        $.ajax({
            url: 'rest/curriculumAnalyze/selectCurriculumAnalyzeList',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(list),
            success: function (result) {
                console.log(result)

                var tablestr;
                tablestr = `
                        <tr style="background:#f8fafb">
                            <th class="item1">序号</th>
                            <th class="item2">课程类型</th>
                            <th class="item2">课程编号</th>
                            <th class="item2">课程名称</th>
                            <th class="item3">发布数量</th>
                            <th class="item3">预约总人次</th>
                            <th class="item3">签到总人次</th>
                            <th class="item3">签到率</th>
                            <th class="item3">满员率</th>
                        </tr>
                `
                
                if (result.rows.length == 0) {
                    $('.table-body1').html(tablestr)
                }

                $.each(result.rows, function (i, item) {
                    tablestr += `
                        <tr>
                            <td class="item1">`+ (i + 1) + `</td>
                            <td class="item2">`+ item.classifyName + `</td>
                            <td class="item2">`+ item.code + `</td>
                            <td class="item2">`+ item.name + `</td>
                            <td class="item3">`+ item.releaseCount + `</td>
                            <td class="item3">`+ item.subscribeCount + `</td>
                            <td class="item3">`+ item.signCount + `</td>
                            <td class="item3">`+ item.signRateStr+ `</td>
                            <td class="item3">`+ item.fullStarffedRateStr +`</td>
                        </tr>
                    `
                    $('.table-body1').html(tablestr)

                    $('.table-body1').children().mouseover(function () {
                        $(this).children('td').css('background', '#faa262')
                        $(this).children('td').css('color', 'white')
                    })

                    $('.table-body1').children().mouseout(function () {
                        $(this).children('td').css('background', '#ffffff')
                        $(this).children('td').css('color', '#444444')
                    })

                    var obj = {
                        wrapid: 'boxpage', //页面显示分页器容器id
                        total: result.total, //总条数
                        pagesize: 15, //每页显示10条
                        currentPage: page, //当前页
                        onPagechange: onPagechange,
                        btnCount:5 //页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                    }

                    pagination.init(obj);

                    var str3
                    str3 = `
                        <p style="font-size:16px">共`+ result.total + `条，每页` + list.rows + `条</p>
                    `
                    $('.count').html(str3)
                })
            
                
            },
            error: function (e) {
                console.log(e.status)
            }
        })

    }
}

//第二个表格渲染
function degbgxr(){
    var onPagechange = function (page) {
        console.log(page)
        aaaaaa(page)
    }

    var page = 1;
    aaaaaa(page)

    function aaaaaa(page) {
        var storeId = $('#sj-body-md').val()
        var classifyId = $('#sj-body-kcfl').val()
        var leagueCurriculumName = $('#kcmc').val()
        var startDate = $('#ksrq').val()
        var endDate = $('#jsrq').val()

        var list = {
            page: page,
            rows: 15,
            storeId: storeId,
            classifyId: classifyId,
            leagueCurriculumName: leagueCurriculumName,
            startDate: startDate,
            endDate: endDate
        }

        $.ajax({
            url: 'rest/curriculumAnalyze/selectStudentAnalyzeList',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(list),
            success: function (result) {
                console.log(result)
                var tablestr;
                tablestr = `
                    <table border="0" cellspacing="0" cellpadding="0">
                        <tr style="background:#f8fafb">
                            <th class="item1" style="border:1px solid #CCCCCC" rowspan="2">序号</th>
                            <th class="item4" style="border:1px solid #CCCCCC;border-left:none" rowspan="2">课程类型</th>
                            <th class="item5" style="border:1px solid #CCCCCC;border-left:none" rowspan="2">课程编号</th>
                            <th class="item6" style="border:1px solid #CCCCCC;border-left:none" rowspan="2">课程名称</th>
                            <th style="width:12.1354%;border:1px solid #CCCCCC;border-left:none" colspan="3">性别</th>
                            <th style="width:20.2604%;border:1px solid #CCCCCC;border-left:none" colspan="5">上课频次</th>
                            <th style="width:32.4479%;border:1px solid #CCCCCC;border-left:none" colspan="8">年龄</th>
                        </tr>
                        <tr style="background:#f8fafb">
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">男</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">女</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">未知</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">1-3次</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">4-10次</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">10-20次</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">20-30次</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">30次以上</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">20以下</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">20-24</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">25-30</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">31-40</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">41-50</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">51-60</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">60以上</th>
                            <th class="item7" style="border:1px solid #CCCCCC;border-left:none;border-top:none">未知</th>
                        </tr>

                `

                if (result.rows.length == 0) {
                    $('.table-body1').html(tablestr)
                }

                $.each(result.rows, function (i, item) {
                    tablestr += `
                            <tr>
                                <td class="item1">`+ (i + 1) + `</td>
                                <td class="item4">`+ item.classifyName + `</td>
                                <td class="item5">`+ item.code + `</td>
                                <td class="item6">`+ item.name + `</td>
                                <td class="item7">`+ item.sexList[0] + `</td>
                                <td class="item7">`+ item.sexList[1] + `</td>
                                <td class="item7">`+ item.sexList[2] + `</td>
                                <td class="item7">`+ item.classFrequencyList[0] + `</td>
                                <td class="item7">`+ item.classFrequencyList[1] + `</td>
                                <td class="item7">`+ item.classFrequencyList[2] + `</td>
                                <td class="item7">`+ item.classFrequencyList[3] + `</td>
                                <td class="item7">`+ item.classFrequencyList[4] + `</td>
                                <td class="item7">`+ item.ageList[0] + `</td>
                                <td class="item7">`+ item.ageList[1] + `</td>
                                <td class="item7">`+ item.ageList[2] + `</td>
                                <td class="item7">`+ item.ageList[3] + `</td>
                                <td class="item7">`+ item.ageList[4] + `</td>
                                <td class="item7">`+ item.ageList[5] + `</td>
                                <td class="item7">`+ item.ageList[6] + `</td>
                                <td class="item7">`+ item.ageList[7] + `</td>
                            </tr>
                        `
                    $('.table-body1').html(tablestr)

                    $('.table-body1').children().mouseover(function () {
                        $(this).children('td').css('background', '#faa262')
                        $(this).children('td').css('color', 'white')
                    })

                    $('.table-body1').children().mouseout(function () {
                        $(this).children('td').css('background', '#ffffff')
                        $(this).children('td').css('color', '#444444')
                    })

                    var obj = {
                        wrapid: 'boxpage', //页面显示分页器容器id
                        total: result.total, //总条数
                        pagesize: 15, //每页显示10条
                        currentPage: page, //当前页
                        onPagechange: onPagechange,
                        btnCount:5 //页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                    }

                    pagination.init(obj);

                    var str3
                    str3 = `
                                            <p style="font-size:16px">共`+ result.total + `条，每页` + list.rows + `条</p>
                                        `
                    $('.count').html(str3)
                })
            },
            error: function (e) {
                console.log(e.status)
            }
        })

    }
}

//第三个表格渲染
function dsgbgxr(){
    var onPagechange = function (page) {
        console.log(page)
        aaaaaa(page)
    }

    var page = 1;
    aaaaaa(page)

    function aaaaaa(page) {

        var storeId = $('#sj-body-md1').val()
        var realName = $('#jlxm').val()
        var userName = $('#jlgh').val()
        var startDate = $('#ksrq1').val()
        var endDate = $('#jsrq1').val()

        var list = {
            page: page,
            rows: 15,
            storeId : storeId,
            realName : realName,
            userName : userName,
            startDate : startDate,
            endDate : endDate
        }

        $.ajax({
            url: 'rest/curriculumAnalyze/selectCoachAnalyzeList',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(list),
            success: function (result) {
                console.log(result)

                var tablestr;
                tablestr = `
                        <tr style="background:#f8fafb">
                            <th class="item1">序号</th>
                            <th class="item8">教练工号</th>
                            <th class="item8">教练姓名</th>
                            <th class="item8">岗位</th>
                            <th class="item3">发布课程数量</th>
                            <th class="item3">预约总人次</th>
                            <th class="item3">课程平均签到人次</th>
                            <th class="item3">签到总人次</th>
                            <th class="item3">签到率</th>
                            <th class="item3">满员率</th>
                        </tr>
                `

                function gzxz(arr) {
                    var gzxz = ''
                    if (!arr) {
                        return gzxz = ''
                    } else{
                        return arr
                    }
                    // else {
                    //     if (arr == 1) {
                    //         return gzxz = "全职"
                    //     } else {
                    //         return gzxz = "兼职"
                    //     }
                    // }
                }

                if (result.rows.length == 0) {
                    $('.table-body1').html(tablestr)
                }

                $.each(result.rows, function (i, item) {
                    tablestr += `
                        <tr>
                            <td class="item1">`+ (i + 1) + `</td>
                            <td class="item8">`+ item.userName + `</td>
                            <td class="item8">`+ item.realName + `</td>
                            <td class="item8">`+ gzxz(item.jobCategoryStr) + `</td>
                            <td class="item3">`+ item.releaseCount + `</td>
                            <td class="item3">`+ item.subscribeCount + `</td>
                            <td class="item3">`+ item.averageSignCount + `</td>
                            <td class="item3">`+ item.signCount + `</td>
                            <td class="item3">`+ item.signRateStr+ `</td>
                            <td class="item3">`+ item.fullStarffedRateStr +`</td>
                        </tr>
                    `
                    $('.table-body1').html(tablestr)

                    $('.table-body1').children().mouseover(function () {
                        $(this).children('td').css('background', '#faa262')
                        $(this).children('td').css('color', 'white')
                    })

                    $('.table-body1').children().mouseout(function () {
                        $(this).children('td').css('background', '#ffffff')
                        $(this).children('td').css('color', '#444444')
                    })

                    var obj = {
                        wrapid: 'boxpage', //页面显示分页器容器id
                        total: result.total, //总条数
                        pagesize: 15, //每页显示10条
                        currentPage: page, //当前页
                        onPagechange: onPagechange,
                        btnCount:5 //页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                    }

                    pagination.init(obj);

                    var str3
                    str3 = `
                        <p style="font-size:16px">共`+ result.total + `条，每页` + list.rows + `条</p>
                    `
                    $('.count').html(str3)
                })
            },
            error: function (e) {
                console.log(e.status)
            }
        })

    }
}

//第四个表格渲染
function dssgbgxr(){
    var onPagechange = function (page) {
        console.log(page)
        aaaaaa(page)
    }

    var page = 1;
    aaaaaa(page)

    function aaaaaa(page) {

        var storeId = $('#sj-body-md1').val()
        var realName = $('#jlxm').val()
        var userName = $('#jlgh').val()
        var startDate = $('#ksrq1').val()
        var endDate = $('#jsrq1').val()

        var list = {
            page: page,
            rows: 15,
            storeId: storeId,
            realName: realName,
            userName: userName,
            startDate: startDate,
            endDate: endDate
        }

        $.ajax({
            url: 'rest/curriculumAnalyze/selectCourseSchedulingDetailList',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(list),
            success: function (result) {
                console.log(result)

                var tablestr;
                tablestr = `
                        <tr style="background:#f8fafb">
                            <th>序号</th>
                            <th>发布课程</th>
                            <th>预约人数</th>
                            <th>签到人数</th>
                            <th>预约率</th>
                            <th>签到率</th>
                        </tr>
                `

                // function gzxz(arr) {
                //     var gzxz = ''
                //     if (!arr) {
                //         return gzxz = ''
                //     } else {
                //         return arr
                //     }
                //     // else {
                //     //     if (arr == 1) {
                //     //         return gzxz = "全职"
                //     //     } else {
                //     //         return gzxz = "兼职"
                //     //     }
                //     // }
                // }

                if (result.rows.length == 0) {
                    $('.table-body1').html(tablestr)
                }

                $.each(result.rows, function (i, item) {
                    tablestr += `
                        <tr>
                            <td>`+ (i + 1) + `</td>
                            <td>`+ item.leagueCurriculumName + `</td>
                            <td>`+ item.totalCount + `</td>
                            <td>`+ item.signCount + `</td>
                            <td>`+ item.subscribeRateStr + `</td>
                            <td>`+ item.signRateStr + `</td>
                        </tr>
                    `
                    $('.table-body1').html(tablestr)

                    $('.table-body1').children().mouseover(function () {
                        $(this).children('td').css('background', '#faa262')
                        $(this).children('td').css('color', 'white')
                    })

                    $('.table-body1').children().mouseout(function () {
                        $(this).children('td').css('background', '#ffffff')
                        $(this).children('td').css('color', '#444444')
                    })

                    var obj = {
                        wrapid: 'boxpage', //页面显示分页器容器id
                        total: result.total, //总条数
                        pagesize: 15, //每页显示10条
                        currentPage: page, //当前页
                        onPagechange: onPagechange,
                        btnCount: 5 //页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                    }

                    pagination.init(obj);

                    var str3
                    str3 = `
                        <p style="font-size:16px">共`+ result.total + `条，每页` + list.rows + `条</p>
                    `
                    $('.count').html(str3)
                })
            },
            error: function (e) {
                console.log(e.status)
            }
        })

    }
}
</script>

</html>