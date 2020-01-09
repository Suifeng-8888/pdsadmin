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
    <title>进货管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1,minimum-scale=1, user-scalable=no">
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />

</head>
<body>
<div >
<form class="layui-form layui-form-pane" action="" >
    <input type="hidden" name="im_id" id="key" value="${import_pro.im_id}">
    <input type="hidden" name="sup_id" id="sup" value="${import_pro.sup_id}">
    <div class="layui-form-item">
       <%-- <label class="layui-form-label">进货编号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="im_id" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${import_pro.im_id}">
        </div>
--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">货物名称<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="pro_name" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${import_pro.pro_name}">
            </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">商品条码<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="bar_code" class="layui-input" type="text" autocomplete="off"
                       lay-verify="required" value="${import_pro.bar_code}">
            </div>
       <%-- </div>--%>
        <%--<div class="layui-form-item">--%>
            <label class="layui-form-label">供应商名字<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block">
                <input name="sup_name" class="layui-input" style="height:36px;width:400px" type="text" autocomplete="off"
                    id="test"   lay-verify="required" value="${import_pro.sup_name}">
                <span data-method="notice"  class="layui-btn down">选择供应商</span>
            </div>

       <%-- </div>--%>
        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">进货批次号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="im_patch" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${import_pro.im_patch}">
        </div>
        <%--</div>--%>
        <%-- <div class="layui-form-item">--%>
        <label class="layui-form-label">供应商出货批次号<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="sup_patch" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${import_pro.sup_patch}">
        </div>
        <%--</div>--%>
        <%-- <div class="layui-form-item">--%>
        <label class="layui-form-label">验收责任人<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="recipient" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${import_pro.recipient}">
        </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">进货日期<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="im_time" class="layui-input" type="text" autocomplete="off"
                   id="test1"  placeholder="yyyy-MM-dd" lay-verify="required" value="${import_pro.im_time}">
        </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">进货数量<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="im_num" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${import_pro.im_num}">
        </div>
        <%--</div>--%>
        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">验收结果</label>
        <div class="layui-input-block">
            <select name="result" id="mach_sta" lay-verify="required" lay-search="">
                <option value="">请选择</option>
                <option value="0">合格</option>
                <option value="1">不合格</option>
            </select>
        </div>
        <%-- </div>--%>
        <div id="rest1">
        <label class="layui-form-label">是否用完</label>
        <div class="layui-input-block">
            <select name="rest" id="ret" lay-search="">
                <option value="">请选择</option>
                <option value="0">已用完</option>
                <option value="1">未用完</option>
            </select>
        </div>
        </div>
        <%--<div class="layui-form-item">--%>
        <label class="layui-form-label">进货报告<span style="color: #FF5722">*</span></label>
        <div class="layui-input-block">
            <input name="report" class="layui-input" type="text" autocomplete="off"
                   lay-verify="required" value="${import_pro.report}">
        </div>
        <%--</div>--%>
       <%-- <div class="layui-form-item">--%>
            <label class="layui-form-label">进货附件<span style="color: #FF5722">*</span></label>
            <div class="layui-input-block" >
                <input name="attach_file" class="layui-input" type="hidden" autocomplete="off"
                    id="att"   value="${import_pro.attach_file}">
                <button type="button" class="layui-btn" id="test3">上传</button>
                <button type="button" class="layui-btn" id="test5" url="${import_pro.attach_file}" onclick="fileDownload(this)" >下载</button>
                <span class="layui-btn layui-btn-danger down " id="test4"  data-method="clear">删除</span>
                <span id="show"></span>
            </div>
        <%--</div>--%>

    </div>
    <div class="layui-form-item" style="text-align: center;display: none" id="form-button" >
        <button class="layui-btn" lay-filter="formSave" lay-submit>保存</button>
        <button class="layui-btn layui-btn-warm" onclick="closeWin()">关闭</button>
    </div>
</form>

    <%--文件下载--%>
    <form id="file-form" action="file/download.do" method="post">
        <input name="path" type="hidden">
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
        initMach();
        initMach2();
        showFile();
    });

    //layui模块加载 order-2
    layui.use(['layer', 'form','upload','laydate'], function() {
        var layer = layui.layer,
            upload=layui.upload,
            laydate=layui.laydate,
            form = layui.form;

        //获取时间日历
        laydate.render({
            elem: '#test1'
        });

        //监听提交
        form.on('submit(formSave)', function(data){
            var url = "zsImport/" + ($("#key").val()==""?"add":"update") + ".do";
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

        //上传附件
        var str="";
        var filename="";
        upload.render({
            elem: '#test3'
            ,url: 'file/upload'
            ,accept: 'file' //普通文件
            //,multiple:true
            ,done: function(res){
                var url=res.url;
                var filename=res.fileName;
                // attached/file/20180503173641/2.docx
                $("#att").val(url);
               $("#show").html(filename.toString());
                $("#test5").attr("url",url);
            }
        });

        //触发事件
        var active={
            //清除附件
          clear:function(){
              $("#att").val("");
              $("#show").html("");
          },
            //下载附件
            down:function () {
                var path=$("#att").val();
                if(path==""){
                    layui.layer.msg("文件不存在");
                    return ;
                }

            },
            //选择供应商
            notice:function(){
                layer.open({
                    title: "供应商列表",
                    type: 2,
                    offset: 't',
                    maxmin: true,
                    skin: 'layui-layer-rim', //加边框
                    moveType: 1,
                    content: "zsImport/choose.do",
                    area: ['500px', '80%'],
                })
            }
        }
        $(".down").on('click',function(){
            var othis = $(this), method = othis.data('method');
            active[method] ? active[method].call(this, othis) : '';
        })
    });


    //显示附件名
    function showFile(){
        var filename="";
        var  arr = $("#att").val();
        filename=arr.substring(arr.lastIndexOf("/")+1);
        $("#show").html(filename);
    }

    //关闭弹框
    function closeWin(){
       parent.layer.close(index);
    }

    function init(){
        //初始化按钮操作
        if("${import_pro.code}"=="1"){
            $("#form-button").show();
        }
        if("${import_pro.im_id}"==""||"${fix.id}"==null){
            //说明是新增
            $("#rest1").hide();
        }
    }

    //初始化验收结果
    function initMach(){
        $("#mach_sta").val("${import_pro.result}");
    }
    //初始化使用情况
    function initMach2(){
        $("#ret").val("${import_pro.rest}");
    }
</script>
</html>