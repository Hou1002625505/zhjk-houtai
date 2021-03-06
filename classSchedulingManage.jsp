﻿<%@ page language="java" contentType="text/html; charset=utf-8"
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
    <title>中航健身会-课程表</title>
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo.css">
    <link rel="stylesheet" type="text/css" href="easyui/pagination.css" />

    <link rel="stylesheet" type="text/css" href="easyui/themes/datepicker.css" />
     <link rel="stylesheet" type="text/css" href="../../css/jquery.mloading.css"/>
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script src="../easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
    <script type="text/javascript" src="easyui/moment.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
<script src="../../js/jquery.mloading.js" type="text/javascript" charset="utf-8"></script>
<script src="../../js/jquery.jqprint-0.3.js" type="text/javascript" charset="utf-8"></script>
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

        .liuyi-flex {
            display: flex;
            align-items: center;
            height:auto;
            flex-wrap: wrap;
        }
    
        .liuyi-flex .liuyi-input {
            margin-left: 20px;
            margin-right:33px;
        }
    
        .liuyi .liuyi-table {
            margin-top: 30px
        }
    
        .liuyi .liuyi-table table tr th {
            border: 1px solid #BFBFBF;
            border-left: none;
            height: 40px;
            font-size: 14px;
            box-sizing: border-box;
            font-weight: 0;
        }
    
        .liuyi .liuyi-table table tr th:nth-child(1) {
            border-left: 1px solid #BFBFBF;
            display: flex;
            position: relative;
            justify-content: space-between;
        }
    
        .liuyi .liuyi-table table tr td {
            border: 1px solid #BFBFBF;
            border: none;
            text-align: center;
            background: #F5F5F5;
            box-sizing: border-box;
            padding: 0 10px 10px 0;
        }
    
        .liuyi .liuyi-table table tr td:last-child {
            border-right: 1px solid #BFBFBF;
        }
    
        .liuyi .liuyi-table table tr:nth-child(2) td {
            padding-top: 10px
        }
    
        .liuyi-table .bias {
            width: 160px;
            height: 1px;
            background: #BFBFBF;
            transform: rotate(193.3deg);
            position: absolute;
            left: -2px;
            top: 18px
        }
    
        .liuyi-table .bias-left {
            margin-left: 5px;
            margin-bottom: 5px;
            font-size: 16px;
            display: flex;
            align-items: flex-end;
        }
    
        .liuyi-table .bias-right {
            margin-right: 5px;
            margin-top: 5px;
            font-size: 16px
        }
    
        .liuyi-table .liuyi-white {
            width: 228px;
            height: 130px;
            background: white;
        }

        .liuyi .liuyi-flex .liuyi-flex-right{
            display:flex;
                margin-bottom: 15px;
    margin-top: 15px;
        }

        .liuyi-flex .liuyi-flex-right .liuyi-flex-right-p{
            width:120px;
            height:46px;
            border-radius: 4px;
            background:#F5F5F5;
            margin-left:15px;
            font-size:16px;
            display:flex;
            justify-content: center;
            align-items: center;
            /*padding:0 18px 0 18px;*/
            box-sizing: border-box;
            cursor: pointer;
        }

        .liuyi-flex-right-p1{
            width:100px;
            height:46px;
            border-radius: 4px;
            background:#FAA262;
            color:white;
            margin-left:10px;
            font-size:18px;
            display:flex;
            justify-content: center;
            align-items: center;
            padding:0 18px 0 18px;
            box-sizing: border-box;
        }

        .select_wrap {
			position: relative;
		}

        #sj-body-zt{
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

        .bias-left {
            margin-left: 5px;
            margin-bottom: 5px;
            font-size: 16px;
            display: flex;
            align-items: flex-end;
        }

        /* .bias {
            background-image: url(image/xiexian.png);
            width:100px;
            height:50px
        } */

        .bias-right {
            text-align: right;
            margin-right: 5px;
            margin-top: 5px;
            font-size: 16px
        }

        .table-body th {
			font-size: 14px;
			color: #444444;
			height: 40px;
            border: 1px dotted #CCCCCC;
		}

        .table-body tr td {
			font-size: 14px;
			color: #444444;
			height: 40px;
			text-align: center;
			border-left: 1px dotted #CCCCCC;
			border-bottom: 1px dotted #CCCCCC
		}

        .table-body tr td:last-child {
			border-right: 1px dotted #CCCCCC;
		}

        .item1{
            width:8.229167%
        }

        .item2{
            width:25%
        }

        .item3{
            width:11.875%
        }
        .qrcode{
        	font-size:16px;
        	text-align: center;
        	margin-left: 15px;
        	color:rgba(113,178,239,1);
        	cursor: pointer;
        }
