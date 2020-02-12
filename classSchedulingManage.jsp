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

    <link rel="stylesheet" href="imgui/zyUpload.css" type="text/css">
    <!-- 引用核心层插件 -->
    <script src="imgui/zyFile.js"></script>

    <!-- 引用控制层插件 -->
    <script src="imgui/zyUpload.js"></script>

    <!-- 引用初始化JS -->
    <script src="imgui/jq22.js"></script>
    
    <style>
        html{
            font-size:calc(100vw / 88.11);
        }

        * {
            padding: 0;
            margin: 0
        }

        .liuyi-flex {
            display: flex;
            align-items: center;
        }
    
        .liuyi-flex .liuyi-input {
            margin-left: 1rem;
            margin-right:1.65rem;
        }
    
        .select-menu {
            cursor: pointer;
            width: 10rem;
            height: 1.5rem;
            box-sizing: border-box;
        }
    
        .select-menu-ul {
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
            padding: 0 0.7rem;
            box-sizing: border-box;
            line-height: 1.5rem;
        }
    
        .select-menu-ul li:hover {
            background: #f2f2f2;
        }
    
        .select-menu-div {
            position: relative;
            height: 1.5rem;
            width: 10rem;
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
            width: 7rem;
            height: 1.3rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem
        }
    
        .liuyi .liuyi-table {
            margin-top: 1.5rem
        }
    
        .liuyi .liuyi-table table tr th {
            border: 1px solid #BFBFBF;
            border-left: none;
            height: 2rem;
            font-size: 0.7rem;
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
            padding: 0 0.5rem 0.5rem 0;
        }
    
        .liuyi .liuyi-table table tr td:last-child {
            border-right: 1px solid #BFBFBF;
        }
    
        .liuyi .liuyi-table table tr:nth-child(2) td {
            padding-top: 0.5rem
        }
    
        .liuyi-table .bias {
            width: 8rem;
            height: 1px;
            background: #BFBFBF;
            transform: rotate(193.3deg);
            position: absolute;
            left: -0.1rem;
            top: 0.9rem
        }
    
        .liuyi-table .bias-left {
            margin-left: 0.25rem;
            margin-bottom: 0.25rem;
            font-size: 0.8rem;
            display: flex;
            align-items: flex-end;
        }
    
        .liuyi-table .bias-right {
            margin-right: 0.25rem;
            margin-top: 0.25rem;
            font-size: 0.8rem
        }
    
        .liuyi-table .liuyi-white {
            width: 11.4rem;
            height: 6.5rem;
            background: white;
        }

        .liuyi .liuyi-flex .liuyi-flex-right{
            display:flex;
        }

        .liuyi-flex .liuyi-flex-right .liuyi-flex-right-p{
            width:7.5rem;
            height:2.3rem;
            border-radius: 0.2rem;
            background:#F5F5F5;
            margin-left:0.5rem;
            font-size:0.9rem;
            display:flex;
            justify-content: center;
            align-items: center;
            padding:0 0.9rem 0 0.9rem;
            box-sizing: border-box;
        }

        .liuyi-flex .liuyi-flex-right-p1{
            width:7.5rem;
            height:2.3rem;
            border-radius: 0.2rem;
            background:#FAA262;
            color:white;
            margin-left:0.5rem;
            font-size:0.9rem;
            display:flex;
            justify-content: center;
            align-items: center;
            padding:0 0.9rem 0 0.9rem;
            box-sizing: border-box;
        }
    </style>
</head>

<body>
    <div class="liuyi">
        <div class="liuyi-flex">
            <p style="font-size:0.8rem">上课门店</p>
            <div class="liuyi-input">
                <div class="select-menu">
                    <div class="select-menu-div">
                        <input class="select-menu-input" id="select-menu-input"/>
                
                        <img class="select-menu-img" src="./image/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul" style="height:10rem;overflow-y: scroll;">
                        
                    </ul>
                </div>
            </div>
            <div class="liuyi-flex-right"></div>
            <p class="liuyi-flex-right-p1">下一周</p>
        </div>
        <div class="liuyi-table"></div>
    </div>
