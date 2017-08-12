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
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #009688;
    color: #fff;
    position: fixed;
    box-shadow: 1px 3px 12px black;
    top: 0;
    width: 100%;
    z-index: 99;
    font-family: tahoma;
}
.user-info{
		float: right;}
.logo{
	float: left;
}
li {
    float: left;
}

li a {
    display: block;
    color: white;
    text-align: center;
    padding: 20px 20px;
    text-decoration: none;
    box-shadow: 0px 0px 1px #004d40 inset;
}

li a:hover:not(.active) {
    background-color: #004d40;
}

div.img {
    margin: 5px;
    border: 1px solid #ccc;
    float: left;
    width: 250px;
    min-height: 60px;
    margin-left:auto;
    <!--transition:.6s ease;-->
   <!-- margin-top:20px;-->
    margin-right:20px;
    position:relative;
}

div.img:hover {
    border: 1px solid #777;
}

div.img img {
    width: 100%;
    height: auto;
}

div.desc {
    padding:30px;
    text-align: center;}
    .logout-btn{
		border: 2px solid #fff;
		background: black; color: #fff;
		padding: 5px 5px 5px 5px;
		border-radius: 8px;
		float: right;
		cursor: pointer;
	}
</style>
<%String message=(String)session.getAttribute("userlogged");%>
<form action="HomePageServlet" method="post">
<body>


<ul>
		<li>Name</li>
	</ul>
	<ul>
	  <span class="logo"><img src='logo.jpg' height='100px' width='200px' ></span>
	  <li><a  href="home.jsp">Home</a></li>
	  
	  <li><a href="#contact">Contact</a></li>
	  <li><a href="#about">About</a></li>
	  <span class="user-info">
	  	
		<h3><%=message %></h3>
		 <a href='LoginPage.jsp' class="logout-btn">LOGOUT</a>
	  </span>
	 
	</ul>
	
	<br><br><br>
	<table align="center"><tr><td>
<div class="img">
 <a target="_blank" href="download (4).jpg">
    <img src="image/download (4).jpg" alt="chair" width="240px" height="200px">
  </a>
  <div class="desc">
  <input type="submit" name="CHAIR" value='chair'> 
  </div>
</div>
	<br/>
	</td></tr>

<tr><td><div class="img">
  <a target="_blank" href="download (3).jpg">
    <img src="image/download (3).jpg" alt="wardrobe" width="240px" height="220px">
  </a>
  <div class="desc"><input type="submit" name="WARDROBE" value='wardrobe'></div>
</div>
	<br/>

<div class="img">
  <a target="_blank" href="bed-15-300x250.jpg">
    <img src="image/bed-15-300x250.jpg" alt="bed" width="300px" height="250px">
  </a>
  <div class="desc"><input type="submit" name="BED" value="bed"></div>
  </div></td></tr>
 	 <br/>
  <tr><td>
  <div class="img">
  <a target="_blank" href="sofa-design-300x250.jpg">
    <img src="image/sofa-design-300x250.jpg" alt="seating" width="300px" height="250px">
  </a>
  <div class="desc"><input type="submit" name="SEATING" value="seating"></div>
</div>
	<br/>

<div class="img">
  <a target="_blank" href="Conference-Table-300x250.jpg">
    <img src="image/Conference-Table-300x250.jpg" alt="table" width="300px" height="250px">
  </a>
  <div class="desc"><input type="submit" name="TABLE" value="table"></div>
</div></td></tr>
<br/>
<tr><td>
<div class="img">
  <a target="_blank" href="bright-floor-300x250.jpg">
    <img src="image/bright-floor-300x250.jpg" alt="flooring" width="300px" height="250px">
  </a>
  <div class="desc"><input type="submit" name="FLOORING" value=Flooring></div>
  </div>
  <br/></td>
  </tr></table>
  
</form>
</body>
</html>