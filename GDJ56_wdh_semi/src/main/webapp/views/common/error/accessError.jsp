<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorPage</title>
</head>
<body>
	<h1 style="color:crimson;" >ErrorPage!!</h1>
	<h3><%=exception.getMessage() %></h3>
		<img src="/images/errorpage.png" width="500" height="500" >
	<script>
		setTimeout(()=>{
			location.replace("<%=request.getContextPath()%>");
		},2000)
	</script>
</body>
</html>