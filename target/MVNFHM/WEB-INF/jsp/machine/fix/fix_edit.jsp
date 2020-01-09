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
    <title>维修or检测表管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, fix-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="id" id="key" value="${fix.id}">
    <div class="layui-form-item">
        <label class="layui-form-label">仪器名称<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <select name="mach_id" id="mach" lay-search="" class="hniois-search-data">
                <option value="">请选择</option>
                <c:forEach items="${mlist}" var="mach">
                    <option value="${mach.mach_id}">${mach.mach_name}</option>
                </c:forEach>
            </select>
        </div>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">精确度<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block" id="check">
            <input name="fate" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required"  value="${fix.fate}">
        </div>
   <%-- </div>--%>

    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">故障分析</label>
        <div class="layui-input-block">
            <input type="text" name="analysis" autocomplete="off"
                   class="layui-input" value="${fix.analysis}"
            >
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">申请人<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="applyer" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${fix.applyer}"
            >
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">申请方式<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="method" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${fix.method}"
            >
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item" >--%>
        <label class="layui-form-label">申请类型</label>
        <div class="layui-input-block">
            <select name="type"  id="app_type" lay-search="" class="hniois-search-data">
                <option value="">请选择</option>
                <option value="0">维修</option>
                <option value="1">检测</option>
            </select>
        </div>
    <%--</div>--%>
    <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">申请费用<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="cost" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${fix.cost}"
            >
        </div>
    <%--</div>--%>

        <%--<div class="layui-form-item">--%>
        <div  id="app_time">
            <label class="layui-form-label">申请时间</label>
            <div class="layui-input-block">
                <input name="app_time" class="layui-input" type="text" id="test3" placeholder="yyyy-MM-dd"
                       autocomplete="off"  value="${fix.app_time}"
                >
            </div>
        </div>
        <%--<div class="layui-form-item">--%>
        <div id="status">
            <label class="layui-form-label">审批状态</label>
            <div class="layui-input-block">
                <select name="status" id="sta"  lay-search="" class="hniois-search-data">
                        <option value="">请选择</option>
                        <option value="0">审批通过</option>
                        <option value="1">审批驳回</option>
                        <option value="2">待审批</option>
                </select>
            </div>
        </div>

        <%--<div class="layui-form-item">--%>
        <div  id="appver">
            <label class="layui-form-label">审批人</label>
            <div class="layui-input-block">
                <input name="appver" class="layui-input" type="text" autocomplete="off"
                       value="${fix.appver}"
                >
            </div>
        </div>
        <%--<div class="layui-form-item">--%>
        <div  id="approve_time">
            <label class="layui-form-label">审批时间</label>
            <div class="layui-input-block">
                <input name="approve_time" class="layui-input" type="text" id="test1" placeholder="yyyy-MM-dd"
                       autocomplete="off"   value="${fix.approve_time}">
            </div>
        </div>
        <%--<div class="layui-form-item">--%>
        <%--<div id="fix_time">
            <label class="layui-form-label">完成时间</label>
            <div class="layui-input-block">
                <input name="check_fix_time" class="layui-input" type="text" id="test2" placeholder="yyyy-MM-dd"
                       value="${fix.check_fix_time}"
                >
            </div>
        </div>--%>
        <%--<div class="layui-form-item">--%>
        <%--<div  id="fix_state">
            <label class="layui-form-label">最终结果</label>
            <div class="layui-input-block">
                <select name="fix_state" id="state"  lay-search="" class="hniois-search-data">
                    <option value="">请选择</option>
                    <option value="0">已检测</option>
                    <option value="1">未检测</option>
                    <option value="2">已维修</option>
                    <option value="3">未维修</option>
                </select>
            </div>
        </div>--%>
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
<script>
    //获取窗口索引
    var index = parent.layer.getFrameIndex(window.name);
    //初始化函数 order-1
    $(document).ready(function() {
        init();
        initSta();
        initMachName();
        initType();
        initFix();
    });

    //加载树形下拉菜单
    layui.config({
        base: '/static/layui/add/' //扩展根目录
    }).extend({ //设定模块别名
        treeselect: 'layui-tree' //扩展插件
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','laydate'], function() {
        var layer = layui.layer,
            form = layui.form,
            laydate=layui.laydate;

        //获取时间日历
        laydate.render({
            elem: '#test1'
        });
        //获取时间日历
        laydate.render({
            elem: '#test2'
        });
        //获取时间日历
        laydate.render({
            elem: '#test3'
        });

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "fix/" + ($("#key").val()==""?"add":"update") + ".do";
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

    });

    function closeWin(){
       parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${fix.code}"=="1"){//新增或编辑
            $("#form-button").show();

            $("#appver").hide();//审批人隐去
            $("#approve_time").hide();
        }
        if("${fix.id}"==null||"${fix.id}"==""){
            //说明是新增状态
            $("#fix_time").hide();
            $("#fix_state").hide();
            $("#status").hide();//新增时审批状态隐去
        }
        if("${fix.id}"!=null){
            $("select[name=status]").attr("disabled",true);
        }
    }

    //初始化仪器名下拉框
    function initMachName(){
                $("#mach").val("${fix.mach_id}");
    }
    function initSta(){
        $("#sta").val(${fix.status});
    }
    function initType(){
        $("#app_type").val(${fix.type});
    }
    function initFix(){
        $("#state").val(${fix.fix_state});
    }
</script>
</html>