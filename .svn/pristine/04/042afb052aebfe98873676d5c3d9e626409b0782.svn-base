<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <title>采购问价</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="ask_time" value="${purchase.ask_time}">
    <input type="hidden" name="buyer" value="${purchase.buyer}">
    <input type="hidden" name="pro_id" value="${purchase.pro_id}">
    <input type="hidden" id="provide" name="supply_id" value="${purchase.supply_id}">

    <div class="layui-form-item">
        <label class="layui-form-label">采购产品</label>
        <div class="layui-input-block">
            <input name="pro_name" class="layui-input" type="text" autocomplete="off"
                   value="${purchase.pro_name}">
        </div>

    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">采购数量</label>
        <div class="layui-input-block">
            <input  name="pur_num" class="layui-input" type="text" autocomplete="off"
                    value="${purchase.pur_num}">
        </div>
   <%-- </div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">采购批次号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="pur_batch" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${purchase.pur_batch}">
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item"  id="layerDemo">--%>
        <div id="layerDemo">
            <label class="layui-form-label">供应商</label>
            <div class="layui-input-block">
                <input id="test" type="text" style="width:400px;height:35px;" name="supply_name" lay-verify="required"
                       autocomplete="off"  value="${purchase.supply_name}" placeholder="请选择" />
                <span data-method="notice" class="layui-btn">选择供应</span>
            </div>
        </div>
   <%-- <div class="layui-form-item">--%>
        <label class="layui-form-label">采购价格<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input id="pre" name="price" class="layui-input" type="text" lay-verify="required" autocomplete="off"
                   value="${purchase.price}">
        </div>
    <%--</div>--%>

    </div>
    <div class="layui-form-item" style="text-align: center;" id="form-button">
        <button class="layui-btn" lay-filter="formSave" lay-submit>保存</button>
        <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
    </div>
</form>

</div>
</body>

<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {
       // init();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            form = layui.form,
            $ = layui.jquery;

        //监听提交
        form.on('submit(formSave)', function (data) {
            $.ajax({
                url: "inquiry/save.do",
                data: data.field,
                type: "post",
                dataType: 'json',
                success: function (data) {
                    if (data.state == "ok") {
                        parent.formReload();
                        parent.layer.msg(data.msg);
                        closeWin();
                    } else {
                        layer.msg(data.msg);
                    }
                }
            });
            return false;
        });

        //触发事件
         var active = {
        //监听搜索表单提交
             notice:function () {
            layer.open({
                title: "采购的商品和价格",
                type: 2,
                offset: 't',
                maxmin: true,
                skin: 'layui-layer-rim', //加边框
                moveType: 1,
                content: "approve/choose.do",
                area: ['600px', '80%'],

            });
         }
        }

        $('#layerDemo .layui-btn').on('click', function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        });
    });


    function closeWin(){
       parent.layer.close(index);
    }


</script>
</html>