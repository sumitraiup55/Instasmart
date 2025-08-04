
package insta;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

/**
 * Database connection class for MongoDB
 * Author: sumit
 */

public class DBConnection {
    private static MongoClient mongoClient = null;
    private static MongoDatabase database = null;

    public static MongoDatabase getDatabase() {
        if (mongoClient == null) {
            try {
                String uri = "mongodb+srv://sumitraiup555:Sumit123@cluster0.pi8v1hk.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0";
                mongoClient = MongoClients.create(uri);
                // Change 'instamart' to your actual database name if needed
                database = mongoClient.getDatabase("instamart");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return database;
    }
}