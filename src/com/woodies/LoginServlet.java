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


public class LoginServlet extends HttpServlet {
	public ResultSet rs=null;
	public Connection con=null;
	public Statement st=null;
	public String message=""; 
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
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
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String sqlQuery="SELECT * FROM TUSERS WHERE USERID='"+username+"'";
		int f=0;
		HttpSession session=request.getSession(true);
		try {
			rs=st.executeQuery(sqlQuery);
			if(rs.next()){
				String dbUsername=rs.getString(2);
				String dbPassword=rs.getString(3);
				String dbContact=rs.getString(6);
				String dbEmail=rs.getString(4);
				String dbAddress=rs.getString(5);
				String dbDisplayName=rs.getString(7);
				if(dbPassword.equals(password))
				{
					f=1;
					session.setAttribute("userlogged", dbDisplayName);
					session.setAttribute("useraddress", dbAddress);
					session.setAttribute("useremail", dbEmail);
					session.setAttribute("usercontact", dbContact);
					RequestDispatcher rd=request.getRequestDispatcher("/home.jsp");
					rd.forward(request,response);
				}
			else{
				f=1;
				message="Incorrect password entered login again with correct password";
				session.setAttribute("message", message);
				session.setAttribute("luserid", username);
				session.setAttribute("userlogged", null);
				RequestDispatcher rd=request.getRequestDispatcher("/LoginPage.jsp");
				rd.forward(request,response);
			}
			}
			if(f==0)
				throw new SQLException("Incorect usrnm");
		} catch (SQLException e) {
			session.setAttribute("userlogged",null);
			message="Username doesnt exist.Please register";
			session.setAttribute("message", message);
			RequestDispatcher rd=request.getRequestDispatcher("/LoginPage.jsp");
			rd.forward(request,response);
			e.printStackTrace();
		}
		
	}

}
