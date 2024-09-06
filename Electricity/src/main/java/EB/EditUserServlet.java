package EB;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int userId = Integer.parseInt(request.getParameter("user_id"));
	        String username = request.getParameter("username");
	        String email = request.getParameter("email");

	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/electricity_management", "root", "Pranoti3642");

	            String sql = "UPDATE users SET username = ?, email = ? WHERE user_id = ?";
	            PreparedStatement pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, username);
	            pstmt.setString(2, email);
	            pstmt.setInt(3, userId);
	            pstmt.executeUpdate();

	            pstmt.close();
	            conn.close();

	            response.sendRedirect("view_users.jsp");
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.sendRedirect("error.jsp");
	        }
	    }

}