.qrcode img{
	width: 20px;
}
.msk{
	position: fixed;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background-color: #F7F7F7;
	    overflow-y: auto;
	display: none;
}
.msk .back{
	font-size:16px;
color:rgba(113,178,239,1);
	padding: 20px;
	padding-bottom: 0;
	cursor: pointer;
}
.msk .QRcode{
	width:812px;
	min-height: 1145px;
background:rgba(255,255,255,1);
box-shadow:0px 0px 14px 0px rgba(204,204,204,0.3);
margin: 15px 0 0 50px;
margin-bottom: 50px;
float: left;
}
.QRcode{
	padding-bottom: 30px;
}
.QRcode::-webkit-scrollbar {
  display: none;
}
.QRcode {
   scrollbar-width: none;
}
/* 兼容IE10+ */
.QRcode {
    -ms-overflow-style: none;
}
.shopname{
    padding: 15px 0;
	text-align: center;
}
.shopname span{
	display: block;
}
.shopname .name{
	font-size:30px;
color:rgba(68,68,68,1);
margin-bottom: 10px;
}
.shopname .time{
	font-size:20px;
color:rgba(68,68,68,1);
}
.thirdcode{
	/*border-bottom:1px dashed rgba(213,213,215,1);*/
	padding: 0 10px;
	overflow: hidden;
}
.thirdcode .code{
	width: 254px;
	float: left;
	margin-right: 15px;
 text-align: center;
}
.thirdcode .code:nth-child(3n+3){
	margin-right: 0;
}
.thirdcode .code .codeimg{
	width:254px;
height:254px;
border:1px solid rgba(213,213,215,1);
}
.thirdcode .code .codeimg img{
	width: 100%;
	height: 100%;
}
.thirdcode .code .time{
	font-size:24px;
color:rgba(68,68,68,1);
margin:  15px 0;
}
.msk .print{
	width:120px;
height:46px;
line-height: 46px;
text-align: center;
background:rgba(113,178,239,1);
border-radius:4px;
font-size:24px;
color:rgba(255,255,255,1);
    margin-left: 25px;
    margin-top: 15px;
float: left;
cursor: pointer;
}
.line{
	    width: 100%;
    float: left;
    height: 1px;
    border-bottom: 1px dashed rgba(213,213,215,1);
    margin-bottom: 50px;
}
    </style>
</head>

<body>
    <div class="liuyi">
        <div class="liuyi-flex">
            <p style="font-size:16px;margin-right:20px">上课门店</p>
            <span class="select_wrap">
                <select name="visitstatus" id="sj-body-zt" style="cursor:pointer">

                </select>
                <em class="triangle_border_down1"></em>
            </span>
            <div class="liuyi-flex-right"></div>
            <p class="liuyi-flex-right-p1" id="liuyi-flex-right-p22" style="cursor: pointer;">上一周</p>
            <p class="liuyi-flex-right-p1" id="liuyi-flex-right-p11" style="cursor: pointer;">下一周</p>
            <div class="qrcode" id="qrcode">
            	<img src="../../images/self-helpfitnessqrcode_icon.png"/>
            <div>
            	生成自助健身码
            </div>
            </div>
        </div>
        <table style='border-collapse: collapse;width: 100%;table-layout:fixed;margin-top:20px'>
            <tbody class="table-body" id="sj-body-body1">
                
            </tbody>
        </table>
    </div>
    <!--二维码生成-->
   
    <div class="msk">
    		<div class="back" id="back" onclick="back()">返回上一级</div>
    		   <!--startprint-->
    	<div class="QRcode">
    	 <div class="shopname">
    	 	<span class="name" id="ername"></span>
    	<span class="time" id="ertime"></span>
    	 </div>
    	 <div id="datacode">
    	  <div class="thirdcode" id="thirdcode">
    	   <!--<div class="code">
    	   	<div class="codeimg">
    	   	<img src="../../images/xcxcode.jpg"/>
    	   	</div>
    	   	<div class="time">10:00-11:30</div>
    	   </div>
    	      <div class="code">
    	   	<div class="codeimg">
    	   	<img src="../../images/xcxcode.jpg"/>
    	   	</div>
    	   	<div class="time">10:00-11:30</div>
    	   </div>
    	     <div class="code">
    	   	<div class="codeimg">
    	   	<img src="../../images/xcxcode.jpg"/>
    	   	</div>
    	   	<div class="time">10:00-11:30</div>
    	   </div>-->
    	  </div>
    	 </div>
    	</div>
    	<!--endprint-->
    	<div class="print" onclick="doPrint()">打印</div>
    </div>


