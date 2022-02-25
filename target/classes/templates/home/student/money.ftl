<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>${siteName!""}流水记录</title>
    <link rel="icon" href="/home/imgs/favicon.ico" type="image/x-icon">
    <link media="all" href="/home/css/release_product.css" type="text/css" rel="stylesheet">
    <link media="all" href="/home/css/index.css" type="text/css" rel="stylesheet">
    <link href="/home/css/login2.css" rel="stylesheet" type="text/css"/>
    <link href="/home/css/bootstrap.min.css" rel="stylesheet">
    <#--    <script type="text/javascript" src="/home/js/jquery-3.1.1.min.js"></script>-->
    <script type="text/javascript" src="/home/js/money.js"></script>
    <#--    <script type="text/javascript" src="/home/js/bootstrap.min.js"></script>-->
    <#include "../common/header.ftl"/>
</head>

<body>
<#include "../common/top_header.ftl"/>
<div class="container">
    <div class="main center">
        <img class="release-icon-main" src="/home/imgs/release-icon.png" alt="">
        <div class="wave-fluid"></div>
        <#--        <div class="release-title">发布图书出售</div>-->
        <div class="form-wr">

            <li style="margin-bottom: 10px">
                <a style="margin-left:20px" href="money?type=consumption">消费记录</a>
                <a style="margin-left:20px" href="money?type=recharge">充值记录</a>
            </li>

            <main class="lyear-layout-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <thead>
                                            <tr>
                                                <th>时间</th>
                                                <#if type=="recharge">
                                                    <th>充值金额</th>
                                                <#else>
                                                    <th>消费金额</th>
                                                </#if>

                                                <th>购买人(学号)</th>
                                                <#if type=="recharge">
                                                    <th>操作人</th>
                                                    <th>充值方式</th>
                                                </#if>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <#if pageBean.content?size gt 0>
                                                <#list pageBean.content as turnover>
                                                    <tr>
                                                        <td style="vertical-align:middle;">
                                                            ${turnover.createTime}
                                                        </td>
                                                        <td style="vertical-align:middle;">
                                                            ￥${turnover.amount}
                                                        </td>
                                                        <td style="vertical-align:middle;">
                                                            ${turnover.student.sn}
                                                        </td>
                                                        <#if type=="recharge">
                                                            <td style="vertical-align:middle;">
                                                                ${turnover.user.username!""}
                                                            </td>
                                                            <td style="vertical-align:middle;">
                                                                ${turnover.type!""}
                                                            </td>
                                                        </#if>


                                                    </tr>
                                                </#list>
                                            <#else>
                                                <tr align="center">
                                                    <td colspan="11">这里空空如也！</td>
                                                </tr>
                                            </#if>
                                            </tbody>
                                        </table>
                                    </div>
                                    <#if pageBean.total gt 0>
                                        <ul class="pagination ">
                                            <#if pageBean.currentPage == 1>
                                                <li class="disabled"><span>«</span></li>
                                            <#else>
                                                <li><a href="money?type=${type}&currentPage=1">«</a></li>
                                            </#if>
                                            <#list pageBean.currentShowPage as showPage>
                                                <#if pageBean.currentPage == showPage>
                                                    <li class="active"><span>${showPage}</span></li>
                                                <#else>
                                                    <li>
                                                        <a href="money?type=${type}&currentPage=${showPage}">${showPage}</a>
                                                    </li>
                                                </#if>
                                            </#list>
                                            <#if pageBean.currentPage == pageBean.totalPage>
                                                <li class="disabled"><span>»</span></li>
                                            <#else>
                                                <li><a href="money?type=${type}&currentPage=${pageBean
                                                    .totalPage}">»</a></li>
                                            </#if>
                                            <li><span>共${pageBean.totalPage}页,${pageBean.total}条数据</span></li>
                                        </ul>
                                    </#if>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>

            </main>
            <!--End 页面主要内容-->
        </div>
    </div>
</div>
</body>
</html>