package com.woodies;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BillingServlet
 */
//@WebServlet("/BillingServlet")
public class BillingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BillingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession(true);
		if(session.getAttribute("userlogged")==null)
		{
			session.setAttribute("message3", "You have been logged out.....To continue please login again.");
			RequestDispatcher rd=request.getRequestDispatcher("/LoginPage.jsp");
			rd.forward(request,response);
		}
		else{
		String s=request.getParameter("payment");
		session.setAttribute("payment", s);
		
		s=request.getParameter("CusName");
		session.setAttribute("CusName", s);
		s=request.getParameter("CusAddress");
		session.setAttribute("CusAddress", s);
		s=request.getParameter("CusContact");
		session.setAttribute("CusContact", s);
		s=request.getParameter("CusEmail");
		session.setAttribute("CusEmail", s);
		RequestDispatcher rd=request.getRequestDispatcher("/Invoice.jsp");
		rd.forward(request,response);
		
	}
}

}
