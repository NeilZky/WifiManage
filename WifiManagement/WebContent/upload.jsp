<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>upload</h3>

<div style="float: left;">

<s:form action="upload" method="post" enctype="multipart/form-data">

<table>

<tr>

<td>请选择要上传的文件</td>

<td><input type="file" name="file" size="20" /></td>

</tr>

<tr>

<td>请选择要上传的文件</td>

<td><input type="file" name="file" size="20" /></td>

</tr>

<tr>

<td><input type="submit" value="上传" /></td>

</tr>

</table>

</s:form>

</div>
</body>
</html>