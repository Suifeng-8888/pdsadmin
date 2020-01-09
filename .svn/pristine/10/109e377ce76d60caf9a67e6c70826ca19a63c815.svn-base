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
    <title>产品批次信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="batch_id" id="key" value="${bat.batch_id}">
    <input type="hidden" name="record_id" id="rec_id" value="${bat.record_id}">
    <div class="layui-form-item">
        <label class="layui-form-label">生产记录号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="record_num" class="layui-input" type="text" autocomplete="off"
                 id="test"  lay-verify="required" value="${bat.record_num}">
            <span data-method="notice" id="chose"  class="layui-btn">选择产品记录</span>
        </div>

        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">产品名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="pro_name" class="layui-input" type="text" autocomplete="off"
                 id="pro_name"      lay-verify="required" value="${bat.pro_name}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">产品条码<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="pro_code" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${bat.pro_code}">
            </div>
       <%-- </div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">产品批次号<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="batch" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${bat.batch}">
            </div>
       <%-- </div>--%>

        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">加工数量<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="batch_num" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${bat.batch_num}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">加工时间<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="btime" class="layui-input" type="text" autocomplete="off"
                       id="test1" placeholder="yyyy-MM-dd"   lay-verify="required" value="${bat.btime}">
            </div>
       <%-- </div>--%>
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
            var url = "batch/" + ($("#key").val()==""?"add":"update") + ".do";
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
            //选择产品
            notice:function(){
                layer.open({
                    title: "产品列表",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "batch/choose.do",
                    area: ['600px', '80%'],
                })
            }
        }
        $("#chose").on('click',function(){
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
        if("${bat.code}"=="1"){
            $("#form-button").show();
        }
    }

</script>
</html>