<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
    <title>${siteName!""}-图书信息</title>
    <link rel="icon" href="/home/imgs/favicon.ico" type="image/x-icon">
    <link media="all" href="/home/css/release_product.css" type="text/css" rel="stylesheet">
    <link media="all" href="/home/css/index.css" type="text/css" rel="stylesheet">
    <style>
        .ensure_to_buy_button{
            background-color:#0FB25F;
            width: 24%;
            height: 45px;
            margin-left: 28.3%;
            margin-top: 30px;
            color: white;
            cursor:pointer;
        }
    </style>
</head>
<body>
<#include "../common/top_header.ftl"/>
<div class="container">
    <div class="main center">
        <form id="publish-form" >
            <div class="form-wr">
                <div class="form-must-wr">

                    <input type="hidden" value="${goods.id}">
                    <input id="photo" type="hidden" value="${goods.photo}" class="required" tips="请上传图片">

                    <div id="show-img" class="form-item l goods-title" style="height:100px;">
                        <div class="form-key">
                            <span>图书图片</span></div>
                        <div class="form-value">
                            <div class="form-input-wr">
                                <img id="uploaded-img" src="/photo/view?filename=${goods.photo}" width="100px" height="100px">
                            </div>
                        </div>
                    </div>

                    <div class="form-item l goods-title">
                        <div class="form-key">
                            <span>图书名称</span></div>
                        <div class="form-value">
                            <div class="form-input-wr">
                                <input value="${goods.name}" type="text" class="required" readonly></div>
                        </div>
                    </div>

                    <div class="form-item xl goods-desc">
                        <div class="form-key">
                            <span>图书详情</span></div>
                        <div class="form-value">
                            <div class="form-input-wr">
                                    <textarea placeholder="建议填写图书用途、新旧程度、原价等信息，至少15个字" class="required"
                                               id="desc" disabled>${goods.content}</textarea>
                            </div>
                        </div>
                    </div>

                    <div class="form-item l goods-price">
                        <div class="form-key">
                            <span>售价</span></div>
                        <div class="form-value">
                            <div class="form-input-wr">
                                <input class="price required" value="${goods.sellPrice}" type="number"  readonly></div>
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
                                                <option value="${goodsCategory.id}" <#if goods.goodsCategory.parent.id == goodsCategory.id>selected</#if> >${goodsCategory.name}</option>
                                            </#if>
                                        </#list>
                                    </#if>
                                </select>
                                <select id="cid2" name="goodsCategory.id" style="width: 40%;height: 28px;color: rgb(68, 68, 68);font-size: 1.17em;line-height: 28px;background-color: transparent;" disabled>
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
                        </div>
                    </div>

                    <div class="form-item l goods-title">
                        <div class="form-key">
                            <span>收货地址</span></div>
                        <div class="form-value">
                            <div class="form-input-wr">
                                <input type="text" class="required" id="place"
                                       name="place"
                                       placeholder="请输入收货地址"
                                       tips="请输入收货地址"/>
                            </div>
                        </div>
                    </div>
                    <div class="form-item l goods-cat">
                        <div class="form-key">
                            <span>优惠券</span></div>
                        <div class="form-value">
                            <div class="form-input-wr">
                                <select id="discountType" name="discountType" style="width: 80%;height: 28px;color: rgb(68, 68, 68);font-size: 1.17em;line-height: 28px;background-color: transparent;">
                                <#if student.discountCoupon == 1>
                                    <option value="0">--选择优惠券--</option>
                                    <option value="1">--10元优惠券--</option>
                                <#else>
                                    <option value="-1">--暂无优惠券--</option>
                                </#if>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-item l goods-price">
                        <div class="form-key">
                            <span>实际价格</span></div>
                        <div class="form-value">
                            <div class="form-input-wr">
                                <input class="price required" value="${goods.sellPrice}" type="number" id="payPrice"  readonly></div>
                        </div>
                    </div>

                    <input class="ensure_to_buy_button" id="submit-btn" type="button" onclick="ensure_to_buy(${goods.id})" value="确定"/>

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

        $("#discountType").change(function () {
            var discountType = $(this).val();
            var sellPrice = '${goods.sellPrice}'
            var discounts = sellPrice - 10;
            if(discountType == 1){
                $("#payPrice").val(discounts)
            }else{
                $("#payPrice").val(sellPrice)

            }
        })
    })

    function ensure_to_buy(goodsId) {
        var discountType = $("#discountType").val();
        var place = $("#place").val().trim();

        if(place.length == 0){
            alert('收货地址不能为空！');
            return;
        }

        $.ajax({
            url:'to_buy',
            type:'post',
            data:{
                discountType:discountType,
                place:place,
                goodsId:goodsId
            },
            dataType:'json',
            success:function (data) {
                if(data.code == 0){
                    alert("购买成功!")
                    window.location.href = '/home/index/index';
                }else{
                    alert(data.msg);
                }
            },
            error:function(data){
                alert('网络错误!');
            }
        })

    }
</script>
</html>

