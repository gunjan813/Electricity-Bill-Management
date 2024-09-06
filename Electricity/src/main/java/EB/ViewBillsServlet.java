package EB;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewBillsServlet
 */
@WebServlet("/ViewBillsServlet")
public class ViewBillsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String status = request.getParameter("status");
	        request.setAttribute("status", status);
	        request.getRequestDispatcher("view_bills.jsp").forward(request, response);
	    }
}
