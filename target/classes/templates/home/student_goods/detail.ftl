<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<title>${siteName!""}-图书信息</title>
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
                <div class="release-title">图书详情</div>
                <form id="publish-form" >
                <div class="form-wr">
                    <div class="form-must-wr">
                    	
                    	<input type="hidden" name="id" value="${studentGoods.id}">
                    	<input id="photo" type="hidden" name="photo" value="${studentGoods.photo}" class="required" tips="请上传图片">
                    	
                    	<div id="show-img" class="form-item l goods-title" style="height:100px;">
                            <div class="form-key">
                                <span>图书图片</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                	<img id="uploaded-img" src="/photo/view?filename=${studentGoods.photo}" width="100px" height="100px">
                                </div>
                            </div>
                        </div>
                    	
                        <div class="form-item l goods-title">
                            <div class="form-key">
                                <span>图书名称</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                    <input value="${studentGoods.name}" type="text" class="required" readonly></div>
                            </div>
                        </div>
                        
                        <div class="form-item xl goods-desc">
                            <div class="form-key">
                                <span>图书详情</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                    <textarea placeholder="建议填写图书用途、新旧程度、原价等信息，至少15个字" class="required"
                                              name="content" id="desc" disabled>${studentGoods.content}</textarea>
                                </div>
                            </div>
                        </div>

                        <div class="form-item l goods-price">
                            <div class="form-key">
                                <span>购入价格</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                    <input class="price required" value="${studentGoods.buyPrice}" type="number" tips="请填写购物价格" readonly></div>
                            </div>
                        </div>
                        <div class="form-item l goods-price">
                            <div class="form-key">
                                <span>售出价格</span></div>
                            <div class="form-value">
                                <div class="form-input-wr">
                                    <input class="price required" value="${studentGoods.sellPrice}" type="number" tips="请填写出售价格" readonly></div>
                            </div>
                        </div>

                        <!--选择分类信息 -->
                        <div class="form-item l goods-cat">
                            <div class="form-key">
                                <span>分类</span>
                            </div>
                             <div class="form-value">
                                <div class="form-input-wr">
								    <select id="cid" style="width: 40%;height: 28px;color: rgb(68, 68, 68);font-size: 1.17em;line-height: 28px;background-color: transparent;" disabled>
										<option>---请选择大类----</option>
										<#if goodsCategorys??>
										<#list goodsCategorys as goodsCategory>
											<#if goodsCategory.parent??>
											<#else>
											<option value="${goodsCategory.id}" <#if studentGoods.goodsCategory.parent.id == goodsCategory.id>selected</#if> >${goodsCategory.name}</option>
											</#if>
										</#list>
										</#if>
								   </select>
								   <select id="cid2" name="goodsCategory.id" style="width: 40%;height: 28px;color: rgb(68, 68, 68);font-size: 1.17em;line-height: 28px;background-color: transparent;" disabled>
								   		<option value="-1">----请选择小类----</option>
								   		<#if goodsCategorys??>
										<#list goodsCategorys as goodsCategory>
								   		<#if goodsCategory.parent??>
										<#if goodsCategory.parent.id == studentGoods.goodsCategory.parent.id>
										<option value="${goodsCategory.id}" pid="${goodsCategory.parent.id}" <#if studentGoods.goodsCategory.id == goodsCategory.id>selected</#if>>${goodsCategory.name}</option>
										<#else>
										<option style="display:none;" value="${goodsCategory.id}" pid="${goodsCategory.parent.id}">${goodsCategory.name}</option> 
										</#if>
										</#if>
										</#list>
										</#if>
								   </select> 
							    </div>
                            </div>
                        </div>
                    </div>

                  </div>
                </form>
            </div>
        </div>
 	<#include "../common/right_menu.ftl"/>
	<#include "../common/bottom_footer.ftl"/> 
<script  src="/home/js/jquery-3.1.1.min.js"></script>
<script src="/home/js/common.js"></script>
<script src="/home/js/add.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $("#cid").change(function () {
        var cid = $(this).val();
        $("#cid2 option[value='-1']").prop("selected", true);
        $("#cid2 option[value!='-1']").css({'display': 'none'});
        $("#cid2 option").each(function (i, e) {
            if ($(e).attr('pid') == cid) {
                $(e).css({'display': 'block'})
            }
        });
    });
})
</script>	
</html>