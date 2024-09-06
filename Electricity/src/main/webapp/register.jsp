<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel="stylesheet" href="css/register.css" />
</head>
<body>
    
 <div class="register-container">
      <div class="register-form">
        <h1>Register</h1>
         <form action="RegisterServlet" method="post">
          <div class="input-group">
            <label for="username">Username</label>
            <input
              type="text"
              id="username"
              name="username"
              placeholder="Enter your username"
              required
            />
          </div>
          
            <div class="input-group">
          <label for="email">Email:</label>
        <input type="email" id="email" name="email"  placeholder="Enter your username" required>
        
          </div>
          

          <div class="input-group">
            <label for="password">Password</label>
            <input
              type="password"
              id="password"
              name="password"
              placeholder="Enter your password"
              required
            />
          </div>
          
          <div class="register">
            <button type="submit">Register</button>
          </div>
    </form>
    <a href="login.jsp">Login</a>
</body>
</html>
