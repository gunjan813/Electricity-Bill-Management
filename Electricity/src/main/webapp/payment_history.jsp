<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment History</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
         .table>tbody {
    
    text-align: center;
}
    </style>
</head>
<body>
    
    <h2 class= "text-center mt-3">Payment History</h2>
    <table  class="table table-striped mt-3 ">
     <thead class="table-dark text-center">
       <tr>
            <th>Payment ID</th>
            <th>Bill ID</th>
            <th>Payment Date</th>
            <th>Amount</th>
        </tr>
        </thead>
        
        <%
            
            Integer userId = (Integer) session.getAttribute("user_id");
            if (userId != null) {
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost/electricity_management", "root", "Pranoti3642");
                    stmt = conn.createStatement();

                    String query = "SELECT p.payment_id, p.bill_id, p.payment_date, p.amount " +
                                   "FROM payments p JOIN bills b ON p.bill_id = b.bill_id " +
                                   "WHERE b.user_id = " + userId;
                    rs = stmt.executeQuery(query);

                    while (rs.next()) {
                        out.println("<tr>");
                        out.println("<td>" + rs.getInt("payment_id") + "</td>");
                        out.println("<td>" + rs.getInt("bill_id") + "</td>");
                        out.println("<td>" + rs.getDate("payment_date") + "</td>");
                        out.println("<td>" + rs.getDouble("amount") + "</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
                    if (stmt != null) try { stmt.close(); } catch (Exception e) { e.printStackTrace(); }
                    if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
                }
            } else {
                out.println("You need to log in first.");
            }
        %>
    </table>
    <div class="d-flex justify-content-center">
    <button  type="button" class="btn btn-info btn-center"> <a class="text-decoration-none text-white" href="user_dashboard.jsp">Back to Dashboard</a></button>
</div>
</body>
</html>
