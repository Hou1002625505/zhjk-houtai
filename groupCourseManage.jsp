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

        .course-manage-body {
            padding: 20px 20px 0 20px;
        }

        .course-manage-button {
            width: 106px;
            height: 35px;
            background: #71B2EF;
            color: white;
            font-size: 18px;
            text-align: center;
            line-height: 35px;
            cursor: pointer;
            border-radius: 4px;
        }

        .course-manage-flex {
            display: flex;
            margin-top: 20px;
            align-items: center;
        }

        .course-manage-flex .course-manage-flex-input {
            width: 176px;
            height: 26px;
            border-radius: 4px;
            margin-left: 18px;
            margin-right: 34px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }

        .course-manage-flextwo {
            display: flex;
            margin-top: 18px;
        }

        .course-manage-flextwo p:nth-child(1) {
            width: 70px;
            height: 26px;
            border-radius: 4px;
            background: #71B2EF;
            text-align: center;
            line-height: 26px;
            color: white;
            font-size: 14px
        }

        .course-manage-flextwo p:nth-child(2) {
            width: 70px;
            height: 26px;
            border-radius: 4px;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            text-align: center;
            line-height: 26px;
            color: black;
            margin-left: 13px;
            font-size: 14px
        }

        .select-menu {
            margin-left: 10px;
            margin-right: 39px;
            cursor: pointer;
            width: 106px;
            height: 26px;
            box-sizing: border-box;
        }

        .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 106px;
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
            height: 26px;
            width: 106px;
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

        .course-manage-flex-input-one {
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

        .course-manage-flex-input-two {
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

        .course-manage-flex-input-three {
            width: 70px;
            height: 26px;
            border-radius: 4px;
            margin-left: 21px;
            margin-right: 6px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }

        .course-manage-flex-input-four {
            width: 70px;
            height: 26px;
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
            height: 35px;
            text-align: center;
        }

        .course-manage-table table td:last-child {
            border-right: 1px dashed #CCCCCC;
            text-align: center;
        }

        .course-manage-table table th {
            background: #D0E8F2;
            text-align: center;
            height: 35px;
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
            width: 14px;
            height: 14px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
        }

        .course-manage-table .course-manage-table-checkbox img {
            width: 14px;
            height: 14px;
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
            width: 14px;
            height: 14px;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
            line-height: 14px;
        }

        .course-manage-table-checkbox img {
            width: 14px;
            height: 14px;
            margin-top: -1px;
            margin-left: -1px;
        }

        .course-manage-footer .course-manage-footer-pone {
            font-size: 12px;
            margin-left: 8px;
        }

        .course-manage-footer .course-manage-footer-ptwo {
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

        .course-manage-footer .course-manage-footer-pthree {
            font-size: 14px;
            margin-left: 893px;
        }
    </style>
</head>

<body>
    <div class="course-manage-body">
        <div class="course-manage-button">新建课程</div>
        <div class="course-manage-flex">
            <div style="font-size:14px">课程名称</div>
            <input class="course-manage-flex-input" type="text">
            <div style="font-size:14px">课程分类</div>
            <div class="course-manage-flex-select-one"></div>
            <div style="font-size:14px">课程状态</div>
            <div class="course-manage-flex-select-two"></div>
            <div style="font-size:14px">创建时间</div>
            <input type="text" class="course-manage-flex-input-one" placeholder="开始时间">
            <p>-</p>
            <input type="text" class="course-manage-flex-input-two" placeholder="结束时间">
            <div style="font-size:14px">价格区间</div>
            <input type="text" class="course-manage-flex-input-three">
            <p>-</p>
            <input type="text" class="course-manage-flex-input-four">
        </div>
        <div class="course-manage-flextwo">
            <p>查询</p>
            <p>清除</p>
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
<script type="text/javascript">
    window.onload = function () {
        new course_manage().init();
    }

    class course_manage {
        constructor() {
            this.select_one = $(".course-manage-flex-select-one")
            this.select_two = $(".course-manage-flex-select-two")
            this.table = $(".course-manage-table")
            this.input_four = $(".course-manage-footer-pthree")
        }

        init() {
            this.select_all1()
            this.select_all2()
            this.table_all()
            this.input_all4()
            this.select_option()
        }

        select_all1() {
            var str
            str = `
                <div class="select-menu">
		            <div class="select-menu-div">
			            <input class="select-menu-input" />

			            <img class="select-menu-img" src="../images/simage/sifting_icon.png"/>
		            </div>
                    <ul class="select-menu-ul">
                        <li class="select-this">全部</li>
                        <li>团操课</li>
                        <li>莱美课</li>
                        <li>舞蹈课</li>
                    </ul>
                </div>
            `
            this.select_one.html(str)
        }

        select_all2() {
            var str1
            str1 = `
                <div class="select-menu">
		            <div class="select-menu-div">
			            <input class="select-menu-input" />

			            <img class="select-menu-img" src="../images/simage/sifting_icon.png"/>
		            </div>
                    <ul class="select-menu-ul">
                        <li class="select-this">全部</li>
                        <li>已上架</li>
                        <li>未上架</li>
                    </ul>
                </div>
            `
            this.select_two.html(str1)
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
            var str2;
            var that = this
            var param = {
                rows: 10
            }

            $.ajax({
                method: 'POST',
                url: 'http://test.physicalclub.com/rest/leagueCurriculum/selectLeagueCurriculumList',
                contentType: "application/json",
                data: JSON.stringify(param),
                success: function (result) {
                    list = result.results
                    console.log(list)
                    str2 = `
                        <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th width="35"></th>
                            <th>课程分类</th>
                            <th>课程名称</th>
                            <th><div class="headingsifting">课程价格<div class="headingsifting-column"><img src="../images/simage/headingsifting_up.png"><img src="../images/simage/headingsifting_down.png"></div></div></th>
                            <th><div class="headingsifting">创建时间<div class="headingsifting-column"><img src="../images/simage/headingsifting_up.png"><img src="../images/simage/headingsifting_down.png"></div></div></th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                    `
                    $.each(list, function (i, item) {
                        //console.log($('.course-manage-table-tr').parent().children().eq(i+1).children().eq(5))
                        if (item.state == 1) {
                            str2 += `
                                        <tr class="course-manage-table-tr">
                                            <td width="42"><div style="display:flex;justify-content: center;"><div class="course-manage-table-checkbox"><img style="display:none" src="../images/simage/codeallset_btn.png"></div></div></td>
                                            <td width="254">`+ item.classifyName + `</td>
                                            <td width="254">`+ item.name + `</td>
                                            <td width="254">`+ item.price + `</td>
                                            <td width="254">`+ item.createDate + `</td>
                                            <td width="254">上架</td>
                                            <td width="130"><a>编辑</a>|<a></a>上架</td>
                                        </tr>
                                    `
                        }

                        if(item.state == 2){
                            str2 += `
                                        <tr class="course-manage-table-tr">
                                            <td width="42"><div style="display:flex;justify-content: center;"><div class="course-manage-table-checkbox"><img style="display:none" src="../images/simage/codeallset_btn.png"></div></div></td>
                                            <td width="254">`+ item.classifyName + `</td>
                                            <td width="254">`+ item.name + `</td>
                                            <td width="254">`+ item.price + `</td>
                                            <td width="254">`+ item.createDate + `</td>
                                            <td width="254">下架</td>
                                            <td width="130"><a>编辑</a>|<a></a>上架</td>
                                        </tr>
                                    `
                        }

                        that.table.html(str2)

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
            //this.checkbox_img = $(".course-manage-table-checkbox img")
        }
        init() {
            this.checkbox_click()
        }

        checkbox_click() {
            // console.log(this.checkbox)
            // console.log(this.checkbox_img)
            this.checkbox.click(function () {
                if ($(this).children('img').is(":hidden")) {
                    $(this).children('img').show()
                } else {
                    $(this).children('img').hide()
                }
            })
        }
    }

    $('.M-box11').pagination({
        mode: 'fixed'
    });
</script>

</html>