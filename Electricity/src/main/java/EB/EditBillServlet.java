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
 * Servlet implementation class EditBillServlet
 */
@WebServlet("/EditBillServlet")
public class EditBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditBillServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int billId = Integer.parseInt(request.getParameter("bill_id"));
        int userId = Integer.parseInt(request.getParameter("user_id"));
        double unitsConsumed = Double.parseDouble(request.getParameter("units_consumed"));
        double billAmount = Double.parseDouble(request.getParameter("bill_amount"));
        boolean paid = request.getParameter("paid") != null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/electricity_management", "root", "Pranoti3642");

            String sql = "UPDATE bills SET user_id = ?, units_consumed = ?, bill_amount = ?, paid = ? WHERE bill_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userId);
            pstmt.setDouble(2, unitsConsumed);
            pstmt.setDouble(3, billAmount);
            pstmt.setBoolean(4, paid);
            pstmt.setInt(5, billId);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

            response.sendRedirect("admin_view_all_bill.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

}
