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
    <script src="easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
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
    
        .course-anaylse-header {
            display: flex
        }
    
        .course-anaylse-header #course-anaylse-header-pone {
            width: 5rem;
            height: 1.5rem;
            border-radius: 0.2rem 0 0 0;
            text-align: center;
            line-height: 1.5rem;
            border: 1px solid #BFBFBF;
            background: #71B2EF;
            border-bottom: 0;
            box-sizing: border-box;
            font-size:0.8rem;
            color:white
        }
    
        .course-anaylse-header #course-anaylse-header-ptwo {
            width: 5rem;
            height: 1.5rem;
            text-align: center;
            line-height: 1.5rem;
            border-top: 1px solid #BFBFBF;
            background: #F5F5F5;
            box-sizing: border-box;
            font-size:0.8rem;
        }
    
        .course-anaylse-header #course-anaylse-header-pthree {
            width: 5rem;
            height: 1.5rem;
            border-radius: 0 0.2rem 0 0;
            text-align: center;
            line-height: 1.5rem;
            border: 1px solid #BFBFBF;
            border-bottom: 0;
            background: #F5F5F5;
            box-sizing: border-box;
            font-size:0.8rem;
        }
    
        .course-anaylse-nav {
            height: 1px;
            background: #BFBFBF;
            padding: 0 1.5rem 0 1rem
        }
    
        .course-anaylse-search {
            display: flex;
            align-items: center;
            margin-top: 1rem
        }
    
    
        .select-menu {
            margin-right: 2rem;
            cursor: pointer;
            width: 10rem;
            height: 1.5rem;
            box-sizing: border-box;
            margin-left: 1rem
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
            padding: 0 0.6rem;
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
            border-radius: 0.2rem;
            box-sizing: border-box;
            line-height: 1.5rem;
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
            width: 7.5rem;
            height: 1.3rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem
        }
    
    
    
        .course-anaylse-search .course-anaylse-search-inputone {
            width: 6rem;
            height: 1.5rem;
            border: 1px solid #BFBFBF;
            border-radius: 0.2rem;
            margin-left: 1.05rem;
            margin-right: 0.35rem;
            font-size: 0.6rem;
            line-height: 1.5rem;
            padding-left: 0.55rem;
            box-sizing: border-box;
        }
    
        .course-anaylse-search .course-anaylse-search-inputtwo {
            width: 6rem;
            height: 1.5rem;
            border: 1px solid #BFBFBF;
            border-radius: 0.2rem;
            margin-left: 0.35rem;
            font-size: 0.6rem;
            line-height: 1.5rem;
            padding-left: 0.55rem;
            box-sizing: border-box;
        }
    
        .course-anaylse-button {
            display: flex;
            justify-content: space-between;
            margin-top: 1rem;
        }
    
        .course-anaylse-button .course-anaylse-button-flex {
            display: flex
        }
    
        .course-anaylse-button-flex #course-anaylse-pone {
            width: 4rem;
            height: 1.5rem;
            color: white;
            border-radius: 0.2rem;
            background: #71B2EF;
            text-align: center;
            line-height: 1.5rem;
            font-size:0.8rem
        }
    
        .course-anaylse-button-flex #course-anaylse-ptwo {
            width: 4rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.5rem;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            margin-left: 0.75rem;
            font-size:0.8rem
        }
    
        .course-anaylse-button #course-anaylse-pthree {
            width: 4rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            text-align: center;
            line-height: 1.5rem;
            box-sizing: border-box;
            background: #71B2EF;
            color: white;
            font-size:0.8rem;
            margin-right:1.8rem
        }

        table{
            margin-top:0.5rem
        }

        table th{
            font-size:0.7rem;
            height:2rem;
            background:#D0E8F2;
        }

        table td{
            font-size:0.7rem;
            height:2rem;
            border:1px dashed #CCCCCC;
            border-top:none;
            border-left:none;
            text-align: center;
            line-height:2rem
        }

        table tr td:first-child{
            border-left:1px dashed #CCCCCC
        }

        .footer-flex{
            display:flex;
            margin-top:1rem
        }

        .course-anaylse-search-selectthree{
            width:10rem;
            height:1.5rem;
            border:1px solid #BFBFBF;
            border-radius: 0.2rem;
            line-height: 1.5rem;
            margin:0 2rem 0 1.1rem
        }
    </style>
