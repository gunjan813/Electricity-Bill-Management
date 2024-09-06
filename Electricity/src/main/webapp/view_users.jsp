<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
         .table>tbody {
    
    text-align: center;
}
    </style>
</head>
<body>
 <h2 class= "text-center mt-3">Manage Users</h2>
    <table  class="table table-striped mt-3 ">
     <thead class="table-dark text-center">
        <tr>
            <th>User ID</th>
            <th>Username</th>
            <th>Email</th>
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

                String query = "SELECT * FROM users";
                rs = stmt.executeQuery(query);

                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getInt("user_id") + "</td>");
                    out.println("<td>" + rs.getString("username") + "</td>");
                    out.println("<td>" + rs.getString("email") + "</td>");
                    out.println("<td>");
                    out.println("<a  class='btn btn-success btn-center' href='edit_user.jsp?user_id=" + rs.getInt("user_id") + "'>Edit</a>");
                    out.println(" | ");
                    out.println("<a   class='btn btn-danger btn-center' href='DeleteUserServlet?user_id=" + rs.getInt("user_id") + "' onclick='return confirm(\"Are you sure?\")'>Delete</a>");
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
