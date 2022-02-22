<!--选择分类信息 -->
<div class="form-item l goods-cat">
    <div class="form-value">
        <div class="form-input-wr">
            <select id="cid" style="width: 80%;height: 28px;color: rgb(68, 68, 68);font-size: 1.17em;line-height: 28px;background-color: transparent;">
                <option value="-1">---请选择大类----</option>
                <#if goodsCategoryList??>
                    <#list goodsCategoryList as goodsCategory>
                        <#if goodsCategory.parent??>
                        <#else>
                            <option value="${goodsCategory.id}">${goodsCategory.name}</option>
                        </#if>
                    </#list>
                </#if>
            </select>
        </div>
    </div>
</div>