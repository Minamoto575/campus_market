<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>${siteName!""}-个人中心</title>
    <link rel="icon" href="/home/imgs/favicon.ico" type="image/x-icon">
    <link media="all" href="/home/css/index.css" type="text/css" rel="stylesheet">
    <link media="all" href="/home/css/user_center.css" type="text/css" rel="stylesheet">
</head>
<body>
<#include "../common/top_header.ftl"/>
<#include "../common/left_menu.ftl"/>
﻿
<div class="container">
    <div class="main center">
    
        <div class="top clearfix" id="user-top">
            <div id="user_msg">
                <div class="name" id="user_big_name">

                </div>

            </div>
            <div id="user_photo">
                <#if student.headPic??>
                    <img id="origin_ph" onClick="openUploadPanel()" src="/photo/view?filename=${student.headPic}"
                         old-src="/photo/view?filename=${student.headPic}" alt="大头像">
                <#else>
                    <img id="origin_ph" onClick="openUploadPanel()" src="/home/imgs/avatar1.png"
                         old-src="/home/imgs/avatar1.png">
                </#if>
            </div>
        </div>
        <ul id="middle_nav" class="clearfix">
            <li class="on"><a href="#">个人资料</a></li>
        </ul>
        <div id="my_info">
            <div id="account_info">
                <h2>账户信息</h2>
                <ul class="infos" id="userid">
                    <li>账号ID</li>
                    <li class="right_info">${student.id}</li>
                </ul>
                <ul class="infos" id="userstate">
                    <li>账号状态</li>
                    <li class="right_info"><#if student.status == 1>正常<#else>冻结</#if></li>
                </ul>
            </div>

            <div id="account_info">
                <ul class="infos">
                    <li>学号</li>
                    <li class="right_info">${student.sn}</li>
                </ul>
            </div>

            <div id="base_info">
                <h2>基本信息 </h2>
                <ul class="infos">
                    <li>昵称</li>
                    <li class="right_info">
                        <span class="baseinfo" id="nickname_span">${student.nickname!""}</span>
                        <input class="baseinfo" value="${student.nickname!""}" id="nickname" type="text">
                    </li>
                </ul>
                <ul class="infos">
                    <li>手机</li>
                    <li class="right_info">
                        <span class="baseinfo" id="phone_span">${student.mobile!""}</span>
                        <input class="baseinfo" value="${student.mobile!""}" id="mobile" type="text">
                    </li>
                </ul>
                <ul class="infos">
                    <li>QQ</li>
                    <li class="right_info">
                        <span class="baseinfo" id="qq_span">${student.qq!""}</span>
                        <input class="baseinfo" value="${student.qq!""}" id="qq" type="text">
                    </li>
                </ul>
                <ul class="infos">
                    <li>学院</li>
                    <li class="right_info">
                        <span class="baseinfo" id="college_span">${student.academy!""}</span>
                        <input class="baseinfo" value="${student.academy!""}" id="academy" type="text">
                    </li>
                </ul>
                <ul class="infos">
                    <li>年级</li>
                    <li class="right_info">
                        <span class="baseinfo" id="grade_span">${student.grade!""}</span>
                        <input class="baseinfo" value="${student.grade!""}" id="grade" type="text">
                    </li>
                </ul>
                <ul class="infos">
                    <li>学校</li>
                    <li class="right_info">
                        <span class="baseinfo" id="area_span">${student.school!""}</span>
                        <input class="baseinfo" value="${student.school!""}" id="school" type="text">
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<#include "../common/right_menu.ftl"/>
<#include "../common/bottom_footer.ftl"/>
<script src="/home/js/jquery-3.1.1.min.js"></script>
<script src="/home/js/common.js"></script>
<script src="/home/js/user_center.js"></script>
<script src="/home/js/add.js"></script>
<script>

</script>
</body>
</html>