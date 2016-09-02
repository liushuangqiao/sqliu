<%--
  Created by IntelliJ IDEA.
  User: shuangqiao
  Date: 2016/8/12
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!-- saved from url=(0027)http://192.168.3.211:10000/ -->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>后台管理系统</title>
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu/styles.css" type="text/css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/menu/jquery-tool.css" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/menu/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/menu/jquery.tools.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/menu/main.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ad/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ad/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/ad/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/ad/bootstrap-treeview.js"></script>

    <!--[if lt IE 9]>
    <script src="/webjars/html5shiv/3.7.2/dist/html5shiv.min.js"></script>
    <script src="/webjars/respond/1.4.2/dest/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        .control-group {
            margin-left: 10px;
        }
    </style>
    <style type="text/css" id="menuDiv-style">
        .treeview .list-group-item {
            cursor: pointer
        }
        .treeview span.indent {
            margin-left: 10px;
            margin-right: 10px
        }
        .treeview span.icon {
            width: 12px;
            margin-right: 5px
        }
        .treeview .node-disabled {
            color: silver;
            cursor: not-allowed
        }
        .node-menuDiv {
            color: #428bca;
            background-color: #F1F1F1;
            border: none;
        }
        .node-menuDiv:not(.node-disabled):hover {
            background-color: #F5F5F5;
        }
    </style>
</head>

<body>
<link href="${pageContext.request.contextPath}/css/ad/main_css.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ad/commonAll.js"></script>
<script type="text/javascript">
    /**退出系统**/
    function logout() {
        if (confirm("您确定要退出本系统吗？")) {
            window.location.href = "/logout";
        }
    }

    /**获得当前日期**/
    function getDate01() {
        var time = new Date();
        var myYear = time.getFullYear();
        var myMonth = time.getMonth() + 1;
        var myDay = time.getDate();
        if (myMonth < 10) {
            myMonth = "0" + myMonth;
        }
        document.getElementById("day_day").innerHTML = myYear + "." + myMonth
                + "." + myDay;
    }

</script>
<script type="text/javascript">

    var menuData = [
        {
            text: '写文章',
            href: '${pageContext.request.contextPath}/manage/write'
        },
        {
            text: '文章管理列表',
            href: '${pageContext.request.contextPath}/manage/articleList'
        },
    ];


    $(function () {
        $('#menuDiv').treeview({
            color: "#428bca",
            showBorder: false,
            data: menuData,
            backColor: '#F1F1F1',
            onNodeSelected: function (event, node) {
                $('#nav_current').text(node.text);
                $('#rightMain').attr("src", node.href);
            }
        });

        getDate01();
    });


</script>
<div id="top">
    <div id="top_logo"> <img alt="logo" src="${pageContext.request.contextPath}/images/ad/logo.png" width="240" height="35" style="vertical-align: middle;"> </div>
    <div id="top_links">
        <div id="top_op">
            <ul>
                <li><img alt="当前用户" src="${pageContext.request.contextPath}/images/common/user.jpg">： <span>admin</span></li>
                <li><img alt="今天是" src="${pageContext.request.contextPath}/images/common/date.jpg">： <span id="day_day">2016.08.8</span></li>
            </ul>
        </div>
        <div id="top_close"> <a href="javascript:void(0);" onclick="logout();" target="_parent"> <img alt="退出系统" title="退出系统" src="${pageContext.request.contextPath}/images/common/close.jpg" style="position: relative; left: 25px;"> </a> </div>
    </div>
