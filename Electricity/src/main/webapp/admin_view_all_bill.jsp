<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title> Admin View All Bills</title>
   
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
         .table>tbody {
    
    text-align: center;
}
    </style>
</head>
<body>
    <h2 class= "text-center mt-3">Admin View All Bills</h2>
    <table  class="table table-striped mt-3 ">
     <thead class="table-dark text-center">
   
        <tr>
            <th>Bill ID</th>
            <th>User ID</th>
            <th>Units Consumed</th>
            <th>Bill Amount</th>
            <th>Paid</th>
            <th>Action</th>
        </tr>
           </thead>
        <%
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost/electricity_management", "root", "Pranoti3642");
                stmt = conn.createStatement();

                String query = "SELECT * FROM bills";
                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("bill_id") + "</td>");
                    out.println("<td>" + rs.getInt("user_id") + "</td>");
                    out.println("<td>" + rs.getDouble("units_consumed") + "</td>");
                    out.println("<td>" + rs.getDouble("bill_amount") + "</td>");
                    out.println("<td>" + (rs.getBoolean("paid") ? "Yes" : "No") + "</td>");
                    out.println("<td>");
                    out.println("<a  class='btn btn-success btn-center' href='edit_bill.jsp?bill_id=" + rs.getInt("bill_id") + "'>Edit</a>");
                    out.println(" | ");
                    out.println("<a  class='btn btn-danger btn-center' href='DeleteBillServlet?bill_id=" + rs.getInt("bill_id") + "' onclick='return confirm(\"Are you sure?\")'>Delete</a>");
                    out.println("</td>");
                    out.println("</tr>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
                if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
            }
        %>
    </table>
</body>
</html>
