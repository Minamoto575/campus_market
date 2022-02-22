<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>${siteName!""}-个人订单</title>
    <link rel="icon" href="/home/imgs/favicon.ico" type="image/x-icon">
    <link media="all" href="/home/css/index.css" type="text/css" rel="stylesheet">
    <link media="all" href="/home/css/user_center.css" type="text/css" rel="stylesheet">
</head>
<body>
<#include "../common/top_header.ftl"/>
<#include "../common/left_menu.ftl"/>
﻿<div class="container">
    <div class="main center">
        <ul id="middle_nav" class="clearfix">
            <li class="on"><a href="">我的订单</a></li>
        </ul>
        <div id="my_products">
            <div id="onsale_pro">
                <#if pageBean.content??>
                    <#list pageBean.content as orderForm>
                        <div class="enshr_each" id="">
                            <div class="enshr_info">
                                <h2><a href="../goods/show?id=${orderForm.goods.id}" class="img" target="_top">${orderForm.goods.name}</a></h2>
                                <p style="overflow:hidden;height: 45px">
                                    售&nbsp&nbsp&nbsp价：${orderForm.sellPrice}</br>
                                    是否使用优惠券：
                                    <#if orderForm.isUse == 1>
                                        是
                                    <#else>
                                        否
                                    </#if>
                                    </br>
                                    支付价格：${orderForm.payPrice}
                                </p>
                                <div class="enshr_state">
                                    <span id="prostate">购买日期：${orderForm.updateTime}</span></br>
                                    <span id="prostate">收货地址：${orderForm.place}</span>
                                </div>
                            </div>
                            <img class="enshr_ph" src="/photo/view?filename=${orderForm.goods.photo}" alt="${orderForm.goods.name}">
                        </div>

                    </#list>
                </#if>
            </div>

        </div>

        <#if pageBean.total gt 0>
            <!-- 分页 开始 -->
            <div class="pages">
                <#if pageBean.currentPage == 1>
                    <a class="page-arrow arrow-left" href="javascript:void(0)">首页</a>
                <#else>
                    <a class="page-arrow arrow-left" href="/home/student/order?currentPage=1">首页</a>
                </#if>
                <#list pageBean.currentShowPage as showPage>
                    <#if pageBean.currentPage == showPage>
                        <a class="page-num cur" href="javascript:void(0)">${showPage}</a>
                    <#else>
                        <a class="page-num " href="/home/student/order?currentPage=${showPage}">${showPage}</a>
                    </#if>
                </#list>
                <#if pageBean.currentPage == pageBean.totalPage>
                    <a class="page-arrow arrow-right" href="javascript:void(0)">尾页</a>
                <#else>
                    <a class="page-arrow arrow-right" href="/home/student/order?currentPage=${pageBean.totalPage}">尾页</a>
                </#if>
            </div>
            <!-- 分页 结束 -->
        </#if>

    </div>
</div>
<#include "../common/right_menu.ftl"/>
<#include "../common/bottom_footer.ftl"/>
<script  src="/home/js/jquery-3.1.1.min.js"></script>
<script src="/home/js/common.js"></script>
<script src="/home/js/user_center.js"></script>
<script src="/home/js/add.js"></script>
</html>