</head>

<body>
    <div class="course-anaylse-header">
        <div id="course-anaylse-header-pone">课程分析</div>
        <div id="course-anaylse-header-ptwo">学员分析</div>
        <div id="course-anaylse-header-pthree">教练分析</div>
    </div>
    <div class="course-anaylse-nav"></div>
    <div class="course-anaylse-search">
        <p style="font-size:0.8rem">上课门店</p>
        <div class="course-anaylse-search-selectone">
            <div class="select-menu">
                <div class="select-menu-div">
                    <input class="select-menu-input" id="select-menu-input-mendian"/>
            
                    <img class="select-menu-img" src="./image/sifting_icon.png" />
                </div>
                <ul class="select-menu-ul" id="select-menu-ul-pulishmendian" style="height:10rem;overflow-y: scroll;">

                </ul>
            </div>
        </div>
        <p style="font-size:0.8rem">课程分类</p>
        <div class="course-anaylse-search-selecttwo">
            <div class="select-menu">
                <div class="select-menu-div">
                    <input class="select-menu-input" id="select-menu-input-course"/>
            
                    <img class="select-menu-img" src="./image/sifting_icon.png" />
                </div>
                <ul class="select-menu-ul" id="select-menu-ul-course">
            
                </ul>
            </div>
        </div>
        <p style="font-size:0.8rem">课程名称</p>
        <div class="course-anaylse-search-selectthree">
            <input type="text" style="width:10rem;height:1.4rem;border:0;"/>
        </div>
        <p style="font-size:0.8rem">日期范围</p>
        <div class="J-datepicker-day">
            <input type="text" class="course-anaylse-search-inputone " placeholder="开始日期">
        </div>
        <p>-</p>
        <div class="J-datepicker-day">
            <input type="text" class="course-anaylse-search-inputtwo" placeholder="结束日期">
        </div>
    </div>
    <div class="course-anaylse-button">
        <div class="course-anaylse-button-flex">
            <p id="course-anaylse-pone">查询</p>
            <p id="course-anaylse-ptwo">清除</p>
        </div>
        <p id="course-anaylse-pthree">导出数据</p>
    </div>
    <div class="course-anaylse-table"></div>

    <div class="footer-flex">
        <div class="count"></div>
        <div class="box" id="boxpage" style="margin-top:0;margin-left:1.5rem"></div>
    </div>
    
</body>

