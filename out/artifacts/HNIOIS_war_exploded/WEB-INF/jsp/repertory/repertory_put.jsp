<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <title></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
    <form class="layui-form layui-form-pane" action="" >
        <input type="hidden" name="sort" value="${repertory.sort}">
        <input type="hidden" name="id" id="key" value="${repertory.id}">
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">出入库单号</label>
            <div class="layui-input-block">
                <input name="odd_number" class="layui-input" type="text" autocomplete="off" value="">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">库存类别</label>
            <div class="layui-input-block">
                <input name="category" class="layui-input" type="text" autocomplete="off" value="${repertory.category}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">库存名称</label>
            <div class="layui-input-block">
                <input name="name" class="layui-input" type="text" autocomplete="off" value="${repertory.name}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">计量单位</label>
            <div class="layui-input-block">
                <input name="unit" class="layui-input" type="text" autocomplete="off" lay-verify="required" value="${repertory.unit}">
            </div>
        <%--</div>--%>
        <c:if test="${repertory.sort == 1}">
            <%--<div class="layui-form-item">--%>
                <label class="layui-form-label">采购单号</label>
                <div class="layui-input-block">
                    <input name="order_number" class="layui-input" type="text" autocomplete="off" value="">
                </div>
            <%--</div>--%>
            <%--<div class="layui-form-item">--%>
                <label class="layui-form-label">入库数量</label>
                <div class="layui-input-block">
                    <input name="stock" class="layui-input" type="text" autocomplete="off" value="${repertory.stock}"
                           onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();">
                </div>
            <%--</div>--%>
        </c:if>
        <c:if test="${repertory.sort == 2}">
            <%--<div class="layui-form-item">--%>
                <label class="layui-form-label">采购单号</label>
                <div class="layui-input-block">
                    <input name="order_number" class="layui-input" type="text" autocomplete="off" value="">
                </div>
            <%--</div>--%>
            <%--<div class="layui-form-item">--%>
                <label class="layui-form-label">库存数量</label>
                <div class="layui-input-block">
                    <input name="stock" id="instock" class="layui-input" type="text" autocomplete="off" value="${repertory.stock}" readonly="readonly">
                </div>
            <%--</div>--%>
            <%--<div class="layui-form-item">--%>
                <label class="layui-form-label">入库数量</label>
                <div class="layui-input-block">
                    <input name="inrep" id="inrep" class="layui-input" type="text" autocomplete="off" value=""
                           onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" onchange="fninrep();">
                </div>
            <%--</div>--%>
        </c:if>
        <c:if test="${repertory.sort == 3}">
            <%--<div class="layui-form-item">--%>
                <label class="layui-form-label">库存数量</label>
                <div class="layui-input-block">
                    <input name="stock" id="outstock" class="layui-input" type="text" autocomplete="off" value="${repertory.stock}" readonly="readonly">
                </div>
            <%--</div>--%>
            <%--<div class="layui-form-item">--%>
                <label class="layui-form-label">出库数量</label>
                <div class="layui-input-block">
                    <input name="outrep" id="outrep" class="layui-input" type="text" autocomplete="off" value=""
                           onkeyup="(this.v=function(){this.value=this.value.replace(/[^0-9-]+/,'');}).call(this)" onblur="this.v();" onchange="fnoutrep();">
                </div>
            <%--</div>--%>
            <%--<div class="layui-form-item">--%>
                <label class="layui-form-label">领取人</label>
                <div class="layui-input-block">
                    <input name="get_name" class="layui-input" type="text" autocomplete="off" value="">
                </div>
            <%--</div>--%>
        </c:if>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">存储位置</label>
            <div class="layui-input-block">
                <input name="storage" class="layui-input" type="text" autocomplete="off" value="${repertory.storage}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">预警值</label>
            <div class="layui-input-block">
                <input name="warning" class="layui-input" type="text" autocomplete="off" value="${repertory.warning}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">规格</label>
            <div class="layui-input-block">
                <input name="specification" class="layui-input" type="text" autocomplete="off" value="${repertory.specification}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">生产厂家</label>
            <div class="layui-input-block">
                <input name="provenance" class="layui-input" type="text" autocomplete="off" value="${repertory.provenance}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">备注信息</label>
            <div class="layui-input-block">
                <input name="bz" class="layui-input" type="text" autocomplete="off" value="">
            </div>
        <%--</div>--%>
        <div class="layui-form-item" style="text-align: center; margin-top: 30px;">
            <button class="layui-btn" lay-filter="formSave" lay-submit id="form-button">保存</button>
            <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
        </div>
    </form>
</div>
</body>
<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script type="text/javascript">
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);

    function closeWin() {
        parent.layer.close(index);
    }
    //跟新入库
    //TODO: 再次重新修改更新入库数量做了累计操作 需要修改逻辑
    var stockVal = $("#instock").val();
    function fninrep() {
        var inrepVal = $("#inrep").val().trim();
        if(inrepVal) {
            $("#instock").val(parseInt(stockVal) + parseInt(inrepVal));
        } else {
            $("#instock").val(stockVal);
        }
    }
    //出库
    var stockVal = $("#outstock").val();
    function fnoutrep() {
        var outrepVal = $("#outrep").val().trim();
        if (outrepVal) {
            var count = parseInt(stockVal) - parseInt(outrepVal);
            if (count < 0) {
                parent.layer.msg("没有更多的库存量");
                return;
            }
            $("#outstock").val(count);
        } else {
            $("#outstock").val(stockVal);
        }
    }

    layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            form = layui.form;

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "repertory/save.do";
            $.ajax({
                url: url,
                data: data.field,
                type: "post",
                dataType:'json',
                success: function(success){
                    debugger;
                    if(success.state=="ok"){
                        parent.formReload();
                        layer.msg(success.msg);
                        closeWin();
                    }else{
                        layer.msg(success.msg);
                    }
                }
            });
            return false;
        });
    });
</script>
</html>