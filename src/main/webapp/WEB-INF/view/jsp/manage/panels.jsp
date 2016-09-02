<%--
  Created by IntelliJ IDEA.
  User: shuangqiao
  Date: 2016/7/3
  Time: 14:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>sqliu后台管理</title>
    <link href="${pageContext.request.contextPath}/css/manage/main_css.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/css/manage/zTreeStyle.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.ztree.core-3.2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonAll.js"></script>
    <script type="text/javascript">
        /**退出系统**/
        function logout() {
            if (confirm("您确定要退出本系统吗？")) {
                window.location.href = "login.html";
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

        /**加入收藏夹**/
        function addfavorite() {
            var ua = navigator.userAgent.toLowerCase();
            if (ua.indexOf("360se") > -1) {
                art.dialog({
                    icon : 'error',
                    title : '友情提示',
                    drag : false,
                    resize : false,
                    content : '由于360浏览器功能限制，加入收藏夹功能失效',
                    ok : true,
                });
            } else if (ua.indexOf("msie 8") > -1) {
                window.external
                        .AddToFavoritesBar('${dynamicURL}/authority/loginInit.action');//IE8
            } else if (document.all) {
                window.external
                        .addFavorite('${dynamicURL}/authority/loginInit.action');
            } else {
                art.dialog({
                    icon : 'error',
                    title : '友情提示',
                    drag : false,
                    resize : false,
                    content : '添加失败，请用ctrl+D进行添加',
                    ok : true,
                });
            }
        }
    </script>
    <script type="text/javascript">
        /* zTree插件加载目录的处理  */
        var zTree;

        var setting = {
            view : {
                dblClickExpand : false,
                showLine : false,
                expandSpeed : ($.browser.msie && parseInt($.browser.version) <= 6) ? ""
                        : "fast"
            },
            data : {
                key : {
                    name : "resourceName"
                },
                simpleData : {
                    enable : true,
                    idKey : "resourceID",
                    pIdKey : "parentID",
                    rootPId : ""
                }
            },
            callback : {
                // 				beforeExpand: beforeExpand,
                // 				onExpand: onExpand,
                onClick : zTreeOnClick
            }
        };

        var curExpandNode = null;
        function beforeExpand(treeId, treeNode) {
            var pNode = curExpandNode ? curExpandNode.getParentNode() : null;
            var treeNodeP = treeNode.parentTId ? treeNode.getParentNode() : null;
            for (var i = 0, l = !treeNodeP ? 0 : treeNodeP.children.length; i < l; i++) {
                if (treeNode !== treeNodeP.children[i]) {
                    zTree.expandNode(treeNodeP.children[i], false);
                }
            }
            while (pNode) {
                if (pNode === treeNode) {
                    break;
                }
                pNode = pNode.getParentNode();
            }
            if (!pNode) {
                singlePath(treeNode);
            }

        }
        function singlePath(newNode) {
            if (newNode === curExpandNode)
                return;
            if (curExpandNode && curExpandNode.open == true) {
                if (newNode.parentTId === curExpandNode.parentTId) {
                    zTree.expandNode(curExpandNode, false);
                } else {
                    var newParents = [];
                    while (newNode) {
                        newNode = newNode.getParentNode();
                        if (newNode === curExpandNode) {
                            newParents = null;
                            break;
                        } else if (newNode) {
                            newParents.push(newNode);
                        }
                    }
                    if (newParents != null) {
                        var oldNode = curExpandNode;
                        var oldParents = [];
                        while (oldNode) {
                            oldNode = oldNode.getParentNode();
                            if (oldNode) {
                                oldParents.push(oldNode);
                            }
                        }
                        if (newParents.length > 0) {
                            for (var i = Math.min(newParents.length,
                                            oldParents.length) - 1; i >= 0; i--) {
                                if (newParents[i] !== oldParents[i]) {
                                    zTree.expandNode(oldParents[i], false);
                                    break;
                                }
                            }
                        } else {
                            zTree.expandNode(oldParents[oldParents.length - 1],
                                    false);
                        }
                    }
                }
            }
            curExpandNode = newNode;
        }

        function onExpand(event, treeId, treeNode) {
            curExpandNode = treeNode;
        }

        /** 用于捕获节点被点击的事件回调函数  **/
        function zTreeOnClick(event, treeId, treeNode) {
            var zTree = $.fn.zTree.getZTreeObj("dleft_tab1");
            zTree.expandNode(treeNode, null, null, null, true);
            // 		zTree.expandNode(treeNode);
            // 规定：如果是父类节点，不允许单击操作
            if (treeNode.isParent) {
                // 			alert("父类节点无法点击哦...");
                return false;
            }
            // 如果节点路径为空或者为"#"，不允许单击操作
            if (treeNode.accessPath == "" || treeNode.accessPath == "#") {
                //alert("节点路径为空或者为'#'哦...");
                return false;
            }
            // 跳到该节点下对应的路径, 把当前资源ID(resourceID)传到后台，写进Session
            rightMain(treeNode.accessPath);

            if (treeNode.isParent) {
                $('#here_area').html(
                        '当前位置：' + treeNode.getParentNode().resourceName
                        + '&nbsp;>&nbsp;<span style="color:#1A5CC6">'
                        + treeNode.resourceName + '</span>');
            } else {
                $('#here_area').html(
                        '当前位置：系统&nbsp;>&nbsp;<span style="color:#1A5CC6">'
                        + treeNode.resourceName + '</span>');
            }
        };

        /* 上方菜单 */
        function switchTab(tabpage, tabid) {
            /* var oItem = document.getElementById(tabpage).getElementsByTagName("li");
             for (var i = 0; i < oItem.length; i++) {
             var x = oItem[i];
             x.className = "";
             } */
            if ('left_tab' == tabid) {
                /* $(document).ajaxStart(onStart).ajaxSuccess(onStop); */
                // 异步加载"信息中心"下的菜单
                loadMenu('1', 'dleft_tab1');
            } else if ('left_tab2' == tabid) {
                /* $(document).ajaxStart(onStart).ajaxSuccess(onStop); */
                // 异步加载"数据中心"下的菜单
                loadMenu('2', 'dleft_tab2');
            } else if ('left_tab3' == tabid) {
                $(document).ajaxStart(onStart).ajaxSuccess(onStop);
                // 异步加载邀请服务"下的菜单
                loadMenu('2', 'dleft_tab3');
            } else if ('left_tab4' == tabid) {
                $(document).ajaxStart(onStart).ajaxSuccess(onStop);
                // 异步加载邀请服务"下的菜单
                loadMenu('4', 'dleft_tab4');
            } else if ('left_tab5' == tabid) {
                $(document).ajaxStart(onStart).ajaxSuccess(onStop);
                // 异步加载邀请服务"下的菜单
                loadMenu('5', 'dleft_tab5');
            }
        }

        $(document).ready(function() {
            $(document).ajaxStart(onStart).ajaxSuccess(onStop);
            /** 默认异步加载"信息中心"目录  **/
            loadMenu('1', "dleft_tab1");
            // 默认展开所有节点
            if (zTree) {
                // 默认展开所有节点
                zTree.expandAll(true);
            }
        });

        function loadMenu(resourceType, treeObj) {
            data = [
                {
                    "accessPath" :  "welcome.html",
                    "checked" : false,
                    "delFlag" : 0,
                    "parentID" : 1,
                    "resourceCode" : "",
                    "resourceDesc" : "",
                    "resourceGrade" : 2,
                    "resourceID" : 3,
                    "resourceName" : "后台管理",
                    "resourceOrder" : 0,
                    "resourceType" : "1"
                },
                {
                    "accessPath" : "${pageContext.request.contextPath}/manage/write",
                    "checked" : false,
                    "delFlag" : 0,
                    "parentID" : 3,
                    "resourceCode" : "",
                    "resourceDesc" : "",
                    "resourceGrade" : 3,
                    "resourceID" : 7,
                    "resourceName" : "写文章",
                    "resourceOrder" : 0,
                    "resourceType" : "1"
                },
                {
                    "accessPath" : "${pageContext.request.contextPath}/manage/articleList",
                    "checked" : false,
                    "delFlag" : 0,
                    "parentID" : 3,
                    "resourceCode" : "",
                    "resourceDesc" : "",
                    "resourceGrade" : 3,
                    "resourceID" : 7,
                    "resourceName" : "文章列表",
                    "resourceOrder" : 0,
                    "resourceType" : "1"
                },



            ];
            // 如果返回数据不为空，加载"信息中心"目录
            if (data != null) {
                // 将返回的数据赋给zTree
                $.fn.zTree.init($("#" + treeObj), setting, data);
                //              alert(treeObj);
                zTree = $.fn.zTree.getZTreeObj(treeObj);
                if (zTree) {
                    // 默认展开所有节点
                    zTree.expandAll(true);
                }
            }
        }

        //ajax start function
        function onStart() {
            $("#ajaxDialog").show();
        }

        //ajax stop function
        function onStop() {
            // 		$("#ajaxDialog").dialog("close");
            $("#ajaxDialog").hide();
        }
    </script>
</head>
<body onload="getDate01()">
<div id="top">
    <div id="top_logo">
        <img alt="logo"
             src="${pageContext.request.contextPath}/images/common/manage_head.png"
             width="240" height="35" style="vertical-align: middle;">
    </div>
    <div id="top_links">
        <div id="top_op">
            <ul>
                <li><img alt="管理员"
                         src="${pageContext.request.contextPath}/images/common/user.jpg">：
                    <span>超级管理员</span></li>
                <li><img alt="今天是"
                         src="${pageContext.request.contextPath}/images/common/date.jpg">：
                    <span id="day_day"></span></li>
            </ul>
        </div>
        <div id="top_close">
            <a href="javascript:void(0);" onclick="logout();" target="_parent">
                <img alt="退出系统" title="退出系统" src="images/common/close.jpg"
                     style="position: relative; top: 4px; left: 25px;">
            </a>
        </div>
    </div>
</div>
<!-- side menu start -->
<div id="side">
    <div id="left_menu">
        <ul id="TabPage2" style="height: 200px; margin-top: 50px;">
            <li id="left_tab1" class="selected"
                onClick="javascript:switchTab('TabPage2','left_tab1');"
                title="操作管理"><img alt="操作管理" title="操作管理"
                                  src="${pageContext.request.contextPath}/images/common/1_hover.jpg"
                                  width="30" height="30"></li>
        </ul>
        <div id="nav_show"
             style="position: absolute; bottom: 0px; padding: 15px;">
            <a href="javascript:;" id="show_hide_btn"> <img alt="显示/隐藏"
                                                            title="显示/隐藏"
                                                            src="${pageContext.request.contextPath}/images/common/nav_hide.png"
                                                            width="30" height="30">
            </a>
        </div>
    </div>
    <div id="left_menu_cnt">
        <div id="nav_module">
            <img
                    src="${pageContext.request.contextPath}/images/common/module_1.png"
                    width="210" height="58" />
        </div>
        <div id="nav_resource">
            <ul id="dleft_tab1" class="ztree">
                <ul id="dleft_tab2" class="ztree">
                    <ul id="dleft_tab3" class="ztree">
                        <ul id="dleft_tab4" class="ztree">
                            <ul id="dleft_tab5" class="ztree">
                            </ul>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function() {
        $('#TabPage2 li').click(
                function() {
                    var index = $(this).index();
                    $(this).find('img').attr(
                            'src',
                            '${pageContext.request.contextPath}/images/common/'
                            + (index + 1) + '_hover.jpg');
                    $(this).css({
                        background : '#fff'
                    });
                    $('#nav_module').find('img').attr(
                            'src',
                            '${pageContext.request.contextPath}/images/common/module_'
                            + (index + 1) + '.png');
                    $('#TabPage2 li').each(
                            function(i, ele) {
                                if (i != index) {
                                    $(ele).find('img').attr(
                                            'src',
                                            '${pageContext.request.contextPath}/images/common/'
                                            + (i + 1) + '.jpg');
                                    $(ele).css({
                                        background : '#E6E6E6'
                                    });
                                }
                            });
                    // 显示侧边栏
                    switchSysBar(true);
                });

        // 显示隐藏侧边栏
        $("#show_hide_btn").click(function() {
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
                width : '280px'
            });
            $('#top_nav').css({
                width : '77%',
                left : '280px'
            });
            $('#main').css({
                left : '280px'
            });
        } else {
            if (left_menu_cnt.is(":visible")) {
                left_menu_cnt.hide(10, 'linear');
                side.css({
                    width : '60px'
                });
                $('#top_nav').css({
                    width : '100%',
                    left : '60px',
                    'padding-left' : '28px'
                });
                $('#main').css({
                    left : '60px'
                });
                $("#show_hide_btn")
                        .find('img')
                        .attr('src',
                                '${pageContext.request.contextPath}/images/common/nav_show.png');
            } else {
                left_menu_cnt.show(500, 'linear');
                side.css({
                    width : '280px'
                });
                $('#top_nav').css({
                    width : '77%',
                    left : '304px',
                    'padding-left' : '0px'
                });
                $('#main').css({
                    left : '280px'
                });
                $("#show_hide_btn")
                        .find('img')
                        .attr('src',
                                '${pageContext.request.contextPath}/images/common/nav_hide.png');
            }
        }
    }
</script>
<!-- side menu start -->
<div id="top_nav">
    <span id="here_area">当前位置：系统&nbsp;>&nbsp;系统介绍</span>
    <!--<div id="here_heading">个人信息</div>-->
</div>
<div id="main">
    <iframe name="right" id="rightMain"
            src="<c:url value="${pageContext.request.contextPath}/manage/writeAdd" />" frameborder="no"
            scrolling="auto" width="100%" height="100%" allowtransparency="true" />
</div>
<div style="display: none">
    <script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540'
            language='JavaScript' charset='gb2312'></script>
</div>
</body>
</html>