</body>
<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>
<script type="text/javascript">
    window.onload = function () {
            new liuyi().init()
        }

        

        class liuyi {
            init() {
                this.liuyi()
                this.select_option()
                // this.ajax()
                this.liuyi_table()
                this.ajax()
            }

            ajax(){

            }

            liuyi() {

                //门店列表和选择时间渲染
                
                $.ajax({
                    url: 'http://test.physicalclub.com/rest/club/getClubInfo',
                    type: 'GET',
                    dataType: 'json',
                    success: function (data) {
                        console.log(data)
                        var liuyistr = ''

                        liuyistr = `<li class="select-this" style="display:none"></li>`

                        $.each(data.rows,function(i,item){
                            liuyistr += `                           
                                <li class="`+ item.clubId +`">`+ item.clubName +`</li>
                            `
                        })
                        setTimeout(() => {
                            $('#select-menu-ul').html(liuyistr)
                        }, 100);
                    },
                    error: function (msg) {
                        console.log(msg)
                    }
                })
                
                //门店选择时间渲染
                setTimeout(() => {

                    var list = {
                        storeId: "16",
                        week: 0
                    }

                    $.ajax({
                    url: 'http://test.physicalclub.com/rest/classScheduling/selectGroupByCourseSchedulingList',
                    type: 'POST',
                    contentType: 'application/json;charset=UTF-8',
                    data: JSON.stringify(list),
                    success: function (result) {
                        console.log(result)

                        var liuyitime = ''         

                        $.each(result.rows, function(i,item){
                            liuyitime += `
                                <p class="liuyi-flex-right-p">`+ item.monthDayStr + '(' + item.whatDayStr + ')'+`</p>
                            `
                        })

                        $('.liuyi-flex-right').html(liuyitime)

                        var myDate = new Date()
                        console.log(myDate.getMonth(), myDate.getDate())
                    
                        //选择时间的高亮

                        $('.liuyi-flex-right-p').click(function(){

                            $(this).parent().children('.liuyi-flex-right-p').css('background', '#F5F5F5')
                            $(this).parent().children('.liuyi-flex-right-p').css('color', 'black')

                            $(this).css('background', '#71B2EF')
                            $(this).css('color', 'white')
                        })

                        for (var i = 0; i < $('.liuyi-flex-right').children().length; i++) {
                            //console.log($('.liuyi-flex-right').children().eq(i).html().split('(')[0])
                            if ((myDate.getMonth() + 1) == Number($('.liuyi-flex-right').children().eq(i).html().split('(')[0].split('-')[0]) && myDate.getDate() == $('.liuyi-flex-right').children().eq(i).html().split('(')[0].split('-')[1]) {
                                $('.liuyi-flex-right').children().eq(i).click()
                                console.log(i)
                            }
                            //console.log(Number($('.liuyi-flex-right').children().eq(i).html().split('(')[0].split('-')[0]))
                        }

                    },
                    error: function (e) {
                        console.log(e.status)
                    }
                })

                    $('.liuyi-flex-right-p1').click(function () {
                        var list = {
                            storeId: "16",
                            week: 1
                        }

                        $.ajax({
                            url: 'http://test.physicalclub.com/rest/classScheduling/selectGroupByCourseSchedulingList',
                            type: 'POST',
                            contentType: 'application/json;charset=UTF-8',
                            data: JSON.stringify(list),
                            success: function (result) {
                                console.log(result)

                                var liuyitime = ''

                                $.each(result.rows, function (i, item) {
                                    liuyitime += `
                                <p class="liuyi-flex-right-p">`+ item.monthDayStr + '(' + item.whatDayStr + ')' + `</p>
                            `
                                })

                                $('.liuyi-flex-right').html(liuyitime)

                                //选择时间的高亮

                                $('.liuyi-flex-right-p').click(function () {

                                    $(this).parent().children('.liuyi-flex-right-p').css('background', '#F5F5F5')
                                    $(this).parent().children('.liuyi-flex-right-p').css('color', 'black')

                                    $(this).css('background', '#71B2EF')
                                    $(this).css('color', 'white')
                                })

                            },
                            error: function (e) {
                                console.log(e.status)
                            }
                        })

                    })
                }, 100);
            
            }

            select_option() {
                selectMenu(0);
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

            liuyi_table() {
                var tablestr = ''
                tablestr = `
                <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th><p class="bias-left">时间</p><p class="bias"></p><p class="bias-right">房间</p></th>
                        <th colspan="2"></th>
                        <th colspan="2"></th>
                        <th colspan="2"></th>
                    </tr>
                    <tr style="height:6.5rem">
                        <td rowspan="2" style="width:7.9rem;background:white;border:1px solid #BFBFBF;border-top:none;font-size:0.9rem">
                            上午
                            <br>
                            <br>
                            8:00-11:59
                        </td>
                        <td style="width:11.4rem;padding-left:0.5rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                    </tr>
                    <tr style="height:6.5rem">
                        <td style="width:11.4rem;padding-left:0.5rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                    </tr>
                    <tr style="height:6.5rem">
                        <td rowspan="4" style="width:140px;background:white;border:1px solid #BFBFBF;border-top:none;font-size:0.9rem">
                            下午
                            <br>
                            <br>
                            12:00-17:59
                        </td>
                        <td style="width:11.4rem;padding-left:0.5rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                    </tr>
                    <tr style="height:6.5rem">
                        <td style="width:11.4rem;padding-left:0.5rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                    </tr>
                    <tr style="height:6.5rem">
                        <td style="width:11.4rem;padding-left:0.5rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                    </tr>
                    <tr style="height:6.5rem">
                        <td style="width:11.4rem;padding-left:0.5rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                    </tr>
                    <tr style="height:6.5rem">
                        <td rowspan="4" style="width:140px;background:white;border:1px solid #BFBFBF;border-top:none;font-size:0.9rem">
                            晚上
                            <br>
                            <br>
                            18:00-21:30
                        </td>
                        <td style="width:11.4rem;padding-left:0.5rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                    </tr>
                    <tr style="height:6.5rem">
                        <td style="width:11.4rem;padding-left:0.5rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                        <td style="width:11.4rem">
                            <div class="liuyi-white"></div>
                        </td>
                    </tr>
                </table>
            `
                $('.liuyi-table').html(tablestr)
            }
            // ajax(){
            //     var list = {}
            //     $.ajax({
            //         type:'get',
            //         url:'http://172.16.7.20:8080/rest/leagueCoach/selectLeagueCoachList',
            //         data: JSON.stringify(list),
            //         success : function(result){
            //             console.log(result)
            //         },
            //         error : function(e){
            //             console.log(e.status);
            //             console.log(e.responseText)
            //         }
            //     })
            // }
        }

</script>

</html>