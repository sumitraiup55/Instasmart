<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Logout - InstaSmart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f9f9f9;
        }
        .logout-container {
            text-align: center;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            color: #007bff;
            margin-bottom: 20px;
        }
        p {
            font-size: 1.2rem;
            color: #555;
        }
        .spinner {
            border: 4px solid #f3f3f3;
            border-top: 4px solid #007bff;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            animation: spin 1s linear infinite;
            margin: 20px auto;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    </style>
    <script>
        // Redirect to login page after 3 seconds
        setTimeout(function() {
            window.location.href = "login.jsp";
        }, 3000);
    </script>
</head>
<body>
    <%
        // Invalidate the session
        HttpSession userSession = request.getSession(false);
        if (userSession != null) {
            userSession.invalidate();
        }
    %>
    <div class="logout-container">
        <h1>Logout Successful</h1>
        <p>You have been logged out successfully. Redirecting to the login page...</p>
        <div class="spinner"></div>
    </div>
</body>
</html>