<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|图书管理-编辑图书</title>
<#include "../common/header.ftl"/>

</head>
  
<body>
<div class="lyear-layout-web">
  <div class="lyear-layout-container">
    <!--左侧导航-->
    <aside class="lyear-layout-sidebar">
      
      <!-- logo -->
      <div id="logo" class="sidebar-header">
        <a href="index.html"><img src="/admin/images/logo-sidebar.png" title="${siteName!""}" alt="${siteName!""}" /></a>
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
              <div class="card-header"><h4>编辑图书</h4></div>
              <div class="card-body">
                <form action="add" id="user-add-form" method="post" class="row">
                  <input type="hidden" name="id" value="${goods.id}">
                  <div class="form-group col-md-12">
                    <label>图片上传</label>
                    <div class="form-controls">
                      <ul class="list-inline clearfix lyear-uploads-pic">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <figure>
                            <#if goods.photo?length gt 0>
                    		<img src="/photo/view?filename=${goods.photo}" id="show-picture-img">
                    		<#else>
                    		<img src="/admin/images/default-head.jpg" id="show-picture-img" alt="默认头像">
                    		</#if>
                          </figure>
                        </li>
                        <input type="hidden" name="photo" id="photo" value="${goods.photo}">
                        <input type="file" id="select-file" style="display:none;" onchange="upload('show-picture-img','headPic')">
                        <li class="col-xs-4 col-sm-3 col-md-2">
                          <a class="pic-add" id="add-pic-btn" href="javascript:void(0)" title="点击上传"></a>
                        </li>
                      </ul>
                    </div>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">图书名称</span>
                    <input type="text" class="form-control required" id="name" name="name" value="${goods.name}" placeholder="请输入图书名称" tips="请填写图书名称" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">图书详情</span>
                    <textarea name="content" id="desc" placeholder="建议填写图书用途、新旧程度、原价等信息，至少15个字"
                              class="form-control required" tips="请填写详情描述">${goods.content}</textarea>

                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">购入价格</span>
                    <input class="price form-control required" id="buyPrice" name="buyPrice" value="${goods.buyPrice}" type="number" tips="请填写购入价格">
                  </div>

                  <div class="input-group m-b-10">
                    <span class="input-group-addon">售出价格</span>
                    <input class="price form-control required" id="sellPrice" name="sellPrice" value="${goods.sellPrice}" type="number" tips="请填写出售价格">
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">所属大类</span>
                    <select id="cid" class="form-control">
                      <option>---请选择大类----</option>
                      <#if goodsCategorys??>
                        <#list goodsCategorys as goodsCategory>
                          <#if goodsCategory.parent??>
                          <#else>
                            <option value="${goodsCategory.id}" <#if goods.goodsCategory.parent.id == goodsCategory.id>selected</#if> >${goodsCategory.name}</option>
                          </#if>
                        </#list>
                      </#if>
                    </select>
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">所属小类</span>
                    <select id="cid2"  class="form-control" name="goodsCategory.id">
                      <option value="-1">----请选择小类----</option>
                      <#if goodsCategorys??>
                        <#list goodsCategorys as goodsCategory>
                          <#if goodsCategory.parent??>
                            <#if goodsCategory.parent.id == goods.goodsCategory.parent.id>
                              <option value="${goodsCategory.id}" pid="${goodsCategory.parent.id}" <#if goods.goodsCategory.id == goodsCategory.id>selected</#if>>${goodsCategory.name}</option>
                            <#else>
                              <option style="display:none;" value="${goodsCategory.id}" pid="${goodsCategory.parent.id}">${goodsCategory.name}</option>
                            </#if>
                          </#if>
                        </#list>
                      </#if>
                    </select>
                  </div>
                  <div class="form-group col-md-12">
                    <button type="button" class="btn btn-primary ajax-post" id="add-form-submit-btn">确 定</button>
                    <button type="button" class="btn btn-default" onclick="javascript:history.back(-1);return false;">返 回</button>
                  </div>
                </form>
       
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
$(document).ready(function(){
  $("#cid").change(function(){
    var cid = $(this).val();
    $("#cid2 option[value='-1']").prop("selected", true);
    $("#cid2 option[value!='-1']").css({'display':'none'});
    $("#cid2 option").each(function(i,e){
      if($(e).attr('pid') == cid){
        $(e).css({'display':'block'})
      }
    });
  });
	//提交按钮监听事件
	$("#add-form-submit-btn").click(function(){
		if(!checkForm("user-add-form")){
			return;
		}
		var data = $("#user-add-form").serialize();
		$.ajax({
			url:'edit',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('编辑成功!',function(){
						window.location.href = 'list';
					})
				}else{
					showErrorMsg(data.msg);
				}
			},
			error:function(data){
				alert('网络错误!');
			}
		});
	});
	//监听上传图片按钮
	$("#add-pic-btn").click(function(){
		$("#select-file").click();
	});
});
</script>
</body>
</html>