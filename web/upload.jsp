<%@page contentType="text/html; charset=UTF-8"%>
<html>
<head>
        <title>文件上传下载</title>
</head>
<body>
	<form action="uploadServlet" method="POST" enctype="multipart/form-data">
        <input type="file" name="file1" /><br/>
        <input type="submit" value="上传"/> 
    </form>
    <div id="mes">${message}</div>
    <hr>
	<form action="DownloadServlet" method="POST">
        输入下载文件名：<input type="text" name="filename" /><br/>
        <input type="submit" value="下载"/> 
    </form>
</body>
</html>