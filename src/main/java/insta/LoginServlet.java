package insta;

import java.io.IOException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import com.mongodb.client.model.Filters;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve username and password from the login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            MongoDatabase db = DBConnection.getDatabase();
            MongoCollection<Document> users = db.getCollection("users");
            Document userDoc = users.find(Filters.and(
                Filters.eq("username", username),
                Filters.eq("password", password)
            )).first();

            if (userDoc != null) {
                // User authenticated successfully
                HttpSession session = request.getSession();
                session.setAttribute("username", userDoc.getString("username"));
                session.setAttribute("email", userDoc.getString("email"));
                session.setAttribute("address", userDoc.getString("address"));
                response.sendRedirect("profile.jsp");
            } else {
                // Authentication failed
                request.setAttribute("error", "Invalid username or password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            // Close the database connection
            // ...existing code...
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}