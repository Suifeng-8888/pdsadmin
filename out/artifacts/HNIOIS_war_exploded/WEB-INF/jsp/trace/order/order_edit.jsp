<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
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
    <title>订单管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="order_num" id="key" value="${order.order_num}">
    <input type="hidden" name="batch_id" id="bat_id" value="${order.batch_id}">
    <input type="hidden" name="sale_id" id="sale_id" value="${order.sale_id}">
    <div class="layui-form-item">
        <label class="layui-form-label">订单编号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="order_num" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${order.order_num}">
        </div>

        <label class="layui-form-label">销售商<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="sale_name" class="layui-input" type="text" autocomplete="off"
                 id="test"  lay-verify="required" value="${order.sale_name}">
            <span data-method="notice"  class="layui-btn chose">选择销售商</span>
        </div>

        <label class="layui-form-label">产品批次<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="batch" class="layui-input" type="text" autocomplete="off"
                   id="bach"  lay-verify="required" value="${order.batch}">
            <span data-method="choose"  class="layui-btn chose">选择产品批次</span>
        </div>

        <label class="layui-form-label">产品名称<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="batch_name" class="layui-input" type="text" autocomplete="off"
             id="na"      lay-verify="required" value="${order.batch_name}">
        </div>
        <label class="layui-form-label">产品数量<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="batch_num" class="layui-input" type="text" autocomplete="off"
               id="nm"    lay-verify="required" value="${order.batch_num}">
        </div>
        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">发货人<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="sender" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${order.sender}">
        </div>
        <%--</div>--%>
        <label class="layui-form-label">发货地址<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="begin_address" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${order.begin_address}">
        </div>
        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">发货时间<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="send_time" class="layui-input" type="text" autocomplete="off"
                   id="test1" placeholder="yyyy-MM-dd"   lay-verify="required" value="${order.send_time}">
        </div>
        <%-- </div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">收货人<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="recever" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${order.recever}">
            </div>
       <%-- </div>--%>
        <label class="layui-form-label">收货地址<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="end_address" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${order.end_address}">
        </div>

    </div>
    <div class="layui-form-item" style="text-align: center;display: none" id="form-button" >
        <button class="layui-btn" lay-filter="formSave" lay-submit>保存</button>
        <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
    </div>
</form>

</div>
</body>

<script src="static/layui/layui.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script src="static/hniois/hniois.js"></script>
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {
        init();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','upload','laydate'], function() {
        var layer = layui.layer,
            laydate=layui.laydate,
            form = layui.form;

        //获取时间日历
        laydate.render({
            elem: '#test1'
        });

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "order/" + ($("#key").val()==""?"add":"update") + ".do";
            $.ajax({
                url: url,
                data: data.field,
                type: "post",
                dataType:'json',
                success: function(data){
                    if(data.state=="ok"){
                        parent.formReload();
                        parent.layer.msg(data.msg);
                        closeWin();
                    }else{
                        layer.msg(data.msg);
                    }
                }
            });
            return false;
        });

        //触发事件
        var active={
            //选择销售商
            notice:function(){
                layer.open({
                    title: "销售商列表",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "order/choose.do",
                    area: ['600px', '80%'],
                })
            },
            //选择产品批次
            choose:function(){
                layer.open({
                    title: "产品批次列表",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "order/chose.do",
                    area: ['600px', '80%'],
                })
            }
        }
        $("div .chose").on('click',function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        })
    });


    //关闭弹框
    function closeWin(){
       parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${order.code}"=="1"){
            $("#form-button").show();
        }
    }

</script>
</html>