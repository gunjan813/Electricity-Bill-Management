<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Bill</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
 <link rel="stylesheet" href="css/cbill.css">
</head>
<body>
  
 <div class="login-container">
      <div class="login-form">
        <h1 class="text-dark fw-bold">Create Bill</h1>
        <form action ="CreateBillServlet" method="post">
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

          <div class="login">
            <button type="submit" value="Create Bill">Create Bill</button>
          </div>
        </form>
       
      </div>
    </div>

</body>
</html>


