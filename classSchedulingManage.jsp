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

    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script src="../easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
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
        }

        .liuyi-flex .liuyi-flex-right .liuyi-flex-right-p{
            width:150px;
            height:46px;
            border-radius: 4px;
            background:#F5F5F5;
            margin-left:10px;
            font-size:18px;
            display:flex;
            justify-content: center;
            align-items: center;
            padding:0 18px 0 18px;
            box-sizing: border-box;
            cursor: pointer;
        }

        .liuyi-flex .liuyi-flex-right-p1{
            width:150px;
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
            <p class="liuyi-flex-right-p1" style="cursor: pointer;">下一周</p>
        </div>
        <table style='border-collapse: collapse;width: 100%;table-layout:fixed;margin-top:20px'>
            <tbody class="table-body" id="sj-body-body1">
                
            </tbody>
        </table>
    </div>
</body>
<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>

<script type="text/javascript">
    
var weekweek = 0 
$('.liuyi-flex-right-p1').click(function(){
    var storeId = $('#sj-body-zt').val()

    if (storeId == '') {
        return;
    }

    weekweek++
    var list = {
        storeId: storeId,
        week: weekweek
    }

    $.ajax({
        url: 'rest/classScheduling/selectGroupByCourseSchedulingList',
        type: 'POST',
        contentType: 'application/json;charset=UTF-8',
        data: JSON.stringify(list),
        success: function (result) {

            var liuyitime = ''

            $.each(result.rows, function (i, item) {
                liuyitime += `
                    <p class="liuyi-flex-right-p">`+ item.monthDayStr + '(' + item.whatDayStr + ')' + `</p>
                `
            })

            $('.liuyi-flex-right').html(liuyitime)

            bgxr(result)

        },
        error: function (e) {
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

    $('#sj-body-zt').click(function(){

        var storeId = $('#sj-body-zt').val()

        if(storeId == ''){
            return;
        }

        var list = {
            storeId: storeId,
            week: 0
        }

        $.ajax({
            url: 'rest/classScheduling/selectGroupByCourseSchedulingList',
            type: 'POST',
            contentType: 'application/json;charset=UTF-8',
            data: JSON.stringify(list),
            success: function (result) {

                var liuyitime = ''

                $.each(result.rows, function (i, item) {
                    liuyitime += `
                    <p class="liuyi-flex-right-p" >`+ item.monthDayStr + '(' + item.whatDayStr + ')' + `</p>
                `
                })

                $('.liuyi-flex-right').html(liuyitime)

                bgxr(result)

            },
            error: function (e) {
                console.log(e.status)
            }
        })
    })

    $('#sj-body-zt').click()
}

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
        var str
        if (i == '') {
            return str = ''
        } else if (i.length < j + 1) {
            return str = ''
        } else if (!i[j].children[k].children) {
            return str = ''
        } else if (i[j].children[k].children.length < h + 1) {
            return str = ''
        } else {
            return str = `<p style="font-size:0.8rem">` + i[j].children[k].children[h].leagueCurriculumName + `<p><br><p style="font-size:0.8rem">` + i[j].children[k].children[h].timeStr + `<p>`
        }
    }

    $('.liuyi-flex-right-p').click(function () {
        $(this).parent().children('.liuyi-flex-right-p').css('background', '#F5F5F5')
        $(this).parent().children('.liuyi-flex-right-p').css('color', 'black')

        $(this).css('background', '#71B2EF')
        $(this).css('color', 'white')

        for (var i = 0; i < result.rows.length; i++) {
            if ($(this).html().split('(')[0] == result.rows[i].monthDayStr) {
                var tablestr = ''
                tablestr = `
                <tr>
                    <th class="item1" style="position:relative;background-image:url(image/xiexian.png);background-size: 100% 100%;"><p class="bias-right">房间</p><p class="bias"></p><p class="bias-left">时间</p></th>
                    <th class="item2" colspan="2">`+ panduan(result.rows[i].children, 0) + `</th>
                    <th class="item2" colspan="2">`+ panduan(result.rows[i].children, 1) + `</th>
                    <th class="item2" colspan="2">`+ panduan(result.rows[i].children, 2) + `</th>
                </tr>
                <tr style="height:130px">
                    <td rowspan="2" class="item1" style="background:white;border-top:none;font-size:18px">
                        上午
                        <br>
                        <br>
                        8:00-11:59
                    </td>
                    <td class="item3" style="padding-left:10px">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 0, 0) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 0, 1) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 0, 0) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 0, 1) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 0, 0) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 0, 1) + `</div>
                    </td>
                </tr>
                <tr style="height:130px">
                    <td class="item3" style="padding-left:10px">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 0, 2) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 0, 3) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 0, 2) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 0, 3) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 0, 2) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 0, 3) + `</div>
                    </td>
                </tr>
                <tr style="height:130px">
                    <td rowspan="4" class="item1" style="background:white;border-top:none;font-size:18px">
                        下午
                        <br>
                        <br>
                        12:00-17:59
                    </td>
                    <td class="item3" style="padding-left:10px">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 1, 0) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 1, 1) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 1, 0) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 1, 1) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 1, 0) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 1, 1) + `</div>
                    </td>
                </tr>
                <tr style="height:130px">
                    <td class="item3" style="padding-left:10px">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 1, 2) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 1, 3) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 1, 2) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 1, 3) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 1, 2) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 1, 3) + `</div>
                    </td>
                </tr>
                <tr style="height:130px">
                    <td class="item3" style="padding-left:10px">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 1, 4) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 1, 5) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 1, 4) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 1, 5) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 1, 4) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 1, 5) + `</div>
                    </td>
                </tr>
                <tr style="height:130px">
                    <td class="item3" style="padding-left:10px">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 1, 6) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 1, 7) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 1, 6) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 1, 7) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 1, 6) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 1, 7) + `</div>
                    </td>
                </tr>
                <tr style="height:130px">
                    <td rowspan="4" class="item1" style="background:white;border-top:none;font-size:18px">
                        晚上
                        <br>
                        <br>
                        18:00-21:30
                    </td>
                    <td class="item3" style="padding-left:10px">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 2, 0) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 2, 1) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 2, 0) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 2, 1) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 2, 0) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 2, 1) + `</div>
                    </td>
                </tr>
                <tr style="height:130px">
                    <td class="item3" style="padding-left:10px">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 2, 2) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 0, 2, 3) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 2, 2) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 1, 2, 3) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 2, 2) + `</div>
                    </td>
                    <td class="item3">
                        <div class="liuyi-white">`+ content(result.rows[i].children, 2, 2, 3) + `</div>
                    </td>
                </tr>
        `
                $('#sj-body-body1').html(tablestr)

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

</script>

</html>