</body>
<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>

<script type="text/javascript">
    
var weekweek = 0;
var courseData=[];
$('#liuyi-flex-right-p11').click(function(){
    var storeId = $('#sj-body-zt').val()

    if (storeId == '') {
        return;
    }

    weekweek++
    var list = {
        storeId: storeId,
        week: weekweek
    }
$("body").mLoading(); 
    $.ajax({
        url: 'rest/classScheduling/selectGroupByCourseSchedulingList',
        type: 'POST',
        contentType: 'application/json;charset=UTF-8',
        data: JSON.stringify(list),
        success: function (result) {
        	     	courseData=result.rows;
 $(".mloading").removeClass("active")
            var liuyitime = ''

            $.each(result.rows, function (i, item) {
                liuyitime += `
                    <p class="liuyi-flex-right-p" data-time=`+ item.dateStr  +'(' + item.whatDayStr + ')'+ `>`+ item.monthDayStr + '(' + item.whatDayStr + ')' + `</p>
                `
            })

            $('.liuyi-flex-right').html(liuyitime)

            bgxr(result)

        },
        error: function (e) {
        	 $(".mloading").removeClass("active")
            console.log(e.status)
        }
    })
})

    $('#liuyi-flex-right-p22').click(function () {
        var storeId = $('#sj-body-zt').val()

        if (storeId == '') {
            return;
        }

        weekweek--
        var list = {
            storeId: storeId,
            week: weekweek
        }
$("body").mLoading(); 
        $.ajax({
            url: 'rest/classScheduling/selectGroupByCourseSchedulingList',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(list),
            success: function (result) {
            	courseData=result.rows;
 $(".mloading").removeClass("active")
                var liuyitime = ''

                $.each(result.rows, function (i, item) {
                    liuyitime += `
                    <p class="liuyi-flex-right-p"  data-time=`+ item.dateStr  +'(' + item.whatDayStr + ')' + `>`+ item.monthDayStr + '(' + item.whatDayStr + ')' + `</p>
                `
                })

                $('.liuyi-flex-right').html(liuyitime)

                bgxr(result)

            },
            error: function (e) {
            	 $(".mloading").removeClass("active")
                console.log(e.status)
            }
        })
    })

skfjxlcd()

//上课门店下拉菜单
function skfjxlcd(){
    $.ajax({
        url: 'rest/club/getClubInfo',
        type: 'GET',
        dataType: 'json',
        success: function (result) {
            console.log(result)

            var liuyistr = `<option value="" selected="selected">全部</option>`

            $.each(result.rows,function (i,item){
                liuyistr += ` 
                     <option value="`+ item.clubId + `">` + item.clubName + `</option>
                `
            })
            
            $('#sj-body-zt').html(liuyistr)

            $('#sj-body-zt').find('option[value="16"]').prop("selected", true);

            mdsjxzxr()
        },
        error: function (msg) {
            console.log(msg)
        }
    })
}

//门店时间选择渲染
function mdsjxzxr(){

  

    $('#sj-body-zt').change()
}
  $('#sj-body-zt').change(function(){
console.log(111)
        var storeId = $('#sj-body-zt').val()

        if(storeId == ''){
            return;
        }

        var list = {
            storeId: storeId,
            week: 0
        }
$("body").mLoading();
        $.ajax({
            url: 'rest/classScheduling/selectGroupByCourseSchedulingList',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(list),
            success: function (result) {
            	     	courseData=result.rows;
              $(".mloading").removeClass("active")
                var liuyitime = ''

                $.each(result.rows, function (i, item) {
                    liuyitime += `
                    <p class="liuyi-flex-right-p"  data-time=`+ item.dateStr   +'(' + item.whatDayStr + ')'+ `>`+ item.monthDayStr + '(' + item.whatDayStr + ')' + `</p>
                `
                })

                $('.liuyi-flex-right').html(liuyitime)

                bgxr(result)

            },
            error: function (e) {
            	           $(".mloading").removeClass("active")
                console.log(e.status)
            }
        })
    })
