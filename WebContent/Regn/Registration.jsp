
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%String message=(String)session.getAttribute("message2");%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>The Woodies Registration</title>
<style>

body
{
    background: url("abc.jpg");
    background-size: cover;
    font-size: 25px;
    webkit-text-stroke-color: black;

}

input[type=text], select {
    width: 200%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=password], select {
    width: 200%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}



h1
{
    font-family: "Times New Roman", Times, serif;
    font-weight: "bold";
    text-shadow: 2px 2px #B8EB38;
}
h3
{
    text-shadow: 2px 2px #003366;
}
    .button {
    background-color: #008CBA; /* Blue */
    border: none;
    color: white;
    padding: 16px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    margin: 4px 2px;
    -webkit-transition-duration: 0.4s; /* Safari */
    transition-duration: 0.4s;
    cursor: pointer;
}

.button1 {
    background-color: white; 
    color: black; 
    border: 2px solid #008CBA;
    border-radius: 12px;
}

.button1:hover {
    background-color: #008CBA;
    color: white;
}



</style>
</head>
<body>
	<div align="center">
		<h1><font color="#800000">The Woodies</font></h1>
        <img src="logo.jpg" height="150px" width="250px">
        <br>
		
	</div>

		<form action="RegisterServlet" method="post">
        <div>
        <table align="center">
        <caption><h3><font color="#FF6924" style="font-family:courier" size="10">REGISTRATION PORTAL</font></h3></caption>
		<tr>
         <td><font color="#FFCC66"><label for="name">Name</label></font></td>
         <td><input type="text" id="name" name="name"></td>
         </font>
		</tr>
		<tr>
         <td><font color="#FFCC66"><label for="userid">User ID</label></font></td>
         <td><input type="text" id="userid" name="userid"></td>
		</tr>
		<tr>
		 <td><font color="#FFCC66"><label for="password">Password</label></font></td>
		 <td><input type="password" id="password" name="password"></td>
		</tr>
		<tr>
		 <td><font color="#FFCC66"><label for="password">Confirm Password</label></font></td>
		 <td><input type="password" id="password" name="confirmpassword"></td>
        </tr>
        <tr>
         <td><font color="#FFCC66"><label for="Address">Address</label></font></td>
         <td><input type="text" id="address" name="address"></td>
        </tr>
        <tr>
         <td><font color="#FFCC66"><label for="Contact">Contact</label></font></td>
         <td><input type="text" id="contact" name="contact"></td>
        </tr>
        <tr>
         <td><font color="#FFCC66"><label for="EmailID">Email ID</label></font></td>
         <td><input type="text" id="email" name="email"></td>
		</tr>
        </table>
		<%if(message!=null){%>
		<h4 style='color: red;' align="center"><%=message %></h4>
		<%}%>
        </div>
        <br>
		 <center><button type="submit" class="button button1">Create Account</button></center>

		</form>

</body>
</html>