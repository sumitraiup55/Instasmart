<%@ page import="java.sql.*" %>
<%@ page import="insta.DBConnection" %>
<%
    // Get form data from register.jsp
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String role = request.getParameter("role");

    // Validate input (basic validation)
    if (username == null || username.trim().isEmpty() ||
        password == null || password.trim().isEmpty() ||
        email == null || email.trim().isEmpty() ||
        role == null || role.trim().isEmpty()) {
        out.println("All fields are required. <a href='register.jsp'>Go back</a>");
        return;
    }

    // Database connection and insertion
    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Get database connection
        conn = DBConnection.getConnection();

        // SQL query to insert data into the users table
        String sql = "INSERT INTO users (username, password, email, role) VALUES (?, ?, ?, ?)";
        pstmt = conn.prepareStatement(sql);

        // Set parameters for the SQL query
        pstmt.setString(1, username);
        pstmt.setString(2, password);
        pstmt.setString(3, email);
        pstmt.setString(4, role);

        // Execute the query
        int rowsInserted = pstmt.executeUpdate();

        if (rowsInserted > 0) {
            // Registration successful
            out.println("Registration successful! <a href='login.html'>Login here</a>");
        } else {
            // Registration failed
            out.println("Registration failed. <a href='register.jsp'>Try again</a>");
        }
    } catch (Exception e) {
        // Handle errors
        e.printStackTrace();
        out.println("An error occurred. Please try again. <a href='register.jsp'>Go back</a>");
    } finally {
        // Close database resources
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>