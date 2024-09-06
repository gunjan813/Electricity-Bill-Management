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
 * Servlet implementation class CreateBillServlet
 */
@WebServlet("/CreateBillServlet")
public class CreateBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("user_id"));
        double unitsConsumed = Double.parseDouble(request.getParameter("units_consumed"));
        double billAmount = unitsConsumed * 5; // Example rate of $5 per unit

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/electricity_management", "root", "Pranoti3642");
            String sql = "INSERT INTO bills (user_id, units_consumed, bill_amount) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setDouble(2, unitsConsumed);
            pstmt.setDouble(3, billAmount);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            response.sendRedirect("admin_dashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

}
