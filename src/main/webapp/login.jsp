<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - InstaSmart</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* General Styles */
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #ff9a9e, #fad0c4);
        }

        /* Login Container */
        .login-container {
            text-align: center;
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 400px;
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .login-container h1 {
            color: #ff6f61;
            margin-bottom: 20px;
            font-size: 2rem;
        }

        /* Form Styles */
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus {
            border-color: #ff6f61;
            outline: none;
        }

        /* Button Styles */
        .btn {
            width: 100%;
            padding: 12px;
            background: linear-gradient(135deg, #ff6f61, #ff9a9e);
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .btn:hover {
            background: linear-gradient(135deg, #ff9a9e, #ff6f61);
        }

        /* Error Message */
        .error-message {
            color: #ff0000;
            font-size: 0.9rem;
            margin-top: 10px;
            display: none;
        }

        /* Signup Link */
        .signup-link {
            margin-top: 20px;
            font-size: 0.9rem;
            color: #555;
        }

        .signup-link a {
            color: #ff6f61;
            text-decoration: none;
            font-weight: bold;
        }

        .signup-link a:hover {
            text-decoration: underline;
        }

        /* Responsive Styles */
        @media (max-width: 480px) {
            .login-container {
                padding: 20px;
            }

            .login-container h1 {
                font-size: 1.5rem;
            }
        }
    </style>
    <script>
        // Client-side form validation
        function validateForm() {
            const username = document.getElementById("username").value;
            const password = document.getElementById("password").value;
            const errorMessage = document.getElementById("error-message");

            if (username.trim() === "" || password.trim() === "") {
                errorMessage.textContent = "Please fill in all fields.";
                errorMessage.style.display = "block";
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <div class="login-container">
        <h1>Login to InstaSmart</h1>
        
        <!-- Display error message if login fails -->
        <%
            String error = (String) request.getAttribute("error");
            if (error != null) {
        %>
            <div class="error-message" id="error-message" style="display: block;">
                <%= error %>
            </div>
        <%
            } else {
        %>
            <div class="error-message" id="error-message"></div>
        <%
            }
        %>

        <!-- Login Form -->
        <form action="welcome.jsp" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter your username">
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password">
            </div>
            <button type="submit" class="btn">Login</button>
        </form>

        <!-- Signup Link -->
        <p class="signup-link">Don't have an account? <a href="register.jsp">Sign up here</a></p>
    </div>
</body>
</html>