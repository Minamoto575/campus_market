<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, goodsCategory-scalable=no"/>
    <title>${siteName!""}|订单管理-${title!""}</title>

    <#include "../common/header.ftl"/>
    <style>
        td {
            vertical-align: middle;
        }
    </style>
</head>

<body>
<div class="lyear-layout-web">
    <div class="lyear-layout-container">
        <!--左侧导航-->
        <aside class="lyear-layout-sidebar">

            <!-- logo -->
            <div id="logo" class="sidebar-header">
                <a href="index.html"><img src="/admin/images/logo-sidebar.png" title="${siteName!""}"
                                          alt="${siteName!""}"/></a>
            </div>
            <div class="lyear-layout-sidebar-scroll">
                <#include "../common/left-menu.ftl"/>
            </div>

        </aside>
        <!--End 左侧导航-->

        <#include "../common/header-menu.ftl"/>

        <!--页面主要内容-->
        <main class="lyear-layout-content">

            <div class="container-fluid">

                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-toolbar clearfix">
                                <form class="pull-right search-bar" method="get" action="list" role="form">
                                    <div class="input-group">
                                        <div class="input-group-btn">
                                            <button class="btn btn-default dropdown-toggle" id="search-btn"
                                                    data-toggle="dropdown" type="button" aria-haspopup="true"
                                                    aria-expanded="false">
                                                <#if sn??>学生学号<#elseif name??>图书名称<#else>搜索条件</#if> <span
                                                        class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu">
                                                <li><a tabindex="-1" href="javascript:void(0)" data-field="student.sn">学生学号</a>
                                                </li>
                                                <li><a tabindex="-1" href="javascript:void(0)" data-field="goods.name">图书名称</a>
                                                </li>
                                            </ul>
                                        </div>
                                        <input type="text" class="form-control" value="${name!sn!""}" id="search-value"
                                               name="<#if sn??>student.sn<#else>goods.name</#if>" placeholder="请输入搜索值">
                                        <span class="input-group-btn">
                      <button class="btn btn-primary" type="submit">搜索</button>
                    </span>
                                    </div>
                                </form>
                                <#include "../common/third-menu.ftl"/>
                            </div>
                            <div class="card-body">

                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>图片</th>
                                            <th>名称</th>
                                            <th>分类</th>
                                            <th>购买人(学号)</th>
                                            <th>手机号</th>
                                            <th>QQ号</th>
                                            <th>地址</th>
                                            <th>售价</th>
                                            <th>是否使用优惠券</th>
                                            <th>支付价格</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <#if pageBean.content?size gt 0>
                                            <#list pageBean.content as orderForm>
                                                <tr>
                                                    <td style="vertical-align:middle;">
                                                        <img src="/photo/view?filename=${orderForm.goods.photo}"
                                                             width="30px" height="30px">
                                                    </td>
                                                    <td style="vertical-align:middle;">
                                                        ${orderForm.goods.name}
                                                    </td>
                                                    <td style="vertical-align:middle;">
                                                        ${orderForm.goods.goodsCategory.name}
                                                    </td>
                                                    <td style="vertical-align:middle;">
                                                        ${orderForm.student.sn}
                                                    </td>
                                                    <td style="vertical-align:middle;">
                                                        ${orderForm.student.mobile!""}
                                                    </td>
                                                    <td style="vertical-align:middle;">
                                                        ${orderForm.student.qq!""}
                                                    </td>
                                                    <td style="vertical-align:middle;">
                                                        ${orderForm.place!""}
                                                    </td>
                                                    <td style="vertical-align:middle;">
                                                        ${orderForm.sellPrice!""}
                                                    </td>
                                                    <td style="vertical-align:middle;">
                                                        <#if orderForm.isUse == 1>
                                                            是
                                                        <#else>
                                                            否
                                                        </#if>
                                                    </td>
                                                    <td style="vertical-align:middle;">
                                                        ${orderForm.payPrice!""}
                                                    </td>
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
                                            <li>
                                                <a href="list?<#if sn??>student.sn<#else>goods.name</#if>=${name!sn!""}&currentPage=1">«</a>
                                            </li>
                                        </#if>
                                        <#list pageBean.currentShowPage as showPage>
                                            <#if pageBean.currentPage == showPage>
                                                <li class="active"><span>${showPage}</span></li>
                                            <#else>
                                                <li>
                                                    <a href="list?<#if sn??>student.sn<#else>goods.name</#if>=${name!sn!""}&currentPage=${showPage}">${showPage}</a>
                                                </li>
                                            </#if>
                                        </#list>
                                        <#if pageBean.currentPage == pageBean.totalPage>
                                            <li class="disabled"><span>»</span></li>
                                        <#else>
                                            <li>
                                                <a href="list?<#if sn??>student.sn<#else>goods.name</#if>=${name!sn!""}&currentPage=${pageBean.totalPage}">»</a>
                                            </li>
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
<#include "../common/footer.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $(".dropdown-menu li a").click(function () {
            $("#search-btn").html($(this).text() + '<span class="caret"></span>');
            $("#search-value").attr('name', $(this).attr('data-field'));
        });
    });

</script>
</body>
</html>