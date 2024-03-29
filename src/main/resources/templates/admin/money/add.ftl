<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" />
<title>${siteName!""}|菜单管理-添加菜单</title>
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
              <div class="card-header"><h4>添加菜单</h4></div>
              <div class="card-body">
                <form action="add" id="menu-add-form" method="post" class="row">
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">学生学号</span>
                    <input type="text" class="form-control" id="student.sn" name="student.sn" value=""
                           placeholder="请填写学生学号" />
                  </div>
                  <div class="input-group m-b-10">
                    <span class="input-group-addon">金额(元)</span>
                    <input type="text" class="form-control" id="amount" name="amount" value="" placeholder="请填写充值金额" />
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
<#include "../common/icons.ftl"/>
<script type="text/javascript" src="/admin/js/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="/admin/js/main.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	//提交按钮监听事件
	$("#add-form-submit-btn").click(function(){
		if(!checkForm("menu-add-form")){
			return;
		}
        var data = $("#menu-add-form").serialize();
		$.ajax({
			url:'add',
			type:'POST',
			data:data,
			dataType:'json',
			success:function(data){
				if(data.code == 0){
					showSuccessMsg('充值成功!',function(){
						window.location.href = '/admin/money/recharge';
					})
				}else{
					showErrorMsg(data.msg);
				}
			},
			error:function(data){
				alert('充值出错!');
			}
		});
	});
});
</script>
</body>
</html>