<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Bill</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <link rel="stylesheet" href="css/cbill.css">
 
     <style>
    body{
         background-image: url("images/9.jpg");
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
        int billId = Integer.parseInt(request.getParameter("bill_id"));
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int userId = 0;
        double unitsConsumed = 0.0;
        double billAmount = 0.0;
        boolean paid = false;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/electricity_management", "root", "Pranoti3642");

            String query = "SELECT * FROM bills WHERE bill_id = ?";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, billId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                userId = rs.getInt("user_id");
                unitsConsumed = rs.getDouble("units_consumed");
                billAmount = rs.getDouble("bill_amount");
                paid = rs.getBoolean("paid");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
            if (conn != null) try { conn.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    %>
   
      <form action="EditBillServlet" method="post">
    <div class="login-container">
      <div class="login-form">
        <h1 class="text-light fw-bold">Edit Bill</h1>
        <form action ="CreateBillServlet" method="post">
        
          <div class="input-group">
            <label for="username"></label>
            <input
              type="number"
              id="username"
              name="bill_id"
              placeholder="Enter User_id"
              required style="padding:8px"
            />
          </div>
          
          <div class="input-group">
            <label for="username"></label>
            <input
              type="number"
              id="username"
              name="user_id"
              placeholder="Enter User_id"
              required style="padding:8px"
            />
          </div>

          <div class="input-group otp-group" style="margin-bottom: 10px">
            <label for="password"></label>
            <input
              type="number"
              id="password"
              name="units_consumed"
              placeholder="Enter Unit Consumed"
              style="padding:8px"
              required
            />
          </div>
          
          <div class="input-group">
            <label for="username"></label>
            <input
              type="number"
              id="username"
              name="bill_amount"
              placeholder="Enter User_id"
              required style="padding:8px"
            />
          </div>
          
          <div class="input-group">
            <label for="username"></label>
            <input
              type="number"
              id="username"
              name="paid"
              placeholder="Enter User_id"
              required style="padding:8px"
            />
          </div>

          <div class="login">
            <button type="submit" class = "btn btn-lg btn-warning mx-2" value="update">Update</button>
          </div>
        </form>
       
      </div>
    </div>
    
</body>
</html>
