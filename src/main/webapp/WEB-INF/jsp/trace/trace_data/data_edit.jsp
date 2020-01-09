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
    <title>批次用料信息</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="batch_id"  value="${tData.batch_id}">
    <input type="hidden" name="dat_id" id="key" value="${tData.dat_id}">
    <input type="hidden" name="attach_id" id="att_id" value="${tData.attach_id}">
    <div class="layui-form-item">
        <label class="layui-form-label">记录时间<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="fill_time" class="layui-input" type="text" autocomplete="off"
                   id="test1" placeholder="yyyy-MM-dd"   lay-verify="required" value="${tData.fill_time}">
        </div>
        <label class="layui-form-label">所用材料<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="bz" class="layui-input" type="text" autocomplete="off"
                 id="test"  lay-verify="required" value="${tData.bz}">
            <span data-method="notice" id="chose"  class="layui-btn">请选择材料</span>
        </div>

        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">供应商<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="mat_sup" class="layui-input" type="text" autocomplete="off"
                   id="supply"   lay-verify="required" value="${tData.mat_sup}">
        </div>
        <%-- </div>--%>

        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">用料批次号<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="mat_batch" class="layui-input" type="text" autocomplete="off"
                  id="batch"   lay-verify="required" value="${tData.mat_batch}">
            </div>
       <%-- </div>--%>
        <label class="layui-form-label">用料类型<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="mat_type" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${tData.mat_type}">
        </div>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">用料数量<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="use_num" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${tData.use_num}">
            </div>
        <%--</div>--%>
        <label class="layui-form-label">包装材料<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
                <select name="page_id"  id="status" lay-search="" lay-verify="required" class="hniois-search-data">
                    <option value="">请选择</option>
                    <option value="15">主要材料</option>
                    <option value="16">辅料</option>
                    <option value="17">添加剂</option>
                    <option value="18">其他</option>
                    <option value="14">包装材料</option>
                </select>
        </div>
    </div>
    <div class="layui-form-item" style="text-align: center;" id="form-button" >
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

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "tdata/" + ($("#key").val()==""?"add":"update") + ".do";
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
                    content: "tdata/choose.do",
                    area: ['600px', '80%'],
                })
            }
        }
        $("#chose").on('click',function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        })
    });


    function init(){
        $("#status").val("${tData.page_id}")
    }
    //关闭弹框
    function closeWin(){
       parent.layer.close(index);
    }


</script>
</html>