<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>
<script type="text/javascript">
    window.onload = function () {
            new anaylse().init()
        }

        class anaylse {
            constructor() {
                this.select_one = $('.course-anaylse-search-selectone')
                this.select_two = $('.course-anaylse-search-selecttwo')
                this.select_three = $('.course-anaylse-search-selectthree')
            }

            init() {
                this.search_selectone()
                this.select_option()
                this.ac_table()
                this.time()
                this.ajax()
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

            ajax(){

                
            }

            search_selectone() {

                setTimeout(() => {
                    var pulishmendian = '';
                    //门店列表渲染
                    $.ajax({
                        url: 'rest/club/getClubInfo',
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

                
                setTimeout(() => {
                    var courselist = {
                        typeCode: "GroupType"
                    }
                    //课程列表渲染
                    $.ajax({
                        url : 'rest/wx/dictionnary/getdictionnarylist',
                        type: 'POST',
                        contentType: 'application/json;charset=UTF-8',
                        data: JSON.stringify(courselist),
                        success : function(result){
                            var coursestr = ''
                            $.each(result.rows, function (i, item){
                                coursestr += `
                                    <li class="`+ item.dictionaryId + `">` + item.name + `</li>
                                `
                            })
                            $('#select-menu-ul-course').html(coursestr)
                            $('#select-menu-input-course').val("全部")
                        },
                        error : function(e){
                            console.log(e.status)
                        }
                    })
                }, 100);


            //     var selectstr
            //     var select1str
            //     var select2str
            //     selectstr = `
                
            // `
            //     select1str = `
            //     <div class="select-menu">
		    //         <div class="select-menu-div">
			//             <input class="select-menu-input" />

			//             <img class="select-menu-img" src="./image/sifting_icon.png"/>
		    //         </div>
            //         <ul class="select-menu-ul">
            //             <li class="select-this">全部</li>
            //             <li>团操课</li>
            //             <li>莱美课</li>
            //             <li>舞蹈课</li>
            //         </ul>
            //     </div>
            // `
            //     select2str = `
            //     <div class="select-menu">
		    //         <div class="select-menu-div">
			//             <input class="select-menu-input" />

			//             <img class="select-menu-img" src="./image/sifting_icon.png"/>
		    //         </div>
            //         <ul class="select-menu-ul">
            //             <li class="select-this">全部</li>
            //             <li>团操课</li>
            //             <li>莱美课</li>
            //             <li>舞蹈课</li>
            //         </ul>
            //     </div>
            // `
            //     this.select_one.html(selectstr)
            //     this.select_two.html(select1str)
            //     this.select_three.html(select2str)
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

            ac_table() {
                        
                setTimeout(() => {

                    tableone()

                    //第一个表格
                    function tableone(){
                        var onPagechange = function (page) {
                            console.log(page)
                            aaaaaa(page)
                        }

                        var page = 1;
                        aaaaaa(page)

                        function aaaaaa(page) {
                            var list = {
                                page: page,
                                rows: 15
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
                                    <table border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th style="width:2.45rem">序号</th>
                                            <th style="width:12.6rem">课程类型</th>
                                            <th style="width:12.6rem">课程编号</th>
                                            <th style="width:12.6rem">课程名称</th>
                                            <th style="width:8.5rem">发布数量</th>
                                            <th style="width:8.5rem">预约总人次</th>
                                            <th style="width:8.5rem">签到总人次</th>
                                            <th style="width:8.5rem">签到率</th>
                                            <th style="width:8.5rem">满员率</th>
                                        </tr>
                                `

                                    $.each(result.rows, function (i, item) {
                                        tablestr += `
                                    <tr>
                                        <td style="width:2.45rem">`+ (i + 1) + `</td>
                                        <td style="width:12.6rem">`+ item.classifyName + `</td>
                                        <td style="width:12.6rem">`+ item.code + `</td>
                                        <td style="width:12.6rem">`+ item.name + `</td>
                                        <td style="width:8.5rem">`+ item.releaseCount + `</td>
                                        <td style="width:8.5rem">`+ item.subscribeCount + `</td>
                                        <td style="width:8.5rem">`+ item.signCount + `</td>
                                        <td style="width:8.5rem">`+ (item.signRate * 100) + `%</td>
                                        <td style="width:8.5rem">满员率</td>
                                    </tr>
                                `
                                        $('.course-anaylse-table').html(tablestr)

                                        var obj = {
                                            wrapid: 'boxpage', //页面显示分页器容器id
                                            total: result.total, //总条数
                                            pagesize: 15, //每页显示10条
                                            currentPage: page, //当前页
                                            onPagechange: onPagechange
                                            //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                                        }

                                        pagination.init(obj);

                                        var str3
                                        str3 = `
                                            <p style="font-size:0.8rem">共`+ result.total + `条，每页` + list.rows + `条</p>
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

                    //第二个表格
                    function tabletwo(){

                        var onPagechange = function (page) {
                            console.log(page)
                            aaaaaa(page)
                        }

                        var page = 1;
                        aaaaaa(page)

                        function aaaaaa(page) {
                            var list = {
                                page: page,
                                rows: 15
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
                                        <tr>
                                            <th style="width:2.35rem;background:none;border:1px solid #CCCCCC" rowspan="2">序号</th>
                                            <th style="width:5.85rem;background:none;border:1px solid #CCCCCC;border-left:none" rowspan="2">课程类型</th>
                                            <th style="width:4.8rem;background:none;border:1px solid #CCCCCC;border-left:none" rowspan="2">课程编号</th>
                                            <th style="width:7.25rem;background:none;border:1px solid #CCCCCC;border-left:none" rowspan="2">课程名称</th>
                                            <th style="width:11.65rem;background:none;border:1px solid #CCCCCC;border-left:none" colspan="3">发布数量</th>
                                            <th style="width:19.45rem;background:none;border:1px solid #CCCCCC;border-left:none" colspan="5">预约总人次</th>
                                            <th style="width:31.15rem;background:none;border:1px solid #CCCCCC;border-left:none" colspan="8">签到总人次</th>
                                        </tr>
                                        <tr>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">男</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">女</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">未知</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">1-3次</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">4-10次</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">10-20次</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">20-30次</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">30次以上</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">20以下</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">20-24</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">25-30</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">31-40</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">41-50</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">51-60</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">60以上</th>
                                            <th style="width:3.85rem;background:none;border:1px solid #CCCCCC;border-left:none;border-top:none">未知</th>
                                        </tr>

                                `
                                $.each(result.rows, function (i, item) {
                                    tablestr += `
                                    <tr>
                                        <td style="width:2.35rem">`+ (i + 1) + `</td>
                                        <td style="width:5.85rem">`+ item.classifyName + `</td>
                                        <td style="width:4.8rem">`+ item.code + `</td>
                                        <td style="width:7.25rem">`+ item.name + `</td>
                                        <td style="width:3.85remrem">`+ item.sexList[0] + `</td>
                                        <td style="width:3.85remrem">`+ item.sexList[1] + `</td>
                                        <td style="width:3.85remrem">`+ item.sexList[2] + `</td>
                                        <td style="width:3.85remrem">`+ item.classFrequencyList[0] + `</td>
                                        <td style="width:3.85remrem">`+ item.classFrequencyList[1] + `</td>
                                        <td style="width:3.85remrem">`+ item.classFrequencyList[2] + `</td>
                                        <td style="width:3.85remrem">`+ item.classFrequencyList[3] + `</td>
                                        <td style="width:3.85remrem">`+ item.classFrequencyList[4] + `</td>
                                        <td style="width:3.85remrem">`+ item.ageList[0] + `</td>
                                        <td style="width:3.85remrem">`+ item.ageList[1] + `</td>
                                        <td style="width:3.85remrem">`+ item.ageList[2] + `</td>
                                        <td style="width:3.85remrem">`+ item.ageList[3] + `</td>
                                        <td style="width:3.85remrem">`+ item.ageList[4] + `</td>
                                        <td style="width:3.85remrem">`+ item.ageList[5] + `</td>
                                        <td style="width:3.85remrem">`+ item.ageList[6] + `</td>
                                        <td style="width:3.85remrem">`+ item.ageList[7] + `</td>
                                    </tr>
                                `
                                    $('.course-anaylse-table').html(tablestr)

                                    var obj = {
                                        wrapid: 'boxpage', //页面显示分页器容器id
                                        total: result.total, //总条数
                                        pagesize: 15, //每页显示10条
                                        currentPage: page, //当前页
                                        onPagechange: onPagechange
                                        //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                                    }

                                    pagination.init(obj);

                                    var str3
                                    str3 = `
                                            <p style="font-size:0.8rem">共`+ result.total + `条，每页` + list.rows + `条</p>
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

                    //第三个表格
                    function tablethree(){
                         var onPagechange = function (page) {
                            console.log(page)
                            aaaaaa(page)
                        }

                        var page = 1;
                        aaaaaa(page)

                        function aaaaaa(page) {
                            var list = {
                                page: page,
                                rows: 15
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
                                    <table border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <th style="width:2.45rem">序号</th>
                                            <th style="width:12.6rem">教练工号</th>
                                            <th style="width:12.6rem">教练姓名</th>
                                            <th style="width:12.6rem">岗位</th>
                                            <th style="width:8.5rem">发布课程数量</th>
                                            <th style="width:8.5rem">预约总人次</th>
                                            <th style="width:8.5rem">签到总人次</th>
                                            <th style="width:8.5rem">签到率</th>
                                            <th style="width:8.5rem">满员率</th>
                                        </tr>
                                `

                                    function gzxz(arr){
                                        var gzxz = ''
                                        if(!arr){
                                            return gzxz = ''
                                        }else{
                                            if(arr == 1){
                                                return gzxz = "全职"
                                            }else{
                                                return gzxz = "兼职"
                                            }
                                        }
                                    }

                                    $.each(result.rows, function (i, item) {
                                        tablestr += `
                                    <tr>
                                        <td style="width:2.45rem">`+ (i + 1) + `</td>
                                        <td style="width:12.6rem">`+ item.userName + `</td>
                                        <td style="width:12.6rem">`+ item.realName + `</td>
                                        <td style="width:12.6rem">`+ gzxz(item.jobCategory) + `</td>
                                        <td style="width:8.5rem">`+ item.releaseCount + `</td>
                                        <td style="width:8.5rem">`+ item.subscribeCount + `</td>
                                        <td style="width:8.5rem">`+ item.signCount + `</td>
                                        <td style="width:8.5rem">`+ (item.signRate * 100) + `%</td>
                                        <td style="width:8.5rem">满员率</td>
                                    </tr>
                                `
                                        $('.course-anaylse-table').html(tablestr)

                                        var obj = {
                                            wrapid: 'boxpage', //页面显示分页器容器id
                                            total: result.total, //总条数
                                            pagesize: 15, //每页显示10条
                                            currentPage: page, //当前页
                                            onPagechange: onPagechange
                                            //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                                        }

                                        pagination.init(obj);

                                        var str3
                                        str3 = `
                                            <p style="font-size:0.8rem">共`+ result.total + `条，每页` + list.rows + `条</p>
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
                    
                    $('#course-anaylse-header-pone').click(function () {
                        $('#course-anaylse-header-pthree').css('background', '#F5F5F5')
                        $('#course-anaylse-header-pthree').css('color', 'black')
                        $('#course-anaylse-header-ptwo').css('background', '#F5F5F5')
                        $('#course-anaylse-header-ptwo').css('color', 'black')
                        $('#course-anaylse-header-pone').css('background', '#71B2EF')
                        $('#course-anaylse-header-pone').css('color', 'white')
                        tableone()
                    })

                    $('#course-anaylse-header-ptwo').click(function () {
                        $('#course-anaylse-header-pthree').css('background','#F5F5F5')
                        $('#course-anaylse-header-pthree').css('color','black')
                        $('#course-anaylse-header-pone').css('background', '#F5F5F5')
                        $('#course-anaylse-header-pone').css('color','black')
                        $('#course-anaylse-header-ptwo').css('background', '#71B2EF')
                        $('#course-anaylse-header-ptwo').css('color','white')
                        tabletwo()
                    })

                    $('#course-anaylse-header-pthree').click(function () {
                        $('#course-anaylse-header-pone').css('background', '#F5F5F5')
                        $('#course-anaylse-header-pone').css('color', 'black')
                        $('#course-anaylse-header-ptwo').css('background', '#F5F5F5')
                        $('#course-anaylse-header-ptwo').css('color', 'black')
                        $('#course-anaylse-header-pthree').css('background', '#71B2EF')
                        $('#course-anaylse-header-pthree').css('color', 'white')
                        tablethree()
                    })
                }, 100);
            }
        }

</script>

</html>