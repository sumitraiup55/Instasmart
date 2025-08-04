<%@ page import="java.sql.*" %>
<%@ page import="insta.DBConnection" %>
<%
    // Get form data from login.jsp
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Validate input (basic validation)
    if (username == null || username.trim().isEmpty() ||
        password == null || password.trim().isEmpty()) {
        out.println("Username and password are required. <a href='login.jsp'>Go back</a>");
        return;
    }

    // Database connection and query
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // Get database connection
        conn = DBConnection.getConnection();

        // SQL query to check if the user exists
        String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);

        // Set parameters for the SQL query
        pstmt.setString(1, username);
        pstmt.setString(2, password);

        // Execute the query
        rs = pstmt.executeQuery();

        if (rs.next()) {
            // Login successful
            String role = rs.getString("role");

            // Store user information in the session
            session.setAttribute("username", username);
            session.setAttribute("role", role);

            // Redirect based on role
            if (role.equals("admin")) {
                response.sendRedirect("adminWelcome.jsp"); // Redirect to admin page
            } else {
                response.sendRedirect("welcome.jsp"); // Redirect to user page
            }
        } else {
            // Login failed
            out.println("Invalid username or password. <a href='login.jsp'>Try again</a>");
        }
    } catch (Exception e) {
        // Handle errors
        e.printStackTrace();
        out.println("An error occurred. Please try again. <a href='login.jsp'>Go back</a>");
    } finally {
        // Close database resources
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
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