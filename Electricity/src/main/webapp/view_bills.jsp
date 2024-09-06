<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Bills</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
         .table>tbody {
    
    text-align: center;
}
    </style>
</head>
<body>
    
     <h2 class= "text-center mt-3">Bills List</h2>
    <table  class="table table-striped mt-3 ">
     <thead class="table-dark text-center">
        <tr>
            <th>Bill ID</th>
            <th>User ID</th>
            <th>Units Consumed</th>
            <th>Bill Amount</th>
            <th>Paid</th>
        </tr>
        </thead>
        <%
            String status = request.getParameter("status");
            Connection conn = null;
            Statement stmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost/electricity_management", "root", "Pranoti3642");
                stmt = conn.createStatement();

                String query = "SELECT * FROM bills WHERE paid = " + (status.equals("paid") ? "TRUE" : "FALSE");
                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("bill_id") + "</td>");
                    out.println("<td>" + rs.getInt("user_id") + "</td>");
                    out.println("<td>" + rs.getDouble("units_consumed") + "</td>");
                    out.println("<td>" + rs.getDouble("bill_amount") + "</td>");
                    out.println("<td>" + (rs.getBoolean("paid") ?"<button class='btn btn-success'> Yes</button>" :"<button class='btn btn-danger'> No</button>") + "</td>");
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
    <div class="d-flex justify-content-center">
     <button  type="button" class="btn btn-info btn-center"><a class="text-decoration-none text-white" href="admin_dashboard.jsp">Back to Dashboard</a></button>
</div>
</body>
</html>
