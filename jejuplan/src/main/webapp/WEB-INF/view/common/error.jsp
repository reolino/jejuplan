<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>404 Error</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="/lib/bootstrap/iconfonts/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="/lib/bootstrap/iconfonts/ionicons/css/ionicons.css">
    <link rel="stylesheet" href="/lib/bootstrap/iconfonts/typicons/src/font/typicons.css">
    <link rel="stylesheet" href="/lib/bootstrap/iconfonts/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="/lib/bootstrap/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="/lib/bootstrap/css/vendor.bundle.addons.css">
    <!-- endinject -->
    <!-- inject:css -->
    <link rel="stylesheet" href="/lib/bootstrap/css/style.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="/lib/bootstrap/images/favicon.png" />
    <script src="/lib/bootstrap/js/jquery.min.js"></script>
  </head>
  <body>
    <div class="container-scroller">
      <div class="container-fluid page-body-wrapper full-page-wrapper">
        <div class="content-wrapper d-flex align-items-center text-center error-page bg-primary">
          <div class="row flex-grow">
            <div class="col-lg-7 mx-auto text-white">
              <div class="row align-items-center d-flex flex-row">
                <div class="col-lg-6 text-lg-right pr-lg-4">
                  <h1 class="display-1 mb-0">${code}</h1>
                </div>
                <div class="col-lg-6 error-page-divider text-lg-left pl-lg-4">
                  <h2>SORRY!</h2>
                  <h3 class="font-weight-light">${msg}</h3>
                  <h3 class="font-weight-light">${timestamp}</h3>
                </div>
              </div>
              <div class="row mt-5">
                <div class="col-12 text-center mt-xl-2">
                  <a class="text-white font-weight-medium" href="../../index.html">Back to home</a>
                </div>
              </div>
              <div class="row mt-5">
                <div class="col-12 mt-xl-2">
                  <p class="text-white font-weight-medium text-center">Copyright &copy; 2019 All rights reserved.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="/lib/bootstrap/js/vendor.bundle.base.js"></script>
    <script src="/lib/bootstrap/js/vendor.bundle.addons.js"></script>
    <!-- endinject -->
    <!-- inject:js -->
    <script src="/lib/bootstrap/js/off-canvas.js"></script>
    <script src="/lib/bootstrap/js/misc.js"></script>
    <!-- endinject -->
  </body>
</html>