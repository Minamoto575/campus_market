<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title>${siteName!""}</title>
<link rel="icon" href="/home/imgs/favicon.ico" type="image/x-icon">
<link media="all" href="/home/css/index.css" type="text/css" rel="stylesheet">
</head>
<body>
  <#include "../common/top_header.ftl"/>
	<#include "../common/left_menu.ftl"/> 
    <div class="container">
   		<div class="main center">
                <div class="wrap-site mt20">
                      <#if ylrc_auth??>
                          <#if ylrc_auth!= 1>
    <div class="top-nav" id="show-copyright">
        <div class="container fn-clear" align="center">
            <p style="color:red;font-size:16px;">
                本系统由<a href="www.yuanlrc.com/?fuid=6666">【猿来入此】</a>发布，请认准官网获取，官网获取的正版源码提供免费更新升级！
                <a href="javascript:alert('请登录后台首页填写订单号进行验证，验证通过后刷新此页面，版权信息会自动消失！')" id="order-auth-btn">点此去版权</a>
                <a href="www.yuanlrc.com/?fuid=6666/">点此进入官网</a>
            </p>
        </div>
    </div>
                          </#if>
                      </#if>
            <div class="recom-title"></div>
            <ul class="recom-list group">
                <#if newsList??>
                <#list newsList as news>
                <li><a href="/home/index/news_detail?id=${news.id}" target="_top">${news.title}</a></li>
                </#list>
                </#if>
            </ul>

        </div>
        <div class="label-wr center clearfix">
            <div id="nav-labels">
                <button id="new_pro" class="labels" onclick="" ></button>
            </div>
           
        </div>
        
        <div class="item-list">
            <ul class="items clearfix">
            
            	<#if pageBean.content??>
            	<#list pageBean.content as goods>
            	<li class="item">
                    <a href="../goods/detail?id=${goods.id}" class="img" target="_top">
                    	<img src="/photo/view?filename=${goods.photo}" alt="${goods.name}"></a>
                    <div class="info">
                        <div class="price">${goods.sellPrice}</div>
                        <div class="name">
                            <a href="../goods/detail?id=${goods.id}" target="_top">${goods.name}</a>
                        </div>
                        <#if goods.recommend == 1>
                        <div class="school"><span>推荐</span></div>
                        </#if>
                     </div>
                </li>
                </#list>
            	</#if>
            </ul>
        </div>
        <#if pageBean.total gt 0>
        <!-- 分页 开始 -->
        <div class="pages">
            <#if pageBean.currentPage == 1>
            <a class="page-arrow arrow-left" href="javascript:void(0)">首页</a>
            <#else>
            <a class="page-arrow arrow-left" href="/home/index/index?name=${name!""}&currentPage=1">首页</a>
            </#if>
            <#list pageBean.currentShowPage as showPage>
	        <#if pageBean.currentPage == showPage>
	        <a class="page-num cur" href="javascript:void(0)">${showPage}</a>
	        <#else>
            <a class="page-num " href="/home/index/index?name=${name!""}&currentPage=${showPage}">${showPage}</a>
           	</#if>
           	</#list>
           	<#if pageBean.currentPage == pageBean.totalPage>
            <a class="page-arrow arrow-right" href="javascript:void(0)">尾页</a>
            <#else>
	        <a class="page-arrow arrow-right" href="/home/index/index?name=${name!""}&currentPage=${pageBean.totalPage}">尾页</a>
	        </#if>
        </div>
        <!-- 分页 结束 -->
        </#if>
    </div>
</div>
<div class="return-to-top"><a href="#"></a></div><!--返回顶部-->
 	<#include "../common/right_menu.ftl"/>
	<#include "../common/bottom_footer.ftl"/> 
<script  src="/home/js/jquery-3.1.1.min.js"></script>
<script src="/home/js/common.js"></script>
<script src="/home/js/index.js"></script>
</html>