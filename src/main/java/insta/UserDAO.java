
package insta;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import org.bson.Document;
import com.mongodb.client.model.Filters;

public class UserDAO {
    public boolean registerUser(User user) {
        try {
            MongoDatabase db = DBConnection.getDatabase();
            MongoCollection<Document> users = db.getCollection("users");
            Document doc = new Document("username", user.getUsername())
                    .append("password", user.getPassword())
                    .append("email", user.getEmail())
                    .append("role", user.getRole());
            users.insertOne(doc);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public User loginUser(String username, String password) {
        try {
            MongoDatabase db = DBConnection.getDatabase();
            MongoCollection<Document> users = db.getCollection("users");
            Document doc = users.find(Filters.and(
                    Filters.eq("username", username),
                    Filters.eq("password", password))).first();
            if (doc != null) {
                User user = new User();
                user.setUsername(doc.getString("username"));
                user.setRole(doc.getString("role"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}