<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorPage</title>
</head>
<body>
	<h1 style="color:crimson;fornt-weight:100px" >ErrorPage!!</h1>
	<img src="<%=request.getContextPath()%>/images/errorpage.png" width="500" height="500">
	<h3><%=exception.getMessage() %></h3>
	<script>
		setTimeout(()=>{
			location.replace("<%=request.getContextPath()%>");
		},3000)
	</script>
</body>
</html>