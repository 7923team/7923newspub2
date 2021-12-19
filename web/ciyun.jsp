<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html
PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtnl1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="image/icon.svg">
    <title>新闻发布系统 V20</title>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <link rel="stylesheet" type="text/css" href="css/main.css" />
    <script src="js/fun.js" type="text/javascript" charset="UTF-8"></script>
</head>

<body>
<jsp:include page="common/top.jsp" />
<div id="content">
    <div id="sidebar">
        <jsp:include page="common/left.jsp" />
    </div>
    <div id="main">
        <!-- main begin -->
        <img src="python/imge/wbcy.png"/>
        <%@include file="python/imge/ciyun.txt"%>
        <!-- main end -->
    </div>
    <script type="text/javascript">
        showTime();
    </script>
</div>
<div class="blank20"></div>
<div class="blank10"></div>
<%@include file="common/bottom.txt"%>
</body>
</html>
