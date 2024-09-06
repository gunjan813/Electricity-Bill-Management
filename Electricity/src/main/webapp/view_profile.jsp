<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Profile</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
    body{
         background-image: url("images/bc.jpg");
       background-position: center;
        background-size: cover;
         background-position: center;
            background-repeat: no-repeat;
            height:437px;
            }
           
    </style> 
    
</head>
<body>
    <h1 class="text-white">View Profile</h1>
    <%
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String username = (String) session.getAttribute("username");
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String email = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/electricity_management", "root", "Pranoti3642");

            String query = "SELECT * FROM users WHERE username = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, username);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                email = rs.getString("email");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
        %>
        <div>
            <label for="username" class="text-white">Username:</label>
            <input type="text" id="username"  value="<%= username %>" readonly>
        </div>
        <div>
            <label for="email" class="text-white">Email:</label>
            <input type="email" id="email" class="w-25" value="<%= email %>" readonly>
        </div>
        <a href="edit_profile.jsp" class="btn btn-lg btn-warning mx-3 mb-2">Edit Profile</a>
    </div>
    
    </body>
</html>
