<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loginpage</title>
</head>
<%String message=(String)session.getAttribute("message");%>
<body>
<form action="LoginServlet" method="post">
<h1 align="center">Welcome to Woodies</h1>

<table align="center">
<tr>
	<td>UserID</td>
	<td><input type="text" name="username"></td>
</tr>
<tr>
	<td>Password</td>
	<td><input type="password" name="password"></td>
</tr>
<tr>
<td colspan=2 align="center">
<input type="submit" value="Login">
<input type="button" value="Register" onclick="location.href='Registration.jsp'"></td></tr>
</table>

<%if(message!=null){%>
<h4 style='color: red;' align="center"><%=message %></h4>
<%}%>

</form>
</body>
</html>