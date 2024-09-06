<%@ page import="java.sql.*, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
      <link rel="stylesheet" href="css/adash.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <div class="container vh-100 d-flex flex-column mt-5 text-center">
        <h1 class="mb-4 text-light">Admin Dashboard</h1>
        <div class="mt-5">
            <a href="create_bill.jsp" class="btn btn-lg btn-warning mx-3 mb-2">Create New Bill</a>
            <a href="view_all_bills.jsp" class="btn btn-lg btn-success mx-3 mb-2">Bill Report</a>
            <a href="view_users.jsp" class="btn btn-lg btn-light mx-3 mb-2">Manage Users </a>
            <a href="admin_view_all_bill.jsp"  class="btn btn-lg btn-primary mx-3 mb-2">View All Bills</a><br>
            
            <a href="admin_logout.jsp" class="btn btn-lg btn-danger mx-3 mb-2">Logout</a>
        </div>
    </div>
</body>
</html>
