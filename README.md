# Instasmart

Instasmart is a modern e-commerce web application built with Java Servlets, JSP, and MongoDB. It features a stylish UI, product modals with reviews, and full automation for build and deployment.

## Features
- User authentication and profile management
- Product catalog with modal popups and reviews/comments
- Shopping cart and checkout
- Notifications and recommendations
- Stylish, responsive UI
- MongoDB database integration
- Automated WAR packaging and Tomcat deployment

## Setup
1. Install Java (JDK 8+), Apache Tomcat, and MongoDB.
2. Place required JARs in `WEB-INF/lib`:
   - mongodb-driver-sync
   - bson
   - mongodb-driver-core
   - javax.servlet-api
3. Build WAR:
   ```sh
   jar cvf Instasmart.war -C build/classes . -C src/main/webapp .
   ```
4. Deploy WAR to Tomcat's `webapps` folder.
5. Start Tomcat and access at `http://localhost:8080/Instasmart`

## GitHub Actions
Basic CI workflow included for future automation.

## Author
Sumit Rai