</div>
<!-- side menu start -->
<div id="side">
    <div id="left_menu">
        <ul id="TabPage2" style="height: 200px; margin-top: 50px;">
            <li id="left_tab1" class="selected" title="权限管理" ><img alt="权限管理" title="权限管理" src="${pageContext.request.contextPath}/images/common/1_hover.jpg" width="30" height="30"></li>
        </ul>
        <div id="nav_show" style="position: absolute; bottom: 0px; padding: 15px;"><a href="javascript:;" id="show_hide_btn"> <img alt="显示/隐藏" title="显示/隐藏" src="${pageContext.request.contextPath}/images/ad/nav_hide.png" width="30" height="30"> </a> </div>
    </div>
    <div id="left_menu_cnt">
        <div id="nav_module"> <img src="" width="210" height="58"> </div>
        <div id="nav_resource">
            <div id="menuDiv" style="display: block;" class="treeview">
                <%--<ul class="list-group">
                    <li class="list-group-item node-menuDiv" data-nodeid="6" ><span class="icon glyphicon"></span><span class="icon node-icon"></span>首页</li>
                    <li class="list-group-item node-menuDiv" data-nodeid="6" ><span class="icon glyphicon"></span><span class="icon node-icon"></span>广告投放管理</li>
                    <li class="list-group-item node-menuDiv" data-nodeid="6" ><span class="icon glyphicon"></span><span class="icon node-icon"></span>物料管理</li>
                   &lt;%&ndash; <li class="list-group-item node-menuDiv" data-nodeid="6" ><span class="icon glyphicon"></span><span class="icon node-icon"></span>供应商管理</li>&ndash;%&gt;
                    <li class="list-group-item node-menuDiv" data-nodeid="6" ><span class="icon glyphicon"></span><span class="icon node-icon"></span>代码管理</li>
                    <li class="list-group-item node-menuDiv" data-nodeid="6" ><span class="icon glyphicon"></span><span class="icon node-icon"></span>代码分组管理</li>
                    <li class="list-group-item node-menuDiv" data-nodeid="6" ><span class="icon glyphicon"></span><span class="icon node-icon"></span>修改代码位分组</li>
                    <li class="list-group-item node-menuDiv" data-nodeid="6" ><span class="icon glyphicon"></span><span class="icon node-icon"></span>代码管理-获取代码</li>
                </ul>--%>
            </div>
            <div id="orderDiv" style="display: none;" class="treeview">
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $('#TabPage2 li').click(
                function () {
                    var index = $(this).index();
                    $(this).find('img').attr(
                            'src',
                            '/css/images/common/'
                            + (index + 1) + '_hover.jpg');
                    $(this).css({
                        background: '#fff'
                    });
                    $('#nav_module').find('img').attr(
                            'src',
                            '/images/ad/module_'
                            + (index + 1) + '.png');
                    $('#TabPage2 li').each(
                            function (i, ele) {
                                if (i != index) {
                                    $(ele).find('img').attr(
                                            'src',
                                            '/css/images/common/'
                                            + (i + 1) + '.jpg');
                                    $(ele).css({
                                        background: '#E6E6E6'
                                    });
                                }
                            });
                    // 显示侧边栏
                    switchSysBar(true);
                });

        // 显示隐藏侧边栏
        $("#show_hide_btn").click(function () {
            switchSysBar();
        });
    });

    /**隐藏或者显示侧边栏**/
    function switchSysBar(flag) {
        var side = $('#side');
        var left_menu_cnt = $('#left_menu_cnt');
        if (flag == true) { // flag==true
            left_menu_cnt.show(500, 'linear');
            side.css({
                width: '280px'
            });
            $('#top_nav').css({
                width: '77%',
                left: '280px'
            });
            $('#main').css({
                left: '280px'
            });
        } else {
            if (left_menu_cnt.is(":visible")) {
                left_menu_cnt.hide(10, 'linear');
                side.css({
                    width: '60px'
                });
                $('#top_nav').css({
                    width: '100%',
                    left: '60px',
                    'padding-left': '28px'
                });
                $('#main').css({
                    left: '60px'
                });
                $("#show_hide_btn")
                        .find('img')
                        .attr('src',
                                '/css/images/common/nav_show.png');
            } else {
                left_menu_cnt.show(500, 'linear');
                side.css({
                    width: '280px'
                });
                $('#top_nav').css({
                    width: '77%',
                    left: '304px',
                    'padding-left': '0px'
                });
                $('#main').css({
                    left: '280px'
                });
                $("#show_hide_btn")
                        .find('img')
                        .attr('src',
                                '/css/images/common/nav_hide.png');
            }
        }
    }

    $("#left_tab1").click(function(){
        var ad = $('#menuDiv').attr('style');
        if(ad == "display: none;"){
            $('#menuDiv').css("display","block");
        }
        var order = $('#orderDiv').attr('style');
        if(order == "display: block;"){
            $('#orderDiv').css("display","none");
        }
    })

    $("#left_tab2").click(function(){
        var ad = $('#menuDiv').attr('style');
        if(ad == "display: block;"){
            $('#menuDiv').css("display","none");
        }
        var order = $('#orderDiv').attr('style');
        if(order == "display: none;"){
            $('#orderDiv').css("display","block");
        }
    })
</script>
<!-- side menu start -->
<div id="top_nav"> <span id="here_area">当前位置：系统&nbsp;&gt;&nbsp;</span><span id="nav_current">系统介绍</span> </div>
<div id="main">
    <iframe name="right" id="rightMain" src="${pageContext.request.contextPath}/manage/list" frameborder="no" scrolling="auto" width="100%" height="100%" allowtransparency="true"> &lt;/div&gt;

        &lt;/body&gt;
        &lt;/html&gt; </iframe>
</div>
</body>
</html>
