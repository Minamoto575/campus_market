<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>${siteName!""}流水记录</title>
    <link rel="icon" href="/home/imgs/favicon.ico" type="image/x-icon">
    <link media="all" href="/home/css/release_product.css" type="text/css" rel="stylesheet">
    <link media="all" href="/home/css/index.css" type="text/css" rel="stylesheet">
</head>
<body>
<#include "../common/top_header.ftl"/>
<div class="container">
    <div class="main center">
        <img class="release-icon-main" src="/home/imgs/release-icon.png" alt="">
        <div class="wave-fluid"></div>
        <div class="release-title">发布图书出售</div>
        <div class="form-wr">
            <main class="lyear-layout-content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card">
                                <div class="card-toolbar clearfix">
                                    <form class="pull-right search-bar" method="get" action="list" role="form">
                                        <div class="input-group">
                                            <div class="input-group-btn">
                                                <button class="btn btn-default dropdown-toggle" id="search-btn" data-toggle="dropdown" type="button" aria-haspopup="true" aria-expanded="false">
                                                    <#if consumption??>消费记录<#elseif recharge??>充值记录<#else>消费记录</#if>
                                                    <span
                                                            class="caret"></span>
                                                </button>
                                                <ul class="dropdown-menu">
                                                    <li> <a tabindex="-1" href="javascript:void(0)" data-field="consumption">消费记录</a> </li>
                                                    <li> <a tabindex="-1" href="javascript:void(0)" data-field="recharge">充值记录</a> </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </form>
<#--                                    <#include "../common/third-menu.ftl"/>-->
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered">
                                            <thead>
                                            <tr>
                                                <th>时间</th>
                                                <th>充值金额</th>
                                                <th>购买人(学号)</th>
                                                <th>操作人</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <#if pageBean.content?size gt 0>
                                                <#list pageBean.content as consumption>
                                                    <tr>
                                                        <td style="vertical-align:middle;">
                                                            ${consumption.createTime}
                                                        </td>
                                                        <td style="vertical-align:middle;">
                                                            ￥${consumption.amount}
                                                        </td>
                                                        <td style="vertical-align:middle;">
                                                            ${consumption.student.sn}
                                                        </td>
                                                        <td style="vertical-align:middle;">
                                                            ${consumption.user.username!""}
                                                        </td>

                                                    </tr>
                                                </#list>
                                            <#else>
                                                <tr align="center"><td colspan="11">这里空空如也！</td></tr>
                                            </#if>
                                            </tbody>
                                        </table>
                                    </div>
                                    <#if pageBean.total gt 0>
                                        <ul class="pagination ">
                                            <#if pageBean.currentPage == 1>
                                                <li class="disabled"><span>«</span></li>
                                            <#else>
                                                <li><a href="list?<#if sn??>student.sn<#else>goods.name</#if>=${name!sn!""}&currentPage=1">«</a></li>
                                            </#if>
                                            <#list pageBean.currentShowPage as showPage>
                                                <#if pageBean.currentPage == showPage>
                                                    <li class="active"><span>${showPage}</span></li>
                                                <#else>
                                                    <li><a href="list?<#if sn??>student.sn<#else>goods.name</#if>=${name!sn!""}&currentPage=${showPage}">${showPage}</a></li>
                                                </#if>
                                            </#list>
                                            <#if pageBean.currentPage == pageBean.totalPage>
                                                <li class="disabled"><span>»</span></li>
                                            <#else>
                                                <li><a href="list?<#if sn??>student.sn<#else>goods
                                                .name</#if>=${name!sn!""}&currentPage=$ pageBean
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