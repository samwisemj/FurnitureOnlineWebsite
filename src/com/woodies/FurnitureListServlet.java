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

/**
 * Servlet implementation class FurnitureListServlet
 */
//@WebServlet("/FurnitureListServlet")
public class FurnitureListServlet extends HttpServlet {
	public ResultSet rs=null;
	public Connection con=null;
	public Statement st=null;
	public PrintWriter pr=null;
	private static final long serialVersionUID = 1L;
       
  
    public FurnitureListServlet() {
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
		else{
		String category=(String)session.getAttribute("category");
		try {
			rs=st.executeQuery("SELECT * FROM TFURNITUREDETAILS WHERE TYPE='"+category+"'");
			String id,name,price,type=category,description;
			while(rs.next())
			{
				id=rs.getString(1);
				name=rs.getString(2);
				price=rs.getString(3);
				description=rs.getString(5);
				int del=Integer.parseInt(price)*5/100;
				if(request.getParameter(id)!=null)
				{
					session.setAttribute("productname", name);
					session.setAttribute("productprice", price);
					session.setAttribute("productdescription", description);
					session.setAttribute("productdelcharge", String.valueOf(del));
					session.setAttribute("productid", id);
					RequestDispatcher rd=request.getRequestDispatcher("/Billing.jsp");
					rd.forward(request,response);
					break;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}

}
