<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
 <link rel="stylesheet" href="css/login.css">
</head>
<body>

 <div class="login-container">
      <div class="login-form">
        <h1>Login</h1>
        <form action ="LoginServlet" method="post">
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
        <div class="register-link">
          <p>New user? <a href="register.jsp">Register here</a></p>
        </div>
      </div>
    </div>

</body>
</html>
