<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loginpage</title>
<style>
body{  }
		.login{
			position: relative;
			background:  #fff ;
			width: 300px;
			vertical-align: center;
			margin: 50px auto;
			box-shadow: 1px 0px 2px black,-1px 0 2px black;
			min-height: 200px;
			padding: 10px 10px 10px 10px;
			border-radius: 3px;
			/*border-left: 4px solid darkgray; */
		}
		div.login h3
		{
			margin: 0 0 0 0;
			color: #505050;
			font-family: tahoma;
			text-align: center;
			font-size: 30px;
			text-shadow: 1px 1px 1px #1f2025;
			box-shadow: 0 3px 10px #3a3a3c ;
		}
		.login:hover{ 
		
		 }
		.ip{
			height: 32px;
			/*border: 1px solid lightgray;*/
			border: none;
			border-bottom: 2px solid lightgray;
			font-size: 20px;
			outline: none;
			width: 97%;
			margin: 2px 2px 2px 2px;
			margin-top: 20px;
			transition: .8s ease all;
			position: relative;
		}
		.ip:focus{
			/*border: 1px solid #4abcf9;*/
			border-bottom: 2px solid black;
			/*box-shadow: 1px 0px 6px  #696a70;*/
		}
		.ip:hover{
			box-shadow: 12px 13px 0px rgba(204, 211, 51, 0.38),

		}
		.btn{
			cursor: pointer;
			border: none;
			background:  #3b58bc;
			margin-top: 10px;
			padding: 6px 20px 6px 20px;
			font-size: 20px;
			box-shadow: 0px 1px 3px black;
			color: #fff;
			margin-left: 2px;
			transition: .5s ease-out;
		}
		.btn:hover{ 
			box-shadow: 0px 2px 5px black;
		}
		.red{ background:#f53863 ; }
		.red:hover{  background: #a21a43; }
		.blue:hover{
			background: #0b3146;
		}
		.icn{
			position: absolute; right: 5%; top: 24px;
			font-size: 26px;
			color: lightgray;
		}
		.icn:focus{
			color: black;
		}
		.effect2
		{
		  position: relative;
		}
		.effect2:before, .effect2:after
		{
		  z-index: -1;
		  position: absolute;
		  content: "";
		  bottom: 15px;
		  left: 10px;
		  width: 100%;
		  top: 80%;
		  max-width:300px;
		  background: #777;
		  -webkit-box-shadow: 0 15px 5px #777;
		  -moz-box-shadow: 0 15px 5px #777;
		  box-shadow: 0 15px 5px #777;
		  -webkit-transform: rotate(-3deg);
		  -moz-transform: rotate(-3deg);
		  -o-transform: rotate(-3deg);
		  -ms-transform: rotate(-3deg);
		  transform: rotate(-3deg);
		}
		.effect2:after
		{
		  -webkit-transform: rotate(3deg);
		  -moz-transform: rotate(3deg);
		  -o-transform: rotate(3deg);
		  -ms-transform: rotate(3deg);
		  transform: rotate(3deg);
		  right: 10px;
		  left: auto;
		}
</style>
</head>
<%String message=(String)session.getAttribute("message");%>
<%String message3=(String)session.getAttribute("message3");%>
<body>
<form action="LoginServlet" method="post" class="login effect2">
<h3 align="center">Welcome to Woodies</h3>

<table align="center">
<tr>
	<td>UserID</td>
	<td><input type="text" name="username" class="ip"></td>
</tr>
<tr>
	<td>Password</td>
	<td><input type="password" name="password" class="ip"></td>
</tr>
<tr>
<td colspan=2 align="center">
<input type="submit" value="Login" class="btn">
<input type="button" class="btn" value="Register" onclick="location.href='Registration.jsp'"></td></tr>
</table>

<%if(message!=null){%>
<h4 style='color: red;' align="center"><%=message %></h4>
<%}%>
<%if(message3!=null){%>
<h4 style='color: red;' align="center"><%=message3 %></h4>
<%}%>

</form>
</body>
</html>