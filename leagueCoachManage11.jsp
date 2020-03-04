



<!DOCTYPE html>

<head>
    <base href="http://test.physicalclub.com:80/">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo.css">
    <link rel="stylesheet" type="text/css" href="easyui/pagination.css" />
    
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script src="easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
    
    <style>

        html{
            font-size:calc(100vw / 88.11);
        }

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
            width: 6rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            margin-left: 0.9rem;
            margin-right: 1.75rem;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }

        .course-coach-manage-flextwo {
            display: flex;
        }

        .course-coach-manage-flextwo #course-coach-manage-flextwo-pone {
            width: 4rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            background: #71B2EF;
            text-align: center;
            line-height: 1.5rem;
            color: white;
            font-size: 0.8rem;
            cursor: pointer;
        }

        .course-coach-manage-flextwo #course-coach-manage-flextwo-ptwo {
            width: 4rem;
            height: 1.5rem;
            border-radius: 0.2rem;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            text-align: center;
            line-height: 1.5rem;
            color: black;
            margin-left: 0.75rem;
            font-size: 0.8rem;
            cursor: pointer;
        }

        .select-menu {
            margin-left: 0.5rem;
            margin-right: 1.95rem;
            cursor: pointer;
            width: 12.5rem;
            height: 1.8rem;
            box-sizing: border-box;
        }

        .select-menu-ul {
            /* margin-top: 50px; */
            list-style: none;
            opacity: 0;
            display: none;
            width: 12.5rem;
            text-align: left;
            border: 1px solid #ddd;
            background: #fff;
            position: absolute;
            z-index: 1;
        }

        .select-menu-ul li {
            height: 1.6rem;
            font-size: 0.7rem;
            padding: 0 0.75rem;
            box-sizing: border-box;
            line-height: 1.6rem;
        }

        .select-menu-ul li:hover {
            background: #f2f2f2;
        }

        .select-menu-div {
            position: relative;
            height: 1.8rem;
            width: 12.5rem;
            border: 1px solid #ddd;
            border-radius: 0.2rem;
            box-sizing: border-box;
            line-height: 1.8rem;
        }

        .select-this {
            background: #71B2EF;
        }

        .select-this:hover {
            background: #71B2EF !important;
        }

        .select-menu-img {
            width: 0.55rem;
            height: 0.4rem;
            margin-right: 0.5rem;
            position: absolute;
            right: 0;
            top: 0.7rem;
        }

        .select-menu-input {
            padding-left: 0.7rem;
            border: 0;
            width: 2.5rem;
            height: 1.2rem;
            cursor: pointer;
            user-select: none;
            font-size: 0.7rem
        }

        .course-coach-manage-flex-input-one {
            width: 5.3rem;
            height: 1.3rem;
            border-radius: 0.2rem;
            margin-left: 1.05rem;
            margin-right: 0.35rem;
            padding: 0.65rem 0 0.35rem 0.5rem;
            box-sizing: border-box;
            font-size: 0.6rem;
            border: 1px solid #BFBFBF
        }

        .course-coach-manage-flex-input-two {
            width: 5.3rem;
            height: 1.3rem;
            border-radius: 0.2rem;
            margin-left: 0.35rem;
            margin-right: 1.9rem;
            padding: 0.65rem 0 0.35rem 0.5rem;
            box-sizing: border-box;
            font-size: 0.6rem;
            border: 1px solid #BFBFBF
        }

        .course-coach-manage-flex-input-three {
            width: 3.5rem;
            height: 1.3rem;
            border-radius: 0.2rem;
            margin-left: 1.05rem;
            margin-right: 0.3rem;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }

        .course-coach-manage-flex-input-four {
            width: 3.5rem;
            height: 1.3rem;
            border-radius: 0.2rem;
            margin-left: 0.3rem;
            box-sizing: border-box;
            border: 1px solid #BFBFBF
        }

        .course-coach-manage-table {
            margin-top: 1rem;
            font-size: 0.7rem;
        }

        .course-coach-manage-table table tr:nth-child(2) td {
            border-top: none
        }

        .course-coach-manage-table table td {
            border-left: 1px dashed #CCCCCC;
            border-bottom: 1px dashed #CCCCCC;
            height: 3rem;
            text-align: center;
        }

        .course-coach-manage-table table td:last-child {
            border-right: 1px dashed #CCCCCC;
            text-align: center;
        }

        .course-coach-manage-table table th {
            background: #D0E8F2;
            text-align: center;
            height: 2rem;
        }

        .course-coach-manage-table .course-coach-manage-table-tr td:last-child {
            cursor: pointer;
            color: #71B2EF;
        }

        .course-coach-manage-table .course-coach-manage-table-tr td:last-child a:nth-child(1) {
            margin-right: 0.25rem;
        }

        .course-coach-manage-table .course-coach-manage-table-tr td:last-child a:nth-child(2) {
            margin-left: 0.25rem;
        }

        .course-coach-manage-table .course-coach-manage-table-checkbox {
            width: 0.7rem;
            height: 0.7rem;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
        }

        .course-coach-manage-table .course-coach-manage-table-checkbox img {
            width: 0.7rem;
            height: 0.7rem;
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
            margin-left: 0.3rem;
        }

        .course-coach-manage-table .headingsifting .headingsifting-column img:nth-child(2) {
            margin-top: 1px
        }

        .course-coach-manage-footer {
            display: flex;
            margin-top: 0.85rem;
            height: 1.3rem;
            display: flex;
            align-items: center;
            padding-left: 0.7rem;
        }

        .course-coach-manage-table-checkbox {
            width: 0.7rem;
            height: 0.7rem;
            box-sizing: border-box;
            border: 1px solid #BFBFBF;
            line-height: 0.7rem;
        }

        .course-coach-manage-table-checkbox img {
            width: 0.7rem;
            height: 0.7rem;
            margin-top: -1px;
            margin-left: -1px;
        }

        .course-coach-manage-footer .course-coach-manage-footer-pone {
            font-size: 0.6rem;
            margin-left: 0.4rem;
        }

        .course-coach-manage-footer .course-coach-manage-footer-ptwo {
            width: 4rem;
            height: 1.3rem;
            border: 1px solid #BFBFBF;
            margin-left: 0.45rem;
            font-size: 0.6rem;
            color: #444444;
            text-align: center;
            line-height: 1.3rem;
            border-radius: 0.1rem;
        }

        .course-coach-manage-footer .course-coach-manage-footer-pthree {
            font-size: 0.7rem;
            margin-left: 44.65rem;
        }

        .course-coach-manage-body .course-coach-manage-addone {
            position: absolute;
            width: 46rem;
            height: 41rem;
            top: -0.25rem;
            left: 17rem;
            z-index: 100;
            background: #D0E8F2;
            border-radius: 0.45rem;
            padding: 0.9rem;
            box-sizing: border-box;
        }

        .course-coach-manage-addone .coach-manage-addone-flexone {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .course-coach-manage-addone .coach-manage-addone-flexone img {
            width: 1.2rem;
            height: 1.15rem
        }

        .course-coach-manage-addone .coach-manage-addone-flexone p {
            font-size: 1.2rem;
            margin-left: 0.6rem
        }

        .course-coach-manage-addone .coach-manage-addone-flextwo {
            display: flex;
            align-items: center;
        }




        .course-coach-manage-addone .coach-manage-addone-flexthree {
            width: 44rem;
            height: 36.9rem;
            border: 2px solid #71B2EF;
            box-sizing: border-box;
            margin-top: 0.5rem;
            background: #FFFFFF;
            overflow-y: scroll;
        }

        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blockone {
            box-sizing: border-box;
            border-bottom: 1px solid #BFBFBF;
            height: 2.75rem;
            padding: 0.9rem 0 0.9rem 0.9rem;
            display: flex;
            align-items: center;
        }

        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blockone .flexthree-blockone-pone {
            font-size: 0.9rem
        }

        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blockone .flexthree-blockone-ptwo {
            font-size: 0.7rem;
            margin-left: 3.65rem
        }

        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blockone #areaborder {
            width: 12.5rem;
            height: 1.8rem;
            margin-left: 5.5rem;
            border: 1px solid #BFBFBF;
            border-radius: 0.2rem;
        }

        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blockone #area {
            width: 12.5rem;
            height: 1.8rem;
            border: 0;

        }

        .coach-manage-addone-flexthree-blockone .flexthree-blockone-inputtwo {
            margin-left: -1.2rem
        }

        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blocktwo {
            display: flex;
            justify-content: space-between;
            box-sizing: border-box;
            border-bottom: 1px solid #BFBFBF;
            height: auto;
            padding: 1rem 1.3rem 1rem 1rem;
            display: flex;
            align-items: center;
        }

        .coach-manage-addone-flexthree-blocktwo .flexthree-blocktwo-pone {
            font-size: 0.8rem;
            display: flex;
            width: 3.5rem
        }

        .coach-manage-addone-flexthree-blocktwo .flexthree-blocktwo-pthree {
            width: 3rem;
            height: 1.5rem;
            border: 1px solid #71B2EF;
            color: #71B2EF;
            text-align: center;
            line-height: 1.5rem;
            border-radius: 0.2rem;
            cursor: pointer;
            font-size: 0.7rem;
            box-sizing: border-box;
        }

        .coach-manage-addone-flexthree-blocktwo .flexthree-blocktwo-pfour {
            display: flex;
            flex-wrap: wrap;
            width: 28.6rem;
        }

        .flexthree-blocktwo-pfour .blocktwo-pfour-p {
            padding:0 0.5rem 0 0.5rem;
            height: 1.5rem;
            background: #F5F5F5;
            border-radius: 0.2rem;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 1rem;
            margin-bottom: 0.5rem;
            position: relative;
            font-size: 0.7rem
        }

        .flexthree-blocktwo-pfour .blocktwo-pfour-p a {
            position: absolute;
            top: -0.3rem;
            left: 100%;
            display: none;
        }

        .coach-manage-addone-flexthree-blocktwo .flexthree-blocktwo-pfive {
            display: flex;
            flex-wrap: wrap;
            width: 28.6rem;
        }



        .flexthree-blocktwo-pfive .blocktwo-pfive-p {
            height: 1.5rem;
            padding:0 0.5rem 0 0.5rem;
            box-sizing: border-box;
            background: #F5F5F5;
            border-radius: 0.2rem;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 0.9rem;
            margin-bottom: 0.5rem;
            position: relative;
            font-size: 0.7rem
        }

        .flexthree-blocktwo-pfive .blocktwo-pfive-p a {
            position: absolute;
            top: -0.3rem;
            left: 100%;
            display: none;
        }

        .coach-manage-addone-flexthree-blocktwo .flexthree-blocktwo-psix {
            width: 33.5rem;
            height: 5.65rem;
            display: flex;
            flex-wrap: wrap;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            padding: 0.65rem 0.4rem 0 0.7rem;
            border-radius: 0.2rem;
            font-size: 0.7rem
        }

        .coach-manage-addone-flexthree .coach-manage-addone-flexthree-blockthree {
            display: flex;
            box-sizing: border-box;
            border-bottom: 1px solid #BFBFBF;
            height: auto;
            padding: 0.9rem 1.15rem 0.9rem 0.9rem;
            display: flex;
            align-items: center;
        }

        .coach-manage-addone-flexthree-blockthree .flexthree-blockthree-pone {
            font-size: 0.8rem;
            display: flex;
            width: 4.15rem;
            margin-right: 3.1rem
        }



        .course-coach-manage-addone .coach-manage-addone-flexfour {
            width: 42.95rem;
            height: 5rem;
            box-sizing: border-box;
            position: fixed;
            top: 35.75rem;
            left: 19rem;
            background: #FFFFFF;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .course-coach-manage-addone .coach-manage-addone-flexfour #coach-manage-addone-flexfour-save {
            width: 4.4rem;
            height: 1.75rem;
            background: #71B2EF;
            color: white;
            font-size: 0.8rem;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 0.2rem;
            cursor: pointer;
        }

        .course-coach-manage-addone .coach-manage-addone-flexfour #coach-manage-addone-flexfour-quxiao {
            width: 4.4rem;
            height: 1.75rem;
            font-size: 0.8rem;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 1px solid #BFBFBF;
            box-sizing: border-box;
            border-radius: 0.2rem;
            margin-left: 1.3rem;
            cursor: pointer;
        }

        .course-coach-manage-body .course-coach-manage-addtwo {
            position: absolute;
            width: 30.4rem;
            height: 29.2rem;
            top: 8.75rem;
            left: 26.5rem;
            background: #D0E8F2;
            border-radius: 0.45rem;
            padding: 0.9rem;
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
            width: 1.2rem;
            height: 1.2rem
        }

        .coach-manage-addtwo-flexone .coach-manage-addtwo-flextwo p {
            font-size: 0.9rem;
            margin-left: 0.75rem
        }

        .course-coach-manage-addtwo .coach-manage-addtwo-flexthree {
            width: 28.5rem;
            height: 25.25rem;
            border: 1px solid #71B2EF;
            background: white;
            margin-top: 0.85rem;
            padding: 1.1rem 0 0 0.2rem;
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
            width: 4rem;
            border-radius: 0.2rem;
            background: #F5F5F5;
            margin-left: 0.9rem;
            height: 1.5rem;
            box-sizing: border-box;
            margin-bottom: 0.9rem;
            display: flex;
            align-items: center;
            cursor: pointer;
            font-size: 0.7rem;
            justify-content: center;
        }

        .coach-manage-addtwo-flexthree .addtwo-flexfour .active {
            background: #71B2EF;
            color: white
        }


        .coach-manage-addtwo-flexthree .coach-manage-addtwo-flexfour {
            padding: 0 1.05rem 1.3rem 1.05rem;
            position: absolute;
            bottom: 0px;
            width: 100%;
            box-sizing: border-box;
        }

        .coach-manage-addtwo-flexthree .coach-manage-addtwo-flexfour p {
            font-size: 0.8rem
        }

        .coach-manage-addtwo-flexfour .addtwo-flexfour-flex {
            display: flex;
            justify-content: center;
            margin-top: 2.15rem
        }

        .coach-manage-addtwo-flexfour .addtwo-flexfour-flex #flexfour-flex-pone {
            width: 5rem;
            height: 2rem;
            background: #71B2EF;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 0.2rem;
            cursor: pointer;
            font-size: 0.9rem
        }

        .coach-manage-addtwo-flexfour .addtwo-flexfour-flex #flexfour-flex-ptwo {
            width: 5rem;
            height: 2rem;
            border: 1px solid #BFBFBF;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 0.2rem;
            margin-left: 1.3rem;
            cursor: pointer;
            font-size: 0.9rem
        }

        .course-coach-manage-body .course-coach-manage-addthree {
            position: absolute;
            width: 34.4rem;
            height: 33.9rem;
            top: 7rem;
            left: 24.25rem;
            background: #D0E8F2;
            border-radius: 0.45rem;
            padding: 0.9rem;
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
            width: 1.2rem;
            height: 1.2rem
        }

        .coach-manage-addthree-flexone .coach-manage-addthree-flextwo p {
            font-size: 0.9rem;
            margin-left: 0.65rem
        }

        .course-coach-manage-addthree .coach-manage-addthree-flexthree {
            width: 32.5rem;
            height: 30rem;
            border: 1px solid #71B2EF;
            background: white;
            margin-top: 0.85rem;
            box-sizing: border-box;
            position: relative;
            z-index: -10;
        }

        .coach-manage-addthree-flexthree .addthree-flexfour {
            display: flex;
            flex-wrap: wrap;
        }

        .coach-manage-addthree-flexthree .coach-manage-addthree-flexthree-flex {
            padding: 1.25rem 1.25rem 0 0.35rem;
            box-sizing: border-box;
        }

        .coach-manage-addthree-flexthree-flex .coach-manage-addthree-flexthree-flex-p {
            margin: 0 0 1rem 0.9rem;
            font-size: 0.9rem;
            color: black
        }

        .coach-manage-addthree-flexthree .flexthree-tags {
            width: 4rem;
            border-radius: 0.2rem;
            background: #F5F5F5;
            margin-left: 0.9rem;
            height: 1.5rem;
            box-sizing: border-box;
            margin-bottom: 0.9rem;
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        .coach-manage-addthree-flexthree .flexthree-tags1 {
            padding: 0.5rem;
            border-radius: 0.2rem;
            background: #F5F5F5;
            margin-left: 0.9rem;
            height: 1.5rem;
            box-sizing: border-box;
            margin-bottom: 0.9rem;
            display: flex;
            align-items: center;
            cursor: pointer;
            font-size: 0.7rem
        }

        .coach-manage-addthree-flexthree .addthree-flexfour .active1 {
            background: #71B2EF;
            color: white
        }


        .coach-manage-addthree-flexthree .coach-manage-addthree-flexfour {
            padding: 0 1.05rem 1.3rem 1.05rem;
            position: absolute;
            bottom: 0.2rem;
            width: 36.35rem;
            box-sizing: border-box;
            background: white
        }

        .coach-manage-addthree-flexfour .addthree-flexfour-flex {
            display: flex;
            justify-content: center;
            margin-top: 2.15rem
        }

        .coach-manage-addthree-flexfour .addthree-flexfour-flex #flexfour-flex-pthree {
            width: 5rem;
            height: 2rem;
            background: #71B2EF;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 0.2rem;
            cursor: pointer;
            font-size: 0.9rem
        }

        .coach-manage-addthree-flexfour .addthree-flexfour-flex #flexfour-flex-pfour {
            width: 5rem;
            height: 2rem;
            border: 1px solid #BFBFBF;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 0.2rem;
            margin-left: 1.3rem;
            cursor: pointer;
            font-size: 0.9rem;
        }

        #coach-manage-addthree-flexthree-list {
            height: 30rem;
            padding-bottom: 5rem;
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
    </style>
