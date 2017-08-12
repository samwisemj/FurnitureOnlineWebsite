<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
body,html{
		margin: 0 0 0 0;
}
input[type=text], select {
    width: 250px;
    padding: 12px 8px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
    width: 150px;
    background-color:#4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: 	#45a04;
}

div {
    border-radius: 5px;
    background-color: #E6E6FA;
    padding: 20px;
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
p.par{
width:35em;
word-wrap:break-word;
}

</style>
<body>
<%String message=(String)session.getAttribute("userlogged");%>
<ul>
  <li><a class="active" href="home.jsp">Home</a></li>
  <li><a href="AboutUs.jsp">About</a></li>
  <li><a href="contact.jsp">Contact</a></li>
  <li style="float:right"><a href="LogoutServlet">Hi,<%=message%>!(Logout)</a></li>
</ul>
<center><img src="logo.jpg" height="200px" width="380px"></center>						
<font size="5"><center><b><u>Billing Details</u></b></center></font>				
<div>
  <form action="BillingServlet" method="post">
  
  <table cellpadding="4" style="float:left;">
	<caption><h3><b><u>Customer Details</u></b></h3></caption>
    <tr>
    <td><label for="name"> Name</label></td>
    <td><input type="text" id="name" name="CusName" size="12" value="<%=(String)session.getAttribute("userlogged")%>"></td>
    </tr>

    
    <tr>
    <td> <label for="address">Address</label></td>
    <td><input type="text" id="address" name="CusAddress" value="<%=(String)session.getAttribute("useraddress")%>"></td>
    </tr>
    
     <tr>
     <td><label for="contactno">Contact No</label></td>
   <td> <input type="text" id="contactno" name="CusContact" size="10" value="<%=(String)session.getAttribute("usercontact")%>"></td>
    </tr>
      <tr>
      <td><label for="emailid">Email Id</label></td>
   <td> <input type="text" id="emailid" name="CusEmail" value="<%=(String)session.getAttribute("useremail")%>" size="12"></td>
	</tr>
	</table>
    <table cellpadding="15" style="float:right;">
    <caption><h3><b><u>Product Details</u></b></h3></caption>
    <tr>
     <td><label for="productname">Product Name:</label></td>
   <td> <%=(String)session.getAttribute("productname")%></td>
   </tr>
    <tr>
   <td> <label for="productdesc">Product Description:</label></td>
    <td>
    <p class="par">
    <%=(String)session.getAttribute("productdescription")%>
    </p>
    </td>
    </tr> 
    <tr> 
    <td><label for="productprice">Product Price:</label></td>
   <td> Rs.<%=(String)session.getAttribute("productprice")%>.00</td>
    </tr>
    <tr>
    <td><label for="productprice">Delivery Charge:</label></td>
   <td>Rs.<%=(String)session.getAttribute("productdelcharge")%>.00</td>
   </tr>
   <%
    String del=(String)session.getAttribute("productdelcharge");
    String price=(String)session.getAttribute("productprice");
	int delch=Integer.parseInt(del);
	int pricepro=Integer.parseInt(price);
	pricepro=pricepro+delch;
	session.setAttribute("totalprice",Integer.toString(pricepro));
    %>
    <tr>
   <td><label for="productprice">Total Price:</label></td>
   <td> <b>Rs.<%=(String)session.getAttribute("totalprice")%>.00</b></td>
   </tr>
    </table>
    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
    <center><h3><u>Payment Mode</u></h3></center>
   <table align="center">
    
     <tr>
     <td><input type="radio" name="payment" value="Cash on Delivery" checked>Cash on delivery</td>
    <td><input type="radio" name="payment" value="Online payment">Online Payment</td></tr></table>
  

 <center> <input type="submit" value="Checkout" >
</center>
  
</div>

</body>
</html>
