<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="css/admin_login.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
      integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous" />
    
</head>
<body>
    <div class="login-container">
      <div class="login-form">
       <h1>Admin Login</h1>
    <form action="AdminLoginServlet" method="post">
    
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
              type="text"
              id="password"
              name="password"
              placeholder="Password"
              required
            />
          </div>

          <div class="login">
            <button type="submit">Login</button>
          </div>
        </form>
    
    </form>

    <a class="text-white ms-5" href="index.jsp">Back to Home</a>
    
</body>
</html>
