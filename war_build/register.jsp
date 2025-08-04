<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register - InstaSmart</title>
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

        /* Register Container */
        .register-container {
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

        .register-container h1 {
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

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #ff6f61;
            outline: none;
        }

        /* Gender Radio Buttons */
        .gender-group {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }

        .gender-group label {
            font-weight: normal;
            color: #555;
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

        /* Login Link */
        .login-link {
            margin-top: 20px;
            font-size: 0.9rem;
            color: #555;
        }

        .login-link a {
            color: #ff6f61;
            text-decoration: none;
            font-weight: bold;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        /* Responsive Styles */
        @media (max-width: 480px) {
            .register-container {
                padding: 20px;
            }

            .register-container h1 {
                font-size: 1.5rem;
            }
        }
    </style>
    <script>
        // Client-side form validation
        function validateForm() {
            const username = document.getElementById("username").value;
            const email = document.getElementById("email").value;
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirmPassword").value;
            const gender = document.querySelector('input[name="gender"]:checked');
            const errorMessage = document.getElementById("error-message");

            if (username.trim() === "" || email.trim() === "" || password.trim() === "" || confirmPassword.trim() === "" || !gender) {
                errorMessage.textContent = "Please fill in all fields.";
                errorMessage.style.display = "block";
                return false;
            }

            if (password !== confirmPassword) {
                errorMessage.textContent = "Passwords do not match.";
                errorMessage.style.display = "block";
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <div class="register-container">
        <h1>Create Your Account</h1>
        
        <!-- Display error message if registration fails -->
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

        <!-- Registration Form -->
        <form action="login.jsp" method="post" onsubmit="return validateForm()">
            <!-- Username -->
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" placeholder="Enter your username">
            </div>

            <!-- Email -->
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" placeholder="Enter your email">
            </div>

            <!-- Password -->
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" placeholder="Enter your password">
            </div>

            <!-- Confirm Password -->
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password">
            </div>

            <!-- Gender -->
            <div class="form-group">
                <label>Gender:</label>
                <div class="gender-group">
                    <label><input type="radio" name="gender" value="male"> Male</label>
                    <label><input type="radio" name="gender" value="female"> Female</label>
                    <label><input type="radio" name="gender" value="other"> Other</label>
                </div>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn">Register</button>
        </form>

        <!-- Login Link -->
        <p class="login-link">Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</body>
</html>