<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title>${siteName!""}-图书信息</title>

<link rel="icon" href="/home/imgs/favicon.ico" type="image/x-icon">
<link media="all" href="/home/css/product_detail.css" type="text/css" rel="stylesheet">
<link media="all" href="/home/css/index.css" type="text/css" rel="stylesheet">
</head>
<body>
  <#include "../common/top_header.ftl"/>
  <#include "../common/left_menu.ftl"/>
   <div class="container">
        <div class="main center clearfix">
            <div class="ershou-details">
                <div class="ershou-photos-wr">
	            		 <!-- 收藏功能
	                    <a class="ershou-favorite" href="javascript:void(0);" style="background-image: url('heart.png');" onclick="favorites();">0</a> -->
                       <!-- 轮播大图-->
                        <div class="bigger-photo-box">
                        	<a class="bigger-photo hide show" rel="img_group" href="">
                        		<img class="bigger" style="width: 560px" src="/photo/view?filename=${goods.photo}"  alt="${goods.name}">
                        	</a>
                        </div>
                </div>
                <div class="ershou-info">
                    <div class="ershou-hd">
                        <p class="ershou-title">${goods.name}</p>
                        <div class=" discount">
                        	<span class="buy-price">原价：${goods.buyPrice}</span>
                        	<span class="ershou-price">二手街价：${goods.sellPrice}</span>
                        </div>
                        <p class="bro-counts">浏览了<span>${goods.viewNumber}</span>次</p>
                    </div>
                    <ul class="ershou-detail">
                    	<li class="ershou-place" id="pid">
                    		<div class="name">
                    			<span>图书编号</span>
                    		</div>
                    		<div class="value">
                    			<span id="pid">${goods.id}</span>
                    		</div>
                        </li>
                        <li class="ershou-time">
                        	<div class="name">
                        		<span>发布时间</span>
                        	</div>
                        	<div class="value">
                        		<span class="real-time"id="creat_time">${goods.createTime!""}</span>
                        	</div>
                        </li>

                    </ul>
                </div>
            </div>
            <div class="ershou-desc">
            	<div class="desc clearfix">
            		<p id="user_cmt">${goods.content}</p>
            	</div>
            </div>
        </div>
    </div>
 	<#include "../common/right_menu.ftl"/>
	<#include "../common/bottom_footer.ftl"/>

<script  src="/home/js/jquery-3.1.1.min.js"></script>
<script src="/home/js/common.js"></script>
<script src="/home/js/add.js"></script>

<script type="text/javascript">
$(document).ready(function(){


});

</script>	
</html>