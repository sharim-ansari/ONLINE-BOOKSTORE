<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bookstore.model.Book" %>
<%@ page import="com.bookstore.dao.BookDAO" %>
<%
    BookDAO bookDAO = new BookDAO();
    List<Book> bookList = bookDAO.getAllBooks();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Bookstore - Books</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <h1>Online Bookstore</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="books.jsp">Books</a></li>
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <h2>Available Books</h2>
        <div class="book-list">
            <%
                for (Book book : bookList) {
            %>
                <div class="book-item">
                    <img src="<%= book.getCoverImage() %>" alt="<%= book.getTitle() %>">
                    <h3><%= book.getTitle() %></h3>
                    <p>Author: <%= book.getAuthor() %></p>
                    <p>Price: $<%= book.getPrice() %></p>
                    <p><%= book.getDescription() %></p>
                    <a href="BookServlet?id=<%= book.getId() %>">View Details</a>
                </div>
            <%
                }
            %>
        </div>
    </main>
    <footer>
        <p>&copy; 2023 Online Bookstore. All rights reserved.</p>
    </footer>
</body>
</html>