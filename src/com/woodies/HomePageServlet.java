package com.woodies;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ResultSet rs=null;
	public Connection con=null;
	public Statement st=null;
	public PrintWriter pr=null;
       
    public HomePageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init(ServletConfig config) throws ServletException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			String url=config.getServletContext().getInitParameter("url");
			String user=config.getServletContext().getInitParameter("user");
			String pass=config.getServletContext().getInitParameter("pass");
			con=DriverManager.getConnection(url,user,pass);
			st=con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see Servlet#destroy()
	 */
	public void destroy() {
		try {
			con.close();
			st.close();
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		if(session.getAttribute("userlogged")==null)
		{
			session.setAttribute("message3", "You have been logged out.....To continue please login again.");
			RequestDispatcher rd=request.getRequestDispatcher("/LoginPage.jsp");
			rd.forward(request,response);
		}
		else
		{
		pr=response.getWriter();
		try {
			String category="";
			rs=st.executeQuery("SELECT DISTINCT TYPE FROM TFURNITUREDETAILS");
			while(rs.next())
			{
				if(request.getParameter(rs.getString(1))!=null)
				{
					category=rs.getString(1);
					session.setAttribute("category", category);
					break;
				}
			}
			
			rs=st.executeQuery("SELECT * FROM TFURNITUREDETAILS WHERE TYPE='"+category+"'");
			String id,name,price,type=category,description;
			String html1="<!DOCTYPE html PUBLIC '-//W3C//DTD HTML 4.01 Transitional//EN' 'http://www.w3.org/TR/html4/loose.dtd'> <html> <head>";
			String html2="Hi, "+(String)session.getAttribute("userlogged")+"!(LOGOUT)";
			String html3="<meta http-equiv='Content-Type' content='text/html; charset=ISO-8859-1'> <style> body,html{ margin: 0 0 0 0; } ul { list-style-type: none; margin: 0; padding: 0; overflow: hidden; background-color: #333; }li { float: left; border-right:1px solid #bbb; } li:last-child { border-right: none;} li a { display: block; color: white; text-align: center; padding: 14px 16px; text-decoration: none; }li a:hover:not(.active) { background-color: #111; } .active { background-color: #4CAF50; } .main{ align-content: center; vertical-align: center; padding: 10px 10px 10px 10px; margin: 0 auto; margin-top: 60px; } .item{ display: block; border-radius: 2px; box-shadow: 0px 2px 3px gray,-1px 0px 3px gray; width: 92%; min-height: 200px; margin-top: 20px; margin-left: auto; transition: .6s ease; margin-right: auto; position: relative; } .item:hover{ box-shadow: 2px 0px 12px black,0px 2px 12px black; /*border: 2px solid gray;*/ } .description{ background: #fff; border: 2px solid gray; border-radius: 3px; display: inline-block; width: 800px; min-height: 150px; position: absolute; top: 20px; left: 200px; } .item-image{ background: #fff; border: 2px solid gray; border-radius: 3px; position: absolute; left: 3px; top: 20px; display: inline-block; width: 150px; height: 150px; } .item-image:hover {transform: scale(1.2,1.2);} .buy-now-button{ height: 50px; width: 150px; cursor: pointer; position: absolute; right: 2px; bottom: 2px; } .buy-now-button:hover{ box-shadow: 3px 5px 15px black,-5px 2px 15px black; } /** edited **/ .dropdown{ } .dropdown-content { z-index: 100; display: none; background-color: #f9f9f9; min-width: 160px; position: fixed; box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); z-index: 100; } .dropdown-content a { transition: .4s ease-in; color: black; padding: 12px 16px; text-decoration: none; display: block; text-align: left; box-shadow: 0 -2px 2px lightgray inset; } .dropdown-content a:hover {background:#009688 !important; color: #fff;} .dropdown:hover .dropdown-content{ display: block; } .dropdown:focus .dropdown-content{ display: block; } .img-btn{ background-image: url('test.jpg'); border: none; height: 50px; width: 180px; cursor: pointer; position: absolute; right: 2px; background-size: cover; bottom: 2px; } .img-btn:hover{ box-shadow: 3px 5px 15px black,-5px 2px 15px black; } .title{ background: #0d47a1; color: #fff; padding: 10px 20px 10px 20px; box-shadow: 0px 0px 1px #263238 inset; } .column{ background: #f9fbe7; padding: 10px 20px 10px 20px; box-shadow: 0px 0px 1px #263238 inset; } .user-info{ float: right; } span.user-info>h3{ font-size: 15px; } @media only screen and (max-width: 900px){ .item{ float: left; overflow: hidden; } .description{ display: block; width: 90%; position: relative; float: left; width: 30%; } .img-btn{ float: left; } } table{ width: 800px; } .logout-btn{ border: 2px solid #fff; background: black; color: #fff; padding: 5px 5px 5px 5px; border-radius: 8px; float: right; cursor: pointer; } .hide{display:none;} </style> <title>The Woodies</title> </head> <form action='FurnitureListServlet' method='post'> <body> <!--<h3><%=message %></h3>--> <ul> </ul> <ul><li><a href='home.jsp'>Home</a></li> <li class='dropdown'> <a class='hide' href='#Product'>Product</a> <div class='dropdown-content'> <a href='#'>Sofa</a> <a href='#'>Chair</a> <a href='#'>Table</a> <a href='#'>Bed</a> <a href='#'>Cushions</a> <a href='#'>Storage</a> </div> </li> <li><a href='contact.jsp'>Contact</a></li> <li><a href='AboutUs.jsp'>About</a></li><li style='float:right'><a href='LogoutServlet'>"+html2+"</a></li></ul><center><img src='logo.jpg' height='200px' width='380px'></center> "; 
			String html4="";
			pr.print(html1);
			pr.print(html3);
			while (rs.next())
			{
				id=rs.getString(1);
				name=rs.getString(2);
				price=rs.getString(3);
				description=rs.getString(5);
				int del=Integer.parseInt(price)*5/100;
				String imgsrc="<img src='fimages/"+id+".jpg' height='150px' width='150px' >";
				html4="<div class='main'><div class='item'><div class='item-image'>"+imgsrc+"</div>";
				String html5="<div class='description'>";
				String html6="<table cellspacing='0' style='margin: 0 auto;'><tr> <td class='title'>Item Name</td> <td class='title'>Price</td> <td class='title'>Description</td> <td class='title'>Delivery Charge</td> </tr> <tr>";
				String html7="<td class='column'>"+name+"</td><td class='column'>Rs."+price+".00</td><td class='column'>"+description+"</td><td class='column'>Rs."+String.valueOf(del)+".00</td></tr> </table>";
				String html8="</div> <!-- submit button.. html5 style --> <button type='submit' name='"+id+"' class='img-btn'> <!-- <img src='test.jpg' class='buy-now-button'> --> </button> </div> </div>";
				pr.print(html4);
				pr.print(html5);
				pr.print(html6);
				pr.print(html7);
				pr.print(html8);
			}
		
		pr.print("</body></form></html>");
		session.setAttribute("message3", "You have been logged out.....To continue please login again.");
		session.setAttribute("message", null);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}

}
