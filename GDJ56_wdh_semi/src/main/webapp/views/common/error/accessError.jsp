<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ErrorPage</title>
</head>
<body>
<style>
	body,html {
 		width:100vw;
 		height:100vh;
		margin:0;
	}
</style>

<div style="background-color:black; width:100%;height:100%;">
	<div style="text-align:center;">
		<br><br><br><br><br>
		<h1 style="color:crimson;fornt-weight:100px" >ERROR PAGE</h1>
			<img src="<%=request.getContextPath()%>/images/errorpage.gif" width="300" height="300">
	</div>
		<div>
			<h2 style="text-align:center; color:white;"><%=exception.getMessage() %></h2>
			<br>
		</div>
</div>
	<script>
		setTimeout(()=>{
			location.replace("<%=request.getContextPath()%>");
		},5000)
	</script>
</body>
</html>