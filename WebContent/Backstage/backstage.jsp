<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="../utf8-jsp/ueditor.all.js"> </script>
<script type="text/javascript" src="../utf8-jsp/ueditor.config.js"> </script>
<script type="text/javascript" src="../utf8-jsp/ueditor.parse.js"> </script>
<link rel="stylesheet" href="../utf8-jsp/themes/default/css/ueditor.css">
<title>Insert title here</title>
</head>
<body>
	<h1>写博客</h1>
    <!-- 加载编辑器的容器 -->
    <script id="container" name="content" type="text/plain">
        这里写你的初始化内容
    </script>
    <!-- 配置文件 -->
    <script type="text/javascript" src="../utf8-jsp/ueditor.config.js"></script>
    <!-- 编辑器源码文件 -->
    <script type="text/javascript" src="../utf8-jsp/ueditor.all.js"></script>
    <!-- 实例化编辑器 -->
    <script type="text/javascript">
        var ue = UE.getEditor('container');
    </script>
    
</body>
</html>