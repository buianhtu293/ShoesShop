<%-- 
    Document   : accessDenied
    Created on : Jun 26, 2024, 1:32:09 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Access Denied</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card text-center">
                    <div class="card-header bg-danger text-white">
                        Access Denied
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">You do not have permission to view this page.</h5>
                        <p class="card-text"><strong>Error Code:</strong> <%= request.getAttribute("errorCode") %></p>
                        <p class="card-text"><strong>Error Message:</strong> <%= request.getAttribute("errorMessage") %></p>
                        <p class="card-text">Please contact the administrator if you believe this is an error.</p>
                        <a href="home" class="btn btn-primary">Go Home</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
