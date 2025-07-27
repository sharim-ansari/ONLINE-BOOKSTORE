# Online Bookstore

## Overview
This is a mini online bookstore web application built using Java Servlets and JSP for the backend, MySQL for the database, and HTML/CSS for the frontend UI. The application allows users to browse books, manage a shopping cart, and handle user registration and login.

## Features
- User registration and login
- Browse and search for books
- View book details
- Add/remove books from the shopping cart
- Update quantities in the cart
- Checkout process for placing orders
- View past orders (user functionality)

## Project Structure
```
online-bookstore
├── src
│   ├── main
│   │   ├── java
│   │   │   └── com
│   │   │       └── bookstore
│   │   │           ├── controller
│   │   │           │   ├── BookServlet.java
│   │   │           │   ├── CartServlet.java
│   │   │           │   └── UserServlet.java
│   │   │           ├── dao
│   │   │           │   ├── BookDAO.java
│   │   │           │   ├── CartDAO.java
│   │   │           │   └── UserDAO.java
│   │   │           ├── model
│   │   │           │   ├── Book.java
│   │   │           │   ├── Cart.java
│   │   │           │   └── User.java
│   │   │           └── util
│   │   │               └── DBUtil.java
│   │   ├── resources
│   │   │   └── db.properties
│   │   └── webapp
│   │       ├── WEB-INF
│   │       │   ├── web.xml
│   │       │   └── lib
│   │       ├── css
│   │       │   └── style.css
│   │       ├── index.jsp
│   │       ├── login.jsp
│   │       ├── register.jsp
│   │       ├── books.jsp
│   │       ├── cart.jsp
│   │       └── checkout.jsp
├── pom.xml
└── README.md
```

## Setup Instructions
1. **Clone the repository**: 
   ```
   git clone <repository-url>
   ```

2. **Database Setup**:
   - Create a MySQL database named `online_bookstore`.
   - Import the SQL schema provided in the `db.sql` file (if available) to create the necessary tables.

3. **Configure Database Connection**:
   - Update the `src/main/resources/db.properties` file with your MySQL database connection details:
     ```
     db.url=jdbc:mysql://localhost:3306/online_bookstore
     db.username=<your-username>
     db.password=<your-password>
     ```

4. **Build the Project**:
   - Navigate to the project directory and run:
   ```
   mvn clean install
   ```

5. **Deploy the Application**:
   - Deploy the generated WAR file to a servlet container (e.g., Apache Tomcat).

6. **Access the Application**:
   - Open a web browser and go to `http://localhost:8080/online-bookstore`.

## Technologies Used
- Java
- Servlets and JSP
- MySQL
- HTML/CSS
- Maven

## License
This project is licensed under the MIT License.