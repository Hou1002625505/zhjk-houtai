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
    <style>
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
            margin-top: 20px;
            align-items: center;
        }

        .course-manage-flex #course-manage-flex-input {
            width: 200px;
            height: 30px;
            border-radius: 4px;
            margin-left: 20px;
            margin-right: 39px;
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
            font-size: 16px
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
            font-size: 16px
        }

        .select-menu {
            margin-left: 20px;
            margin-right: 39px;
            cursor: pointer;
            width: 120px;
            height: 30px;
            box-sizing: border-box;
        }

        .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 120px;
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
            height: 30px;
            width: 120px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            line-height: 30px;
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
            width: 60px;
            height: 24px;
            cursor: pointer;
            user-select: none;
            font-size: 14px
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
            background: #D0E8F2;
            text-align: center;
            height: 40px;
            font-size: 14px;
        }

        .course-manage-table .course-manage-table-tr td:last-child {
            cursor: pointer;
            color: #71B2EF;
        }

        .course-manage-table .course-manage-table-tr td:last-child a:nth-child(1) {
            margin-right: 5px;
        }

        .course-manage-table .course-manage-table-tr td:last-child a:nth-child(2) {
            margin-left: 5px;
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

        .course-manage-table .headingsifting {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .course-manage-table .headingsifting .headingsifting-column {
            display: flex;
            flex-direction: column;
            margin-left: 6px;
        }

        .course-manage-table .headingsifting .headingsifting-column img:nth-child(2) {
            margin-top: 1px
        }

        .course-manage-footer {
            display: flex;
            margin-top: 17px;
            height: 26px;
            display: flex;
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
            margin-left: 893px;
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
    </style>
</head>

<body>
    <div class="course-manage-body">
        <div class="course-manage-button">新建课程</div>
        <div class="course-manage-flex">
            <div style="font-size:16px">课程名称</div>
            <input id="course-manage-flex-input" type="text">
            <div style="font-size:16px">课程分类</div>
            <div class="course-manage-flex-select-one">
                <div class="select-menu">
                    <div class="select-menu-div">
                        <input class="select-menu-input" />

                        <img class="select-menu-img" src="../images/simage/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul1">

                    </ul>
                </div>
            </div>
            <div style="font-size:16px">课程状态</div>
            <div class="course-manage-flex-select-two">
                <div class="select-menu">
                    <div class="select-menu-div">
                        <input class="select-menu-input" />

                        <img class="select-menu-img" src="../images/simage/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul">
                        <li class="select-this">全部</li>
                        <li>上架</li>
                        <li>下架</li>
                    </ul>
                </div>
            </div>
            <div style="font-size:16px">创建时间</div>
            <div class="J-datepicker-day"> <input type="text" class="course-manage-flex-input-one " placeholder="开始时间">
            </div>
            <p>-</p>
            <div class="J-datepicker-day"> <input type="text" class="course-manage-flex-input-two" placeholder="结束时间">
            </div>
            <div style="font-size:16px">价格区间</div>
            <input type="text" class="course-manage-flex-input-three">
            <p>-</p>
            <input type="text" class="course-manage-flex-input-four">
        </div>
        <div class="course-manage-flextwo">
            <p id="course-manage-flextwo-search">查询</p>
            <p id="course-manage-flextwo-clear">清除</p>
        </div>
        <div class="course-manage-table"></div>
        <div class="course-manage-footer">
            <div class="course-manage-table-checkbox">
                <img style="display:none" src="../images/simage/codeallset_btn.png">
            </div>
            <div class="course-manage-footer-pone">当页全选</div>
            <div class="course-manage-footer-ptwo">批量上传</div>
            <div class="course-manage-footer-ptwo">批量下架</div>
            <div class="course-manage-footer-pthree"></div>
        </div>
        <!-- <div class="m-style M-box11"></div> -->
        <div class="box" id="ywyboxpage"></div>
    </div>
</body>
<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>
<script type="text/javascript">

    window.onload = function () {
        new course_manage().init();
    }

    class course_manage {
        constructor() {
            this.li_one = $("#select-menu-ul1")
            this.select_two = $(".course-manage-flex-select-two")
            this.table = $(".course-manage-table")
            this.input_four = $(".course-manage-footer-pthree")
        }

        init() {
            this.table_all()
            this.select_option()
            this.time()
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

        select_option() {
            selectMenu(0);
            selectMenu(1);
            function selectMenu(index) {
                $(".select-menu-input").eq(index).val($(".select-this").eq(index).html());//在输入框中自动填充第一个选项的值
                $(".select-menu-div").eq(index).on("click", function (e) {
                    e.stopPropagation();
                    if ($(".select-menu-ul").eq(index).css("display") === "block") {
                        $(".select-menu-ul").eq(index).hide();
                        $(".select-menu-div").eq(index).find("i").removeClass("select-menu-i");
                        $(".select-menu-ul").eq(index).animate({ marginTop: "0", opacity: "0" }, "fast");
                    } else {
                        $(".select-menu-ul").eq(index).show();
                        $(".select-menu-div").eq(index).find("i").addClass("select-menu-i");
                        $(".select-menu-ul").eq(index).animate({ marginTop: "5px", opacity: "1" }, "fast");
                    }
                    for (var i = 0; i < $(".select-menu-ul").length; i++) {
                        if (i !== index && $(".select-menu-ul").eq(i).css("display") === "block") {
                            $(".select-menu-ul").eq(i).hide();
                            $(".select-menu-div").eq(i).find("i").removeClass("select-menu-i");
                            $(".select-menu-ul").eq(i).animate({ marginTop: "0", opacity: "0" }, "fast");
                        }
                    }
                });
                $(".select-menu-ul").eq(index).on("click", "li", function () {//给下拉选项绑定点击事件
                    $(".select-menu-input").eq(index).val($(this).html());//把被点击的选项的值填入输入框中
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
                        $(".select-menu-ul").eq(index).animate({ marginTop: "0", opacity: "0" }, "fast");

                    }

                });

            }
        }

        table_all() {
            var list = [];
            var listclassifyName0 = [];
            var listclassifyName = [];
            var listclassifyName2 = {};
            var listclassifyName3 = [];
            var str;
            var str2;
            var that = this

            $.ajax({
                type: 'GET',
                url: 'http://test.physicalclub.com/crm/rest/leagueCurriculum/getReleaseLeagueCurriculumListGroupByType',
                contentType: "application/json;charset=UTF-8",
                success: function (result) {

                    list = result

                    $.each(list, function (i, item) {
                        //console.log(item)

                        str = `
                            <li class="select-this">全部</li>
                        `
                        str += `
                            <li>` + item.classifyName + `</li>
                            `
                        that.li_one.html(str)

                        if (that.li_one.parent().children('.select-menu-div').children('input').val() == "全部") {
                            list = list
                        } 
                        //等于其他分类名时
                        else if (item.classifyName == that.li_one.parent().children('.select-menu-div').children('input').val()) {
                            
                            $.each(item.children, function (i, item2) {

                                if(item2.name == $('#course-manage-flex-input').val()){
                                    listclassifyName3.push(item2)
                                }
                            })

                            if($('#course-manage-flex-input').val() == ''){
                                list = list
                            }else if(listclassifyName3.length > 0){
                                listclassifyName2.children = listclassifyName3
                                listclassifyName.push(listclassifyName2)
                                list = listclassifyName
                                console.log(list)
                            }else{
                                list = []
                            }
                            
                        }

                    })

                    //console.log(that.li_one.parent().children('.select-menu-div').children('input').val())

                    str2 = `
                        <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th width="48"></th>
                            <th width="288">课程分类</th>
                            <th width="288">课程名称</th>
                            <th width="288"><div class="headingsifting">课程价格<div class="headingsifting-column"><img src="../images/simage/headingsifting_up.png"><img src="../images/simage/headingsifting_down.png"></div></div></th>
                            <th width="288"><div class="headingsifting">创建时间<div class="headingsifting-column"><img src="../images/simage/headingsifting_up.png"><img src="../images/simage/headingsifting_down.png"></div></div></th>
                            <th width="288">状态</th>
                            <th width="148">操作</th>
                        </tr>
                    `

                    $.each(list, function (i, item) {
                        //console.log(item)

                        $.each(item.children, function (i, item1) {
                            //console.log(item1)
                            if (item1.state == 1) {
                                str2 += `
                                            <tr class="course-manage-table-tr">
                                                <td width="48"><div style="display:flex;justify-content: center;"><div class="course-manage-table-checkbox"><img style="display:none" src="../images/simage/codeallset_btn.png"></div></div></td>
                                                <td width="288">`+ item1.classifyName + `</td>
                                                <td width="288">`+ item1.name + `</td>
                                                <td width="288">`+ item1.price + `</td>
                                                <td width="288">`+ item1.createDate + `</td>
                                                <td width="288">上架</td>
                                                <td width="148"><a>编辑</a>|<a></a>上架</td>
                                            </tr>
                                        `
                            }

                            if (item1.state == 2) {
                                str2 += `
                                            <tr class="course-manage-table-tr">
                                                <td width="48"><div style="display:flex;justify-content: center;"><div class="course-manage-table-checkbox"><img style="display:none" src="../images/simage/codeallset_btn.png"></div></div></td>
                                                <td width="288">`+ item.classifyName + `</td>
                                                <td width="288">`+ item1.name + `</td>
                                                <td width="288">`+ item1.price + `</td>
                                                <td width="288">`+ item1.createDate + `</td>
                                                <td width="288">下架</td>
                                                <td width="148"><a>编辑</a>|<a></a>上架</td>
                                            </tr>
                                        `
                            }
                        })

                    })
                    that.table.html(str2)
                    that.li_one.one("click", function () {
                        that.table_all()
                    })
                    $('#course-manage-flextwo-search').one("click", function (){
                        that.table_all()
                    })
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText)
                }
            })

            new computed().init()
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

    class computed {
        constructor() {
            this.checkbox = $(".course-manage-table-checkbox")
        }
        init() {
            this.checkbox_click()
            this.search()
        }

        checkbox_click() {
            this.checkbox.click(function () {
                if ($(this).children('img').is(":hidden")) {
                    $(this).children('img').show()
                } else {
                    $(this).children('img').hide()
                }
            })
        }

        search() {
            $('#course-manage-flextwo-search').click(function () {
                var trall = $('.course-manage-table').children('table').children('tbody').children()
                var trcount = $('.course-manage-table').children('table').children('tbody').children().length

                for (var i = 1; i < trcount; i++) {

                    var val = $('#course-manage-flex-input').val()
                    var td1 = trall.eq(i).children().eq(1).html()

                    // if (td1 == val) {
                    //     trall.eq(i).show()
                    // } else {
                    //     trall.eq(i).hide()
                    // }

                }
            })

        }
    }

</script>

</html>