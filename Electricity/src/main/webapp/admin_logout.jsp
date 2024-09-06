<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logout</title>
</head>
<body>
    <%
       
        session.invalidate();
        response.sendRedirect("index.jsp");
    %>
</body>
</html>
