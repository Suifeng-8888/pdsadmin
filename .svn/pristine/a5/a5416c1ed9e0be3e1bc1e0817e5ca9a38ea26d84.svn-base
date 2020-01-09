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
    <title>生产记录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="ctr_id" id="key" value="${keyContrl.ctr_id}">
    <input type="hidden" name="im_id" id="im_id" value="${keyContrl.im_id}">
    <div class="layui-form-item">

        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label" >产品名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block" >
                <input name="pro_name" class="layui-input" style="height:36px;width:400px" type="text" autocomplete="off"
                     id="test"  lay-verify="required" value="${keyContrl.pro_name}">
                <span data-method="notice" id="chose"  class="layui-btn">请选择产品</span>
            </div>
       <%-- </div>--%>
            <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">产品批次号<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="im_patch" class="layui-input" type="text" autocomplete="off"
                    id="patch"   value="${keyContrl.im_patch}">
            </div>
            <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">关键控制名</label>
            <div class="layui-input-block">
                <input name="ctr_name" class="layui-input" type="text" autocomplete="off"
                    id="code"   lay-verify="required" value="${keyContrl.ctr_name}">
            </div>
       <%-- </div>--%>
        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">控制点数</label>
        <div class="layui-input-block">
            <input name="ctr_point" class="layui-input" type="text" autocomplete="off"
                    value="${keyContrl.ctr_point}">
        </div>
        <%--</div>--%>
        <%-- <div class="layui-form-item">--%>
        <label class="layui-form-label">控制次数<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="ctr_num" class="layui-input" type="text" autocomplete="off"
                    value="${keyContrl.ctr_num}">
        </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">责任人<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="person" class="layui-input" type="text" autocomplete="off"
                    value="${keyContrl.person}">
        </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">开始时间<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="ctr_start" class="layui-input" type="text" autocomplete="off"
                   id="test2"  placeholder="yyyy-MM-dd"  value="${keyContrl.ctr_start}">
        </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">结束时间<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="ctr_end" class="layui-input" type="text" autocomplete="off"
                   id="test1" placeholder="yyyy-MM-dd"    value="${keyContrl.ctr_end}">
        </div>
        <%-- </div>--%>
            <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">监控结论</label>
            <div class="layui-input-block">
                <select name="result" id="mach_sta" lay-verify="required" lay-search="">
                    <option value="">请选择</option>
                    <option value="0">合格</option>
                    <option value="1">不合格</option>
                </select>
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
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            laydate=layui.laydate,
            form = layui.form;

        //获取时间日历
        laydate.render({
            elem: '#test1'
        });
        //获取时间日历
        laydate.render({
            elem: '#test2'
        });
        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "keypoint/" + ($("#key").val()==""?"add":"update") + ".do";
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
                   title: "进货列表",
                   type: 2,
                   offset: 't',
                   maxmin: true,
                   skin: 'layui-layer-rim', //加边框
                   moveType: 1,
                   content: "keypoint/choose.do",
                   area: ['500px', '80%'],
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
        if("${keyContrl.code}"=="1"){
            $("#form-button").show();
        }
    }
</script>
</html>