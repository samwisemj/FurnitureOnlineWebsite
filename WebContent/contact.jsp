<!DOCTYPE html>
<html>
<head>
	<title>The Woodies-About</title>
	<style>
body,html{
		margin: 0 0 0 0;
}
	body{background: url("contacts/backcontact.jpg");
			background-size: cover;}	
	
		
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #333;
}

li {
    float: left;
    border-right:1px solid #bbb;
}

li:last-child {
    border-right: none;}
li a {
    display: block;
    color: white;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
}

li a:hover:not(.active) {
     background-color: #111;
}
.active {
    background-color: #4CAF50;
}

	</style>
</head>
<body>
<%String message=(String)session.getAttribute("userlogged");%>
<ul>
  <li><a class="active" href="home.jsp">Home</a></li>
  <li><a href="AboutUs.jsp">About</a></li>
  <li><a href="contact.jsp">Contact</a></li>
  <%if(message!=null){ %>
  <li style="float:right"><a href="LogoutServlet">Hi,<%=message%>!(Logout)</a></li>
  <%} %>
  <%if(message==null){%>
  <li style="float:right"><a href="LoginPage.jsp"><u>Login</u></a></li>
  <%} %>
  
</ul>
	<center>
		<img src="logo.jpg">
		<table width="50px" cellpadding="10">
			<tr>
				<td><img src="contacts/arkadeb.jpg" height="250px" width="250px"></td>
				<td><img src="contacts/subhamoy.jpg" height="250px" width="250px"></td>
				<td><img src="contacts/tralini.jpg" height="250px" width="250px"></td>
			</tr>
			<tr>
				<td><center>Arkadeb Saha<br>RCC Institute of Information Technology<br>arka.bubun@gmail.com</center></td>
				<td><center>Subhamoy Sarkar<br>RCC Institute of Information Technology<br>samwise.mj@gmail.com</center></td>
				<td><center>Tralini Das<br>Om Dayal Group of Institutions<br>alip.krdas@gmail.com</td>
			</tr>
		</table>
		<br><br>
		<table width="50px" cellpadding="10">
			<tr>
				<td><img src="contacts/tania.jpg" height="250px" width="250px"></td>
				<td><img src="contacts/sutapa.jpg" height="250px" width="250px"></td>
				<td><img src="contacts/bibhasa.jpg" height="250px" width="250px"></td>
			</tr>
			<tr>
				<td><center>Tania Roy<br>Om Dayal Group of Institutions<br>tania15roy@gmail.com</center></td>
				<td><center>Sutapa Saha<br>Om Dayal Group of Institutions<br>priyasutapa@gmail.com</center></td>
				<td><center>Bibhasa Ghosal<br>Neotia Institute of Technology, Management and Science<br>bibhasa1995@yahoo.in</td>
			</tr>
		</table>
		<table width="50px" cellpadding="10px">
			<tr>
				<td><img src="contacts/sudipto.jpg" height="250px" width="250px"></td>
				<td><img src="contacts/saikat.jpg" height="250px" width="250px"></td>
			</tr>
			<tr>
				<td><center>Sudipta Aich<br>Swami Vivekananda Institute of Science and Technology<br>sudiptaaich007@gmail.com</center></td>
				<td><center>Saikat Jana<br>Swami Vivekananda Institute of Science and Technology<br>saikatjana.096@gmail.com</center></td>
			</tr>
		</table>

	</center>
</body>
</html>