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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>${SYSNAME}</title>
    <link rel="Bookmark" href="static/login/layui/css/favicon.ico">
    <link rel="shortcut icon" href="static/login/layui/css/favicon.ico">
    <script>
        if (window != window.top) top.location.href = self.location.href;
    </script>
    <link href="static/login/layui/css/layui.css" rel="stylesheet" />
    <link href="static/login/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="static/login/css/login.css" rel="stylesheet" />
    <link href="static/login/css/normalize.css" rel="stylesheet" />
    <link href="static/login/css/demo.css" rel="stylesheet" />
    <link href="static/login/css/component.css" rel="stylesheet" />
    <!--[if IE]>
    <script src="static/login/js/html5.js"></script>
    <![endif]-->
    <style>

        canvas {
            position: absolute;
            z-index: -1;
        }

        .kit-login-box header h1 {
            line-height: normal;
        }

        .kit-login-box header {
            height: auto;
        }

        .content {
            position: relative;
        }

        .codrops-demos {
            position: absolute;
            bottom: 0;
            left: 40%;
            z-index: 10;
        }

        .codrops-demos a {
            border: 2px solid rgba(242, 242, 242, 0.41);
            color: rgba(255, 255, 255, 0.51);
        }

        .kit-pull-right button,
        .kit-login-main .layui-form-item input {
            background-color: transparent;
            color: white;
        }

        .kit-login-main .layui-form-item input::-webkit-input-placeholder {
            color: white;
        }

        .kit-login-main .layui-form-item input:-moz-placeholder {
            color: white;
        }

        .kit-login-main .layui-form-item input::-moz-placeholder {
            color: white;
        }

        .kit-login-main .layui-form-item input:-ms-input-placeholder {
            color: white;
        }

        .kit-pull-right button:hover {
            border-color: #009688;
            color: #009688
        }

    </style>
</head>


<body class="kit-login-bg">
<div class="container demo-1">
    <div class="content">
        <div id="large-header" class="large-header">
            <canvas id="demo-canvas"></canvas>
            <div class="kit-login-box">
                <header>
                    <h1>${SYSNAME}</h1>
                </header>
                <div class="kit-login-main">
                    <form action="/login_login" class="layui-form" method="post" name="loginForm" id="loginForm">
                        <div class="layui-form-item">
                            <label class="kit-login-icon">
                                <i class="layui-icon">&#xe612;</i>
                            </label>
                            <input type="text" name="loginname" id="loginname" lay-verify="required" autocomplete="off"
                                   placeholder="这里输入用户名." class="layui-input">
                        </div>
                        <div class="layui-form-item">
                            <label class="kit-login-icon">
                                <i class="layui-icon">&#xe642;</i>
                            </label>
                            <input type="password" name="password" id="password" lay-verify="required" autocomplete="off"
                                   placeholder="这里输入密码." class="layui-input">
                        </div>

                        <div class="layui-form-item">
                            <div class="kit-pull-left kit-login-remember">
                                <%--<input type="checkbox" id="saveid" lay-skin="primary"--%>
                                <%--checked title="记住帐号" onclick="savePaw()">--%>
                            </div>
                            <div class="kit-pull-right">
                                <button class="layui-btn layui-btn-primary" lay-submit lay-filter="login">
                                    <i class="fa fa-sign-in" aria-hidden="true"></i> 登录
                                </button>
                            </div>
                            <div class="kit-clear"></div>
                        </div>
                    </form>
                </div>
                <footer>
                    <p>HNIOIS © <a href="http://www.hniois.com" style="color:white; font-size:18px;" target="_blank">www.hniois.com</a></p>
                </footer>
            </div>
        </div>
    </div>
</div>
<!-- /container -->
<script src="static/login/layui/layui.js"></script>
<script src="static/login/js/TweenLite.min.js"></script>
<script src="static/login/js/EasePack.min.js"></script>
<script src="static/login/js/rAF.js"></script>
<script src="static/login/js/demo-1.js"></script>
<script src="static/login/js/jquery-1.7.2.js"></script>
<script>
    //初始化函数 order-1
    $(document).ready(function() {

    });

    //layui模块加载 order-2
    layui.use(['layer', 'form'], function() {
        var layer = layui.layer,
            form = layui.form;

        $(window).on('load', function() {
            form.on('submit(login)', function(data) {
                $.ajax({
                    url: 'login_login',
                    data: {
                        user_id:$("#loginname").val(),
                        password:$("#password").val(),
                        tm:new Date().getTime()
                    },
                    cache: false,
                    type: "post",
                    dataType:'json',
                    success: function(data){
                        if("ok" == data.state){
                            window.location.href = "main/index";
                        }else if("error" == data.state){
                            layer.msg(data.msg);
                            $("#loginname").focus();
                        }else{
                            layer.msg("缺少参数");
                            $("#loginname").focus();
                        }
                    }
                });
                return false;
            });
        }());

    });

</script>
</body>
</html>