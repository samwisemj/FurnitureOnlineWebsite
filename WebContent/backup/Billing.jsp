<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
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
</style>
<body>
						
				<font size="6"><center><b><u>THE WOODIES</u></b></center></font>
					
<div>
  <form action="BillingServlet" method="post">
  
  	<h3><b><u>Customer Details</u></b></h3>
    <label for="name"> Name</label>
    <input type="text" id="name" name="Name" size="12" value="<%=(String)session.getAttribute("userlogged")%>"><br>

    
    
     <label for="address">Address</label>
    <input type="text" id="address" name="Address" value="<%=(String)session.getAttribute("useraddress")%>"><br>
    
     <label for="contactno">Contact No</label>
    <input type="text" id="contactno" name="Contactno" size="10" value="<%=(String)session.getAttribute("usercontact")%>"><br>
    
      <label for="emailid">Email Id</label>
    <input type="text" id="emailid" name="Email Id" value="<%=(String)session.getAttribute("useremail")%>" size="12"><br>

    
        <h3><b><u>Product Details</u></b></h3>
     <label for="productname">Product Name</label>
    <input type="text" id="productname" name="Product Name" value="<%=(String)session.getAttribute("productname")%>" size="35"><br>
    
    <label for="productdesc">Product Desc</label>
    <input type="text" id="productdesc" name="Product Desc"size="35" value="<%=(String)session.getAttribute("productdescription")%>"><br>
    
    <label for="productprice">Product Price</label>
    <input type="text" id="productdesc" name="Product Price" value="<%=(String)session.getAttribute("productprice")%>" maxlength="6" size="6"><br>
    
    <label for="productprice">Delivery Charge</label>
    <input type="text" id="delivery" name="delivery" value="<%=(String)session.getAttribute("productdelcharge")%>" maxlength="6" size="6"><br>
   <%
    String del=(String)session.getAttribute("productdelcharge");
    String price=(String)session.getAttribute("productprice");
	int delch=Integer.parseInt(del);
	int pricepro=Integer.parseInt(price);
	pricepro=pricepro+delch;
	session.setAttribute("totalprice",Integer.toString(pricepro));
    %>
   <label for="productprice">Total Price</label>
    <input type="text" id="totalprice" name="delivery" value="<%=(String)session.getAttribute("totalprice")%>" maxlength="6" size="6"><br>
   <form> 
    <h3><u> Payment Mode</u></h3>
     <input type="radio" name="C1" value="Cash on Delivery" checked>Cash on delivery<br> 
     <input type="radio" name="C1" value="Online payment">Online Payment<br>
  </form>
  <input type="submit" value="Submit">

  </form>
    </left>
  
</div>

</body>
</html>
