<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Retrieve updated profile details from the request
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String address = request.getParameter("address");

    // Update the session with the new profile details
    session.setAttribute("username", username);
    session.setAttribute("email", email);
    session.setAttribute("address", address);

    // Redirect back to the profile page
    response.sendRedirect("welcome.jsp");
%>