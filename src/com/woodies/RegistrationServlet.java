package com.woodies;

import java.io.IOException;
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


public class RegistrationServlet extends HttpServlet {
	public ResultSet rs=null;
	public Connection con=null;
	public Statement st=null;
	public String message=""; 
	private static final long serialVersionUID = 1L;
       
  
    public RegistrationServlet() {
        super();

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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}

	
	public void destroy() {
		try {
			con.close();
			st.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("userid");
		String password=request.getParameter("password");
		String displayname=request.getParameter("name");
		String email=request.getParameter("email");
		String address=request.getParameter("address");
		String contact=request.getParameter("contact");
		HttpSession session=request.getSession(true);
		
		session.setAttribute("tuserid", username);
		session.setAttribute("tname", displayname);
		session.setAttribute("temail", email);
		session.setAttribute("tcontact", contact);
		session.setAttribute("taddress", address);
		
		
		String sqlQuery="SELECT * FROM TUSERS WHERE USERID='"+username+"'";
		try {
			if(username==""||password==""||displayname==""||email==""||contact==""||address=="") throw new SQLException("Blank Field");
			
			rs=st.executeQuery(sqlQuery);
			if(rs.next()==false)
			{
				if(password.equals(request.getParameter("confirmpassword")))
				{	
				sqlQuery="INSERT INTO TUSERS VALUES(NULL,'"+username+"','"+password+"','"+email+"','"+address+"','"+contact+"','"+displayname+"')";
				st.execute(sqlQuery);
				message="Thank you for registration..Please login with your user id and password";
				session.setAttribute("message3", null);
				session.setAttribute("message", message);
				RequestDispatcher rd=request.getRequestDispatcher("/LoginPage.jsp");
				rd.forward(request,response);
				}
				else
				{
					message="Password Fields do not match...";
					session.setAttribute("message2", message);
					RequestDispatcher rd=request.getRequestDispatcher("/Registration.jsp");
					rd.forward(request,response);
				}
			}
			else
			{
				message="A similar username exists.....Register with another username";
				session.setAttribute("message2", message);
				RequestDispatcher rd=request.getRequestDispatcher("/Registration.jsp");
				rd.forward(request,response);
			}
		} catch (SQLException e) {
			message="One or more field(s) were empty....Please try again";
			session.setAttribute("message2", message);
			RequestDispatcher rd=request.getRequestDispatcher("/Registration.jsp");
			rd.forward(request,response);
		}
	}

}
