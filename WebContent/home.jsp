<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME PAGE</title>
</head>
<style>
body,html{
		margin: 0 0 0 0;

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
table {
  border-collapse: separate;
  border-spacing: 18px 0;
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
<%String message=(String)session.getAttribute("userlogged");%>
<form action="HomePageServlet" method="post">
<body>
<ul>
  <li><a class="active" href="#home">Home</a></li>
  <li><a href="AboutUs.jsp">About</a></li>
  <li><a href="contact.jsp">Contact</a></li>
  <%if(message!=null){ %>
  <li style="float:right"><a href="LogoutServlet">Hi,<%=message%>!(Logout)</a></li>
  <%} %>
  <%if(message==null){%>
  <li style="float:right"><a href="LoginPage.jsp"><u>Login</u></a></li>
  <%} %>
</ul>
<center><img src="logo.jpg" height="200px" width="380px"></center>
	<table align="center"><tr><td>
<div>
    <img src="image/download (4).jpg" alt="chair" width="300px" height="300px">
  
  <div>
  <center><input type="submit" name="CHAIR" value='Chair' class="button button1"> </center>
  </div>
</div>
	</td>

<td><div class="img">
    <img src="image/download (3).jpg" alt="wardrobe" width="300px" height="300px">
  </a>
  <div><center><input type="submit" class="button button1" name="WARDROBE" value='Wardrobe'></center></div>
</div></td>
	

<td><div class="img">

    <img src="image/bed-15-300x250.jpg" alt="bed" width="300px" height="300px">
  </a>
  <div class="desc"><center><input type="submit" class="button button1" name="BED" value="Bed"></center></div>
  </div></td></tr>
 	 
  <tr><td>
  <div class="img">
    <img src="image/sofa-design-300x250.jpg" alt="seating" width="300px" height="300px">
  </a>
  <div class="desc"><center><input type="submit" class="button button1" name="SEATING" value="Seating"></center></div>
</div></td>
<td>
<div class="img">
    <img src="image/Conference-Table-300x250.jpg" alt="table" width="300px" height="300px">
  </a>
  <div ><center><input type="submit" name="TABLE" value="Table" class="button button1"></center></div>
</div></td>
<br/>
<td>
<div class="img">
    <img src="image/bright-floor-300x250.jpg" alt="flooring" width="300px" height="300px">
  </a>
  <div><center><input type="submit" name="FLOORING" value=Flooring class="button button1"></center></div>
  </div>
  </td>
  </tr></table>
</form>
</body>
</html>