//表格渲染
function bgxr(result){

    

    function panduan(i, j) {
        var str
        if (i == '') {
            return str = ''
        } else if (i.length < j + 1) {
            return str = ''
        } else {
            return str = i[j].roomName
        }
    }

    function content(i, j, k, h) {
        var data = new Date()
        var str
        if (i == '') {
            return str = ''
        } else if (i.children.length < j + 1) {
            return str = ''
        } else if (!i.children[j].children[k].children) {
            return str = ''
        } else if (i.children[j].children[k].children.length < h + 1) {
            return str = ''
        } else {
            // console.log(i.children[j].children[k].timeStr.split('-')[1])
            // console.log(data.getHours()+ ':' + data.getMinutes())
            if(Number(i.monthDayStr.split('-')[0]) < (data.getMonth() + 1) || Number(i.monthDayStr.split('-')[0]) == (data.getMonth() + 1) && Number(i.monthDayStr.split('-')[1]) < data.getDate()){
                return str = `<div class="scdata" data-time=`+i.children[j].children[k].children[h].timeStr+` data-id=`+i.children[j].children[k].children[h].id+`><p style="font-size:0.8rem;color:#BFBFBF">` + i.children[j].children[k].children[h].leagueCurriculumName + `<p><br><p style="font-size:0.8rem;color:#BFBFBF">` + i.children[j].children[k].children[h].timeStr + `<p><br><p style="font-size:0.8rem;color:#BFBFBF">` + i.children[j].children[k].children[h].courseSchedulingItemList[0].realName + `</p></div>`
            }
            else if(Number(i.monthDayStr.split('-')[0]) == (data.getMonth() + 1) && Number(i.monthDayStr.split('-')[1]) == data.getDate() && Number(i.children[j].children[k].timeStr.split('-')[1].split(':')[0]) < data.getHours() || Number(i.monthDayStr.split('-')[0]) == (data.getMonth() + 1) && Number(i.monthDayStr.split('-')[1]) == data.getDate() && Number(i.children[j].children[k].timeStr.split('-')[1].split(':')[0]) == data.getHours() && Number(i.children[j].children[k].timeStr.split('-')[1].split(':')[1]) < data.getMinutes()){
                return str = `<div class="scdata" data-time=`+i.children[j].children[k].children[h].timeStr+`  data-id=`+i.children[j].children[k].children[h].id+`><p style="font-size:0.8rem;color:#BFBFBF">` + i.children[j].children[k].children[h].leagueCurriculumName + `<p><br><p style="font-size:0.8rem;color:#BFBFBF">` + i.children[j].children[k].children[h].timeStr + `<p><br><p style="font-size:0.8rem;color:#BFBFBF">` + i.children[j].children[k].children[h].courseSchedulingItemList[0].realName + `</p></div>`
            }else{
                return str = `<div class="scdata" data-time=`+i.children[j].children[k].children[h].timeStr+`  data-id=`+i.children[j].children[k].children[h].id+`><p style="font-size:0.8rem;">` + i.children[j].children[k].children[h].leagueCurriculumName + `<p><br><p style="font-size:0.8rem;">` + i.children[j].children[k].children[h].timeStr + `<p><br><p style="font-size:0.8rem">` + i.children[j].children[k].children[h].courseSchedulingItemList[0].realName + `</p></div>`
            }
            
        }
        
    }

    $('.liuyi-flex-right-p').click(function () {
        console.log(result)
        $(this).parent().children('.liuyi-flex-right-p').css('background', '#F5F5F5')
        $(this).parent().children('.liuyi-flex-right-p').css('color', 'black')

        $(this).css('background', '#71B2EF')
        $(this).css('color', 'white')

        for (var i = 0; i < result.rows.length; i++) {
            if ($(this).html().split('(')[0] == result.rows[i].monthDayStr) {
                var tablestr1 = `
                    <tr>
                    <th class="item1" style="position:relative;background-image:url(image/xiexian.png);background-size: 100% 100%;"><p class="bias-right">房间</p><p class="bias"></p><p class="bias-left">时间</p></th>
                `
                for(var j=0;j< result.rows[i].children.length;j++){
                    if(j< result.rows[i].children.length){
                        tablestr1 += `
                            <th class="item2" colspan="2">`+ panduan(result.rows[i].children, j) + `</th>
                        `
                    }else if(j == result.rows[i].children.length){
                        tablestr1 += `
                            <th class="item2" colspan="2">`+ panduan(result.rows[i].children, j) + `</th>
                        </tr>
                        `
                    }
                }

                tablestr1 +=`
                    <tr style="height:130px">
                    <td rowspan="2" class="item1" style="background:white;border-top:none;font-size:18px">
                        上午
                        <br>
                        <br>
                        8:00-11:59
                    </td>
                `

                for(var q = 0; q < result.rows[i].children.length; q++){
                    if(q < result.rows[i].children.length){
                        tablestr1 +=`
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], q, 0, 0) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], q, 0, 1) + `</div>
                            </td>
                        `
                    }else if(q == result.rows[i].children.length){
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], q, 0, 0) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], q, 0, 1) + `</div>
                            </td>
                            </tr>
                        `
                    }
                }

                tablestr1 +=`
                    <tr style="height:130px">
                `

                for (var w = 0; w < result.rows[i].children.length; w++) {
                    if (w < result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 0, 2) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 0, 3) + `</div>
                            </td>
                        `
                    } else if (w == result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 0, 2) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 0, 3) + `</div>
                            </td>
                            </tr>
                        `
                    }
                }

                 tablestr1 +=`
                    <tr style="height:130px">
                    <td rowspan="4" class="item1" style="background:white;border-top:none;font-size:18px">
                        下午
                        <br>
                        <br>
                        12:00-17:59
                    </td>
                 `

                 for (var w = 0; w < result.rows[i].children.length; w++) {
                    if (w < result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 0) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 1) + `</div>
                            </td>
                        `
                    } else if (w == result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 0) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 1) + `</div>
                            </td>
                            </tr>
                        `
                    }
                }

                tablestr1 +=`
                    <tr style="height:130px">
                `
                
                for (var w = 0; w < result.rows[i].children.length; w++) {
                    if (w < result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 2) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 3) + `</div>
                            </td>
                        `
                    } else if (w == result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 2) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 3) + `</div>
                            </td>
                            </tr>
                        `
                    }
                }

                tablestr1 += `
                    <tr style="height:130px">
                `

                for (var w = 0; w < result.rows[i].children.length; w++) {
                    if (w < result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 4) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 5) + `</div>
                            </td>
                        `
                    } else if (w == result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 4) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 5) + `</div>
                            </td>
                            </tr>
                        `
                    }
                }

                tablestr1 += `
                    <tr style="height:130px">
                `

                for (var w = 0; w < result.rows[i].children.length; w++) {
                    if (w < result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 6) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 7) + `</div>
                            </td>
                        `
                    } else if (w == result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 6) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 1, 7) + `</div>
                            </td>
                            </tr>
                        `
                    }
                }

                tablestr1 +=`
                 <tr style="height:130px">
                    <td rowspan="4" class="item1" style="background:white;border-top:none;font-size:18px">
                        晚上
                        <br>
                        <br>
                        18:00-21:30
                    </td>
                `

                for (var w = 0; w < result.rows[i].children.length; w++) {
                    if (w < result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 2, 0) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 2, 1) + `</div>
                            </td>
                        `
                    } else if (w == result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 2, 0) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 2, 1) + `</div>
                            </td>
                            </tr>
                        `
                    }
                }

                tablestr1 += `
                    <tr style="height:130px">
                `

                for (var w = 0; w < result.rows[i].children.length; w++) {
                    if (w < result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 2, 2) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 2, 3) + `</div>
                            </td>
                        `
                    } else if (w == result.rows[i].children.length) {
                        tablestr1 += `
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 2, 2) + `</div>
                            </td>
                            <td class="item3">
                                <div class="liuyi-white">`+ content(result.rows[i], w, 2, 3) + `</div>
                            </td>
                            </tr>
                        `
                    }
                }

                $('#sj-body-body1').html(tablestr1)

                if(result.rows[i].children == ''){
                    $('#sj-body-body1').html('')
                }
            }
        }

    })

    if((new Date().getMonth() + 1) > 10){
        var strmonth = (new Date().getMonth() + 1)
    }else{
        var strmonth = '0'+ (new Date().getMonth() + 1)
    }

    if(new Date().getUTCDate() > 10){
        var strdate = new Date().getUTCDate()
    }else{
        var strdate = '0'+ new Date().getUTCDate()
    }

    for(var j=0;j< $('.liuyi-flex-right-p').length;j++){
        if(strmonth +'-'+ strdate == $('.liuyi-flex-right-p').eq(j).html().split('(')[0]){
            $('.liuyi-flex-right-p').eq(j).click()
        }
    }

}
var codeNum=1;
$("#qrcode").on("click",function(){
	 codeNum=1;
	 if($(".scdata").length==0){
	 	alert('无课程');
	 	return;
	 }
	$(".msk").show();
	$("#ername").text($("#sj-body-zt").find("option:selected").text())
	 $(".liuyi-flex-right .liuyi-flex-right-p").each(function(){
//	 	console.log($(this).css("color"))
	 	if($(this).css("color")=='rgb(255, 255, 255)'){
	 		$("#ertime").text($(this).attr("data-time"))
	 	}
	 })
	   $("#thirdcode").html("");
	   	$("body").mLoading();  
	setTimeout(function(){
	
		   $(".scdata").each(function(item,index){
	   	var that=$(this);
	   	 $.ajax({
            url: 'rest/wx/login/getXcxCode?sence='+$(this).attr("data-id")+"&page=pages/successfully/successfully",
            type: 'get',
            async: false,
            contentType: 'application/json;charset=UTF-8',
            success: function (res) {
                   console.log(res)
               
                   var str='<div class="code">'+
    	   	'<div class="codeimg">'+
    	   	'<img src="data:image/png;base64,'+res.code+'"/>'+
    	   	'</div>'+
    	   	'<div class="time">'+that.attr("data-time")+'</div>'+
    	   '</div>';
    	   if(codeNum%3==0){
    	   	str+='<div class="line"></div>';
    	   }
    	    
    	   $("#thirdcode").append(str);
    	   
    	   if(codeNum==$(".scdata").length){
    	   	   $(".mloading").removeClass("active")
    	   	   console.log(3223)
    	   	   if($(".code").length%3!=0){
    	   		var strs='<div class="line"></div>';
    	   		  $("#thirdcode").append(strs);
    	   }
    	   }
    	      codeNum+=1;
    	
            },
            error: function (e) {
                console.log(e.status)
            }
        })
	   })
	},50)
	
})
function getXcxCode(id){
	 $.ajax({
            url: 'rest/wx/login/getXcxCode?sence='+id+"&page=pages/successfully/successfully",
            type: 'get',
            contentType: 'application/json;charset=UTF-8',
            success: function (res) {
                   console.log(res)
                   codeNum+=1;
                   var str='<div class="code">'+
    	   	'<div class="codeimg">'+
    	   	'<img src="data:image/png;base64,'+res.code+'"/>'+
    	   	'</div>'+
    	   	'<div class="time">10:00-11:30</div>'+
    	   '</div>';
    	   $("#thirdcode").append(str)
    	   if(codeNum<=$(".scdata").length){
    	   	getXcxCode();
    	   }else{
    	   	codeNum=1;
    	   }
            },
            error: function (e) {
                console.log(e.status)
            }
        })
}
	
  function back(){
  	$(".msk").hide();
  }
  function aa(){
	$("#ddd").jqprint();
}

    function doPrint() {
        bdhtml = window.document.body.innerHTML;//获取当前页的html代码
                sprnstr = "<!--startprint-->";//设置打印开始区域
                eprnstr = "<!--endprint-->";//设置打印结束区域
//   document.getElementsByTagName('body')[0].style.zoom=0.8;
                prnhtml = bdhtml.substring(bdhtml.indexOf(sprnstr) + 18); //从开始代码向后取html

                prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));//从结束代码向前取html
$("#back").hide();
$(".print").hide();
 $('.QRcode').css({
		"box-shadow": "none",
		"position": "absolute",
			"left": "50%",
				"margin-left": "-406px"
	});
//                window.document.body.innerHTML = prnhtml;
                window.print();
$("#back").show();
$(".print").show()
 $('.QRcode').css({
		"box-shadow": "0px 0px 14px 0px rgba(204,204,204,0.3)",
		"position": "initial",
			"left": "initial",
				"margin-left": "initial",
				"margin":'15px 0 0 50px'
	});
//                window.document.body.innerHTML = bdhtml;;
//   document.getElementsByTagName('body')[0].style.zoom=1
    }
</script>

</html>