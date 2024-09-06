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
 * Servlet implementation class PayBillServlet
 */
@WebServlet("/PayBillServlet")
public class PayBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int billId = Integer.parseInt(request.getParameter("bill_id"));
        java.sql.Date paymentDate = new java.sql.Date(new java.util.Date().getTime());

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/electricity_management", "root", "Pranoti3642");
            conn.setAutoCommit(false);

            // Update bill status to paid
            String updateBillSql = "UPDATE bills SET paid = TRUE WHERE bill_id = ?";
            PreparedStatement pstmt1 = conn.prepareStatement(updateBillSql);
            pstmt1.setInt(1, billId);
            pstmt1.executeUpdate();

            // Record payment
            String insertPaymentSql = "INSERT INTO payments (bill_id, payment_date, amount) SELECT bill_id, ?, bill_amount FROM bills WHERE bill_id = ?";
            PreparedStatement pstmt2 = conn.prepareStatement(insertPaymentSql);
            pstmt2.setDate(1, paymentDate);
            pstmt2.setInt(2, billId);
            pstmt2.executeUpdate();

            conn.commit();

            pstmt1.close();
            pstmt2.close();
            conn.close();

            response.sendRedirect("user_dashboard.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

}
