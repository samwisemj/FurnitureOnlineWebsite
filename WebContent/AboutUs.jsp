<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>body,html{
		margin: 0 0 0 0;

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
}</style>
<head>
	<title>The Woodies-About Us</title>
	<style>
	body
	{
		background: url("backabout.jpg");
		background-size: cover;
	}
	p {
		font-family: Verdana;
    	padding-right: 50px;
    	padding-left: 80px;
    	text-align: justify;
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
<br>
<br>
<center><img src="logo.jpg"></center>

<p>The Woodies offers a unique selection of stylish, contemporary, and chic furniture online. Our online furniture range includes sofas, beds, chairs, tables and lots more. All our wooden furniture designs are available online. On our portal, you can browse as many furniture designs across categories as you like and easily select and buy the ones you like, and stay updated about new and contemporary designs.</p>

<p>Furniture is what turns your house into a home. Well-designed furniture is not just functional or utilitarian (for example, tables and desks for work or cabinets and wardrobes for storage) but also a reflection of your taste and style. We have lots of furniture designs  as well as soft furnishings and home decor items.</p>

<p>As an online furniture company, we know that service is as important as our products. That's why we pay attention to every detail of the process, from the time of ordering till your order reaches your home, and even afterwards.</p>

<p>The furniture you choose for a room can make or break it. The furniture designs you choose are what determine the personality of the room and say something about the inhabitants of the house. Modern furniture design is all about finding the right balance between design and functionality, while traditional designs have evolved over time, reflecting the fashion fads of each period. Whether you are on the lookout for modern designs or more traditional styles, there are some features to keep an eye out for.</p>

<p>Before you shop for home furniture designs, the first step is to picture the fully furnished rooms in your mind. What do you want each space to be used for? Will it be a private space, for family, or for entertaining? Secondly, consider the layout of each space, including the position of doors and windows, to understand how many and how big your furniture pieces can be, while still leaving enough room for people to walk around unobstructed.</p>

<p>If you have a large space, you have the luxury of adding a number of the latest furniture designs to the room, without overcrowding it, of course. For smaller rooms, it's best that you look for multifunctional furniture designs that let you do more without taking up a lot of room. Once you identify what your room is going to be used for and what pieces you would like to furnish it with, you can proceed to find the right pieces online.<p>

</body>
</html>