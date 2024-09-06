<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <link rel="stylesheet" href="css/cbill.css">
   <style>
    body{
         background-image: url("images/2.jpg");
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
        int userId = Integer.parseInt(request.getParameter("user_id"));
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String username = "";
        String email = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/electricity_management", "root", "Pranoti3642");

            String query = "SELECT * FROM users WHERE user_id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                username = rs.getString("username");
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
    <form action="EditUserServlet" method="post">
     
        
        <div class="login-container">
      <div class="login-form">
        <h1 class="text-light fw-bold">Edit Bill</h1>
        
          <div class="input-group">
            <label for="username"></label>
            <input
              type="number"
              id="username"
              name="username"
              placeholder="Enter User_id"
              required style="padding:8px"
            />
          </div>
          
          <div class="input-group">
            <label for="username"></label>
            <input
              type="number"
              id="username"
              name="email"
              placeholder="Enter Email"
              required style="padding:8px"
            />
          </div>
        
        <div class="login">
            <button type="submit" class = "btn btn-lg btn-warning mx-2" value="update">Update</button>
          </div>
        
    </form>
</body>
</html>
