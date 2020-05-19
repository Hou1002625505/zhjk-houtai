<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>企业档案</title>
    <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="easyui/demo.css">
    <link rel="stylesheet" type="text/css" href="../easyui/pagination.css" />
    <link rel="stylesheet" type="text/css" href="easyui/themes/datepicker.css" />
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="js/common.js"></script>
    <script src="../easyui/pagination.js" type="text/javascript" charset="utf-8"></script>
</head>
<style type="text/css">
    body {
        font-family: verdana, helvetica, arial, sans-serif;
        padding: 20px 20px 20px 18px;
        font-size: 12px;
        margin: 0;
    }

    html {
        border: 1px solid #95B8E7;
        border-bottom: none;
    }

    em {
        font-style: normal;
    }

    /*1*/
    .item1 {
        width: 3%;
    }

    /*5*/
    .item2 {
        width: 11.8%;
    }

    /*  4*/
    .item3 {
        width: 8%;
    }

    /*1*/
    .item4 {
        width: 6%;
    }

    /*1*/
    .item5 {
        width: 23%;
        cursor: pointer;
    }

    .fitem2 {
        width: 7%;
    }

    /*10*/
    .fitem2f {
        width: 8%;
    }

    .fitem3 {
        width: 4%;
    }

    /*1*/
    .fitem4 {
        width: 9%;
    }

    /*2*/
    .fitem4f {
        width: 12%;
    }

    .clear:after {
        content: '';
        display: block;
        clear: both;
    }

    .clear {
        zoom: 1;
    }

    input::-webkit-outer-spin-button,
    input::-webkit-inner-spin-button {
        -webkit-appearance: none;
    }

    input[type="number"] {
        -moz-appearance: textfield;
    }

    .item5 .tdwrap {
        width: 100%;
        height: 100px;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }

    * {
        margin: 0;
        padding: 0;
    }

    .tuancao_wrap tr {
        height: 36px;
        border-right: 1px dotted #CCCCCC;
    }

    .tuancao_wrap td {
        height: 36px;
        text-align: center;
        border-left: 1px dotted #CCCCCC;
        border-bottom: 1px dotted #CCCCCC;
        font-size: 14px;
        color: #444444;
    }

    .tuancao_wrap th {
        font-weight: 400;
        font-size: 16px;
        color: #444444;
    }

    .tuancao_wrap1 tr {
        height: 36px;
        border-right: 1px dotted #CCCCCC;
    }

    .tuancao_wrap1 td {
        height: 36px;
        text-align: center;
        border-left: 1px dotted #CCCCCC;
        border-bottom: 1px dotted #CCCCCC;
        font-size: 14px;
        color: #444444;
    }

    .tuancao_wrap1 th {
        font-weight: 400;
        font-size: 16px;
        color: #444444;
    }

    .tuancao_wrap td span {
        font-size: 16px;
        color: #71B2EF;
        cursor: pointer;
    }

    .tuandatalist {
        width: 100%;
    }

    .pcintolist_title {
        width: 100%;
        height: 40px;
        line-height: 40px;
        border: 1px solid #71B2EE;
        background: linear-gradient(to bottom, #EFF5FF 0, #E0ECFF 100%);
        background-color: #E0ECFF;
    }

    .pcintolist_title .item {
        float: left;
        font-size: 14px;
        color: #444444;
        text-align: center;
        height: 100%;
        font-weight: bold;
        position: relative;
        overflow-y: auto;
    }

    .datalist {
        width: 100%;
        height: 36px;
        line-height: 36px;
        border-bottom: 1px dotted #CCCCCC;
        border-right: 1px dotted #CCCCCC;
    }

    .datalist .item {
        float: left;
        font-size: 14px;
        color: #444444;
        text-align: center;
        height: 100%;
        position: relative;
        overflow-y: auto;
        border-left: 1px dotted #CCCCCC;
    }

    .datalist span {
        font-size: 16px;
        color: #71B2EF;
    }

    .datalist em {
        font-size: 14px;
        font-style: normal;
        color: #BFBFBF;
    }

    .datalist .bianji {
        border-right: 2px solid #71B2EF;
        padding-right: 6px;
        cursor: pointer;
    }

    .datalist .delte {
        padding-left: 6px;
        cursor: pointer;
    }

    .tuancao1_header .input1 {
        border: 1px solid #CCCCCC;
        width: 150px;
        line-height: 30px;
        height: 30px;
        border-radius: 3px;
        padding-left: 10px;
        font-size: 18px;
    }

    .tuancao1_header .input2 {
        border: 1px solid #CCCCCC;
        width: 150px;
        line-height: 30px;
        height: 30px;
        border-radius: 3px;
        padding-left: 10px;
        font-size: 18px;
    }

    .tuancao1_header select {
        border: 1px solid #CCCCCC;
        width: 150px;
        line-height: 30px;
        height: 30px;
        border-radius: 3px;
        padding-left: 10px;
        font-size: 18px;
        appearance: none;
        -moz-appearance: none;
        -webkit-appearance: none;
    }

    .tuancao1_header label {
        font-size: 18px;
        font-family: MicrosoftYaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
        padding: 0 2px 0 28px;

    }

    .tuancao_header .input1 {
        border: 1px solid #CCCCCC;
        width: 240px;
        line-height: 36px;
        height: 36px;
        border-radius: 3px;
        padding-left: 10px;
        font-size: 18px;
    }

    .tuancao_header .input2 {
        border: 1px solid #CCCCCC;
        width: 240px;
        line-height: 36px;
        height: 36px;
        border-radius: 3px;
        padding-left: 10px;
        font-size: 18px;
    }

    .tuancao_header select {
        border: 1px solid #CCCCCC;
        width: 240px;
        line-height: 36px;
        height: 36px;
        border-radius: 3px;
        padding-left: 10px;
        font-size: 18px;
        appearance: none;
        -moz-appearance: none;
        -webkit-appearance: none;
    }

    .tuancao_header label {
        font-size: 18px;
        font-family: MicrosoftYaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
        padding: 0 20px 0 28px;

    }

    .querybtn {
        display: inline-block;
        width: 90px;
        line-height: 36px;
        height: 36px;
        text-align: center;
        background: #71B2EF;
        color: #fff;
        border-radius: 4px;
        margin: 0 27px 0 28px;
        font-size: 16px;
        cursor: pointer;
    }

    .clearbtn {
        display: inline-block;
        width: 90px;
        line-height: 36px;
        height: 36px;
        text-align: center;
        background: #fff;
        color: #444444;
        border-radius: 4px;
        border: 1px solid #BFBFBF;
        font-size: 16px;
        cursor: pointer;
    }

    .pagination-btn {
        height: 23px !important;
        line-height: 23px !important;
    }

    .pagination-ellipsis {
        position: relative;
        top: -2px !important;
    }

    .box {
        margin-left: 50%;
        transform: translateX(-50%);

    }

    .tuancao_header p {
        width: 120px;
        height: 40px;
        line-height: 40px;
        background: rgba(113, 178, 239, 1);
        border-radius: 4px;
        text-align: center;
        font-size: 20px;
        color: #fff;
        margin-bottom: 20px;
        cursor: pointer;
    }

    .xinjiandang_wrap {
        background: #fff;
        width: 100%;
        /*min-height:100%;*/
        /*margin-top:-10px*/
    }

    .xinjiandang_wrap .back {
        font-size: 16px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(113, 178, 239, 1);
        cursor: pointer;
        position: relative;
        top: -8px;
        padding-bottom: 8px;
        width: 150px;
    }

    .tab_wrap {
        width: 100%;
        border-bottom: 1px solid rgba(191, 191, 191, 1);
    }

    .tab_wrap .active {
        background: #71B2EF !important;
        color: #fff !important;
    }

    .tab_wrap span {
        display: inline-block;
        width: 120px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        border: 1px solid rgba(191, 191, 191, 1);
        font-size: 16px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
        border-bottom: none;
        cursor: pointer;
    }

    .tabinfo {
        border-right: none !important;
    }

    .tabaccount {
        border-right: none !important;
    }

    .tabuser {
        border-right: none !important;
    }

    .qiliannum {
        border-right: none !important;
    }

    .tabgenjin {
        border-right: none !important;
    }

    .bussess_item {
        margin-top: 20px;
    }

    .bussess_item span {
        font-size: 18px;
        display: inline-block;
        width: 160px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
    }

    .bussess_item .input {
        width: 400px;
        height: 30px;
        padding-left: 15px;
        margin-right: 10px;
        border: 1px solid rgba(191, 191, 191, 1);
        border-radius: 2px;
        font-size: 16px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
        -webkit-appearance: none;
    }

    .bussess_item .em {
        font-size: 16px;
        font-family: MicrosoftYaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
        padding: 0px 20px;
        position: relative;
        top: -6px;
    }

    .bussess_item .radio {
        width: 100px;
    }

    .bussess_item em {
        font-size: 14px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
    }

    .yuanradio {
        display: inline-block;
        width: 24px !important;
        height: 24px;
        background: url(images/pcradiono.png) no-repeat;
        background-size: 100% !important;
    }

    .yuanradio7 {
        display: inline-block;
        width: 24px !important;
        height: 24px;
        background: url(images/pcradiono.png) no-repeat;
        background-size: 100% !important;
    }

    .yuanradioactive {
        display: inline-block;
        width: 24px !important;
        height: 24px;
        background: url(images/pcradioche.png) no-repeat !important;
        background-size: 100% !important;
    }

    .yuanradioactive7 {
        display: inline-block;
        width: 24px !important;
        height: 24px;
        background: url(images/pcradioche.png) no-repeat !important;
        background-size: 100% !important;
    }

    .bussess_info .text_p {
        font-size: 20px;
        font-family: Microsoft YaHei;
        font-weight: bold;
        color: rgba(68, 68, 68, 1);
        margin-top: 20px;
    }

    .btn_wrap {
        margin-top: 30px;
    }

    .btn_wrap .save {
        width: 100px;
        display: inline-block;
        height: 36px;
        line-height: 36px;
        text-align: center;
        font-size: 18px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(255, 255, 255, 1);
        background: rgba(113, 178, 239, 1);
        border-radius: 4px;
        margin-right: 50px;
        cursor: pointer;
    }

    .btn_wrap .clear {
        width: 100px;
        display: inline-block;
        height: 36px;
        line-height: 36px;
        text-align: center;
        font-size: 18px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: #444444;
        background: #fff;
        border-radius: 4px;
        border: 1px solid rgba(191, 191, 191, 1);
        cursor: pointer;
    }

    .create_dangan {
        width: 880px;
        height: 806px;
        background: linear-gradient(to bottom, #EFF5FF 0, #E0ECFF 100%);
        border: 1px solid rgba(113, 178, 239, 1);
        box-shadow: 7px 7px 20px 0px rgba(107, 107, 107, 0.4);
        border-radius: 10px;
        position: absolute;
        left: 50%;
        top: 50%;
        margin-top: -380px;
        margin-left: -441px;
    }

    .create_con {
        width: 840px;
        height: 726px;
        background: #fff;
        margin: 0 auto;
        border: 1px solid rgba(113, 178, 239, 1);
        box-shadow: 4px 4px 10px 0px rgba(107, 107, 107, 0.3);
    }

    .create1_dangan_wrap {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        background: rgba(255, 255, 255, 0);
        z-index: 999;
        width: 100%;
        min-height: 100%;
    }

    .create1_dangan {
        width: 830px;
        height: 690px;
        background: linear-gradient(180deg, rgba(224, 236, 255, 1), rgba(237, 244, 255, 1));
        border: 1px solid rgba(113, 178, 239, 1);
        box-shadow: 7px 7px 20px 0px rgba(107, 107, 107, 0.4);
        border-radius: 10px;
        position: absolute;
        left: 28%;
        top: 4%;
        /*margin-top: -370px;
    margin-left: -551px;*/
    }

    .create1_con {
        width: 790px;
        height: 610px;
        background: #fff;
        margin: 0 auto;
        border: 1px solid rgba(113, 178, 239, 1);
        box-shadow: 4px 4px 10px 0px rgba(107, 107, 107, 0.3);
    }

    .create2_dangan {
        width: 778px;
        height: 496px;
        background: linear-gradient(180deg, rgba(224, 236, 255, 1), rgba(237, 244, 255, 1));
        border: 1px solid rgba(113, 178, 239, 1);
        box-shadow: 7px 7px 20px 0px rgba(107, 107, 107, 0.4);
        border-radius: 10px;
        position: absolute;
        left: 30%;
        top: 10%;
        /*margin-top: -370px;
    margin-left: -551px;*/
    }

    .create2_con {
        width: 741px;
        height: 416px;
        background: #fff;
        margin: 0 auto;
        border: 1px solid rgba(113, 178, 239, 1);
        box-shadow: 4px 4px 10px 0px rgba(107, 107, 107, 0.3);
    }

    .create3_dangan {
        width: 778px;
        height: 383px;
        background: linear-gradient(180deg, rgba(224, 236, 255, 1), rgba(237, 244, 255, 1));
        border: 1px solid rgba(113, 178, 239, 1);
        box-shadow: 7px 7px 20px 0px rgba(107, 107, 107, 0.4);
        border-radius: 10px;
        position: absolute;
        left: 30%;
        top: 20%;
        /*margin-top: -370px;
    margin-left: -551px;*/
    }

    .create3_con {
        width: 741px;
        height: 303px;
        background: #fff;
        margin: 0 auto;
        border: 1px solid rgba(113, 178, 239, 1);
        box-shadow: 4px 4px 10px 0px rgba(107, 107, 107, 0.3);
    }

    .creat_header {
        width: 900px;
        height: 50px;
        line-height: 50px;
    }

    .creat_header img {
        width: 26px;
        padding: 0 15px 0 20px;
        vertical-align: middle;
        padding-bottom: 10px;
    }

    .creat_header span {
        font-size: 24px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
    }

    .bussess_info1 {
        padding-left: 40px;
    }

    .bussess_info1 .input {
        width: 500px !important;
    }

    .bussess_info1 .btn_wrap {
        margin: 20px 0 20px 270px !important;
    }

    .bussess_info2 {
        padding-left: 40px;
    }

    .bussess_info2 .input {
        width: 537px !important;
    }

    .bussess_info2 .btn_wrap {
        margin: 30px 0 0 250px !important;
    }

    .bussess_info3 {
        padding-left: 30px;
    }

    .bussess_info3 .input {
        width: 500px !important;
    }

    .bussess_info3 .btn_wrap {
        margin: 30px 0 0 230px !important;
    }

    .bussess_info3 .input2 {
        width: 284px !important;
    }

    .xinjian_accountbtn {
        width: 120px;
        display: inline-block;
        height: 40px;
        cursor: pointer;
        line-height: 40px;
        text-align: center;
        font-size: 18px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(255, 255, 255, 1);
        background: rgba(113, 178, 239, 1);
        border-radius: 4px;
        margin: 30px 0;
    }

    .account_item {
        width: 360px;
        height: 212px;
        border: 1px solid rgba(112, 162, 240, 1);
        border-radius: 4px;
        padding-left: 30px;
        position: relative;
        float: left;
        margin: 0 28px 30px 0;
    }

    .account_title {
        font-size: 24px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
        padding: 15px 0;
    }

    .account_text {
        font-size: 18px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
        padding: 5px 0;
    }

    .last_text {
        padding-top: 12px;
    }

    .account_set {
        width: 64px;
        height: 30px;
        cursor: pointer;
        line-height: 30px;
        text-align: center;
        background: rgba(112, 162, 240, 1);
        border-radius: 2px;
        font-size: 14px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(255, 255, 255, 1);
        position: absolute;
        bottom: 12px;
        right: 20px;
    }

    .account_status {
        position: absolute;
        right: 0;
        top: 0;
    }

    .account_status img {
        width: 70px;
    }

    .account_moren {
        position: absolute;
        left: 0;
        top: 0;
    }

    .account_moren img {
        width: 70px;
    }

    .panel-tool-close1 {
        width: 25px;
        height: 25px;
        background: url(../images/closebtn.png) no-repeat;
        background-size: 100%;
        cursor: pointer;
        margin-top: 3px;
    }

    .fangbtn1 {
        position: absolute;
        right: 20px;
        top: 12px;
    }

    input::-webkit-input-placeholder {
        font-size: 14px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(191, 191, 191, 1);
    }

    input::-moz-placeholder {
        /* Mozilla Firefox 19+ */
        font-size: 14px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(191, 191, 191, 1);
    }

    input:-moz-placeholder {
        /* Mozilla Firefox 4 to 18 */
        font-size: 14px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(191, 191, 191, 1);
    }

    input:-ms-input-placeholder {
        /* Internet Explorer 10-11 */
        font-size: 14px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(191, 191, 191, 1);
    }

    .fukuan_wrap {
        display: inline-block;
        position: relative;
        left: -4px;
    }

    .fukuan_itemwrap {
        width: 537px;
        display: flex;
    }

    .fukuan_itemwrap .item {
        flex: 1;
    }

    .fukuan_itemwrap label {
        font-size: 18px;
        padding-right: 10px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
    }

    .fukuan_itemwrap input {
        width: 92px;
        height: 30px;
        border-radius: 4px;
        border: 1px solid rgba(191, 191, 191, 1);
        padding-left: 10px;
        font-size: 16px;
    }

    .fselect_wrap {
        position: relative;
        width: 537px !important;
    }

    .bussess_item select {
        width: 537px;
        padding-left: 10px;
        font-size: 16px;
        font-family: MicrosoftYaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
        height: 30px;
        border: 1px solid rgba(204, 204, 204, 1);
        border-radius: 3px;
        appearance: none;
        -moz-appearance: none;
        -webkit-appearance: none;
    }

    .triangle_border_down1 {
        display: inline-block;
        width: 0;
        height: 0;
        border-width: 8px 5px 0;
        border-style: solid;
        border-color: #BFBFBF transparent transparent;
        position: absolute;
        right: 10px;
        top: 14px;
    }

    .fem {
        /*padding-left: 15px;*/
        font-size: 14px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
    }

    .c-datepicker-date-editor {
        border: 1px solid #CCCCCC;
        position: relative;
        top: -18px;
        width: 150px;
        height: 30px;
        cursor: pointer;
    }

    .c-datepicker-data-input.only-date {
        width: 100%;
        font-size: 18px;
    }

    .select_wrap {
        position: relative;
    }

    .triangle_border_down {
        display: inline-block;
        width: 0;
        height: 0;
        border-width: 8px 5px 0;
        border-style: solid;
        border-color: #1d1d1d transparent transparent;
        position: absolute;
        right: 10px;
        top: 3px;
    }

    .daochustyle {
        width: 100px;
        height: 36px;
        line-height: 36px;
        text-align: center;
        background: rgba(113, 178, 239, 1);
        border-radius: 4px;
        font-size: 16px;
        font-family: MicrosoftYaHei;
        font-weight: 400;
        color: rgba(255, 255, 255, 1);
        position: absolute;
        right: 20px;
        top: 90px;
        cursor: pointer;
    }

    .account_peizhi {
        width: 47%;
        height: 411px;
        float: left;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 0px 6px 0px rgba(15, 138, 203, 0.2);
        padding: 20px 1.2%;
    }

    .account_peizhiheader {
        width: 100%;
        border-bottom: 1px solid #DADBE0;
        padding-bottom: 5px;
    }

    .account_peizhiheader .text {
        font-size: 20px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
    }

    .account_peizhiheader .text1 {
        font-size: 14px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(150, 151, 153, 1);
    }

    .hezuo_modewrap {
        padding-top: 20px;
        height: 74px;
    }

    .hezuo_text {
        float: left;
        width: 109px;
        font-size: 16px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
    }

    .hezuo_selectwrap {
        float: left;
        height: 74px;
    }

    .hezuo_select1 {}

    .hezuo_select1 .yuanradio1 {
        display: inline-block;
        width: 24px !important;
        height: 24px;
        background: url(images/pcradiono.png) no-repeat;
        background-size: 100% !important;
    }

    .hezuo_select1 .em {
        font-size: 14px;
        font-family: MicrosoftYaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
        padding: 0px 20px;
        position: relative;
        top: -6px;
    }

    .yuanradioactive1 {
        display: inline-block;
        width: 24px !important;
        height: 24px;
        background: url(images/pcradioche.png) no-repeat !important;
        background-size: 100% !important;
    }

    .hezuo_select2 {
        padding-top: 18px;
    }

    .hezuo_select2 .yuanradio2 {
        display: inline-block;
        width: 24px !important;
        height: 24px;
        background: url(../images/pccheckno.png) no-repeat;
        background-size: 100% !important;
    }

    .hezuo_select2 .em {
        font-size: 14px;
        font-family: MicrosoftYaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
        padding: 0px 20px;
        position: relative;
        top: -6px;
    }

    .yuanradioactive2 {
        display: inline-block;
        width: 24px !important;
        height: 24px;
        background: url(../images/pccheckche.png) no-repeat !important;
        background-size: 100% !important;
    }

    .hezuo_select5 {
        display: inline-block;
    }

    .hezuo_select5 .yuanradio5 {
        display: inline-block;
        width: 24px !important;
        height: 24px;
        background: url(../images/pccheckno.png) no-repeat;
        background-size: 100% !important;
    }

    .hezuo_select5 .em {
        font-size: 14px;
        font-family: MicrosoftYaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
        padding: 0px 20px;
        position: relative;
        top: -6px;
    }

    .yuanradioactive5 {
        display: inline-block;
        width: 24px !important;
        height: 24px;
        background: url(../images/pccheckche.png) no-repeat !important;
        background-size: 100% !important;
    }

    .peie_modewrap {
        padding-bottom: 30px;
        border-bottom: 1px solid #DADBE0;
        height: 107px;
    }

    .peie_text {
        float: left;
        width: 105px;
        font-size: 16px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        position: relative;
        top: 30px;
        color: rgba(68, 68, 68, 1);
    }

    .peie_selectwrap {
        float: left;
        height: 107px;
    }

    .peie_select1 {
        padding-top: 22px;
    }

    .peie_select1 .yuanradio3 {
        display: inline-block;
        width: 24px !important;
        height: 24px;
        background: url(images/pcradiono.png) no-repeat;
        background-size: 100% !important;
        position: relative;
        top: 6px;
    }

    .peie_select1 input {
        width: 85px;
        height: 24px;
        padding-left: 15px;
        border: 1px solid rgba(191, 191, 191, 1);
        border-radius: 2px;
    }

    .peie_select1 .text {
        font-size: 14px;
        font-family: Microsoft YaHei;
        padding: 0 10px 0 16px;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
    }

    .peie_select1 .text1 {
        font-size: 12px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        padding-left: 10px;
        color: rgba(191, 191, 191, 1);
    }

    .yuanradioactive3 {
        display: inline-block;
        width: 24px !important;
        height: 24px;
        background: url(images/pcradioche.png) no-repeat !important;
        background-size: 100% !important;
    }

    .account_congzhiwrap {
        margin-top: 30px;
    }

    .account_keyongwrap {
        display: inline-block;
        position: relative;
        top: -4px;
    }

    .account_keyongwrap .text {
        font-size: 16px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(191, 191, 191, 1);
    }

    .account_keyongwrap .text1 {
        font-size: 26px;
        font-family: Microsoft YaHei;
        font-weight: bold;
        padding: 8px 0 16px 0;
        color: rgba(68, 68, 68, 1);
    }

    .account_keyongwrap .text2 {
        width: 70px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        background: rgba(113, 178, 239, 1);
        border-radius: 2px;
        font-size: 14px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(255, 255, 255, 1);
    }

    .account_jinewrap {
        display: inline-block;
        width: 74%;
        float: right;
    }

    .account_jineitem {
        width: 26%;
        height: 108px;
        float: left;
        background: rgba(249, 249, 249, 1);
        padding-left: 4%;
        border-radius: 2px;
    }

    .account_jineitem .text {
        font-size: 14px;
        font-family: Microsoft YaHei;
        padding: 26px 0 8px 0;
        font-weight: 400;
        color: rgba(191, 191, 191, 1);
    }

    .account_jineitem .text1 {
        font-size: 24px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
    }

    .taocan_quanyi {
        width: 47%;
        height: 411px;
        float: right;
        background: rgba(255, 255, 255, 1);
        box-shadow: 0px 0px 6px 0px rgba(15, 138, 203, 0.2);
        padding: 20px 1.2%;
    }

    .taocan_quanyiheader {
        border-bottom: 1px solid #DADBE0;
        padding-bottom: 2px;
    }

    .taocan_quanyiheader span {
        font-size: 20px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
    }


    .taocanq_table {
        margin-top: 20px;
    }

    .taocanq_tableheader {
        height: 36px;
        line-height: 36px;
        background: rgba(249, 249, 249, 1);
        width: 100%;
    }

    .taocanq_tableheader .item {
        font-size: 16px;
        float: left;
        width: 24.8%;
        text-align: center;
        font-family: Microsoft YaHei;
        font-weight: bold;
        color: rgba(68, 68, 68, 1);
    }

    .taocanq_tableheader .item2 {
        width: 2%;
        float: left;
    }

    .taocanq_tablecon {
        border-right: 1px dotted #CCCCCC;
    }

    .taocanq_tablecon .item {
        height: 29px;
        line-height: 29px;
        font-size: 14px;
        float: left;
        width: 24.8%;
        text-align: center;
        border-left: 1px dotted #CCCCCC;
        border-bottom: 1px dotted #CCCCCC;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
    }

    .taocanq_tableconwrap {
        height: 150px;
        overflow-y: auto;
        width: 100%;
    }

    .taocanx_table {
        margin-top: 20px;
    }

    .taocanx_table .ffitem1 {
        width: 24%;
    }

    .taocanx_table .ffitem2 {
        width: 74%;
    }

    .taocanx_tableheader {
        height: 36px;
        line-height: 36px;
        width: 98%;
        padding-right: 2%;
        background: rgba(249, 249, 249, 1);
    }

    .taocanx_tableheader .item {
        font-size: 16px;
        float: left;
        text-align: center;
        font-family: Microsoft YaHei;
        font-weight: bold;
        color: rgba(68, 68, 68, 1);
    }

    .taocanx_tableheader .item2 {
        width: 2%;
        float: left;
    }

    .taocanx_tablecon {
        height: 29px;
        line-height: 29px;
        border-bottom: 1px dotted #CCCCCC;
        border-right: 1px dotted #CCCCCC;
    }

    .taocanx_tablecon .item {
        font-size: 14px;
        float: left;
        text-align: center;
        border-left: 1px dotted #CCCCCC;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
    }

    .taocanx_tableconwrap {
        height: 120px;
        overflow-y: auto;
        width: 100%;
    }

    .yuangong_detail {
        font-size: 20px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(68, 68, 68, 1);
        padding: 20px 0 6px 0;
        border-bottom: 1px solid #DADBE0;
    }

    .yuangong_detailwrap {
        background: #fff;
        margin-top: 20px;
        padding: 0 20px;
        position: relative;
    }

    .Switch {
        display: inline-block;
        width: 100px;
        position: relative;
        top: 10px;
    }

    .Switch input {
        display: none
    }

    .Switch label {
        width: 80px;
        background: #F7F7F7;
        height: 36px;
        border-radius: 18px;
        float: right;
        /*margin: 8px 10px 0 0;*/

    }

    .Switch label em {
        width: 32px;
        height: 32px;
        float: left;
        margin: 2px;
        background: rgba(247, 247, 247, 1);
        box-shadow: 0px 0px 4px 0px rgba(117, 117, 117, 0.5);
        border-radius: 16px;
        background: #FFF;
    }

    .Switch input:checked+label {
        background: #71B2EF;
    }

    .Switch input:checked+label em {
        float: right;
    }

    .Switch input:disabled+label {
        opacity: 0.5
    }

    .xinjian_lianxiren {
        width: 120px;
        display: inline-block;
        height: 40px;
        cursor: pointer;
        line-height: 40px;
        text-align: center;
        font-size: 18px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(255, 255, 255, 1);
        background: rgba(113, 178, 239, 1);
        border-radius: 4px;
        margin: 30px 0;
    }

    .xinjian_yewuyuan {
        width: 120px;
        display: inline-block;
        height: 40px;
        cursor: pointer;
        line-height: 40px;
        text-align: center;
        font-size: 18px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(255, 255, 255, 1);
        background: rgba(113, 178, 239, 1);
        border-radius: 4px;
        margin: 30px 0;
    }

    .xinjian_lianxirenheader {
        height: 60px;
        line-height: 60px;
        border: 1px solid #CCCCCC;
    }

    .xinjian_lianxirenheader .item {
        float: left;
        font-size: 16px;
        font-family: Microsoft YaHei;
        text-align: center;
        font-weight: bold;
        border-right: 1px solid #CCCCCC;
        color: rgba(68, 68, 68, 1);
    }

    .lianitem1 {
        width: 5%;
    }

    .lianitem2 {
        width: 13.4%;
    }

    .flianitem2 {
        width: 15.7%;
    }

    .xinjian_lianxirencon {
        height: 80px;
        line-height: 80px;
        border: 1px solid #CCCCCC;
        border-top: none;
    }

    .xinjian_lianxirencon .item {
        float: left;
        font-size: 14px;
        position: relative;
        height: 80px;
        font-family: Microsoft YaHei;
        text-align: center;
        border-right: 1px solid #CCCCCC;
        color: rgba(68, 68, 68, 1);
    }

    .xinjian_lianxirencon span {
        color: #71B2EF;
        cursor: pointer;
    }

    .xinjian_lianxirencon img {
        width: 70px;
        position: absolute;
        top: 0;
        left: 0;
    }

    .checkbox_wrap {
        display: inline-block;
    }

    .checkbox_wrap label {
        font-size: 14px;
        color: #2D2D2D;
        vertical-align: middle;
        margin: 0 46px 0 12px;
        position: relative;
        top: 0px;
    }

    .check_wrap {
        display: inline-block;
        width: 24px;
        height: 24px;
        position: relative;
        vertical-align: middle;
    }

    .check_wrap input {
        width: 24px;
        height: 24px;
        position: absolute;
        top: 0;
        left: 0;
        z-index: 999;
        opacity: 0;
    }

    .xuanzhong {
        display: inline-block;
        width: 24px;
        height: 24px;
        background: url(images/pcradioche.png) no-repeat;
        background-size: 100%;
        position: absolute;
        top: 0;
        left: 0;
        z-index: 998;
        display: none;
    }

    .noxuanzhong {
        display: inline-block;
        width: 24px;
        height: 24px;
        background: url(images/pcradiono.png) no-repeat;
        background-size: 100%;
        position: absolute;
        top: 0;
        left: 0;
    }

    .xuanzhong1 {
        display: inline-block;
        width: 24px;
        height: 24px;
        background: url(images/pccheckche.png) no-repeat;
        background-size: 100%;
        position: absolute;
        top: 0;
        left: 0;
        z-index: 998;
        display: none;
    }

    .noxuanzhong1 {
        display: inline-block;
        width: 24px;
        height: 24px;
        background: url(images/pccheckno.png) no-repeat;
        background-size: 100%;
        position: absolute;
        top: 0;
        left: 0;
    }

    .fangfuc {
        margin: 0 14px 0 12px !important;
    }

    .tanchuang_wrap {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background: rgba(0, 0, 0, 0.1);
        z-index: 99999;
    }

    .tanchuang_con {
        width: 320px;
        height: 150px;
        background: #fff;
        border-radius: 10px;
        margin: 250px auto 0;
    }

    .tanchuang_con .title {
        height: 100px;
        line-height: 100px;
        text-align: center;
        border-bottom: 1px solid #999;
    }

    .tanchuang_con p {
        font-size: 18px;
        color: #333;
    }

    .tanchuang_con .ffbtn_wrap {
        height: 48px;
        line-height: 48px;
        width: 320px;
    }

    .tanchuang_con .btn {
        width: 49%;
        text-align: center;
        float: left;
        cursor: pointer;
    }

    .tanchuang_con span {
        font-size: 18px;
        color: #333;
    }

    .accsetwrap {
        float: right;
    }

    .accsetwrap span {
        display: inline-block;
        width: 70px;
        height: 30px;
        cursor: pointer;
        line-height: 30px;
        text-align: center;
        background: rgba(113, 178, 239, 1);
        border-radius: 2px;
        font-size: 14px;
        font-family: Microsoft YaHei;
        font-weight: 400;
        color: rgba(255, 255, 255, 1);
    }

    input:disabled {
        background: #F7F7F7 !important;
    }

    input[disabled] {
        background: #F7F7F7 !important;
    }

    .qy-active{
        border-bottom:2px solid #71B2EF;
        color:#71B2EF !important;
    }
</style>

<body>
    <div class="tanchuang_wrap" style="display: none;">
        <div class="tanchuang_con">
            <div class="title">
                <p>是否删除默认联系人</p>
            </div>
            <div class="ffbtn_wrap">
                <div class="btn" id="lianshi" style="border-right: 1px solid #999;"><span>是</span></div>
                <div class="btn" id="lianfou"><span>否</span></div>
            </div>
        </div>
    </div>
    <!-- 首页 -->
    <div class="tuancao_wrap">
        <div class="tuancao_header">

            <div class="tuancao_header">
                <p id="addjuesebtn">新建</p>
            </div>

            <label style="padding-left:0!important;">企业名称</label>
            <input type="text" class="input1" id="qiyenameval" />

            <span class="querybtn" id="fangquerybtn" onclick="query()">查询</span>

        </div>
        <div class="daochustyle" style="top:84px;" onclick="daoshustylef()">导出excel</div>

        <div class="tuandatalist_wrap" id="fangcardlist" style="margin-top:20px;">
            <table style=" border-collapse:collapse;width:100%;table-layout: fixed;">
                <tr style="height:40px;background-color: rgba(249,249,249,1);">
                    <th class="item item1 ">序号</th>
                    <th class="item item2 ">企业名称</th>
                    <th class="item item2 ">建档日期</th>
                    <th class="item item2 ">剩余金额</th>
                    <th class="item item2 ">剩余赠送金额</th>
                    <th class="item item2 ">企业人数</th>
                    <th class="item item2 ">联系人</th>
                    <th class="item item2 ">联系人手机号</th>
                    <th class="item item2 ">操作</th>

                </tr>
                <tbody id="ffangdatalist_wrap">
                    <tr>
                        <td class="item item1 ">序号</td>
                        <td class="item item2 ">卡券名称</td>
                        <td class="item item2 ">卡券类型</td>
                        <td class="item item2 ">卡券价值</td>
                        <td class="item item2 ">有效期</td>
                        <td class="item item2 ">赠送原因</td>
                        <td class="item item2 ">赠送比例</td>
                        <td class="item item2 ">卡券权益</td>

                        <td class="item item2 "><span class="bianji" onclick="chadetail()">查看详情</span></td>
                    </tr>


                </tbody>
            </table>
        </div>


        <div class="box" id="boxpage"></div>
    </div>
    <!-- 首页按钮新建企业档案-->
    <div class="create_dangan" style="display: none;">
        <div class="creat_header">
            <img src="images/creat_qidang.png" /><span>新建企业档案</span>
            <div class="fangbtn1">
                <div class="panel-tool-close1" onclick="fangclose()"></div>
            </div>
        </div>
        <div class="create_con" style="overflow-y: scroll;">
            <div class="bussess_info bussess_info1" >
                <!--<div class="bussess_item"><span>*企业来源</span><span class="yuanradio" fvalue="0"></span><em class="em" style="padding-right: 40px;">线上注册</em><span class="yuanradio" fvalue="1"></span><em class="em">线下扩展</em></div>-->
                <div class="bussess_item"><span>*企业名称</span><input type="text" class="input" id="qi_ming1" autocomplete="off" /><em
                        style="color: red;display: none;font-size: 12px;" id="qi_ming1tip">该名称已存在</em></div>
                <div class="bussess_item"><span>企业简称</span><input type="text" class="input" id="qi_jian1" autocomplete="off" /><em
                        class="fem">选填</em><em style="color: red;display: none;font-size: 12px;"
                        id="qi_jian1tip">该简称已存在</em></div>
                <div class="bussess_item"><span>*企业人数</span><input type="number" class="input" id="qi_num1" autocomplete="off" /></div>
                <div class="bussess_item"><span>*企业地址</span><input type="text" class="input" id="qi_dizhi1" autocomplete="off" /></div>
                <div class="bussess_item"><span>企业官网</span><input type="text" class="input" id="qi_net1" autocomplete="off" /><em
                        class="fem">选填</em></div>
                <div class="bussess_item"><span>*默认联系人</span><input type="text" class="input" id="lian_name1" autocomplete="off" /></div>
                <div class="bussess_item"><span>*默认联系人电话</span><input type="text" class="input" id="lian_tel1" autocomplete="off" /></div>
                <div class="bussess_item"><span>*默认联系人职位</span><input type="text" class="input" id="lian_job1" autocomplete="off" /></div>
                <div class="bussess_item"><span>*登录账号</span><input type="text" class="input" id="deng_account1" autocomplete="off"
                        placeholder="请设置企业登录账号" /><em style="color: red;display: none;"
                        id="deng_account1tip">该账号已存在</em></div>
                <div class="bussess_item"><span>*登录密码</span><input type="password" class="input" id="deng_password1" autocomplete="off"
                        placeholder="请设置企业登录密码" /></div>
                <p class="text_p">报备员工</p>
                <div class="bussess_item"><span>*员工姓名</span><input type="text" class="input" id="yuan_name1" autocomplete="off"
                        placeholder="请输入公司员工姓名" /></div>
                <div class="bussess_item"><span>*员工工号</span><input type="number" class="input" id="yuan_num1" autocomplete="off"
                        placeholder="请输入公司员工工号" /></div>

                <div class="item" style="line-height:160px;display:table;content:'';clear: both;margin-top:20px">
                    <span style="float:left;font-size: 18px;width: 160px;font-family: Microsoft YaHei;font-weight: 400;color: rgba(68, 68, 68, 1)">
                        *工商营业执照：
                    </span>
                    <div style="width:130px;height:160px;float:left;border:1px solid #CCCCCC;border-radius:4px;overflow: hidden;">
                        <img style="width:100%;height:100%;" id="uploadimage" class="" src="image/white-white.jpg" alt>
                    </div>
                    <div style="float:left;margin-left:15px">
                        <p
                            style="font-size:14px;line-height:14px;float:none;width:100%;text-align:left;margin-top:32px;padding:0;color:#333333">
                            请上传最新的营业执照!</p>
                        <p
                            style="font-size:14px;line-height:14px;float:none;width:100%;text-align:left;margin-top:18px;padding:0;color:#969799">
                            格式要求：原件照片、扫描件或者加盖公章</p>
                        <p
                            style="font-size:14px;line-height:14px;float:none;width:100%;text-align:left;margin-top:8px;padding:0;color:#969799">
                            的复印件，支持.jpg .jpeg .bmp .gif.png</p>
                        <p
                            style="font-size:14px;line-height:14px;float:none;width:100%;text-align:left;margin-top:8px;padding:0;color:#969799">
                            格式照片，大小不超过5M。</p>
                    </div>
                    <p id="upload"
                        style="float:left;width:80px;height:34px;background:#04B482;color:white;text-align:center;line-height:34px;padding:0;border-radius:4px;margin:63px 0 0 36px;cursor: pointer;font-size: 18px;">
                        上传</p>
                    <input id="fileImage" type="file" accept=".jpg,.jpeg,.bmp,.gif,.png" size="30" onchange="imageimage()"
                        name="fileselect[]" multiple style="display:none">
                </div>

                <div class="btn_wrap" style="margin-bottom:20px"><span class="save" id="qisave1">保存</span><span class="clear"
                        id="qiclear1">取消</span></div>
                
            </div>
        </div>
    </div>
    <!--账户配置新建企业账户-->
    <div class="create1_dangan_wrap" style="display: none;">
        <div class="create1_dangan">
            <div class="creat_header">
                <img src="images/creat_qiaccount.png" /><span>新建企业账户</span>
                <div class="fangbtn1">
                    <div class="panel-tool-close1" onclick="fangclose()"></div>
                </div>
            </div>
            <div class="create1_con">
                <div class="bussess_info bussess_info2">

                    <div class="bussess_item" style="margin-top:34px;"><span>*套餐编号</span><input type="text"
                            class="input" id="tao_num" /></div>
                    <div class="bussess_item"><span>套餐名称</span><input type="text" class="input" id="tao_name"
                            readonly="readonly" /></div>
                    <div class="bussess_item"><span>付款金额</span><input type="text" class="input" id="pay_jine"
                            readonly="readonly" /></div>
                    <div class="bussess_item"><span>*购买门店</span><span class="fselect_wrap">
                            <select name="visitstatus" id="goumaimendianf">
                                <!--  <option value="" selected="selected">全部</option> -->

                            </select><em class="triangle_border_down1"></em></span>
                    </div>
                    <div class="bussess_item"><span style="position: relative;bottom:50px;">*付款方式</span>
                        <div class="fukuan_wrap">
                            <div class="fukuan_itemwrap">
                                <div class="item" style="text-align: left;"><label>银行卡</label><input type="number"
                                        id="yinhangka" onmousewheel="return false" /></div>
                                <div class="item" style="text-align: center;"><label>转账</label><input type="number"
                                        id="zhuangzhang" onmousewheel="return false" /></div>
                                <div class="item" style="text-align: right;"><label>微信</label><input type="number"
                                        id="weixin" onmousewheel="return false" /></div>
                            </div>
                            <div class="fukuan_itemwrap" style="padding-top:20px;">
                                <div class="item" style="text-align: left;"><label>支付宝</label><input type="number"
                                        id="zhifubao" onmousewheel="return false" /></div>
                                <div class="item" style="text-align: center;"><label>现金</label><input type="number"
                                        id="xianjin" onmousewheel="return false" /></div>
                                <div class="item" style="text-align: right;"><label>免付</label><input type="number"
                                        id="mianfu" onmousewheel="return false" /></div>
                            </div>
                        </div>
                    </div>

                    <div class="bussess_item"><span>员工工号（1）</span><input type="text" class="input"
                            id="creat_gonghao1" /></div>
                    <div class="bussess_item"><span>员工业绩</span><input type="number" class="input" id="creat_yeji1" />
                    </div>
                    <div class="bussess_item"><span>员工工号（2）</span><input type="text" class="input"
                            id="creat_gonghao2" /></div>
                    <div class="bussess_item"><span>员工业绩</span><input type="number" class="input" id="creat_yeji2" />
                    </div>

                    <div class="btn_wrap"><span class="save" id="qisave3">保存</span><span class="clear"
                            id="qiclear3">取消</span></div>
                </div>
            </div>
        </div>
    </div>
    <!-- 首页列表的查看详情-->
    <div class="xinjiandang_wrap" style="display: none;">
        <p class="back" onclick="fback()">返回上一级</p>
        <div class="tab_wrap"><span class="tabinfo active">基本信息</span><span class="tabaccount">账户配置</span><span
                class="tabuser">员工名单</span><span class="qiliannum">企业联系人</span><span class="tabgenjin">业务员</span><span
                class="tabxiaofeimingxi">消费明细</span></div>
        <!-- 基本信息 -->
        <div class="bussess_info fbussess_info" style="padding-top:10px;position:relative">
            <div class="bussess_item"><span>*企业来源</span><span id="xianxiastyle"><span
                        class="yuanradio7 yuanradioactive7" fvalue="1"></span><em class="em">线下扩展</em></span><span
                    id="xianxiastyle1"><span class="yuanradio7 yuanradioactive7" fvalue="1"></span><em
                        class="em">线上注册</em></span></div>
            <div class="bussess_item"><span>*企业名称</span><input type="text" class="input" id="qi_ming" /><em
                    style="color: red;display: none;font-size: 14px;" id="qi_mingtip">该名称已存在</em></div>
            <div class="bussess_item"><span>企业简称</span><input type="text" class="input" id="qi_jian" /><em>（选填）</em><em
                    style="color: red;display: none;font-size: 14px;" id="qi_jiantip">该简称已存在</em></div>
            <div class="bussess_item"><span>*企业人数</span><input type="number" class="input" id="qi_num" /></div>
            <div class="bussess_item"><span>*企业所在地址</span><input type="text" class="input" id="qi_dizhi" /></div>
            <div class="bussess_item"><span>企业官网</span><input type="text" class="input" id="qi_net" /><em>（选填）</em>
            </div>
            <div class="bussess_item"><span>*联系人姓名</span><input type="text" class="input" id="lian_name" /></div>
            <div class="bussess_item"><span>*联系人电话</span><input type="tel" class="input" id="lian_tel" /></div>
            <div class="bussess_item"><span>*联系人职位</span><input type="text" class="input" id="lian_job" /></div>
            <div class="bussess_item"><span>*登录账号</span><input type="text" class="input" id="deng_account" /><em
                    style="color: red;display: none;font-size: 14px;" id="qi_dengtip">该账号已存在</em></div>
            <div class="bussess_item"><span>*登录密码</span><input type="password" class="input" id="deng_password" /></div>

            <p class="text_p" style="padding-top:40px;">报备员工</p>
            <div class="bussess_item"><span>*员工姓名</span><input type="text" class="input" id="yuan_name" /></div>
            <div class="bussess_item"><span>*员工工号</span><input type="number" class="input" id="yuan_num" /></div>
            <div style="position:absolute;top:50px;left:750px;clear: both;content:' ';display:table">
                <div style="width:130px;height:160px;border:1px solid #CCCCCC;border-radius:4px;float: left;">
                    <img id="uploadurl" class="" style="width:100%;height:100%" src="" alt="">
                </div>
            </div>
            <div class="btn_wrap" style="padding:40px 0 80px 0;"><span class="save" id="jiqisave">保存</span><span
                    class="clear" id="jiqiclear">清除</span></div>
        </div>

        <!-- 账户配置 -->
        <div class="bussess_account" style="display: none;">
            <div class="xinjian_accountbtn">新建账户</div>
            <div class="xinjian_accountcon clear">
                <!--<div class="account_item">
                   <div class="account_title">华为公司账户A</div>
                   <div class="account_text">账户余额：<span>10,000</span></div>
                    <div class="account_text">福利人数：<span>0人</span></div>
                    <div class="account_text">开户日期：<span>2019-08-15</span></div>
                    <div class="account_text last_text">有效期：<span>2020-02-20</span></div>
                    <div class="account_set">设置</div>
                    <div class="account_status"><img  src="images/pc_dongjie.png"/></div>
                     <div class="account_moren" style="display: none;"><img  src="images/pc_moren.png"/></div>
                </div>-->

            </div>

        </div>

        <!-- 员工名单 -->
        <div class="bussess_user">
            <div class="tuancao1_header" style="margin-top: 30px;">

                <!--<label style="padding-left:0!important;">消费门店</label>
                <span class="select_wrap"><select name="club" id="clubId"></select><em class="triangle_border_down"></em></span>-->
                <label style="padding-left:0!important;">时间筛选：</label>
                <div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"><input
                        type="text" id="ygmdselectDate1" autocomplete="off" name=""
                        class=" c-datepicker-data-input only-date" value=""> </div>
                <strong>-- </strong>
                <div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"><input
                        type="text" id="ygmdselectDate2" autocomplete="off" name=""
                        class=" c-datepicker-data-input only-date" value=""> </div>
                <label>所属账户：</label>
                <span class="select_wrap">
                    <select name="visitstatus" id="ygmdaccount" style="width:250px;">
                        <option value="" selected="selected">全部</option>

                    </select><em class="triangle_border_down"></em></span>



            </div>
            <div class="tuancao1_header" style="margin-top: 0px;">
                <div>
                    <label style="padding-left:0!important;">姓名：</label>
                    <input class="input1" type="text" id="ygmdname">
                    <label>工号：</label>
                    <input class="input2" type="text" id="ygmdgonghao">
                    <label>部门：</label>
                    <span class="select_wrap">
                        <select name="visitstatus" id="ygmdbumen" style="width:250px;">
                            <option value="" selected="selected">全部</option>

                        </select><em class="triangle_border_down"></em></span>
                    <label>职级：</label>
                    <span class="select_wrap">
                        <select name="visitstatus" id="ygmdzhiji">
                            <option value="" selected="selected">全部</option>

                        </select><em class="triangle_border_down"></em></span>
                    <span class="querybtn" id="fangquerybtn" onclick="queryyuanmingf()">查找</span><span class="clearbtn"
                        onclick="ygmdclear()">清除</span>
                </div>
            </div>
            <div class="daochustyle" style="top:174px;" onclick="daoshustylef2()">导出excel</div>
            <div class="tuancao_wrap1">

                <div class="tuandatalist_wrap" id="fangcardlist" style="margin-top:20px;">
                    <table style=" border-collapse:collapse;width:100%;table-layout: fixed;">
                        <tr style="height:40px;background-color: rgba(249,249,249,1);">
                            <th class="item item1 ">序号</th>
                            <th class="item fitem4 ">所属账户</th>
                            <th class="item fitem2 ">工号</th>
                            <th class="item fitem2 ">姓名</th>
                            <th class="item fitem2 ">手机号码</th>
                            <th class="item fitem2 ">部门</th>
                            <th class="item fitem2 ">岗位</th>
                            <th class="item fitem2 ">职级</th>
                            <th class="item fitem2 ">配额</th>
                            <th class="item fitem2 ">配额余额</th>
                            <th class="item fitem2 ">消费金额</th>
                            <th class="item fitem2 ">消费次数</th>
                            <th class="item fitem3 ">状态</th>
                            <th class="item fitem4 ">最后消费时间</th>
                        </tr>
                        <tbody id="ygmdlist">
                            <tr>
                                <td class="item item1 ">序号</td>
                                <td class="item fitem4 ">华为公司账户A</td>
                                <td class="item fitem2 ">工号</td>
                                <td class="item fitem2 ">姓名</td>
                                <td class="item fitem2 ">手机号码</td>
                                <td class="item fitem2 ">部门</td>
                                <td class="item fitem2 ">岗位</td>
                                <td class="item fitem2 ">职级</td>
                                <td class="item fitem2 ">配额</td>
                                <td class="item fitem2 ">配额余额</td>
                                <td class="item fitem2 ">消费金额</td>
                                <td class="item fitem2 ">消费次数</td>
                                <td class="item fitem3 ">状态</td>
                                <td class="item fitem4 ">2019.08.20 18:56:21</td>
                            </tr>


                        </tbody>
                    </table>
                </div>


                <div class="box" id="ygmdboxpage"></div>
            </div>
        </div>

        <!-- 企业联系人 -->
        <div class="bussess_qiyelian" style="display: none;">
            <div class="xinjian_lianxiren">新建联系人</div>
            <div class="xinjian_lianxirenwrap">
                <div class="xinjian_lianxirenheader">
                    <div class="item lianitem1">序号</div>
                    <div class="item lianitem2">联系人</div>
                    <div class="item lianitem2">手机号码</div>
                    <div class="item lianitem2">部门</div>
                    <div class="item lianitem2">职位</div>
                    <div class="item lianitem2">报备员工姓名</div>
                    <div class="item lianitem2">报备员工工号</div>
                    <div class="item lianitem2" style="border-right: none;">操作</div>
                </div>
                <div class="xinjian_lianxirenconwrap" id="xinjian_lianxirenconwrap">
                    <div class="xinjian_lianxirencon">
                        <div class="item lianitem1">序号</div>
                        <div class="item lianitem2">联系人<img src="images/pc_moren.png" /></div>
                        <div class="item lianitem2">手机号码</div>
                        <div class="item lianitem2">部门</div>
                        <div class="item lianitem2">职位</div>
                        <div class="item lianitem2">报备员工姓名</div>
                        <div class="item lianitem2">报备员工工号</div>
                        <div class="item lianitem2" style="border-right: none;"><span>操作</span></div>
                    </div>
                </div>
            </div>
            <div class="box" id="qylxrboxpage"></div>
        </div>

        <!-- 业务员 -->
        <div class="bussess_genjin" style="display: none;">
            <div class="xinjian_yewuyuan">新建业务员</div>
            <div class="xinjian_lianxirenwrap">
                <div class="xinjian_lianxirenheader">
                    <div class="item lianitem1">序号</div>
                    <div class="item flianitem2">业务员姓名</div>
                    <div class="item flianitem2">业务员工号</div>
                    <div class="item flianitem2">业绩占比系数</div>
                    <div class="item flianitem2">状态</div>
                    <div class="item flianitem2">最后跟进时间</div>
                    <div class="item flianitem2" style="border-right: none;">操作</div>
                </div>
                <div class="xinjian_lianxirenconwrap" id="xinjian_lianxirenconwrap1">
                    <div class="xinjian_lianxirencon">
                        <div class="item lianitem1">序号</div>
                        <div class="item flianitem2">联系人<img src="images/pc_moren.png" /></div>
                        <div class="item flianitem2">手机号码</div>
                        <div class="item flianitem2">部门</div>
                        <div class="item flianitem2">职位</div>
                        <div class="item flianitem2">报备员工姓名</div>
                        <div class="item flianitem2" style="border-right: none;"><span>操作</span></div>
                    </div>
                </div>
            </div>
            <div class="box" id="ywyboxpage"></div>
        </div>
        <!-- 消费明细-->
        <div class="bussess_xiaofeidetails">
            <div class="tuancao1_header" style="margin-top: 30px;height:50px;">

                <!--<label style="padding-left:0!important;">消费门店</label>
                <span class="select_wrap"><select name="club" id="clubId"></select><em class="triangle_border_down"></em></span>-->
                <label style="padding-left:0!important;">时间筛选：</label>
                <div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"><input
                        type="text" id="xiaoxiaoselectDate1" autocomplete="off" name=""
                        class=" c-datepicker-data-input only-date" value=""> </div>
                <strong>-- </strong>
                <div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"><input
                        type="text" id="xiaoxiaoselectDate2" autocomplete="off" name=""
                        class=" c-datepicker-data-input only-date" value=""> </div>


            </div>
            <div class="tuancao1_header" style="margin-top: 0px;">
                <div>
                    <label style="padding-left:0!important;">姓名：</label>
                    <input class="input1" type="text" id="xiaoxiaofangcusname">
                    <label>工号：</label>
                    <input class="input2" type="text" id="xiaoxiaofanggong">
                    <label>部门：</label>
                    <span class="select_wrap">
                        <select name="visitstatus" id="xiaoxiaofeidep">
                            <option value="" selected="selected">全部</option>

                        </select><em class="triangle_border_down"></em></span>
                    <label>职级：</label>
                    <span class="select_wrap">
                        <select name="visitstatus" id="xiaoxiaofeizhiji">
                            <option value="" selected="selected">全部</option>

                        </select><em class="triangle_border_down"></em></span>
                    <span class="querybtn" id="fangquerybtn" onclick="xiaoqueryyuanxff()">查找</span><span
                        class="clearbtn" onclick="xiaoxiaofeiclear()">清除</span>
                </div>
            </div>
            <div class="daochustyle" style="top:168px;" onclick="xiaodaoshustylef1()">导出excel</div>
            <div class="tuancao_wrap1">

                <div class="tuandatalist_wrap" id="fangcardlist" style="margin-top:20px;">
                    <table style=" border-collapse:collapse;width:100%;table-layout: fixed;">
                        <tr style="height:40px;background-color: rgba(249,249,249,1);">
                            <th class="item item1 ">序号</th>

                            <th class="item fitem2f ">工号</th>
                            <th class="item fitem2f ">姓名</th>
                            <th class="item fitem2f ">手机号码</th>
                            <th class="item fitem2f ">部门</th>
                            <th class="item fitem2f ">岗位</th>
                            <th class="item fitem2f ">职级</th>
                            <th class="item fitem2f ">消费门店</th>
                            <th class="item fitem2f ">消费项目</th>
                            <th class="item fitem2f ">消费金额</th>
                            <th class="item fitem2f ">消费数量</th>

                            <th class="item fitem4f ">消费时间</th>
                        </tr>
                        <tbody id="xiaoxiaofangdatalist_wrap">
                            <tr>
                                <td class="item item1 ">序号</td>

                                <td class="item fitem2f ">工号</td>
                                <td class="item fitem2f ">姓名</td>
                                <td class="item fitem2f ">手机号码</td>
                                <td class="item fitem2f ">部门</td>
                                <td class="item fitem2f ">岗位</td>
                                <td class="item fitem2f ">职级</td>
                                <td class="item fitem2f ">配额</td>
                                <td class="item fitem2f ">配额余额</td>
                                <td class="item fitem2f ">消费金额</td>
                                <td class="item fitem2f ">消费次数</td>

                                <td class="item fitem4f ">2019.08.20 18:56:21</td>
                            </tr>


                        </tbody>
                    </table>
                </div>


                <div class="box" id="xiaoxiaoboxpage"></div>
            </div>
        </div>
    </div>

    <!--账户设置-->
    <div class="account_setwrap" style="display: none;margin-top:20px;">
        <div class="account_peiquanwrap clear">
            <div class="account_peizhi">
                <div class="account_peizhiheader">
                    <span class="text" id="accountname">华为公司账户A</span><span class="text1"
                        style="padding-left:40px;">（开户日期：<span id="kaidate">2019-08-15</span>）</span><span
                        class="text1">（有效期：<span id="youdate"></span>）</span>
                </div>

                <div class="hezuo_modewrap">
                    <div class="hezuo_text">合作模式：</div>
                    <div class="hezuo_selectwrap">
                        <div class="hezuo_select1">
                            <!--<span class="yuanradio1" hzvalue="预付"></span><em class="em" style="padding-right: 50px;">预付</em><span class="yuanradio1" hzvalue="结算"></span><em class="em" style="padding-right: 50px;">结算</em><span class="yuanradio1"  hzvalue="预付+结算"></span><em class="em">预付+结算</em>-->
                        </div>
                        <div class="hezuo_select2" style="display: none;">
                            <!-- <span class="yuanradio2"></span><em class="em" style="padding-right: 20px;">月结30天</em><span class="yuanradio2"></span><em class="em">季结90天</em>-->
                        </div>
                    </div>
                    <div class="accsetwrap">
                        <span style="margin-right: 15px;" id="accountsetbianji">编辑</span>
                    </div>
                </div>

                <div class="peie_modewrap">
                    <div class="peie_text">配额方式：</div>
                    <div class="peie_selectwrap">
                        <div class="peie_select1" id="depeie_select"><span class="yuanradio3" dvalue="定额分配"
                                fvalue="1"></span><span class="text">定额分配</span><input type="number"
                                id="dinge_min" /><span class="text1">最低下限</span><input type="number" id="dinge_max"
                                style="margin-left:50px;" /><span class="text1">最高上限</span></div>
                        <div class="peie_select1" id="dtpeie_select1"><span class="yuanradio3" dvalue="动态限额"
                                fvalue="2"></span><span class="text">动态限额</span><input type="number"
                                id="dongtaie_min" /><span class="text1">最低下限</span><input type="number"
                                id="dongtaie_max" style="margin-left:50px;" /><span class="text1">最高上限</span></div>
                    </div>
                </div>
                <div class="account_congzhiwrap">
                    <div class="account_keyongwrap">
                        <p class="text">账户可用余额（元）</p>
                        <p class="text1">￥<span id="account_keyong"></span></p>
                        <p class="text2">充值</p>
                    </div>

                    <div class="account_jinewrap clear">
                        <div class="account_jineitem" style="margin-right: 5%;">
                            <p class="text">账户充值总额（元）</p>
                            <p class="text1" id="account_chongzhi"></p>
                        </div>
                        <div class="account_jineitem" style="margin-right: 5%;">
                            <p class="text">账户消费金额（元）</p>
                            <p class="text1" id="account_xiaofei"></p>
                        </div>
                        <div class="account_jineitem">
                            <p class="text">可分配余额（元)</p>
                            <p class="text1" id="account_kefenpei"></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="taocan_quanyi">
                <div class="taocan_quanyiheader">
                    <span style="color:#969799;margin-right:3px">权益:</span>
                    <span id="Package-ri" style="cursor: pointer;" class="qy-active">套餐权益</span>
                    <span style="margin:0 3px;color:#DADBE0">|</span>
                    <span id="useclub" style="cursor: pointer;">使用须知</span>
                    <span style="position:relative;margin-left:9px"><img style="position:absolute;top:6px;width:18px;height:18px" src="image/editor_icon.png" alt=""></span>
                </div>
                <div class="taocanq_table">
                    <div class="taocanq_tableheader">
                        <div class="item">分类名称</div>
                        <div class="item">折扣</div>
                        <div class="item">分类名称</div>
                        <div class="item">折扣</div>

                    </div>


                    <div class="taocanq_tableconwrap">
                        <div class="taocanq_tablecon clear">
                            <!--<div class="item">分类名称</div>
                        <div class="item">折扣</div>
                        <div class="item">分类名称</div>
                        <div class="item">折扣</div>-->
                        </div>

                    </div>
                </div>
                <div class="taocanx_table">
                    <div class="taocanx_tableheader">
                        <div class="item ffitem1">项目</div>
                        <div class="item ffitem2">价格</div>


                    </div>
                    <div class="taocanx_tableconwrap">
                        <div class="taocanx_tablecon">
                            <div class="item ffitem1">分类名称</div>
                            <div class="item ffitem2">折扣</div>

                        </div>

                    </div>
                </div>
                <div id="useclub-show" style="display:none">
                    <div>
                        <textarea rows="" cols="" name="packageDes" id="packageDes" style="display:none" maxlength="300"></textarea>
                        <iframe src="editor/index1.html" width="790px" height="288px" name="child" style="border: 1px solid #f8f8f8;height:288px;width:100%;margin-top: 20px"></iframe>
                    </div>
                    <p id="edior-p" style="width:100px;height:36px;background:#71B2EF;color:#FFFFFF;font-size:16px;text-align: center;line-height: 36px;border-radius: 2px;margin-top:21px">保存</p>
                    
                </div>
            </div>
        </div>
        <!--   员工消费明细-->
        <div class="yuangong_detailwrap">
            <div class="yuangong_detail">
                员工消费明细
            </div>
            <div class="tuancao1_header" style="margin-top: 30px;height:50px;">

                <!--<label style="padding-left:0!important;">消费门店</label>
                <span class="select_wrap"><select name="club" id="clubId"></select><em class="triangle_border_down"></em></span>-->
                <label style="padding-left:0!important;">时间筛选：</label>
                <div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"><input
                        type="text" id="xiaoselectDate1" autocomplete="off" name=""
                        class=" c-datepicker-data-input only-date" value=""> </div>
                <strong>-- </strong>
                <div class="c-datepicker-date-editor c-datepicker-single-editor J-datepicker-day mt10"><input
                        type="text" id="xiaoselectDate2" autocomplete="off" name=""
                        class=" c-datepicker-data-input only-date" value=""> </div>


            </div>
            <div class="tuancao1_header" style="margin-top: 0px;">
                <div>
                    <label style="padding-left:0!important;">姓名：</label>
                    <input class="input1" type="text" id="xiaofangcusname">
                    <label>工号：</label>
                    <input class="input2" type="text" id="xiaofanggong">
                    <label>部门：</label>
                    <span class="select_wrap">
                        <select name="visitstatus" id="xiaofeidep">
                            <option value="" selected="selected">全部</option>

                        </select><em class="triangle_border_down"></em></span>
                    <label>职级：</label>
                    <span class="select_wrap">
                        <select name="visitstatus" id="xiaofeizhiji">
                            <option value="" selected="selected">全部</option>

                        </select><em class="triangle_border_down"></em></span>
                    <span class="querybtn" id="fangquerybtn" onclick="queryyuanxff()">查找</span><span class="clearbtn"
                        onclick="xiaofeiclear()">清除</span>
                </div>
            </div>
            <div class="daochustyle" style="top:138px;" onclick="daoshustylef1()">导出excel</div>
            <div class="tuancao_wrap1">

                <div class="tuandatalist_wrap" id="fangcardlist" style="margin-top:20px;">
                    <table style=" border-collapse:collapse;width:100%;table-layout: fixed;">
                        <tr style="height:40px;background-color: rgba(249,249,249,1);">
                            <th class="item item1 ">序号</th>

                            <th class="item fitem2f ">工号</th>
                            <th class="item fitem2f ">姓名</th>
                            <th class="item fitem2f ">手机号码</th>
                            <th class="item fitem2f ">部门</th>
                            <th class="item fitem2f ">岗位</th>
                            <th class="item fitem2f ">职级</th>
                            <th class="item fitem2f ">消费门店</th>
                            <th class="item fitem2f ">消费项目</th>
                            <th class="item fitem2f ">消费金额</th>
                            <th class="item fitem2f ">消费数量</th>

                            <th class="item fitem4f ">消费时间</th>
                        </tr>
                        <tbody id="xiaofangdatalist_wrap">
                            <tr>
                                <td class="item item1 ">序号</td>

                                <td class="item fitem2f ">工号</td>
                                <td class="item fitem2f ">姓名</td>
                                <td class="item fitem2f ">手机号码</td>
                                <td class="item fitem2f ">部门</td>
                                <td class="item fitem2f ">岗位</td>
                                <td class="item fitem2f ">职级</td>
                                <td class="item fitem2f ">配额</td>
                                <td class="item fitem2f ">配额余额</td>
                                <td class="item fitem2f ">消费金额</td>
                                <td class="item fitem2f ">消费次数</td>

                                <td class="item fitem4f ">2019.08.20 18:56:21</td>
                            </tr>


                        </tbody>
                    </table>
                </div>


                <div class="box" id="xiaoboxpage"></div>
            </div>

        </div>
    </div>
    <!-- 新建联系人-->
    <div class="create2_dangan" style="display: none;">
        <div class="creat_header">
            <img src="images/creat_qiaccount.png" /><span>新建联系人</span>
            <div class="fangbtn1">
                <div class="panel-tool-close1" onclick="fangclose()"></div>
            </div>
        </div>
        <div class="create2_con">
            <div class="bussess_info bussess_info3">

                <div class="bussess_item" style="margin-top:22px;"><span>*联系人</span><input type="text"
                        class="input input2" id="lianxiname" /><em style="font-size: 18px;padding-left:36px;">设置默认</em>
                    <div class="Switch"><input type="checkbox" name="Storage" id="date" /><label
                            for="date"><em></em></label></div>
                </div>
                <div class="bussess_item"><span>*手机号码</span><input type="number" class="input" id="lianxitel" /></div>
                <div class="bussess_item"><span>*部门</span><input type="text" class="input" id="lianxibumen" /></div>
                <div class="bussess_item"><span>*职位</span><input type="text" class="input" id="lianxizhiwei" /></div>

                <div class="bussess_item"><span>*报备员工姓名</span><input type="text" class="input" id="lianxibaoname" />
                </div>
                <div class="bussess_item"><span>*报备员工工号</span><input type="number" class="input" id="lianxibaogong" />
                </div>

                <div class="btn_wrap"><span class="save" id="lianqisave1" onclick="savelianxiren()">保存</span><span
                        class="clear" id="lianqiclear1">取消</span></div>
            </div>
        </div>
    </div>

    <!-- 新建业务人-->
    <div class="create3_dangan" style="display: none;">
        <div class="creat_header">
            <img src="images/creat_qiaccount.png" /><span>新建业务人</span>
            <div class="fangbtn1">
                <div class="panel-tool-close1" onclick="fangclose()"></div>
            </div>
        </div>
        <div class="create3_con">
            <div class="bussess_info bussess_info3">

                <div class="bussess_item" style="margin-top:22px;"><span>*业务员姓名</span><input type="text"
                        class="input input2" id="yewuy_name" /><em style="font-size: 18px;padding-left:36px;">设置默认</em>
                    <div class="Switch"><input type="checkbox" name="Storage1" id="date1" /><label
                            for="date1"><em></em></label></div>
                </div>
                <div class="bussess_item"><span>*业务员工号</span><input type="number" class="input" id="yewuy_gong" /></div>
                <div class="bussess_item"><span>*业绩占比系数</span><input type="number" class="input" id="yewuy_zhanbi" />
                </div>
                <div class="bussess_item" id="yewustatus"><span>*状态</span>
                    <div class="hezuo_select5">
                        <span class="yuanradio5" valyewu="0"></span><em class="em"
                            style="padding-right: 20px;">有效</em><span class="yuanradio5" valyewu="1"></span><em
                            class="em">失效</em>
                    </div>
                </div>


                <div class="btn_wrap"><span class="save" id="yeqisave1" onclick="xinjiansave()">保存</span><span
                        class="clear" id="yeqiclear1">取消</span></div>
            </div>
        </div>
    </div>
</body>
<script src="js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="easyui/moment.min.js"></script>
<script type="text/javascript" src="easyui/datepicker.all.js"></script>
<script type="text/javascript" src="easyui/datepicker.en.js"></script>
<script type="text/javascript" src="js/common.js"></script>
<script type="text/javascript" src="easyui/easyui-lang-zh_CN.js"></script>
<script>
    //全局变量
    var qiyeflag = true;
    var qiyejianflag = true;
    var qiyedengflag = true;
    var qiyeflag1 = true;
    var qiyejianflag1 = true;
    var qiyedengflag1 = true;
    var yebianjiflag = true;
    var fisAlertflag = true;
    var chaqiyeming = '';
    var chaqiyejian = '';
    var chaqiyeaccount = '';
    var chaqiyepassword = '';
    var fpackageId = 0;
    var archivesId1 = '#';
    var gxId1 = '';
    var crmCode1 = '';
    var contactsId1 = '';//联系人ID
    var loginId1 = '';
    var packageId1 = null;
    var service_ip = "http://"+location.host.split('.')[0] + ".physicalclub.com";

    $('#upload').click(function(){
        $('#fileImage').click()
    })

    $('#useclub').click(function(){
        $('.taocanq_table').hide()
        $('.taocanx_table').hide()
        $('#useclub-show').show()
        $(this).addClass('qy-active')
        $('#Package-ri').removeClass('qy-active')
    })

    $('#Package-ri').click(function(){
        $('.taocanq_table').show()
        $('.taocanx_table').show()
        $('#useclub-show').hide()
        $(this).addClass('qy-active')
        $('#useclub').removeClass('qy-active')
    })

    //使用parent和child

    function parentFunction(data){
        $('#packageDes').val(data)
    }

    function callChild() {
        child.window.childFunction1();
    }

    // $('#edior-pp').click(function () {

    //     var sd = '<p>woshiwoshi</p>'

    //     child.window.childFunction(sd)

    // })

    function imageimage(){
        
        if ($("#fileImage").val() == '') {
            return;
        }

        let file = $("#fileImage").val()
        let filename = file.substr(file.lastIndexOf("."));
        if (filename != '.png' && filename != '.jpeg' && filename != '.jpg' && filename != ' .bmp' && filename != '.gif') {
            alert("请上传图片格式的文件");
            return;
        }

        var formData = new FormData();
        // for (var i = 0; i < $('#preview1').children().length; i++) {
        formData.append('file', document.getElementById('fileImage').files[0])
        // }
        formData.append('fileType', 1);
        $.ajax({
            url: "rest/wx/business/apply/uploadLicenseFile",
            type: "post",
            data: formData,
            contentType: false,
            processData: false,
            success: function (data) {
                //var img = data
                //return data
                console.log(data)
                
                $('#uploadimage').attr('src', service_ip + '/images/' + data.rows[0].path)

                $('#uploadimage').attr('class', data.rows[0].path)
            },
            error: function (data) {
                alert("上传失败")
            }
        });
    }

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

    function stopScrollFun(evt) {
        alert(1)
        evt = evt || window.event;
        if (evt.preventDefault) {
            // Firefox  
            evt.preventDefault();
            evt.stopPropagation();
        } else {
            // IE  
            evt.cancelBubble = true;
            evt.returnValue = false;
        }
        return false;
    }

    function getUrlParam(key) {
        // 获取参数
        var url = window.location.search;
        // 正则筛选地址栏
        var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)");
        // 匹配目标参数
        var result = url.substr(1).match(reg);
        //返回参数值
        return result ? decodeURIComponent(result[2]) : null;
    }

    var shenqingvalue = getUrlParam("shenqingflag");
    var qijiancheng = getUrlParam("qijiancheng");
    var qidizhi = getUrlParam("qidizhi");
    var qiliantel = getUrlParam("qiliantel");
    var qilianname = getUrlParam("qilianname");
    var qilianzhiwei = getUrlParam("qilianzhiwei");
    var qiname = getUrlParam("qiname");
    var qirenshu = getUrlParam("qirenshu");
    var shenqingid = getUrlParam("shenqingid");
    var busiLicensePicture = getUrlParam("busiLicensePicture");

    console.log(service_ip + '/' + busiLicensePicture)

    if (shenqingvalue == 1) {
        $('#xianxiastyle').hide()
        $('#xianxiastyle1').show()
        archivesId1 = '#';
        $('.tabinfo').addClass('active');
        $('.tabinfo').siblings().removeClass("active");
        $('.tuancao_wrap').hide();
        $('.xinjiandang_wrap').show();
        $('.fbussess_info').show();
        $('.bussess_account ').hide();
        $('.bussess_user').hide();
        $('.bussess_genjin').hide();
        $('.bussess_xiaofeidetails').hide();
        $('#qi_mingtip').hide();
        $('#qi_jiantip').hide();
        $('#qi_dengtip').hide();

        $('#qi_ming').val('')
        $('#qi_jian').val('')
        $('#qi_num').val('')
        $('#qi_dizhi').val('')
        $('#qi_net').val('')
        $('#lian_name').val('')
        $('#lian_tel').val('')
        $('#lian_job').val('')
        $('#deng_account').val('')
        $('#deng_password').val('')
        $('#yuan_name').val('')
        $('#yuan_num').val('')
        $('#uploadurl').attr('src','')
        //alert(qijiancheng)
        $('#qi_ming').val(qiname)
        $('#qi_jian').val(qijiancheng)
        $('#qi_num').val(qirenshu)
        $('#qi_dizhi').val(qidizhi)
        //$('#qi_net').val(data.officialWebsite)
        $('#lian_name').val(qilianname)
        $('#lian_tel').val(qiliantel)
        $('#lian_job').val(qilianzhiwei)

        $('#uploadurl').attr('src', service_ip + '/images/' + busiLicensePicture)
        $('#uploadurl').attr('class', busiLicensePicture)

        var datafg = {
            applyId: shenqingid,
            status: 4
        }
        $.ajax({
            type: "post",
            url: "rest/business/apply/updBusinessApply",
            async: false,
            //contentType: "application/json;charset=UTF-8",
            //dataType: "json",
            data: datafg,
            //data:JSON.stringify(data),
            success: function (res) {
                console.log(res)

            },
            error: function (res) {
                console.log(res)
            }
        });


    }
    //获取会所
    getclublist()

    function getclublist() {
        $.ajax({
            url: 'rest/club/getViewClubListByuser',
            type: 'get',
            async: false,//使用同步的方式,true为异步方式
            //data : {},//这里使用json对象
            success: function (res) {
                console.log(1)

                console.log(res)
                var clubarray = res.rows;
                if (clubarray.length > 0) {
                    for (var i = 0; i < clubarray.length; i++) {
                        var club = clubarray[i];
                        $("#goumaimendianf").append("<option value='" + club.sysClubCode + "'>" + club.clubName + "</option>");
                    }
                }

            }
        });
    }

    //获取企业员工职级 部门
    function queryzhijibumen() {
        var data = {
            stringParam1: archivesId1,//企业ID
            stringParam2: 1,//1：部门2：岗位3：职级；

        }
        $.ajax({
            type: "post",
            url: "rest/business/employee/businessBaseList",
            async: false,
            contentType: "application/json;charset=UTF-8",
            //dataType: "json",
            //data:data,
            data: JSON.stringify(data),
            success: function (res) {
                // console.log(res)
                if (res.status) {
                    $('#xiaoxiaofeidep').html('<option value="" >全部</option>')
                    $('#xiaofeidep').html('<option value="" >全部</option>')
                    $('#ygmdbumen').html('<option value="" >全部</option>')
                    var data = res.rows;
                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];
                        var str = '<option value="' + item.content + '" >' + item.content + '</option>'
                        $('#xiaoxiaofeidep').append(str);
                        $('#xiaofeidep').append(str);
                        $('#ygmdbumen').append(str);
                    }
                }
            },
            error: function (res) {
                console.log(res)
            }
        });
        var fdata = {
            stringParam1: archivesId1,//企业ID
            stringParam2: 3,//1：部门2：岗位3：职级；

        }
        $.ajax({
            type: "post",
            url: "rest/business/employee/businessBaseList",
            async: false,
            contentType: "application/json;charset=UTF-8",
            //dataType: "json",
            //data:data,
            data: JSON.stringify(fdata),
            success: function (res) {
                // console.log(res)
                if (res.status) {
                    $('#xiaofeizhiji').html('<option value="" >全部</option>')
                    $('#xiaoxiaofeizhiji').html('<option value="" >全部</option>')
                    $('#ygmdzhiji').html('<option value="" >全部</option>')
                    var data = res.rows;
                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];
                        var str = '<option value="' + item.content + '" >' + item.content + '</option>'
                        $('#xiaoxiaofeizhiji').append(str);
                        $('#xiaofeizhiji').append(str);
                        $('#ygmdzhiji').append(str);
                    }
                }
            },
            error: function (res) {
                console.log(res)
            }
        });
        var fgtardata = {
            archivesId: archivesId1
        }
        $.ajax({
            type: "post",
            url: "rest/business/account/busPackageList",
            async: false,
            contentType: "application/json;charset=UTF-8",
            //dataType: "json",
            //data:data,
            data: JSON.stringify(fgtardata),
            success: function (res) {
                // console.log(res)
                if (res.status) {
                    $('#ygmdaccount').html('<option value="" >全部</option>')

                    var data = res.rows;
                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];
                        var str = '<option value="' + item.packageID + '" >' + item.gxmediName + '</option>'

                        $('#ygmdaccount').append(str);

                    }
                }
            },
            error: function (res) {
                console.log(res)
            }
        });
    }

    //数据字典查询合作模式结算模式
    queryhejie()

    function queryhejie() {

        var data = {
            typeCode: 'CooperationMode'
        }
        $.ajax({
            type: "post",
            url: "rest/wx/dictionnary/getdictionnarylist",
            async: false,
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            //data:data,
            data: JSON.stringify(data),
            success: function (res) {
                console.log(res)
                if (res.status) {
                    var data = res.rows;
                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];
                        var str = ' <div class="checkbox_wrap">' +

                            '<span class="check_wrap">' +
                            '<input type="radio"  value="' + item.name + '" name="jiating" class="hezuoradio" valid="' + item.dictionaryId + '"/>' +

                            '<span class="xuanzhong" ></span>' +
                            '<span class="noxuanzhong"></span>' +
                            '</span>' +
                            '<label >' + item.name + '</label>' +
                            '</div>'
                        $('.hezuo_select1').append(str);

                    }

                }
            },
            error: function (res) {
                console.log(res)
            }
        });
        var data = {
            typeCode: 'SettlementMethod'
        }
        $.ajax({
            type: "post",
            url: "rest/wx/dictionnary/getdictionnarylist",
            async: false,
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            //data:data,
            data: JSON.stringify(data),
            success: function (res) {
                console.log(res)
                if (res.status) {
                    var data = res.rows;
                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];
                        var str = ' <div class="checkbox_wrap">' +

                            '<span class="check_wrap">' +
                            '<input type="radio"  value="' + item.name + '" name="jiating1" class="hezuoradio1" valid="' + item.dictionaryId + '"/>' +
                            '<span class="xuanzhong1" ></span>' +
                            '<span class="noxuanzhong1"></span>' +
                            '</span>' +
                            '<label class="fangfuc">' + item.name + '</label>' +
                            '</div>'
                        $('.hezuo_select2').append(str);

                    }

                }
            },
            error: function (res) {
                console.log(res)
            }
        });
    }

    function tihuan(item) {

        if (item == undefined || item == null) {
            item = ""
        } else {
            return item
        }
        return item
    }

    function tihuan1(item) {

        if (item == undefined || item == null) {
            item = ""
        } else {
            return item.split(' ')[0]
        }
        return item
    }

    var fuintoPages = 1;
    function query() {
        fuintoPages = 1;
        queryqiyelist()
    }


    var fuonPagechange = function (page) {

        console.log('当前点击入场页码', page);
        if (fuintoPages != page) {
            fuintoPages = page;
            queryqiyelist();
        }
    }

    queryqiyelist();
    // 企业列表查询
    function queryqiyelist() {

        var name = $('#qiyenameval').val();


        var data = {
            "page": fuintoPages,
            'rows': 20,
            'param.name': name
        };

        $.ajax({
            type: "post",
            url: "rest/business/archives/getArchiveslistByPage",
            async: false,
            //contentType: "application/json;charset=UTF-8",
            dataType: "json",
            data: data,
            success: function (res) {
                console.log(res)
                if (res.status) {
                    $('#ffangdatalist_wrap').html('')
                    var data = res.rows;
                    if (data.length > 0) {
                        $('#boxpage').show();
                        var intoNum = (fuintoPages - 1) * 20; //序号
                        for (var i = 0; i < data.length; i++) {

                            intoNum++;
                            var item = data[i];

                            var str = '<tr>' +
                                '<td class="item item1 ">' + intoNum + '</td>' +
                                '<td class="item item2 ">' + tihuan(item.archivesName) + '</td>' +
                                '<td class="item item2 ">' + tihuan(item.addDate) + '</td>' +
                                '<td class="item item2 ">' + tihuan(item.balance) + '</td>' +
                                '<td class="item item2 ">' + tihuan(item.giveBalance) + '</td>' +
                                '<td class="item item2 ">' + tihuan(item.archivesNumber) + '</td>' +
                                '<td class="item item2 ">' + tihuan(item.defName) + '</td>' +
                                '<td class="item item2 ">' + tihuan(item.defMobile) + '</td>' +

                                '<td class="item item2 "><span class="bianji" onclick="chadetail(\'' + item.archivesId + '\')">查看详情</span></td>' +
                                '</tr>'



                            $('#ffangdatalist_wrap').append(str)
                        }
                    } else {
                        //alert('没有数据，请检查输入信息是否正确')
                        $('#boxpage').hide()
                    }
                    if (intoNum != 0) {

                        var obj = {
                            wrapid: 'boxpage', //页面显示分页器容器id
                            total: res.total, //总条数
                            pagesize: 20, //每页显示10条
                            currentPage: fuintoPages, //当前页
                            onPagechange: fuonPagechange,
                            //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                        }
                        pagination.init(obj);

                    }


                }
            },
            error: function (res) {
                console.log(res)
            }
        });
    }

    //校验企业名称以及简称交叉互不重复
    $('#qi_ming1').blur(function () {

        var fjianflag = true;
        var qiyename = $('#qi_ming1').val();
        var qiyjian = $('#qi_jian1').val();
        if (qiyename != '') {


            var data = {
                archivesName: qiyename,
                archivesAbbreviation: ''

            }
            if (qiyename != '' && qiyjian != '') {
                fjianflag = false
            } else {
                fjianflag = true
            }
            $.ajax({
                type: "post",
                url: "rest/business/archives/checkArchivesName",
                async: false,
                //contentType: "application/json;charset=UTF-8",
                //dataType: "json",
                data: data,
                //data:JSON.stringify(data),
                success: function (res) {
                    console.log(res)
                    if (!res.status) {
                        $('#qi_ming1tip').show()
                        qiyeflag = false;
                    } else {
                        if (res.total > 0) {
                            $('#qi_ming1tip').show()
                            qiyeflag = false;
                        } else {
                            if (fjianflag) {
                                $('#qi_ming1tip').hide()
                                qiyeflag = true;
                            } else {
                                $('#qi_ming1tip').hide()
                                $('#qi_jian1tip').hide()
                                qiyeflag = true;
                                qiyejianflag = true;
                            }

                        }
                    }

                },
                error: function (res) {
                    console.log(res)
                }
            });
        }
    })
    //      $('#qi_jian1').blur(function(){
    //          
    //          var fjianflag = true;
    //          var qiyename = $('#qi_ming1').val();
    //          var qiyjian = $('#qi_jian1').val();
    //          if(qiyjian != ''){
    //              
    //          
    //          var data = {
    //              archivesName:'',
    //              archivesAbbreviation:qiyjian
    //
    //          }
    //          if(qiyename != '' && qiyjian != ''){
    //              fjianflag = false
    //          }else{
    //              fjianflag = true
    //          }
    //         $.ajax({
    //          type:"post",
    //          url:"rest/business/archives/checkArchivesName",
    //          async:false,
    //          //contentType: "application/json;charset=UTF-8",
    //          //dataType: "json",
    //          data:data,
    //          //data:JSON.stringify(data),
    //          success:function(res){
    //              console.log(res)
    //              if(!res.status){
    //                  $('#qi_jian1tip').show()
    //                  qiyejianflag  = false;
    //              }else{
    //                  if(res.total>0){
    //                      $('#qi_jian1tip').show()
    //                      qiyejianflag  = false;
    //                  }else{
    //                      if(fjianflag){
    //                          $('#qi_jian1tip').hide()
    //                          qiyejianflag  = true;
    //                      }else{
    //                          $('#qi_jian1tip').hide()
    //                          qiyeflag = true;
    //                          qiyejianflag =true;
    //                          $('#qi_ming1tip').hide()
    //                      
    //                      }
    //                      
    //                  }
    //              }
    //          },
    //          error:function(res){
    //                  console.log(res)
    //          }
    //      });
    //      }
    //      })

    $('#deng_account1').blur(function () {
        var qiyedeng = $('#deng_account1').val();
        if (qiyedeng != '') {
            var data = {
                loginAccount: qiyedeng

            }
            $.ajax({
                type: "post",
                url: "rest/business/archives/checkArchivesMobile",
                async: false,
                //contentType: "application/json;charset=UTF-8",
                //dataType: "json",
                data: data,
                //data:JSON.stringify(data),
                success: function (res) {
                    console.log(res)
                    if (!res.status) {
                        $('#deng_account1tip ').show()
                        qiyedengflag = false;
                        $('#deng_account1tip').html(res.message)
                    } else {
                        $('#deng_account1tip ').hide()
                        qiyedengflag = true;
                    }
                },
                error: function (res) {
                    console.log(res)
                }
            });
        }

    })

    //修改企业信息 校验企业名称以及简称交叉互不重复
    $('#qi_ming').blur(function () {

        var fjianflag = true;
        var qiyename = $('#qi_ming').val();
        var qiyjian = $('#qi_jian').val();
        if (qiyename == chaqiyeming) {
            $('#qi_mingtip').hide()
            return;
        }
        if (qiyename != '' && qiyename != chaqiyeming) {


            var data = {
                archivesName: qiyename,
                archivesAbbreviation: ''

            }
            if (qiyename != '' && qiyjian != '') {
                fjianflag = false
            } else {
                fjianflag = true
            }
            $.ajax({
                type: "post",
                url: "rest/business/archives/checkArchivesName",
                async: false,
                //contentType: "application/json;charset=UTF-8",
                //dataType: "json",
                data: data,
                //data:JSON.stringify(data),
                success: function (res) {
                    console.log(res)
                    if (!res.status) {
                        $('#qi_mingtip').show()
                        qiyeflag1 = false;
                    } else {
                        if (res.total > 0) {
                            $('#qi_mingtip').show()
                            qiyeflag1 = false;
                        } else {
                            if (fjianflag) {
                                $('#qi_mingtip').hide()
                                qiyeflag1 = true;
                            } else {
                                $('#qi_mingtip').hide()
                                $('#qi_jiantip').hide()
                                qiyeflag1 = true;
                                qiyejianflag1 = true;
                            }

                        }
                    }

                },
                error: function (res) {
                    console.log(res)
                }
            });
        }
    })

    $('#qi_jian').blur(function () {

        var fjianflag = true;
        var qiyename = $('#qi_ming').val();
        var qiyjian = $('#qi_jian').val();
        if (qiyjian == chaqiyejian) {
            $('#qi_jiantip').hide()
            return;
        }
        if (qiyjian != '' && qiyjian != chaqiyejian) {


            var data = {
                archivesName: '',
                archivesAbbreviation: qiyjian

            }
            if (qiyename != '' && qiyjian != '') {
                fjianflag = false
            } else {
                fjianflag = true
            }
            $.ajax({
                type: "post",
                url: "rest/business/archives/checkArchivesName",
                async: false,
                //contentType: "application/json;charset=UTF-8",
                //dataType: "json",
                data: data,
                //data:JSON.stringify(data),
                success: function (res) {
                    console.log(res)
                    if (!res.status) {
                        $('#qi_jiantip').show()
                        qiyejianflag1 = false;
                    } else {
                        if (res.total > 0) {
                            $('#qi_jiantip').show()
                            qiyejianflag1 = false;
                        } else {
                            if (fjianflag) {
                                $('#qi_jiantip').hide()
                                qiyejianflag1 = true;
                            } else {
                                $('#qi_jiantip').hide()
                                qiyeflag1 = true;
                                qiyejianflag1 = true;
                                $('#qi_mingtip').hide()

                            }

                        }
                    }
                },
                error: function (res) {
                    console.log(res)
                }
            });
        }
    })

    $('#deng_account').blur(function () {
        var qiyedeng = $('#deng_account').val();
        if (qiyedeng == chaqiyeaccount) {
            $('#qi_dengtip').hide()
            return;
        }
        if (qiyedeng != '' && qiyedeng != chaqiyeaccount) {
            var data = {
                loginAccount: qiyedeng

            }
            $.ajax({
                type: "post",
                url: "rest/business/archives/checkArchivesMobile",
                async: false,
                //contentType: "application/json;charset=UTF-8",
                //dataType: "json",
                data: data,
                //data:JSON.stringify(data),
                success: function (res) {
                    console.log(res)
                    if (!res.status) {
                        $('#qi_dengtip').show()
                        qiyedengflag1 = false;
                        $('#qi_dengtip').html(res.message)
                    } else {
                        $('#qi_dengtip').hide()
                        qiyedengflag1 = true;
                    }
                },
                error: function (res) {
                    console.log(res)
                }
            });
        }

    })

    //导出企业列表
    function daoshustylef() {
        var qiyenameval = $('#qiyenameval').val();
        var data = {
            "page": 0,
            'rows': 0,
            'param.name': qiyenameval
        };
        $.ajax({
            type: "post",
            url: "rest/business/archives/exportArchivesList",
            async: false,
            //contentType: "application/json;charset=UTF-8",
            dataType: "json",
            data: data,
            success: function (res) {
                if (res.status) {
                    window.open(res.message);
                }


            },
            error: function (res) {
                console.log(res)
            }
        });
    }

    //导出员工列表
    function daoshustylef2() {

        var data = {
            pageNo: 0,
            pageSize: 0,
            pageFlag: false,
            stringParam1: archivesId1,
            stringParam2: $('#ygmdaccount').val(),
            stringParam3: $('#ygmdselectDate1').val(),
            stringParam4: $('#ygmdselectDate2').val(),
            stringParam5: $('#ygmdname').val(),
            stringParam6: $('#ygmdgonghao').val(),
            stringParam7: $('#ygmdbumen').val(),
            stringParam8: $('#ygmdzhiji').val()

        }
        $.ajax({
            type: "post",
            url: "rest/business/employee/exportBusEmployeeList",
            async: false,
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            //data:data,
            data: JSON.stringify(data),
            success: function (res) {
                if (res.status) {
                    window.open(res.message);
                }


            },
            error: function (res) {
                console.log(res)
            }
        });
    }

    //导出员工消费明细
    function daoshustylef1() {

        var data = {
            stringParam1: packageId1,
            stringParam2: $('#xiaoselectDate1').val(),
            stringParam3: $('#xiaoselectDate2').val(),
            stringParam5: $('#xiaofeidep').val(),
            stringParam6: $('#xiaofeizhiji').val(),
            stringParam7: archivesId1,
            stringParam8: $('#xiaofanggong').val()

        }
        $.ajax({
            type: "post",
            url: "rest/business/employee/exportBussinessPackageTradeList",
            async: false,
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            //data:data,
            data: JSON.stringify(data),
            success: function (res) {
                if (res.status) {
                    if (res.message == '没有记录!') {
                        return;
                    }
                    window.open(res.message);
                }


            },
            error: function (res) {
                console.log(res)
            }
        });
    }

    //导出企业消费明细
    function xiaodaoshustylef1() {

        var data = {

            stringParam2: $('#xiaoxiaoselectDate1').val(),
            stringParam3: $('#xiaoxiaoselectDate2').val(),
            stringParam5: $('#xiaoxiaofeidep').val(),
            stringParam6: $('#xiaoxiaofeizhiji').val(),
            stringParam7: archivesId1,
            stringParam8: $('#xiaoxiaofanggong').val()

        }
        $.ajax({
            type: "post",
            url: "rest/business/employee/exportBussinessPackageTradeList",
            async: false,
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            //data:data,
            data: JSON.stringify(data),
            success: function (res) {
                if (res.status) {
                    if (res.message == '没有记录!') {
                        return;
                    }
                    window.open(res.message);
                }


            },
            error: function (res) {
                console.log(res)
            }
        });
    }

    //点击新建保存
    $('#qisave1').click(function () {
        var qiyename = $('#qi_ming1').val();
        var qiyjian = $('#qi_jian1').val();
        var lian_tel1 = $('#lian_tel1').val();
        var accountlian = $('#deng_account1').val();
        var fdata = {
            source: 1,
            archivesName: $('#qi_ming1').val(),

            archivesNumber: $('#qi_num1').val(),
            archivesAddress: $('#qi_dizhi1').val(),

            reportingStaffEmp: $('#yuan_num1').val(),
            reportingStaffName: $('#yuan_name1').val(),
            defMobile: $('#lian_tel1').val(),
            defName: $('#lian_name1').val(),
            //              defDepartment:$('#lian_bumen1').val(),
            defPost: $('#lian_job1').val(),
            loginAccount: $('#deng_account1').val(),
            LoginPassword: $('#deng_password1').val(),
            busiLicensePicture : $('#uploadimage').attr('class')
        }
        console.log(fdata)
        for (i in fdata) {
            if (fdata[i] === '' || fdata[i] == undefined) {
                alert('请把信息填写完整')
                return;
            }
        }

        if (qiyename == qiyjian) {
            alert('企业名称与企业简称不能一样')
            return;
        }
        //           if(accountlian.length<11){
        //              alert('登录账号格式不正确')
        //              return;
        //           }
        if (lian_tel1.length < 7) {
            alert('电话格式不正确')
            return;
        }

        if(busiLicensePicture == ''){
            alert('请上传营业执照')
            return;
        }

        var data = {
            source: 1,
            archivesName: $('#qi_ming1').val(),
            archivesAbbreviation: $('#qi_jian1').val(),
            archivesNumber: $('#qi_num1').val(),
            archivesAddress: $('#qi_dizhi1').val(),
            officialWebsite: $('#qi_net1').val(),
            reportingStaffEmp: $('#yuan_num1').val(),
            reportingStaffName: $('#yuan_name1').val(),
            defMobile: $('#lian_tel1').val(),
            defName: $('#lian_name1').val(),
            //              defDepartment:$('#lian_bumen1').val(),
            defPost: $('#lian_job1').val(),
            loginAccount: $('#deng_account1').val(),
            LoginPassword: $('#deng_password1').val(),
            busiLicensePicture: $('#uploadimage').attr('class')
        }
        if (qiyeflag && qiyejianflag && qiyedengflag) {
            $.ajax({
                type: "post",
                url: "rest/business/archives/addBusinessArchives",
                async: false,
                //contentType: "application/json;charset=UTF-8",
                //dataType: "json",
                data: data,
                //data:JSON.stringify(data),
                success: function (res) {
                    console.log(res)
                    if (res.rel) {
                        $('.create_dangan').hide()
                        queryqiyelist()
                        $('#uploadimage').attr('class','')
                        $('#uploadimage').attr('src','image/white-white.jpg')
                        $('#fileImage').val('')
                    } else {
                        alert(res.msg)
                    }
                },
                error: function (res) {
                    console.log(res)
                }
            });
        }

        console.log(data)
    })

    $('.tabinfo').click(function () {
        $(this).addClass('active');
        $(this).siblings().removeClass("active");
        $('.fbussess_info').show();
        $('.bussess_account ').hide();
        $('.bussess_user').hide();
        $('.bussess_qiyelian').hide();
        $('.bussess_genjin').hide();
        $('.account_setwrap ').hide();
        $('.bussess_xiaofeidetails').hide();
        $('body').css('background-color', '#fff');
        $('.xinjiandang_wrap').css('background-color', '#fff');
    })

    $('.tabaccount').click(function () {
        //alert(archivesId1)
        if (archivesId1 == '#') {
            alert('没有企业信息，请先建档')
        } else {
            $(this).addClass('active');
            $(this).siblings().removeClass("active");
            $('.fbussess_info').hide();
            $('.bussess_account ').show();
            $('.bussess_user').hide();
            $('.bussess_qiyelian').hide();
            $('.bussess_genjin').hide();
            $('.account_setwrap ').hide();
            $('.bussess_xiaofeidetails').hide();
            $('body').css('background-color', '#fff');
            $('.xinjiandang_wrap').css('background-color', '#fff');
            queryaccount()
        }

    })

    $('.tabuser').click(function () {
        if (archivesId1 == '#') {
            alert('没有企业信息，请先建档')
        } else {
            $(this).addClass('active');
            $(this).siblings().removeClass("active");
            $('.fbussess_info').hide();
            $('.bussess_account ').hide();
            $('.bussess_user').show();
            $('.bussess_qiyelian').hide();
            $('.bussess_genjin').hide();
            $('.account_setwrap ').hide();
            $('.bussess_xiaofeidetails').hide();
            $('body').css('background-color', '#fff');
            $('.xinjiandang_wrap').css('background-color', '#fff');
            queryyuanming()
            //获取企业员工职级 部门
            queryzhijibumen();
        }

    })

    $('.qiliannum').click(function () {
        if (archivesId1 == '#') {
            alert('没有企业信息，请先建档')
        } else {
            $(this).addClass('active');
            $(this).siblings().removeClass("active");
            $('.fbussess_info').hide();
            $('.bussess_account ').hide();
            $('.bussess_user').hide();
            $('.bussess_qiyelian').show();
            $('.bussess_genjin').hide();
            $('.account_setwrap ').hide();
            $('.bussess_xiaofeidetails').hide();
            $('body').css('background-color', '#fff');
            $('.xinjiandang_wrap').css('background-color', '#fff');
            queryxinjianlian();
        }

    })

    $('.tabgenjin').click(function () {
        if (archivesId1 == '#') {
            alert('没有企业信息，请先建档')
        } else {
            $(this).addClass('active');
            $(this).siblings().removeClass("active");
            $('.fbussess_info').hide();
            $('.bussess_account ').hide();
            $('.bussess_user').hide();
            $('.bussess_qiyelian').hide();
            $('.bussess_genjin').show();
            $('.account_setwrap ').hide();
            $('.bussess_xiaofeidetails').hide();
            $('body').css('background-color', '#fff');
            $('.xinjiandang_wrap').css('background-color', '#fff');
            queryyewuyuan();
        }

    })

    $('.tabxiaofeimingxi').click(function () {
        if (archivesId1 == '#') {
            alert('没有企业信息，请先建档')
        } else {
            $(this).addClass('active');
            $(this).siblings().removeClass("active");
            $('.fbussess_info').hide();
            $('.bussess_account ').hide();
            $('.bussess_user').hide();
            $('.bussess_qiyelian').hide();
            $('.bussess_genjin').hide();
            $('.bussess_xiaofeidetails').show();
            $('.account_setwrap ').hide();
            $('body').css('background-color', '#fff');
            $('.xinjiandang_wrap').css('background-color', '#fff');
            xiaoqueryyuanxf()
            queryzhijibumen();
        }

    })

    //返回上一级   
    function fback() {
        var fangdisplay = $('.account_setwrap').css('display');

        if (fangdisplay == 'block') {　　//如果是显示的则隐藏元素，否则显示
            $('.bussess_account').show();
            $('.account_setwrap').hide();
            $('body').css('background-color', '#fff');
            $('.xinjiandang_wrap').css('background-color', '#fff');


        } else {

            $('.tuancao_wrap').show()
            $('.xinjiandang_wrap').hide()
            $('.account_setwrap').hide()
            $('body').css('background-color', '#fff');
            $('.xinjiandang_wrap').css('background-color', '#fff');

        }


    }

    $('.xinjian_accountbtn').click(function () {
        $('.create1_dangan_wrap').show();
        $('.create1_dangan').show()
        $('#tao_num').val('')
        $('#tao_name').val('')
        $('#pay_jine').val('')
        $('#goumaimendianf').val('')
        $('#yinhangka').val('')
        $('#zhuangzhang').val('')
        $('#weixin').val('')
        $('#zhifubao').val('')
        $('#xianjin').val('')
        $('#mianfu').val('')
        $('#creat_gonghao1').val('')
        $('#creat_yeji1').val('')
        $('#creat_gonghao2').val('')
        $('#creat_yeji2').val('')
    })

    $('#qiclear3').click(function () {
        $('.create1_dangan_wrap').hide();
    })

    //企业来源
    $(document).on('click', '.yuanradio', function () {
        console.log(1)
        $(this).addClass("yuanradioactive");
        $(this).siblings().removeClass("yuanradioactive");

    })

    $(document).on('click', '.yuanradio1', function () {
        console.log(1)
        $(this).addClass("yuanradioactive1");
        var fhtvalue = $(this).attr('hzvalue');
        if (fhtvalue == '结算' || fhtvalue == '预付+结算') {
            $('.hezuo_select2').show()
        } else {
            $('.hezuo_select2').hide()
        }
        $(this).siblings().removeClass("yuanradioactive1");

    })

    $(document).on('click', '.yuanradio2', function () {
        console.log(1)
        $(this).addClass("yuanradioactive2");
        $(this).siblings().removeClass("yuanradioactive2");

    })

    $(document).on('click', '.yuanradio3', function () {
        console.log(1)
        if (fisAlertflag) {

            $('.yuanradio3').each(function () {
                $(this).removeClass("yuanradioactive3");
            })
            $(this).addClass("yuanradioactive3");
            var fvalue = $(this).attr('dvalue');
            if (fvalue == '定额分配') {
                $('#dongtaie_max').val('')
                $('#dongtaie_min').val('')
            } else {
                $('#dinge_max').val('')
                $('#dinge_min').val('')
            }
        }
    })

    $(document).on('click', '.yuanradio5', function () {
        console.log(1)
        $(this).addClass("yuanradioactive5");
        $(this).siblings().removeClass("yuanradioactive5");

    })

    //查看详情
    function chadetail(qiyeid) {
        shenqingvalue = null
        $('.tabinfo').addClass('active');
        $('.tabinfo').siblings().removeClass("active");
        $('.tuancao_wrap').hide();
        $('.xinjiandang_wrap').show();
        $('.fbussess_info').show();
        $('.bussess_account ').hide();
        $('.bussess_user').hide();
        $('.bussess_genjin').hide();
        $('.bussess_xiaofeidetails').hide();
        $('#qi_mingtip').hide();
        $('#qi_jiantip').hide();
        $('#qi_dengtip').hide();

        $('#qi_ming').val('')
        $('#qi_jian').val('')
        $('#qi_num').val('')
        $('#qi_dizhi').val('')
        $('#qi_net').val('')
        $('#lian_name').val('')
        $('#lian_tel').val('')
        $('#lian_job').val('')
        $('#deng_account').val('')
        $('#deng_password').val('')
        $('#yuan_name').val('')
        $('#yuan_num').val('')
        var data = {
            archivesId: qiyeid
        }
        $.ajax({
            type: "post",
            url: "rest/business/archives/findArchivesInfo",
            async: false,
            //contentType: "application/json;charset=UTF-8",
            dataType: "json",
            data: data,
            //data:JSON.stringify(data),
            success: function (res) {
                console.log(res)
                if (res.status) {
                    var data = res.rows[0];
                    var fvalue = data.source;
                    if (fvalue == 1) {
                        $('#xianxiastyle').show()
                        $('#xianxiastyle1').hide()
                    } else {
                        $('#xianxiastyle').hide()
                        $('#xianxiastyle1').show()
                    }
                    //                              $('.yuanradio7').each(function(){
                    //                                  $(this).removeClass("yuanradioactive7");
                    //                                  if($(this).attr('fvalue')==fvalue){
                    //                                      $(this).addClass("yuanradioactive7");
                    //                                  }
                    //                              })

                    chaqiyeming = data.archivesName;
                    chaqiyejian = data.archivesAbbreviation;
                    chaqiyeaccount = data.loginAccount;
                    chaqiyepassword = data.loginPassword;

                    archivesId1 = data.archivesId;
                    gxId1 = data.gxId;
                    crmCode1 = data.crmCode;
                    contactsId1 = data.contactsId;//联系人ID
                    loginId1 = data.loginId;
                    busiLicensePicture = data.busiLicensePicture

                    $('#qi_ming').val(data.archivesName)
                    $('#qi_jian').val(data.archivesAbbreviation)
                    $('#qi_num').val(data.archivesNumber)
                    $('#qi_dizhi').val(data.archivesAddress)
                    $('#qi_net').val(data.officialWebsite)
                    $('#lian_name').val(data.defName)
                    $('#lian_tel').val(data.defMobile)
                    $('#lian_job').val(data.defPost)
                    $('#deng_account').val(data.loginAccount)
                    //                              $('#deng_password').val(data.LoginPassword)
                    $('#deng_password').val(data.loginPassword)
                    $('#yuan_name').val(data.reportingStaffName)
                    $('#yuan_num').val(data.reportingStaffEmp)

                    $('#uploadurl').attr('src', service_ip + '/images/' + data.busiLicensePicture)
                }
            },
            error: function (res) {
                console.log(res)
            }
        });

    }

    //基本信息保存
    $('#jiqisave').click(function () {
        var qiyename = $('#qi_ming').val();
        var qiyjian = $('#qi_jian').val();
        var lian_tel1 = $('#lian_tel').val();
        var qidengs = $('#deng_password').val();
        var fdata = {
            source: 1,
            archivesName: $('#qi_ming').val(),

            archivesNumber: $('#qi_num').val(),
            archivesAddress: $('#qi_dizhi').val(),

            reportingStaffEmp: $('#yuan_num').val(),
            reportingStaffName: $('#yuan_name').val(),
            defMobile: $('#lian_tel').val(),
            defName: $('#lian_name').val(),
            //              defDepartment:$('#lian_bumen').val(),
            defPost: $('#lian_job').val(),
            loginAccount: $('#deng_account').val(),
            LoginPassword: $('#deng_password').val(),
            busiLicensePicture : $('#uploadurl').attr('class')
        }

        for (i in fdata) {
            if (fdata[i] == '' || fdata[i] == undefined) {
                alert('请把信息填写完整')
                return;
            }
        }
        if (qiyename == qiyjian) {
            alert('企业名称与企业简称不能一样')
            return;
        }
        if (lian_tel1.length < 7) {
            alert('电话格式不正确')
            return;
        }
        //线上注册
        if (shenqingvalue == 1) {
            var data = {
                source: 0,
                archivesName: $('#qi_ming').val(),
                archivesAbbreviation: $('#qi_jian').val(),
                archivesNumber: $('#qi_num').val(),
                archivesAddress: $('#qi_dizhi').val(),
                officialWebsite: $('#qi_net').val(),
                reportingStaffEmp: $('#yuan_num').val(),
                reportingStaffName: $('#yuan_name').val(),
                defMobile: $('#lian_tel').val(),
                defName: $('#lian_name').val(),
                //              defDepartment:$('#lian_bumen').val(),
                defPost: $('#lian_job').val(),
                loginAccount: $('#deng_account').val(),
                LoginPassword: $('#deng_password').val(),
                busiLicensePicture: $('#uploadurl').attr('class')
            }
            if (qiyeflag1 && qiyejianflag1 && qiyedengflag1) {
                $.ajax({
                    type: "post",
                    url: "rest/business/archives/addBusinessArchives",
                    async: false,
                    //contentType: "application/json;charset=UTF-8",
                    //dataType: "json",
                    data: data,
                    //data:JSON.stringify(data),
                    success: function (res) {
                        console.log(res)
                        if (res.rel) {
                            var xiandata = {
                                applyId: shenqingid,
                                status: 1
                            }
                            $.ajax({
                                type: "post",
                                url: "rest/business/apply/updBusinessApply",
                                async: false,
                                //contentType: "application/json;charset=UTF-8",
                                //dataType: "json",
                                data: xiandata,
                                //data:JSON.stringify(data),
                                success: function (res) {
                                    console.log(res)
                                    if (res.rel) {

                                    } else {
                                        alert(res.message)
                                    }
                                },
                                error: function (res) {
                                    console.log(res)
                                }
                            });
                            $('.tuancao_wrap').show()
                            $('.xinjiandang_wrap').hide()
                            $('.account_setwrap').hide()
                            $('body').css('background-color', '#fff');
                            $('.xinjiandang_wrap').css('background-color', '#fff');
                            queryqiyelist()

                        } else {
                            alert(res.msg)
                        }
                    },
                    error: function (res) {
                        console.log(res)
                    }
                });
            }
        } else {
            if (qidengs == chaqiyepassword) {
                var data = {
                    archivesId: archivesId1,
                    gxId: gxId1,
                    crmCode: crmCode1,
                    contactsId: contactsId1,//联系人ID
                    loginId: loginId1,
                    source: 1,
                    archivesName: $('#qi_ming').val(),
                    archivesAbbreviation: $('#qi_jian').val(),
                    archivesNumber: $('#qi_num').val(),
                    archivesAddress: $('#qi_dizhi').val(),
                    officialWebsite: $('#qi_net').val(),
                    reportingStaffEmp: $('#yuan_num').val(),
                    reportingStaffName: $('#yuan_name').val(),
                    defMobile: $('#lian_tel').val(),
                    defName: $('#lian_name').val(),
                    //              defDepartment:$('#lian_bumen').val(),
                    defPost: $('#lian_job').val(),
                    loginAccount: $('#deng_account').val()

                }
            } else {
                var data = {
                    archivesId: archivesId1,
                    gxId: gxId1,
                    crmCode: crmCode1,
                    contactsId: contactsId1,//联系人ID
                    loginId: loginId1,
                    source: 1,
                    archivesName: $('#qi_ming').val(),
                    archivesAbbreviation: $('#qi_jian').val(),
                    archivesNumber: $('#qi_num').val(),
                    archivesAddress: $('#qi_dizhi').val(),
                    officialWebsite: $('#qi_net').val(),
                    reportingStaffEmp: $('#yuan_num').val(),
                    reportingStaffName: $('#yuan_name').val(),
                    defMobile: $('#lian_tel').val(),
                    defName: $('#lian_name').val(),
                    //              defDepartment:$('#lian_bumen').val(),
                    defPost: $('#lian_job').val(),
                    loginAccount: $('#deng_account').val(),
                    LoginPassword: $('#deng_password').val()
                }
            }

            if (qiyeflag1 && qiyejianflag1 && qiyedengflag1) {
                console.log(data)
                $.ajax({
                    type: "post",
                    url: "rest/business/archives/updArchivesInfo",
                    async: false,
                    //contentType: "application/json;charset=UTF-8",
                    //dataType: "json",
                    data: data,
                    //data:JSON.stringify(data),
                    success: function (res) {
                        console.log(res)
                        if (res.status) {
                            alert('修改成功')
                            //                  $('.create_dangan').hide()
                            queryqiyelist()
                        } else {
                            alert('修改失败')
                        }
                    },
                    error: function (res) {
                        console.log(res)
                    }
                });
            }

        }

    })

    //基本信息清除
    $('#jiqiclear').click(function () {
        $('#qi_ming').val('')
        $('#qi_jian').val('')
        $('#qi_num').val('')
        $('#qi_dizhi').val('')
        $('#qi_net').val('')
        $('#lian_name').val('')
        $('#lian_tel').val('')
        $('#lian_job').val('')
        $('#deng_account').val('')
        $('#deng_password').val('')
        $('#yuan_name').val('')
        $('#yuan_num').val('')
        $('.yuanradio7').each(function () {
            $(this).removeClass("yuanradioactive7");

        })
    })

    $('.xinjian_lianxiren').click(function () {
        $('.create2_dangan').show()
        $('#lianxiname').val('')
        $('#lianxitel').val('')
        $('#lianxibumen').val('')
        $('#lianxizhiwei').val('')
        $('#lianxibaoname').val('')
        $('#lianxibaogong').val('')
        $("input[name='Storage']").removeAttr('checked')
    })

    $('.xinjian_yewuyuan').click(function () {
        yebianjiflag = true;
        $('.create3_dangan').show()
        $('#yewuy_gong').val('')
        $('#yewuy_name').val('')
        $('#yewuy_zhanbi').val('')
        $("input[name='Storage1']").removeAttr('checked')
        $('.yuanradio5').each(function () {
            $(this).removeClass("yuanradioactive5");
        })
        $('#yewustatus').css('opacity', 0)

    })

    //点击新建档案    
    $('#addjuesebtn').click(function () {
        $('.yuanradio').removeClass("yuanradioactive")
        $('#qi_ming1').val('')
        $('#qi_jian1').val('')
        $('#qi_num1').val('')
        $('#qi_dizhi1').val('')
        $('#qi_net1').val('')
        $('#lian_name1').val('')
        $('#lian_tel1').val('')
        $('#lian_job1').val('')
        $('#deng_account1').val('')
        $('#deng_password1').val('')
        $('#lian_bumen1').val('')
        $('#yuan_name1').val('')
        $('#yuan_num1').val('')
        $('.create_dangan').show()
    })

    $('#qiclear1').click(function () {
        $('.create_dangan').hide()
    })

    $('#lianqiclear1').click(function () {
        $('.create2_dangan').hide()
    })

    $('#yeqiclear1').click(function () {
        $('.create3_dangan').hide()
    })

    function fangclose() {
        $('.create_dangan').hide()
        $('.create1_dangan').hide()
        $('.create2_dangan').hide()
        $('.create3_dangan').hide()
        $('.create1_dangan_wrap').hide()
    }

    var packageId = '';
    var packageMoney = '';

    $('#tao_num').blur(function () {
        var taonum = $('#tao_num').val();

        var data = {
            packageCode: taonum
        }
        if (taonum != '') {
            $.ajax({
                type: "post",
                url: "rest/business/account/getGxPackageInfo",
                async: false,
                //contentType: "application/json;charset=UTF-8",
                //dataType: "json",
                data: data,
                //data:JSON.stringify(data),
                success: function (res) {
                    console.log(res)
                    if (res.status) {
                        var data = res.rows[0];
                        packageId = data.packageId;
                        packageMoney = data.totalMoney;
                        $('#tao_name').val(data.packageName)
                        $('#pay_jine').val(data.totalMoney)
                    }
                },
                error: function (res) {
                    console.log(res)
                }
            });
        }
    })

    //新建企业账户保存
    $('#qisave3').click(function () {
        var taonum = $('#tao_num').val();
        if (taonum == '') {
            alert('请填写套餐编号')
            return;
        }
        var yinhangka = parseFloat($('#yinhangka').val())
        var zhuangzhang = parseFloat($('#zhuangzhang').val())
        var weixin = parseFloat($('#weixin').val())
        var zhifubao = parseFloat($('#zhifubao').val())
        var xianjin = parseFloat($('#xianjin').val())
        var mianfu = parseFloat($('#mianfu').val())
        var gonghao1 = $('#creat_gonghao1').val()
        var gonghao2 = $('#creat_gonghao2').val()
        var yueyeji1 = $('#creat_yeji1').val()
        var yueyeji2 = $('#creat_yeji2').val()
        if (gonghao1 == '') {
            gonghao1 = 0
        }
        if (gonghao2 == '') {
            gonghao2 = 0
        }
        if (yueyeji1 == '') {
            yueyeji1 = 0
        }
        if (yueyeji2 == '') {
            yueyeji2 = 0
        }
        if (isNaN(yinhangka)) {
            yinhangka = 0;
        }
        if (isNaN(zhuangzhang)) {
            zhuangzhang = 0;
        }
        if (isNaN(weixin)) {
            weixin = 0;
        }
        if (isNaN(zhifubao)) {
            zhifubao = 0;
        }
        if (isNaN(xianjin)) {
            xianjin = 0;
        }
        if (isNaN(mianfu)) {
            mianfu = 0;
        }

        //付款方式总金额
        var totaljine = yinhangka + zhuangzhang + weixin + zhifubao + xianjin + mianfu;

        if (totaljine == packageMoney) {
            var data = {
                archivesId: archivesId1,
                customerCode: crmCode1,
                club: $('#goumaimendianf').val(),
                packageId: packageId,
                price: packageMoney,
                bank: yinhangka,
                transfer: zhuangzhang,
                zfb: zhifubao,
                weixin: weixin,
                cash: xianjin,
                free: mianfu,
                userId1: gonghao1,
                userperform1: yueyeji1,
                userId2: gonghao2,
                userperform2: yueyeji2

            }
            $.ajax({
                type: "post",
                url: "rest/business/account/buyPackage",
                async: false,
                //contentType: "application/json;charset=UTF-8",
                //dataType: "json",
                data: data,
                //data:JSON.stringify(data),
                success: function (res) {
                    console.log(res)
                    if (res.status) {
                        queryaccount()
                        $('.create1_dangan_wrap').hide()
                    } else {
                        alert(res.message)
                    }
                },
                error: function (res) {
                    console.log(res)
                }
            });
            console.log(data)
        } else {
            alert('付款方式总金额与付款金额不相等')
        }



    })

    //查询账户列表
    function queryaccount() {
        var data = {
            id: archivesId1
        }
        $.ajax({
            type: "post",
            url: "rest/business/account/packageList",
            async: false,
            contentType: "application/json;charset=UTF-8",
            //dataType: "json",
            //data:data,
            data: JSON.stringify(data),
            success: function (res) {
                console.log(res)
                if (res.status) {
                    $('.xinjian_accountcon').html('');
                    var data = res.rows;
                    var strimg = '';

                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];
                        if (item.state1 == 6) {
                            strimg = '<img  src="images/pc_dongjie.png"/>'
                        } else if (item.state1 == 2) {
                            strimg = '<img  src="images/pc_shixiao.png"/>'
                        } else {
                            if (item.freeuser == 1) {
                                strimg = '<img  src="images/pc_give.png"/>'
                            } else {
                                strimg = ''
                            }

                        }
                        var youxiao = null;
                        var kaihu = item.opendate.substring(0, 4) + '-' + item.opendate.substring(4, 6) + '-' + item.opendate.substring(6, 8);
                        if (item.closedate.length == 8) {
                            youxiao = item.closedate.substring(0, 4) + '-' + item.closedate.substring(4, 6) + '-' + item.closedate.substring(6, 8);
                        } else {
                            youxiao = item.closedate
                        }

                        var str = '<div class="account_item">' +
                            '<div class="account_title">' + item.packageName + '</div>' +
                            '<div class="account_text">账户余额：<span>' + item.balance + '</span></div>' +
                            '<div class="account_text">福利人数：<span>' + item.benefitPeople + '人</span></div>' +
                            '<div class="account_text">开户日期：<span>' + kaihu + '</span></div>' +
                            '<div class="account_text last_text">有效期：<span>' + youxiao + '</span></div>' +
                            '<div class="account_set" onclick="setaccount(\'' + item.packageName + '\',\'' + kaihu + '\',\'' + youxiao + '\',\'' + item.packageId + '\',1)">设置</div>' +
                            '<div class="account_status">' + strimg + '</div>' +
                            '</div>'
                        $('.xinjian_accountcon').append(str);
                    }

                }

            },
            error: function (res) {
                console.log(res)
            }
        });
    }

    //账户设置编辑、保存

    var acountsetbianji = true;

    $('#accountsetbianji').click(function () {
        if (acountsetbianji) {
            fisAlertflag = true;
            $('#dinge_max').attr("disabled", false);
            $('#dinge_min').attr("disabled", false);
            $('#dongtaie_max').attr("disabled", false);
            $('#dongtaie_min').attr("disabled", false);
            $('.hezuoradio').attr("disabled", false)
            $('.hezuoradio1').attr("disabled", false)
            $('#depeie_select').show()
            $('#dtpeie_select1').show()
            $('.checkbox_wrap').show()
        } else {
            var hezuovalue = $("input[name='jiating']:checked").val();
            var hezuovalue = $("input[name='jiating1']:checked").val();
            var hezuovalueid = $("input[name='jiating']:checked").attr('valid');
            var hezuovalue1id = $("input[name='jiating1']:checked").attr('valid');
            var dongtaie_min = $('#dongtaie_min').val();
            var dongtaie_max = $('#dongtaie_max').val();
            var dinge_max = $('#dinge_max').val();
            var dinge_min = $('#dinge_min').val();
            var peiefangshi = $('.yuanradioactive3').attr('fvalue')
            //alert(hezuovalueid)
            console.log(hezuovalueid)
            console.log(peiefangshi)
            if (hezuovalueid == undefined || hezuovalueid == '') {
                alert('请选择合作模式')
                return;
            }
            if (peiefangshi == undefined || peiefangshi == '') {
                alert('请选择配额方式')
                return;
            } else {
                //1、固定配额 2、动态配额
                if (peiefangshi == 1) {
                    if (dinge_max == '' || dinge_min == '') {
                        alert('请设置最高上限或最低下限')
                        return;
                    }
                } else {
                    if (dongtaie_max == '' || dongtaie_max == '') {
                        alert('请设置最高上限或最低下限')
                        return;
                    }
                }
            }
            var data = {
                packageID: fpackageId,
                isAlert: 2,
                assignMethod: peiefangshi,
                cooperationId: hezuovalueid,
                settlementId: hezuovalue1id,
                minAssigned: dinge_min,
                maxAssigned: dinge_max,
                minAlterableAssigned: dongtaie_min,
                maxAlterableAssigned: dongtaie_max
            }
            $.ajax({
                type: "post",
                url: "rest/business/account/accountSetting",
                async: false,
                //contentType: "application/json;charset=UTF-8",
                //dataType: "json",
                data: data,
                //data:JSON.stringify(data),
                success: function (res) {
                    console.log(res)
                },
                error: function (res) {
                    console.log(res)
                }
            });
            setaccount(accountname1, kaidate1, youdate1, packageId1, 2)
        }
        acountsetbianji = !acountsetbianji;
        if (acountsetbianji) {
            $('#accountsetbianji').html('编辑')
        } else {
            $('#accountsetbianji').html('保存')
        }



    })

    //设置账户
    var accountname1 = null;
    var kaidate1 = null;
    var youdate1 = null;

    //点击设置按钮
    function setaccount(accountname, kaidate, youdate, packageId, fsetflag) {
        $('.checkbox_wrap').show();
        accountname1 = accountname;
        kaidate1 = kaidate;
        youdate1 = youdate;
        packageId1 = packageId;
        //获取企业员工职级 部门
        queryzhijibumen();
        //查看消费明细
        queryyuanxf();
        $('.account_setwrap').show()
        $('.bussess_account ').hide();
        $('body').css('background-color', '#F7F7F7')
        $('.xinjiandang_wrap').css('background-color', '#F7F7F7')
        $('#accountname').html(accountname)
        $('#kaidate').html(kaidate)
        $('#youdate').html(youdate)
        $('.hezuoradio').each(function () {
            $(this).attr('checked', false)
            $(this).next().hide()
        })
        $('.hezuoradio1').each(function () {
            $(this).attr('checked', false)
            $(this).next().hide()
        })
        $('.yuanradio3').each(function () {
            $(this).removeClass("yuanradioactive3");
        })
        $('#dongtaie_min').val('')
        $('#dongtaie_max').val('')
        $('#dinge_min').val('')
        $('#dinge_max').val('')
        $('.taocanx_tableconwrap').html('')
        $('.taocanq_tablecon').html('')
        $('#account_keyong').html('')
        $('#account_chongzhi').html('')
        $('#account_xiaofei').html('')
        $('#account_kefenpei').html('')

        child.window.childFunction('')
        $('.taocanq_table').show()
        $('.taocanx_table').show()
        $('#useclub-show').hide()
        $('#Package-ri').addClass('qy-active')
        $('#useclub').removeClass('qy-active')

        fpackageId = packageId;
        //查询企业账户信息
        var data = {
            pacId: packageId,
            id: archivesId1
        }
        $.ajax({
            type: "post",
            url: "rest/business/account/queryBussinessPackageInfo",
            async: false,
            //contentType: "application/json;charset=UTF-8",
            //dataType: "json",
            data: data,
            //data:JSON.stringify(data),
            success: function (res) {
                console.log(res)
                if (res.status) {
                    var data = res.rows[0];

                    $('#dinge_max').val(data.maxAssigned);
                    $('#dinge_min').val(data.minAssigned);
                    $('#dongtaie_max').val(data.maxAlterableAssigned);
                    $('#dongtaie_min').val(data.minAlterableAssigned);
                    $('#account_keyong').html(data.gxRemainMoney)
                    $('#account_chongzhi').html(data.totalMoney)
                    $('#account_xiaofei').html(data.costedMoney)
                    $('#account_kefenpei').html(data.remainMoney)
                    var peiemoshi = data.assignMethod;
                    var hezuomoshi = data.cooperationId;
                    var jieshuanmoshi = data.settlementId;
                    var fisAlert = data.isAlert;//账户配额方式是否允许修改 1允许 2禁止

                    $('#edior-p').unbind()

                    if(res.rows[0].packageDes){
                        child.window.childFunction(res.rows[0].packageDes)
                    }

                    $('#edior-p').click(function () {

                        callChild()

                        console.log($('#packageDes').val())
                        console.log(res.rows[0].packageID)

                        var data = {
                            packageID : res.rows[0].packageID,
                            packageDes : $('#packageDes').val()
                        }

                        $.ajax({
                            type : 'post',
                            url : 'rest/business/account/accountSetting',
                            // contentType: "application/json",
                            data: data,
                            success : function(res){
                                console.log(res)
                                alert(res.message)
                            },
                            err : function(err){
                                console.log(err)
                            }
                        })
                    })

                    $('.yuanradio3').each(function () {
                        if ($(this).attr('fvalue') == peiemoshi) {

                            $(this).addClass('yuanradioactive3')

                        }
                    })
                    if (peiemoshi == 1) {
                        $('#depeie_select').show()
                        $('#dtpeie_select1').hide()

                    } else if (peiemoshi == 2) {
                        $('#depeie_select').hide()
                        $('#dtpeie_select1').show()

                    } else {

                        $('#depeie_select').show()
                        $('#dtpeie_select1').show()
                    }
                    if (fisAlert == 2) {

                        fisAlertflag = false;
                        $('#dinge_max').attr("disabled", true);
                        $('#dinge_min').attr("disabled", true);
                        $('#dongtaie_max').attr("disabled", true);
                        $('#dongtaie_min').attr("disabled", true);

                    } else {
                        fisAlertflag = true;
                        $('#dinge_max').attr("disabled", false);
                        $('#dinge_min').attr("disabled", false);
                        $('#dongtaie_max').attr("disabled", false);
                        $('#dongtaie_min').attr("disabled", false);
                    }
                    if (hezuomoshi == '结算' || hezuomoshi == '预付+结算') {
                        $('.hezuo_select2').show()
                    } else {
                        $('.hezuo_select2').hide()
                    }
                    var hezuoradioflag = false;
                    var hezuoradioflag1 = false;
                    $('.hezuoradio').each(function () {
                        if ($(this).val() == hezuomoshi) {
                            $(this).attr('checked', true)
                            $(this).next().show()
                            hezuoradioflag = true;



                        } else {
                            $(this).attr('checked', false)
                            $(this).next().hide()



                        }
                    })
                    if (hezuoradioflag) {
                        $('.hezuoradio').attr("disabled", true)
                    } else {
                        $('.hezuoradio').attr("disabled", false)
                    }
                    if (fsetflag == 1) {
                        if (fisAlertflag && !hezuoradioflag) {

                            acountsetbianji = false;
                            $('#accountsetbianji').html('保存')
                        } else {
                            acountsetbianji = true;
                            $('#accountsetbianji').html('编辑')
                        }
                    }


                    $('.hezuoradio1').each(function () {
                        if ($(this).val() == jieshuanmoshi) {
                            $(this).attr('checked', true)
                            $(this).next().show()
                            hezuoradioflag1 = true;

                            $(this).parent().parent().show();

                        } else {
                            $(this).attr('checked', false)
                            $(this).next().hide()

                        }
                    })
                    if (!fisAlertflag && hezuoradioflag) {
                        $('.hezuoradio').each(function () {
                            if ($(this).attr('checked')) {

                                $(this).parent().parent().show();

                            } else {

                                $(this).parent().parent().hide();
                            }
                        })


                    }
                    if (!fisAlertflag && hezuoradioflag) {
                        $('.hezuoradio1').each(function () {
                            if ($(this).attr('checked')) {

                                $(this).parent().parent().show();

                            } else {

                                $(this).parent().parent().hide();
                            }
                        })


                    }

                    if (hezuoradioflag1) {
                        $('.hezuoradio1').attr("disabled", true)
                    } else {
                        $('.hezuoradio1').attr("disabled", false)
                    }
                    var data1 = data.equityList;
                    var zhekou = [];
                    var xiangmu = [];
                    for (var i = 0; i < data1.length; i++) {
                        var item = data1[i];
                        if (item.type == '项目') {
                            xiangmu.push(item)
                        } else {
                            zhekou.push(item)
                        }
                    }
                    // console.log(zhekou)
                    // console.log(xiangmu)
                    var datalen = zhekou.length;

                    $('.taocanq_tablecon').html('')
                    if (datalen < 11) {
                        for (var m = 0; m < datalen; m++) {
                            var item_1 = zhekou[m]
                            var str = '<div class="item">' + item_1.chargeName + '</div>' +
                                '<div class="item">' + item_1.remark1 + '</div>'
                            $('.taocanq_tablecon').append(str)

                        }
                        var n = 10 - parseInt(datalen);
                        for (var j = 0; j < n; j++) {
                            var str = '<div class="item"></div>' +
                                '<div class="item"></div>'
                            $('.taocanq_tablecon').append(str)
                        }

                    } else {
                        if (datalen % 2 == 0) {
                            for (var k = 0; k < datalen; k++) {
                                var item_2 = zhekou[k]
                                var str = '<div class="item">' + item_2.chargeName + '</div>' +
                                    '<div class="item">' + item_2.remark1 + '</div>'
                                $('.taocanq_tablecon').append(str)

                            }
                        } else {
                            for (var q = 0; q < datalen; q++) {
                                var item_3 = zhekou[q]
                                var str = '<div class="item">' + item_3.chargeName + '</div>' +
                                    '<div class="item">' + item_3.remark1 + '</div>'
                                $('.taocanq_tablecon').append(str)

                            }
                            var str1 = '<div class="item"></div>' +
                                '<div class="item"></div>'
                            $('.taocanq_tablecon').append(str1)
                        }

                    }
                    $('.taocanx_tableconwrap').html('')
                    var datalen1 = xiangmu.length;
                    if (datalen1.length < 5) {
                        for (var x = 0; x < datalen1; x++) {
                            var item_5 = xiangmu[x]
                            var str3 = '<div class="taocanx_tablecon">' +
                                '<div class="item ffitem1">' + item_5.chargeName + '</div>' +
                                '<div class="item ffitem2">' + item_5.remark1 + '</div>' +

                                '</div>'
                            $('.taocanx_tableconwrap').append(str2)
                        }
                        var w = 4 - parseInt(datalen1);
                        for (var y = 0; y < w.length; y++) {
                            var str4 = '<div class="taocanx_tablecon">' +
                                '<div class="item ffitem1"></div>' +
                                '<div class="item ffitem2"></div>' +

                                '</div>'
                        }
                        $('.taocanx_tableconwrap').append(str4)
                    } else {
                        for (var z = 0; z < datalen1; z++) {
                            var item_5 = xiangmu[z]
                            var str2 = '<div class="taocanx_tablecon">' +
                                '<div class="item ffitem1">' + item_5.chargeName + '</div>' +
                                '<div class="item ffitem2">' + item_5.remark1 + '</div>' +

                                '</div>'
                            $('.taocanx_tableconwrap').append(str2)
                        }
                    }



                }
            },
            error: function (res) {
                console.log(res)
            }
        });
    }

    var fintoPages = 1;

    function queryyuanxff() {
        fintoPages = 1;
        queryyuanxf()
    }

    var fonPagechange = function (page) {
        console.log('当前点击入场页码', page);
        if (fintoPages != page) {
            fintoPages = page;
            queryyuanxf();
        }
    }


    //员工消费明细
    function queryyuanxf() {
        //   xiaofangcusname  姓名
        var data = {
            pageNo: fintoPages,
            pageSize: 20,
            stringParam1: packageId1,
            stringParam2: $('#xiaoselectDate1').val(),
            stringParam3: $('#xiaoselectDate2').val(),
            stringParam5: $('#xiaofeidep').val(),
            stringParam6: $('#xiaofeizhiji').val(),
            stringParam7: archivesId1,
            stringParam8: $('#xiaofanggong').val()

        }
        $.ajax({
            type: "post",
            url: "rest/business/employee/empPackageTradeList",
            async: false,
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            data: JSON.stringify(data),
            success: function (res) {

                console.log(res)
                if (res.status) {
                    $('#xiaofangdatalist_wrap ').html('')
                    var data = res.rows;
                    if (data.length > 0) {
                        $('#xiaoboxpage').show();
                        var intoNum = (fintoPages - 1) * 20; //序号
                        for (var i = 0; i < data.length; i++) {
                            intoNum++;
                            var item = data[i];
                            var str = '<tr>' +
                                '<td class="item item1 ">' + intoNum + '</td>' +

                                '<td class="item fitem2f ">' + tihuan(item.employeeCode) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.employeeName) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.mobile) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.department) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.position) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.rank) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.clubName) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.itemName) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.payMoney) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.itemNum) + '</td>' +

                                '<td class="item fitem4f ">' + tihuan(item.tradeTime) + '</td>' +
                                '</tr>';






                            $('#xiaofangdatalist_wrap ').append(str)
                        }
                    } else {
                        //alert('没有数据，请检查输入信息是否正确')
                        $('#xiaoboxpage').hide()
                    }
                    if (intoNum != 0) {
                        var obj = {
                            wrapid: 'xiaoboxpage', //页面显示分页器容器id
                            total: res.total, //总条数
                            pagesize: 20, //每页显示10条
                            currentPage: fintoPages, //当前页
                            onPagechange: fonPagechange,
                            //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                        }
                        pagination.init(obj);

                    }

                }
            },
            error: function (res) {
                console.log(res)
            }
        });
    }


    // 企业消费明细
    var xiaofintoPages = 1;
    function xiaoqueryyuanxff() {
        xiaofintoPages = 1;
        xiaoqueryyuanxf()
    }

    var xiaofonPagechange = function (page) {
        console.log('当前点击入场页码', page);
        if (xiaofintoPages != page) {
            xiaofintoPages = page;
            xiaoqueryyuanxf();
        }
    }

    function xiaoqueryyuanxf() {
        //   xiaofangcusname  姓名
        var data = {
            pageNo: xiaofintoPages,
            pageSize: 20,
            stringParam2: $('#xiaoxiaoselectDate1').val(),
            stringParam3: $('#xiaoxiaoselectDate2').val(),
            stringParam5: $('#xiaoxiaofeidep').val(),
            stringParam6: $('#xiaoxiaofeizhiji').val(),
            stringParam7: archivesId1,
            stringParam8: $('#xiaoxiaofanggong').val()

        }
        $.ajax({
            type: "post",
            url: "rest/business/employee/empPackageTradeList",
            async: false,
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            data: JSON.stringify(data),
            success: function (res) {

                console.log(res)
                if (res.status) {
                    $('#xiaoxiaofangdatalist_wrap ').html('')
                    var data = res.rows;
                    if (data.length > 0) {
                        $('#xiaoxiaoboxpage').show();
                        var intoNum = (xiaofintoPages - 1) * 20; //序号
                        for (var i = 0; i < data.length; i++) {
                            intoNum++;
                            var item = data[i];
                            var str = '<tr>' +
                                '<td class="item item1 ">' + intoNum + '</td>' +

                                '<td class="item fitem2f ">' + tihuan(item.employeeCode) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.employeeName) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.mobile) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.department) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.position) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.rank) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.clubName) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.itemName) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.payMoney) + '</td>' +
                                '<td class="item fitem2f ">' + tihuan(item.itemNum) + '</td>' +

                                '<td class="item fitem4f ">' + tihuan(item.tradeTime) + '</td>' +
                                '</tr>';






                            $('#xiaoxiaofangdatalist_wrap ').append(str)
                        }
                    } else {
                        //alert('没有数据，请检查输入信息是否正确')
                        $('#xiaoxiaoboxpage').hide()
                    }
                    if (intoNum != 0) {
                        var obj = {
                            wrapid: 'xiaoxiaoboxpage', //页面显示分页器容器id
                            total: res.total, //总条数
                            pagesize: 20, //每页显示10条
                            currentPage: xiaofintoPages, //当前页
                            onPagechange: xiaofonPagechange,
                            //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                        }
                        pagination.init(obj);

                    }

                }
            },
            error: function (res) {
                console.log(res)
            }
        });
    }

    function xiaofeiclear() {
        $('#xiaofangcusname ').val('');
        $('#xiaofanggong').val('');
    }

    function xiaoxiaofeiclear() {
        $('#xiaoxiaofangcusname ').val('');
        $('#xiaoxiaofanggong').val('');
    }

    $(document).on('click', '.hezuoradio', function () {
        $('.hezuoradio').next().hide()
        if ($(this).prop('checked')) {

            $(this).next().show()
        }

    })

    $(document).on('click', '.hezuoradio1', function () {
        $('.hezuoradio1').next().hide()
        if ($(this).prop('checked')) {

            $(this).next().show()
        }

    })

    $(document).on('change', '.hezuoradio', function () {
        var hezuovalue = $("input[name='jiating']:checked").val();
        var hezuovalue1 = $("input[name='jiating1']:checked").val();
        var hezuovalueid = $("input[name='jiating']:checked").attr('valid');
        var hezuovalue1id = $("input[name='jiating1']:checked").attr('valid');
        var dongtaie_min = $('#dongtaie_min').val();
        var dongtaie_max = $('#dongtaie_max').val();
        var dinge_max = $('#dinge_max').val();
        var dinge_min = $('#dinge_min').val();
        var peiefangshi = $('.yuanradioactive3').attr('fvalue')
        if (hezuovalue == '结算' || hezuovalue == '预付+结算') {
            $('.hezuo_select2').show()
        } else {
            $('.hezuo_select2').hide()
            $('.hezuoradio1').each(function () {
                $(this).attr("checked", false)
            })
            $('.hezuoradio1').next().hide()
            hezuovalue1id = $("input[name='jiating1']:checked").attr('valid');
            //                  alert(hezuovalue1id)
        }
        var data = {
            packageID: fpackageId,
            isAlert: 2,
            assignMethod: peiefangshi,
            cooperationId: hezuovalueid,
            settlementId: hezuovalue1id,
            minAssigned: dinge_min,
            maxAssigned: dinge_max,
            minAlterableAssigned: dongtaie_min,
            maxAlterableAssigned: dongtaie_max
        }
        $.ajax({
            type: "post",
            url: "rest/business/account/accountSetting",
            async: false,
            //contentType: "application/json;charset=UTF-8",
            //dataType: "json",
            data: data,
            //data:JSON.stringify(data),
            success: function (res) {
                console.log(res)
            },
            error: function (res) {
                console.log(res)
            }
        });
        //              alert(hezuovalue)
        //              alert(hezuovalue1)
    })

    $(document).on('change', '.hezuoradio1', function () {
        //              var hezuovalue =  $("input[name='jiating']:checked").val();
        //              var hezuovalue =  $("input[name='jiating1']:checked").val(); 
        //              var hezuovalueid =  $("input[name='jiating']:checked").attr('valid');
        //              var hezuovalue1id =  $("input[name='jiating1']:checked").attr('valid');
        //              var dongtaie_min = $('#dongtaie_min').val();
        //              var dongtaie_max = $('#dongtaie_max').val();
        //              var dinge_max = $('#dinge_max').val();
        //              var dinge_min = $('#dinge_min').val();
        //              var peiefangshi = $('.yuanradioactive3').attr('fvalue')
        //              //alert(hezuovalueid)
        //              var data = {
        //                          packageID:fpackageId,                   
        //                          isAlert:2,
        //                          assignMethod:peiefangshi,
        //                          cooperationId:hezuovalueid,
        //                          settlementId:hezuovalue1id,
        //                          minAssigned:dinge_min,
        //                          maxAssigned:dinge_max,
        //                          minAlterableAssigned:dongtaie_min,
        //                          maxAlterableAssigned:dongtaie_max                   
        //                  }
        //              $.ajax({
        //                      type:"post",
        //                      url:"rest/business/account/accountSetting",
        //                      async:false,
        //                      //contentType: "application/json;charset=UTF-8",
        //                      //dataType: "json",
        //                      data:data,
        //                      //data:JSON.stringify(data),
        //                      success:function(res){
        //                          console.log(res)
        //                      },
        //                      error:function(res){
        //                              console.log(res)
        //                      }
        //                  });
    })

    $('#depeie_select').click(function () {
        if (fisAlertflag) {
            $('#dongtaie_max').val('')
            $('#dongtaie_min').val('')
            $('.yuanradio3').each(function () {
                $(this).removeClass('yuanradioactive3')
            })
            $('#depeie_select').find('.yuanradio3').addClass('yuanradioactive3')
        }
    })

    $('#dtpeie_select1').click(function () {
        if (fisAlertflag) {
            $('#dinge_min').val('')
            $('#dinge_max').val('')
            $('.yuanradio3').each(function () {
                $(this).removeClass('yuanradioactive3')
            })
            $('#dtpeie_select1').find('.yuanradio3').addClass('yuanradioactive3')
        }
    })


    //          $('#dongtaie_min').blur(function(){
    //              var dongtaie_min = $('#dongtaie_min').val();
    //              var dongtaie_max = $('#dongtaie_max').val();
    //              var hezuovalue =  $("input[name='jiating']:checked").val(); 
    //              var hezuovalue1 =  $("input[name='jiating1']:checked").val();
    //              var hezuovalueid =  $("input[name='jiating']:checked").attr('valid');
    //              var hezuovalue1id =  $("input[name='jiating1']:checked").attr('valid');
    //              var peiefangshi = $('.yuanradioactive3').attr('fvalue');
    //              var data = {
    //                  packageID:fpackageId,                   
    //                  isAlert:2,
    //                  assignMethod:peiefangshi,
    //              cooperationId:hezuovalueid,
    //                          settlementId:hezuovalue1id,
    //                  minAssigned:'',
    //                  maxAssigned:'',
    //                  minAlterableAssigned:dongtaie_min,
    //                  maxAlterableAssigned:dongtaie_max
    //                  
    //              }
    //              if(dongtaie_min !=''){
    //                  $.ajax({
    //                      type:"post",
    //                      url:"rest/business/account/accountSetting",
    //                      async:false,
    //                      //contentType: "application/json;charset=UTF-8",
    //                      //dataType: "json",
    //                      data:data,
    //                      //data:JSON.stringify(data),
    //                      success:function(res){
    //                          console.log(res)
    //                      },
    //                      error:function(res){
    //                              console.log(res)
    //                      }
    //                  });
    //              }
    //          })
    //          $('#dongtaie_max').blur(function(){
    //              var dongtaie_max = $('#dongtaie_max').val();
    //              var dongtaie_min = $('#dongtaie_min').val();
    //              var hezuovalue =  $("input[name='jiating']:checked").val(); 
    //              var hezuovalue1 =  $("input[name='jiating1']:checked").val();
    //              var hezuovalueid =  $("input[name='jiating']:checked").attr('valid');
    //              var hezuovalue1id =  $("input[name='jiating1']:checked").attr('valid');
    //              var peiefangshi = $('.yuanradioactive3').attr('fvalue')
    ////              var data = {
    ////                  packageID:fpackageId,
    ////                  cooperationId:'',
    ////                  settlementId:'',
    ////                  isAlert:2,
    ////                  assignMethod:peiefangshi,
    ////                  minAssigned:'',
    ////                  maxAssigned:'',
    ////                  minAlterableAssigned:'',
    ////                  maxAlterableAssigned:dongtaie_max
    ////                  
    ////              }
    //             var data = {
    //                  packageID:fpackageId,                   
    //                  isAlert:2,
    //                  assignMethod:peiefangshi,
    //                  cooperationId:hezuovalueid,
    //                          settlementId:hezuovalue1id,
    //                  minAssigned:'',
    //                  maxAssigned:'',
    //                  minAlterableAssigned:dongtaie_min,
    //                  maxAlterableAssigned:dongtaie_max
    //                  
    //              }
    //              if(dongtaie_max !=''){
    //                  $.ajax({
    //                      type:"post",
    //                      url:"rest/business/account/accountSetting",
    //                      async:false,
    //                      //contentType: "application/json;charset=UTF-8",
    //                      //dataType: "json",
    //                      data:data,
    //                      //data:JSON.stringify(data),
    //                      success:function(res){
    //                          console.log(res)
    //                      },
    //                      error:function(res){
    //                              console.log(res)
    //                      }
    //                  });
    //              }
    //              
    //          })
    //          //定额分配
    //          $('#dinge_min').blur(function(){
    //              var dinge_max = $('#dinge_max').val();
    //              var dinge_min = $('#dinge_min').val();
    //              var hezuovalue =  $("input[name='jiating']:checked").val(); 
    //              var hezuovalue1 =  $("input[name='jiating1']:checked").val();
    //              var hezuovalueid =  $("input[name='jiating']:checked").attr('valid');
    //              var hezuovalue1id =  $("input[name='jiating1']:checked").attr('valid');
    //              var peiefangshi = $('.yuanradioactive3').attr('fvalue');
    //              var data = {
    //                  packageID:fpackageId,                   
    //                  isAlert:2,
    //                  assignMethod:peiefangshi,
    //                  cooperationId:hezuovalueid,
    //                          settlementId:hezuovalue1id,
    //                  minAssigned:dinge_min,
    //                  maxAssigned:dinge_max,
    //                  minAlterableAssigned:'',
    //                  maxAlterableAssigned:''
    //                  
    //              }
    //              if(dinge_min !=''){
    //                  $.ajax({
    //                      type:"post",
    //                      url:"rest/business/account/accountSetting",
    //                      async:false,
    //                      //contentType: "application/json;charset=UTF-8",
    //                      //dataType: "json",
    //                      data:data,
    //                      //data:JSON.stringify(data),
    //                      success:function(res){
    //                          console.log(res)
    //                      },
    //                      error:function(res){
    //                              console.log(res)
    //                      }
    //                  });
    //              }
    //          })
    //          $('#dinge_max').blur(function(){
    //              var dinge_max = $('#dinge_max').val();
    //              var dinge_min = $('#dinge_min').val();
    //              var hezuovalue =  $("input[name='jiating']:checked").val(); 
    //              var hezuovalue1 =  $("input[name='jiating1']:checked").val();
    //              var hezuovalueid =  $("input[name='jiating']:checked").attr('valid');
    //              var hezuovalue1id =  $("input[name='jiating1']:checked").attr('valid');
    //              var peiefangshi = $('.yuanradioactive3').attr('fvalue');
    //              var data = {
    //                  packageID:fpackageId,                   
    //                  isAlert:2,
    //                  assignMethod:peiefangshi,
    //                  cooperationId:hezuovalueid,
    //                  settlementId:hezuovalue1id,
    //                  minAssigned:dinge_min,
    //                  maxAssigned:dinge_max,
    //                  minAlterableAssigned:'',
    //                  maxAlterableAssigned:''
    //                  
    //              }
    //              if(dinge_max !=''){
    //                  $.ajax({
    //                      type:"post",
    //                      url:"rest/business/account/accountSetting",
    //                      async:false,
    //                      //contentType: "application/json;charset=UTF-8",
    //                      //dataType: "json",
    //                      data:data,
    //                      //data:JSON.stringify(data),
    //                      success:function(res){
    //                          console.log(res)
    //                      },
    //                      error:function(res){
    //                              console.log(res)
    //                      }
    //                  });
    //              }
    //          })
    //员工名单
    var fintoPages1 = 1;
    function queryyuanmingf() {
        fintoPages1 = 1;
        queryyuanming()
    }

    var fonPagechange1 = function (page) {
        console.log('当前点击入场页码', page);
        if (fintoPages1 != page) {
            fintoPages1 = page;
            queryyuanming();
        }
    }

    function queryyuanming() {

        var data = {
            pageNo: fintoPages1,
            pageSize: 20,
            pageFlag: true,
            stringParam1: archivesId1,
            stringParam2: $('#ygmdaccount').val(),
            stringParam3: $('#ygmdselectDate1').val(),
            stringParam4: $('#ygmdselectDate2').val(),
            stringParam5: $('#ygmdname').val(),
            stringParam6: $('#ygmdgonghao').val(),
            stringParam7: $('#ygmdbumen').val(),
            stringParam8: $('#ygmdzhiji').val()

        }
        $.ajax({
            type: "post",
            url: "rest/business/employee/businessEmployeeList",
            async: false,
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            data: JSON.stringify(data),
            success: function (res) {

                console.log(res)
                if (res.status) {
                    $('#ygmdlist ').html('')
                    var data = res.rows;
                    if (data.length > 0) {
                        $('#ygmdboxpage').show();
                        var intoNum = (fintoPages1 - 1) * 20; //序号
                        for (var i = 0; i < data.length; i++) {
                            intoNum++;
                            var item = data[i];
                            var fstatus = '';

                            if (item.status == 1) {
                                fstatus = '有效'
                            } else if (item.status == 0) {
                                fstatus = '删除'
                            } else if (item.status == 2) {
                                fstatus = '禁用'
                            } else if (item.status == 3) {
                                fstatus = '离职'
                            } else {
                                fstatus = ''
                            }

                            var str = '<tr>' +
                                '<td class="item item1 ">' + intoNum + '</td>' +
                                '<td class="item fitem4 ">' + tihuan(item.packageID) + '</td>' +
                                '<td class="item fitem2 ">' + tihuan(item.employeeCode) + '</td>' +
                                '<td class="item fitem2 ">' + tihuan(item.employeeName) + '</td>' +
                                '<td class="item fitem2 ">' + tihuan(item.mobile) + '</td>' +
                                '<td class="item fitem2 ">' + tihuan(item.department) + '</td>' +
                                '<td class="item fitem2 ">' + tihuan(item.position) + '</td>' +
                                '<td class="item fitem2 ">' + tihuan(item.rank) + '</td>' +
                                '<td class="item fitem2 ">' + tihuan(item.assignMoney) + '</td>' +
                                '<td class="item fitem2 ">' + tihuan(item.remainMoney) + '</td>' +
                                '<td class="item fitem2 ">' + tihuan(item.tradeMoney) + '</td>' +
                                '<td class="item fitem2 ">' + tihuan(item.consumeCount) + '</td>' +
                                '<td class="item fitem3 ">' + fstatus + '</td>' +
                                '<td class="item fitem4 ">' + tihuan(item.updateDate) + '</td>' +
                                '</tr>';




                            $('#ygmdlist').append(str)
                        }
                    } else {
                        //alert('没有数据，请检查输入信息是否正确')
                        $('#ygmdboxpage').hide()
                    }
                    if (intoNum != 0) {
                        var obj = {
                            wrapid: 'ygmdboxpage', //页面显示分页器容器id
                            total: res.total, //总条数
                            pagesize: 20, //每页显示10条
                            currentPage: fintoPages1, //当前页
                            onPagechange: fonPagechange1,
                            //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                        }
                        pagination.init(obj);

                    }

                }
            },
            error: function (res) {
                console.log(res)
            }
        });
    }

    function ygmdclear() {
        //$('#ygmdaccount').val();
        $('#ygmdselectDate1').val('');
        $('#ygmdselectDate2').val('');
        $('#ygmdname').val('');
        $('#ygmdgonghao').val('');
        queryzhijibumen();
    }

    //企业联系人
    var fintoPages2 = 1;
    //      function queryyuanmingf() {
    //           fintoPages2 = 1;
    //          queryyuanming()
    //      } 

    var fonPagechange2 = function (page) {
        console.log('当前点击入场页码', page);
        if (fintoPages2 != page) {
            fintoPages2 = page;
            queryxinjianlian();
        }
    }

    function queryxinjianlian() {

        var data = {
            pageNo: fintoPages2,
            pageSize: 20,
            pageFlag: true,
            stringParam1: archivesId1

        }
        $.ajax({
            type: "post",
            url: "rest/business/contact/contactsList",
            async: false,
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            data: JSON.stringify(data),
            success: function (res) {

                console.log(res)
                if (res.status) {
                    $('#xinjian_lianxirenconwrap').html('')
                    var data = res.rows;
                    if (data.length > 0) {
                        $('#qylxrboxpage').show();
                        var intoNum = (fintoPages2 - 1) * 20; //序号
                        for (var i = 0; i < data.length; i++) {
                            intoNum++;
                            var item = data[i];
                            var molian = '';
                            if (item.defaultContact == 0) {
                                molian = '<img src="images/pc_moren.png" />'
                            } else {
                                molian = ''
                            }

                            var str = ' <div class="xinjian_lianxirencon">' +
                                '<div class="item lianitem1">' + intoNum + '</div>' +
                                '<div class="item lianitem2">' + tihuan(item.name) + '' + molian + '</div>' +
                                '<div class="item lianitem2">' + tihuan(item.tel) + '</div>' +
                                '<div class="item lianitem2">' + tihuan(item.department) + '</div>' +
                                '<div class="item lianitem2">' + tihuan(item.post) + '</div>' +
                                '<div class="item lianitem2">' + tihuan(item.reportingStaffEmp) + '</div>' +
                                '<div class="item lianitem2">' + tihuan(item.reportingStaffName) + '</div>' +
                                '<div class="item lianitem2" style="border-right: none;"><span onclick="xinjianliandel(\'' + item.contactsId + '\',\'' + item.defaultContact + '\')">删除</span></div>' +
                                '</div>';




                            $('#xinjian_lianxirenconwrap ').append(str)
                        }
                    } else {
                        //alert('没有数据，请检查输入信息是否正确')
                        $('#qylxrboxpage').hide()
                    }
                    if (intoNum != 0) {
                        var obj = {
                            wrapid: 'qylxrboxpage', //页面显示分页器容器id
                            total: res.total, //总条数
                            pagesize: 20, //每页显示10条
                            currentPage: fintoPages2, //当前页
                            onPagechange: fonPagechange2,
                            //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                        }
                        pagination.init(obj);

                    }

                }
            },
            error: function (res) {
                console.log(res)
            }
        });
    }

    //新建联系人保存
    function savelianxiren() {
        var tellength = $('#lianxitel').val();

        var olianximoren = '';
        if ($("input[name='Storage']").attr('checked')) {
            olianximoren = 0
        } else {
            olianximoren = 1
        }
        var fdata = {
            archivesId: archivesId1,
            name: $('#lianxiname').val(),
            tel: $('#lianxitel').val(),
            department: $('#lianxibumen').val(),
            post: $('#lianxizhiwei').val(),
            reportingStaffEmp: $('#lianxibaoname').val(),
            reportingStaffName: $('#lianxibaogong').val(),
            defaultContact: olianximoren

        }
        console.log(fdata)
        for (i in fdata) {
            if (fdata[i] === '') {
                alert('请把信息填写完整')
                return;
            }
        }
        if (tellength.length < 11) {
            alert('电话号码格式错误')
            return;
        }
        $.ajax({
            type: "post",
            url: "rest/business/contact/addContactsInfo",
            async: false,
            contentType: "application/json;charset=UTF-8",
            //dataType: "json",
            //data:fdata,
            data: JSON.stringify(fdata),
            success: function (res) {
                console.log(res)
                if (res.status) {
                    $('.create2_dangan').hide()
                    queryxinjianlian()
                }
            },
            error: function (res) {
                console.log(res)
            }
        });

    }

    var lianxirenid = null;
    //新建联系人删除
    function xinjianliandel(xinid, morenid) {

        lianxirenid = xinid;

        if (morenid == 0) {
            //$('.tanchuang_wrap').show()
            alert('默认联系人不能删除')
            return;
        } else {

            var data = {
                contactsId: xinid
            }
            $.ajax({
                type: "post",
                url: "rest/business/contact/updateContacts",
                async: false,
                contentType: "application/json;charset=UTF-8",
                //dataType: "json",
                //data:data,
                data: JSON.stringify(data),
                success: function (res) {
                    console.log(res)
                    if (res.status) {
                        queryxinjianlian()
                    }
                },
                error: function (res) {
                    console.log(res)
                }
            });
        }

    }

    $('#lianshi').click(function () {
        var data = {
            contactsId: lianxirenid
        }
        $.ajax({
            type: "post",
            url: "rest/business/contact/updateContacts",
            async: false,
            contentType: "application/json;charset=UTF-8",
            //dataType: "json",
            //data:data,
            data: JSON.stringify(data),
            success: function (res) {
                console.log(res)
                if (res.status) {
                    queryxinjianlian()
                    $('.tanchuang_wrap').hide()
                } else {
                    alert(res.message)
                }
            },
            error: function (res) {
                console.log(res)
            }
        });
    })

    $('#lianfou').click(function () {
        $('.tanchuang_wrap').hide()
    })
    //业务员
    var fintoPages3 = 1;
    function queryyewuyuanf() {
        fintoPages3 = 1;
        queryyewuyuan()
    }

    var fonPagechange3 = function (page) {
        console.log('当前点击入场页码', page);
        if (fintoPages3 != page) {
            fintoPages3 = page;
            queryyewuyuan();
        }
    }

    function queryyewuyuan() {

        var data = {
            pageNo: fintoPages3,
            pageSize: 20,
            pageFlag: true,
            stringParam1: archivesId1

        }
        $.ajax({
            type: "post",
            url: "rest/business/salesman/getSalesmanListPage",
            async: false,
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            data: JSON.stringify(data),
            success: function (res) {

                console.log(res)
                if (res.status) {
                    $('#xinjian_lianxirenconwrap1').html('')
                    var data = res.rows;
                    if (data.length > 0) {
                        $('#ywyboxpage').show();
                        var intoNum = (fintoPages3 - 1) * 20; //序号
                        for (var i = 0; i < data.length; i++) {
                            intoNum++;
                            var item = data[i];
                            var molian = '';
                            if (item.defaultSalesman == 0) {
                                molian = '<img src="images/pc_moren.png" />'
                            } else {
                                molian = ''
                            }
                            var genjinper = ''
                            if (item.status == 0) {
                                genjinper = '有效'
                            } else {
                                genjinper = '无效'
                            }
                            var str = '<div class="xinjian_lianxirencon">' +
                                '<div class="item lianitem1">' + intoNum + '</div>' +
                                '<div class="item flianitem2">' + tihuan(item.salesmanName) + '' + molian + '</div>' +
                                '<div class="item flianitem2">' + tihuan(item.salesmanEmp) + '</div>' +
                                '<div class="item flianitem2">' + tihuan(item.coefficient) + '</div>' +
                                '<div class="item flianitem2">' + genjinper + '</div>' +
                                '<div class="item flianitem2"></div>' +
                                '<div class="item flianitem2" style="border-right: none;"><span onclick="bianjiyewu(\'' + item.salesmanId + '\',\'' + item.salesmanEmp + '\',\'' + item.salesmanName + '\',\'' + item.defaultSalesman + '\',\'' + item.coefficient + '\',\'' + item.status + '\')">编辑</span></div>' +
                                '</div>';



                            $('#xinjian_lianxirenconwrap1').append(str)
                        }
                    } else {
                        //alert('没有数据，请检查输入信息是否正确')
                        $('#ywyboxpage').hide()
                    }
                    if (intoNum != 0) {
                        var obj = {
                            wrapid: 'ywyboxpage', //页面显示分页器容器id
                            total: res.total, //总条数
                            pagesize: 20, //每页显示10条
                            currentPage: fintoPages3, //当前页
                            onPagechange: fonPagechange3,
                            //btnCount:7 页数过多时，显示省略号的边界页码按钮数量，可省略，且值是大于5的奇数
                        }
                        pagination.init(obj);

                    }

                }
            },
            error: function (res) {
                console.log(res)
            }
        });
    }

    var ffsalesmanId = null;
    //新建 编辑业务员保存
    function xinjiansave() {
        var olianximoren = '';
        if ($("input[name='Storage1']").attr('checked')) {
            olianximoren = 0
        } else {
            olianximoren = 1
        }
        var fdata = {
            archivesId: archivesId1,
            salesmanEmp: $('#yewuy_gong').val(),
            salesmanName: $('#yewuy_name').val(),
            coefficient: $('#yewuy_zhanbi').val(),
            defaultSalesman: olianximoren

            //status:$('.yuanradioactive5').attr('valyewu')
        }
        var ffdata = {
            archivesId: archivesId1,
            salesmanId: ffsalesmanId,
            salesmanEmp: $('#yewuy_gong').val(),
            salesmanName: $('#yewuy_name').val(),
            coefficient: $('#yewuy_zhanbi').val(),
            status: $('.yuanradioactive5').attr('valyewu'),
            defaultSalesman: olianximoren
        }
        console.log(fdata)
        for (let i in fdata) {
            console.log(fdata[i])
            if (fdata[i] === '') {
                alert('请把信息填写完整哦')
                return;
            }
        }
        if (yebianjiflag) {
            $.ajax({
                type: "post",
                url: "rest/business/salesman/addSalesmanInfo",
                async: false,
                contentType: "application/json;charset=UTF-8",
                //dataType: "json",
                //data:fdata,
                data: JSON.stringify(fdata),
                success: function (res) {
                    console.log(res)
                    if (res.status) {
                        $('.create3_dangan').hide()
                        queryyewuyuan()
                    }
                },
                error: function (res) {
                    console.log(res)
                }
            });
        } else {
            $.ajax({
                type: "post",
                url: "rest/business/salesman/updateSalesmanInfo",
                async: false,
                contentType: "application/json;charset=UTF-8",
                //dataType: "json",
                //data:fdata,
                data: JSON.stringify(ffdata),
                success: function (res) {
                    console.log(res)
                    if (res.status) {
                        $('.create3_dangan').hide()
                        queryyewuyuan()
                    }
                },
                error: function (res) {
                    console.log(res)
                }
            });
        }


    }

    //编辑业务员信息
    function bianjiyewu(salesmanId, salesmanEmp, salesmanName, defaultSalesman, coefficient, status) {
        ffsalesmanId = salesmanId
        yebianjiflag = false;
        $('.create3_dangan').show()
        $('#yewustatus').css('opacity', 1)
        $('#yewuy_gong').val(salesmanEmp)
        $('#yewuy_name').val(salesmanName)
        $('#yewuy_zhanbi').val(coefficient)
        if (defaultSalesman == 0) {
            $("input[name='Storage1']").attr('checked', true)
        } else {
            $("input[name='Storage1']").attr('checked', false)
        }
        $('.yuanradio5').each(function () {
            if ($(this).attr('valyewu') == status) {
                $(this).addClass('yuanradioactive5')
            } else {
                $(this).removeClass('yuanradioactive5')
            }
        })
    }
</script>

</html>