</head>

<body>
    <div class="course-coach-manage-body">
        <div class="course-coach-manage-flex">
            <div style="font-size:0.8rem">员工姓名</div>
            <input class="course-coach-manage-flex-input" id="ccmfi1" type="text">
            <div style="font-size:0.8rem">员工工号</div>
            <input class="course-coach-manage-flex-input" id="ccmfi2" type="text">
            <div style="font-size:0.8rem">课程类型</div>
            <div class="course-coach-manage-flex-select-one">
                <div class="select-menu">
                    <div class="select-menu-div" id="select-menu-div1">
                        <input class="select-menu-input" />

                        <img class="select-menu-img" src="./image/sifting_icon.png" />
                    </div>
                    <ul class="select-menu-ul" id="select-menu-ul-GroupType">

                    </ul>
                </div>
            </div>
            <div style="font-size:0.8rem">课程名称</div>
            <div class="course-coach-manage-flex-select-two">
                <div style="width:10rem;height:1.5rem;border:1px solid #BFBFBF;border-radius: 0.2rem;margin:0 1.5rem 0 1rem">
                    <input style="width:10rem;height:1.5rem;border:0;" />
                </div>
            </div>
            <div class="course-coach-manage-flextwo">
                <p id="course-coach-manage-flextwo-pone">查询</p>
                <p id="course-coach-manage-flextwo-ptwo">清除</p>
            </div>
        </div>
        <div class="course-coach-manage-table"></div>
        <div class="course-coach-manage-bottom">
            <div class="box" id="boxpage" style="margin-left:0"></div>
        </div>
        <div class="course-coach-manage-add"></div>
        <div class="course-coach-manage-add1" style="opacity: 0;"></div>
        <div class="course-coach-manage-add2" style="opacity: 0;"></div>
    </div>
