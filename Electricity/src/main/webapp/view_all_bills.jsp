<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Bills</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
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

<div class="container vh-100 d-flex flex-column mt-4 text-center">
    <h2 class="mb-4 text-light">View Bills</h2>
    <div class="mt-4">
        <a href="ViewBillsServlet?status=paid" class="btn btn-lg btn-success mx-2">View Paid Bills</a>
        <a href="ViewBillsServlet?status=unpaid" class="btn btn-lg btn-danger mx-2">View Unpaid Bills</a>
    </div>
</div>

</body>
</html>
