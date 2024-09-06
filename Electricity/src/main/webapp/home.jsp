<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="icon" href="images/Iullstration/favicon.png">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
      integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous" />
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    
    <section class="container-fluid " id="navbar">
        <div class="row">
          <div class="col col-12 p-0">
            <nav class="navbar navbar-expand-lg  fixed-top  bg-blue" id="nav" data-bs-theme="dark">
              <div class="container-fluid">
                <a class="navbar-brand" href="#"><img src="images/bulb-logo.png" style="width:150px; height: 75px;"
                    alt="image not found"></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                  data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                  aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item pe-5 fs-5">
                      <a class="nav-link active" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-itemp pe-5 fs-5">
                     <a  class="nav-link" href="user_dashboard.jsp">View Bills</a>
                    </li>
                    <li class="nav-itemp pe-5 fs-5">
                      <a class="nav-link" href="payment_history.jsp">Payment History</a>
                    </li>
                     <li  class="nav-itemp pe-5 fs-5">
                      <a  class="nav-link" href="view_profile.jsp">View Profile</a>
                      </li>
                    
                    <li class="nav-itemp pe-5 fs-5">
                      <a class="nav-link" href="#">Contact Us</a>
                    </li>
                   
                    <li class="nav-item">
                      <button class="btn  btn-warning btn-lg" type="submit"><a href="logout.jsp">Logout</button>
                    </li>
                  </ul>
                </div>
              </div>
            </nav>
          </div>
        </div>
      </section><!--navbar end-->
      
<!--Hero Section Start-->
<div class="container-fluid">
  <div class="row">
      <div class="col-12 p-0">
         
                      <img src="images/header.jpg" class="img-fluid w-100 " style="height: 690px " alt="...">
      </div>
  </div>
</div>
<!--End Hero Section-->

<section
class="container-fluid g-0 py-1 text-center" id="footer1">
<div class="container">
<div class="row">
  <p class="">© Copyright. All Rights Reserved 
    Designed by <span style="color: white;">(Gunjan Deshmukh)</span> </p>
</div>
</div>
</section>

      <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
    crossorigin="anonymous"></script>


</body>
</html>