</body>
<script type="text/javascript">

    function upload() {
            if ($("#photoFile").val() == '') {
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
                    $("#preview_photo").attr("src", 'images/'+data.rows[0].path)
                    $('#photoFile').attr('class', data.rows[0].path)
                    alert(data.message)
                },
                error: function (data) {
                    alert("上传失败")
                }
            });
        }

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
            //this.input_all4()
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
                url: "rest/wx/dictionnary/getdictionnarylist",
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

            //console.log($('.course-coach-manage-flex-input').val())

            for (var i = 1; i < $('#select-menu-ul-GroupType').children().length; i++) {
                if ($('#select-menu-ul-GroupType').children().eq(i).html() == $('#select-menu-div1').children('input').val()) {
                    var classifyId = $('#select-menu-ul-GroupType').children().eq(i).attr('class').split(' ')[0]
                }
            }

            var onPagechange = function (page) {
                console.log(page)
                aaaaaa(page)
            }

            var page = 1;
            aaaaaa(page)

            function aaaaaa(page){

            if ($('#select-menu-div1').children('input').val() == "全部") {
                var paramscoach = {
                    page: page,
                    rows: 10,
                    param: {
                        name: $('#ccmfi1').val(),
                        user: $('#ccmfi2').val(),
                        classifyId: null,
                        name: $('.course-coach-manage-flex-select-two').children().children().val()
                    },
                }
            } else {
                var paramscoach = {
                    page: page,
                    rows: 10,
                    param: {
                        name: $('#ccmfi1').val(),
                        user: $('#ccmfi2').val(),
                        classifyId: classifyId,
                        name: $('.course-coach-manage-flex-select-two').children().children().val()

                    }
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
            var str2 = `
                    <table border="0" cellspacing="0" cellpadding="0">
                    <tr>
                        <th style="width:2.45rem">序号</th>
                        <th style="width:6rem">员工姓名</th>
                        <th style="width:6rem">员工工号</th>
                        <th style="width:12.5rem">个人标签</th>
                        <th style="width:24.5rem">上牌课程</th>
                        <th style="width:24.4rem">个人简介</th>
                        <th style="width:6rem">操作</th>
                    </tr>
                `
//                    console.log("**"+result.results)
                    $.each(result.rows, function (i, item) {
                    	
                        str2 += `
                                        <tr class="course-coach-manage-table-tr">
                                            <td style="width:2.45rem"><div style="display:flex;justify-content: center;">`+ (i + 1 + (paramscoach.page - 1) * paramscoach.rows) + `</div></td>
                                            <td style="width:6rem">`+ item.realName + `</td>
                                            <td style="width:6rem">`+ item.userName + `</td>
                                            <td style="width:12.5rem">`+ biaoqian(item.coachTagList) + `</td>
                                            <td style="width:24.5rem">`+ kecheng(item.coachSkillList) + `</td>
                                            <td style="width:24.4rem">`+ introduce(item) + `</td>
                                            <td style="width:6rem"><a class="course-coach-manage-a">编辑</a></td>
                                        </tr>
                                    `
                    })
//                  console.log(str2)
                    that.table.html(str2)
                         
                    //添加标签窗口的表框
                    straddsmall1 = `
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
                    straddsmall2 = `
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

                    var obj = {
                        wrapid: 'boxpage', //页面显示分页器容器id
                        total: result.total, //总条数
                        pagesize: 10, //每页显示10条
                        currentPage: page, //当前页
                        onPagechange: onPagechange
                        //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                    }

                    pagination.init(obj);

                        // var str3
                        // str3 = `
                        //         <p>共`+ result.totalCount +`条，每页10条</p>
                        //     `
                        // $('#course-coach-manage-page').html(str3)

                    new credit().init()
                },
                error: function (e) {
                    console.log(e.status);
                    console.log(e.responseText)
                }
            })

            }

            $('#course-coach-manage-flextwo-pone').one('click', function () {
                that.table_all()
            })
        }

        // input_all4() {
        //     var obj = {
        //         wrapid: 'ywyboxpage', //页面显示分页器容器id
        //         total: 15, //总条数
        //         pagesize: 15, //每页显示10条
        //         currentPage: 2, //当前页
        //         onPagechange: 2,
        //         //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
        //     }
        //     pagination.init(obj);

        //     var str3
        //     str3 = `
        //             <p>共20条，每条15条</p>
        //         `
        //     this.input_four.html(str3)
        // }
    }

    class credit {
        constructor() {
            this.coach_manage_a = $(".course-coach-manage-a")
        }

        init() {
            this.ccm_a()
        }

        ccm_a() {
            var that = this
            //编辑员工点击
            this.coach_manage_a.click(function () {
                //console.log($(this).parent().parent().children().eq(2).html())

                var paramscoach = {
                    page: 1,
                    rows: 10,
                    param: {
                        name: null,
                        user: $(this).parent().parent().children().eq(2).html(),
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
                        // console.log(result.results[0].nickName)                        

                        //添加窗口的内容
                        var stradd;
                        if(result.rows[0].jobCategory == 1){
                        stradd = `
                                <div class="course-coach-manage-addone">
                                    <div class="coach-manage-addone-flexone">
                                        <div class="coach-manage-addone-flextwo">
                                            <img src="./image/editor_icon.png" alt="">
                                            <p>编辑员工</p>
                                        </div>
                                        <img id="addone-flexone-chacha" style="width:1.8rem;height:1.8rem" src="./image/popupclose_btn.png" alt="">
                                    </div>
                                    <div class="coach-manage-addone-flexthree">
                                        <div class="coach-manage-addone-flexthree-blockone"><p class="flexthree-blockone-pone">员工工号</p><p class="flexthree-blockone-ptwo `+ result.rows[0].userId +`" id="coach-userid">`+ result.rows[0].userName +`</p></div>
                                        <div class="coach-manage-addone-flexthree-blockone"><p class="flexthree-blockone-pone">员工姓名</p><p class="flexthree-blockone-ptwo" id="coach-realName">`+ result.rows[0].realName +`</p></div>
                                        <div class="coach-manage-addone-flexthree-blockone" style="height:auto">
                                            <p class="flexthree-blockone-pone" style="margin-right:5.75rem">头像</p>
                                            <div id="imageimage" style="display:flex;justify-content:space-between;width:33rem">
                                                <img style="width:2.5rem;height:2.5rem" src="images/`+ result.rows[0].pictures +`">  
                                                <div id="imageimage1" style="display:flex"><p style="margin-right:0.5rem;font-size:0.7rem;color:#71B2EF">编辑</p><image style="style="width:1rem;height:0.8rem"" src="image/pulldown_btn.png"></div>
                                            </div>
                                            <div id="imageimage11" style="display:none">
                                                <div style="display:flex;justify-content:space-between;width:32.5rem">
                                                    <div style="display:flex">
                                                        <img id="preview_photo" src="images/`+ result.rows[0].pictures +`" style="width:6.5rem;height:7.4rem">
                                                        <p style="width:4rem;height:1.5rem;background:#71B2EF;color:white;text-align:center;line-height:1.5rem;border-radius:0.2rem" id="clickclick">上传头像</p>
                                                        <input type="file" class="`+ result.rows[0].pictures +`" id="photoFile" style="display: none;" onchange="upload()">
                                                    </div>
                                                    <div id="shouqishouqi" style="display:flex">
                                                        <p style="font-size:0.7rem;color:#71B2EF;margin-right:0.5rem">收起</p>    
                                                        <img style="width:1rem;height:0.8rem" src="image/pullup_btn.png">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="coach-manage-addone-flexthree-blockone"><p class="flexthree-blockone-pone">昵称</p><div id="areaborder"><input id="area" value="`+ result.rows[0].nickName + `"/></div><div class="flexthree-blockone-inputtwo"><span id="text-count">0</span>/7</div></div>
                                        <div class="coach-manage-addone-flexthree-blockthree">
                                            <p class="flexthree-blockthree-pone">工作性质</p>
                                            <div class="flexthree-blocktwo-pseven">
                                                <div class="select-menu-div">
                                                    <input class="select-menu-input" />

                                                    <img class="select-menu-img" src="./image/sifting_icon.png" />
                                                </div>
                                                <ul class="select-menu-ul `+ result.rows[0].jobCategory +`" id="select-menu-ul-state">
                                                     <li class="select-this">全职</li>
                                                     <li>兼职</li>
                                                </ul>    
                                            </div>
                                        </div>
                                        <div class="coach-manage-addone-flexthree-blocktwo">
                                            <p class="flexthree-blocktwo-pone">个人标签</p>
                                            <p class="flexthree-blocktwo-pfour" id="coach-tag"></p>
                                            <p class="flexthree-blocktwo-pthree" id="tianjia1">添加</p>
                                        </div>
                                        <div class="coach-manage-addone-flexthree-blocktwo">
                                            <p class="flexthree-blocktwo-pone">上牌课程</p>
                                            <p class="flexthree-blocktwo-pfive" id="coach-course"></p>
                                            <p class="flexthree-blocktwo-pthree" id="tianjia2">添加</p>
                                        </div>
                                        <div class="coach-manage-addone-flexthree-blocktwo" style="margin-bottom:100px">
                                            <p class="flexthree-blocktwo-pone">个人简介</p>
                                            <textarea class="flexthree-blocktwo-psix" id="coach-introduce">`+$.trim(result.rows[0].introduce)+`</textarea>
                                        </div>
                                    </div>
                                    <div class="coach-manage-addone-flexfour">
                                        <p id="coach-manage-addone-flexfour-save">保存</p>
                                        <p id="coach-manage-addone-flexfour-quxiao">取消</p>
                                    </div>
                                </div>
                            `
                        }
                        if(result.rows[0].jobCategory == 2){
                            stradd = `
                                <div class="course-coach-manage-addone">
                                    <div class="coach-manage-addone-flexone">
                                        <div class="coach-manage-addone-flextwo">
                                            <img src="./image/editor_icon.png" alt="">
                                            <p>编辑员工</p>
                                        </div>
                                        <img id="addone-flexone-chacha" style="width:1.8rem;height:1.8rem" src="./image/popupclose_btn.png" alt="">
                                    </div>
                                    <div class="coach-manage-addone-flexthree">
                                        <div class="coach-manage-addone-flexthree-blockone"><p class="flexthree-blockone-pone">员工工号</p><p class="flexthree-blockone-ptwo `+ result.rows[0].userId + `" id="coach-userid">` + result.rows[0].userName + `</p></div>
                                        <div class="coach-manage-addone-flexthree-blockone"><p class="flexthree-blockone-pone">员工姓名</p><p class="flexthree-blockone-ptwo" id="coach-realName">`+ result.rows[0].realName + `</p></div>
                                        <div class="coach-manage-addone-flexthree-blockone" style="height:auto">
                                            <p class="flexthree-blockone-pone" style="margin-right:5.75rem">头像</p>
                                            <div id="imageimage" style="display:flex;justify-content:space-between;width:33rem">
                                                <img style="width:2.5rem;height:2.5rem" src="images/`+ result.rows[0].pictures +`"> 
                                                <div id="imageimage1" style="display:flex"><p style="margin-right:0.5rem;font-size:0.7rem;color:#71B2EF">编辑</p><image style="width:1rem;height:0.8rem" src="image/pulldown_btn.png"></div>
                                            </div>
                                            <div id="imageimage11" style="display:none">
                                                <div style="display:flex;justify-content:space-between;width:32.5rem">
                                                    <div style="display:flex">
                                                        <img id="preview_photo" src="images/`+ result.rows[0].pictures +`" style="width:6.5rem;height:7.4rem">
                                                        <p style="width:4rem;height:1.5rem;background:#71B2EF;color:white;text-align:center;line-height:1.5rem;border-radius:0.2rem" id="clickclick">上传头像</p>
                                                        <input type="file" class="`+ result.rows[0].pictures +`" id="photoFile" style="display: none;" onchange="upload()">
                                                    </div>
                                                    <div id="shouqishouqi" style="display:flex">
                                                        <p style="font-size:0.7rem;color:#71B2EF;margin-right:0.5rem">收起</p>    
                                                        <img style="width:1rem;height:0.8rem" src="image/pullup_btn.png">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="coach-manage-addone-flexthree-blockone"><p class="flexthree-blockone-pone">昵称</p><div id="areaborder"><input id="area" value="`+ result.rows[0].nickName + `"/></div><div class="flexthree-blockone-inputtwo"><span id="text-count">0</span>/7</div></div>
                                        <div class="coach-manage-addone-flexthree-blockthree">
                                            <p class="flexthree-blockthree-pone">工作性质</p>
                                            <div class="flexthree-blocktwo-pseven">
                                                <div class="select-menu-div">
                                                    <input class="select-menu-input" id="qzajz"/>

                                                    <img class="select-menu-img" src="./image/sifting_icon.png" />
                                                </div>
                                                <ul class="select-menu-ul" id="select-menu-ul-state">
                                                     <li>全职</li>
                                                     <li class="select-this">兼职</li>
                                                </ul>    
                                            </div>
                                        </div>
                                        <div class="coach-manage-addone-flexthree-blocktwo">
                                            <p class="flexthree-blocktwo-pone">个人标签</p>
                                            <p class="flexthree-blocktwo-pfour" id="coach-tag"></p>
                                            <p class="flexthree-blocktwo-pthree" id="tianjia1">添加</p>
                                        </div>
                                        <div class="coach-manage-addone-flexthree-blocktwo">
                                            <p class="flexthree-blocktwo-pone">上牌课程</p>
                                            <p class="flexthree-blocktwo-pfive" id="coach-course"></p>
                                            <p class="flexthree-blocktwo-pthree" id="tianjia2">添加</p>
                                        </div>
                                        <div class="coach-manage-addone-flexthree-blocktwo" style="margin-bottom:100px">
                                            <p class="flexthree-blocktwo-pone">个人简介</p>
                                            <textarea class="flexthree-blocktwo-psix" id="coach-introduce" style="resize: none;">`+result.rows[0].introduce+`</textarea>
                                        </div>
                                    </div>
                                    <div class="coach-manage-addone-flexfour">
                                        <p id="coach-manage-addone-flexfour-save">保存</p>
                                        <p id="coach-manage-addone-flexfour-quxiao">取消</p>
                                    </div>
                                </div>
                            `
                        }

                        $(".course-coach-manage-add").html(stradd)

                        setTimeout(() => {
                            var ad_ft = '';

                            //课程标签的请求及渲染
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
                                    $.each(result.rows, function (i, item) {
                                        ad_ft += `
                                                    <div class="flexthree-tags `+ item.dictionaryId +`">
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

                                },
                                error: function (e) {
                                    console.log(e.status);
                                    console.log(e.responseText)
                                }
                            })

                            //添加标签窗口的标签遍历

                            var ad_ft1 = '';

                            //课程名称的请求及渲染

                            $.ajax({
                                type: 'GET',
                                contentType: "application/json;charset=UTF-8",
                                url: "rest/leagueCurriculum/getReleaseLeagueCurriculumListGroupByType",
                                success: function (results) {
                                    console.log(results)
                                    var result = results.rows
                                    //console.log(list)
                                    for (var i = 0; i < result.length; i++) {
                                        var ad_str2 = '';
                                        for (var j = 0; j < result[i].children.length; j++) {
                                            ad_str2 += `
                                                <div class="flexthree-tags1 `+ result[i].children[j].id +`">
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
                                            // console.log(111)
                                        }
                                    }
                                    //console.log($('#coach-manage-addthree-flexthree-list').html())
                                },
                                error: function (e) {
                                    console.log(e.status);
                                    console.log(e.responseText)
                                }
                            })

                            $('#clickclick').click(function(){
                                $("#photoFile").click()
                            })

                            $('#imageimage1').click(function () {
                                $('#imageimage').hide()
                                $('#imageimage11').show()
                            })

                            $('#shouqishouqi').click(function(){
                                $('#imageimage').show()
                                $('#imageimage11').hide()
                            })

                            setTimeout(() => {
                                new inputcontain().init(list)
                            }, 100);

                        }, 50);


                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText)
                    }
                })
            })
        }
    }

    class inputcontain {

        init(list) {
            this.textare_contain()
            this.add_tags1(list)
            this.chacha()
            this.smallselect()
            this.select_option()
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

        add_tags1(list) {
            
            var straddtags1 = '';
            var straddtags2 = '';

            for (var i = 0; i < $('#addtwo-flexfour').children().length; i++) {
                if ($('#addtwo-flexfour').children().eq(i).hasClass('active')) {

                    straddtags1 += `  
                                        <p class="blocktwo-pfour-p `+ $('#addtwo-flexfour').children().eq(i).attr('class').split(' ')[1] +`">
                                            `+ $('#addtwo-flexfour').children().eq(i).html() + `
                                            <a><img src="./image/classdel_btn.png" alt=""></img></a>
                                        </p>`
                }
            }

            $('.flexthree-blocktwo-pfour').html(straddtags1)

            //添加窗口第二个标签栏

            for (var i = 0; i < $('.addthree-flexfour').length; i++) {
                for (var j = 0; j < $('.addthree-flexfour').eq(i).children().length; j++) {
                    if ($('.addthree-flexfour').eq(i).children().eq(j).hasClass('active1')) {
                        straddtags2 += `  
                            <p class="blocktwo-pfive-p `+ $('.addthree-flexfour').eq(i).children().eq(j).attr('class').split(' ')[1] +`">
                                `+ $('.addthree-flexfour').eq(i).children().eq(j).html() + `
                                <a><img src="./image/classdel_btn.png" alt=""></img></a>
                            </p>`
                    }
                }
            }

            $('.flexthree-blocktwo-pfive').html(straddtags2)
            console.log(111)
            
            setTimeout(() => {
                new ashow().init()
            }, 100);
        }

        chacha() {
            //添加窗口点击叉关闭窗口
            $('#addone-flexone-chacha').click(function () {
                $(this).parent().parent().hide()
            })

            //编辑员工的点击取消关闭窗口
            $('#coach-manage-addone-flexfour-quxiao').click(function () {
                $(this).parent().parent().hide()
            })

            //编辑员工的点击确定关闭窗口

            $('#coach-manage-addone-flexfour-save').click(function(){
                $(this).parent().parent().hide()
                var TagList = []
                var SkillList = []

                for(var i=0;i< $('#coach-tag').children().length;i++){
                    TagList.push({ dictionaryId : $('#coach-tag').children().eq(i).attr('class').split(' ')[1]})
                }

                for(var j=0;j<$('#coach-course').children().length;j++){
                    SkillList.push({leagueCurriculumId : $('#coach-course').children().eq(j).attr('class').split(' ')[1]})
                }

                var jobCategory = ''

                if($('#qzajz').val() == '全职'){
                    jobCategory = 1
                }else{
                    jobCategory = 2
                }

                console.log(TagList)
                console.log(SkillList)

                // for(var j=0;j<$('#coach-course').children().length)

                var paramcoach = {
                    id : $('#coach-userid').attr('class').split(' ')[1],
                    nickName : $('#areaborder').children().val(),
                    jobCategory : jobCategory,
                    introduce : $.trim($('#coach-introduce').val()),
                    coachTagList : TagList,
                    coachSkillList : SkillList,
                    pictures : $('#photoFile').attr('class')
                }
                console.log(paramcoach)

               $.ajax({
                    type: 'POST',
                    url: "rest/leagueCoach/updateLeagueCoach",
                    contentType: "application/json",  //multipart/form-data;boundary=--xxxxxxx   application/json,
                    data: JSON.stringify(paramcoach),
                    success: function (result) {
                        console.log(result)
                    },
                    error: function (e) {
                        console.log(e.status);
                        console.log(e.responseText)
                    }
                })
            })

            //点击添加关闭原窗口，打开添加标签窗口
            $('#tianjia1').click(function () {
                //$(this).parent().parent().parent().hide()
                $('.course-coach-manage-add1').css('opacity', 1)
                $('.course-coach-manage-addtwo').css('z-index', 999)
                $('.coach-manage-addtwo-flexthree').css('z-index', 999)

                // for(var i = 0;i<$(this).parent().children('.flexthree-blocktwo-pfour').children().length;i++){
                //     for(var j=0;j<$('#addtwo-flexfour').children().length;j++){
                //         if(!$(this).parent().children('.flexthree-blocktwo-pfour').children().eq(i).html() == $('#addtwo-flexfour').children().eq(j).html()){
                //             $('#addtwo-flexfour').children().eq(j).removeClass('active')
                //         }
                //     }   
                // }
                
            })

            $('#tianjia2').click(function () {
                //$(this).parent().parent().parent().hide()
                $('.course-coach-manage-add2').css('opacity', 1)
                $('.course-coach-manage-addthree').css('z-index', 999)
                $('.coach-manage-addthree-flexthree').css('z-index', 999)
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

        select_option() {
            selectMenu(1);
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
                
            })

            $('#flexfour-flex-pone').one('click',function () {
                $('.course-coach-manage-add1').css('opacity', 0)
                $('.course-coach-manage-addtwo').css('z-index', -10)
                setTimeout(() => {
                    new inputcontain().add_tags1()
                }, 100);
            })

            $('#flexfour-flex-ptwo').click(function () {
                $('.course-coach-manage-add1').css('opacity', 0)
                
                console.log($('#coach-tag').html())
                
            })

            //$('#addtwo-flexfour').children().eq(0).click()

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
                
            })

            $('#flexfour-flex-pthree').one('click',function () {
                $('.course-coach-manage-add2').css('opacity', 0)
                $('.course-coach-manage-addthree').css('z-index', -10)

                setTimeout(() => {
                    new inputcontain().add_tags1()
                }, 100);
            })

            $('#flexfour-flex-pfour').click(function () {
                $('.course-coach-manage-add2').css('opacity', 0)
                
            })
        }
    }

    $('.box').pagination({
        mode: 'fixed'
    });
</script>

</html>