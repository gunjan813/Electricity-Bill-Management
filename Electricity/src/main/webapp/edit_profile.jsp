<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile</title>
     <link rel="stylesheet" href="css/login.css">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
    body{
         background-image: url("images/ba.jpg");
       background-position: center;
        background-size: cover;
         background-position: center;
            background-repeat: no-repeat;
            height:437px;
            }
           
    </style> 
</head>
<body>
    
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
    <form action="EditProfileServlet" method="post">
    <h1 class="text-light mb-3">Edit Profile</h1>
        <div class="input-group">
            <label for="username"></label>
            <input
              type="text"
              id="username"
              name="username"
              placeholder="Username"
              required
            />
          </div>
       
          <div class="input-group otp-group" style="margin-bottom: 10px">
            <label for="password"></label>
            <input
              type="email"
              id="email"
              name="email"
              placeholder="email"
              required
            />
        
          <div class="input-group otp-group" style="margin-bottom: 10px">
            <label for="password"></label>
            <input
              type="text"
              id="password"
              name="password"
              placeholder="Password"
              required
            />
        <input type="submit" value="Update"  class="btn btn-lg btn-warning mx-3 mb-2">
    </form>
</body>
</html>
