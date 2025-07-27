<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Bookstore</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <header>
        <h1>Welcome to the Online Bookstore</h1>
        <nav>
            <ul>
                <li><a href="index.jsp">Home</a></li>
                <li><a href="books.jsp">Browse Books</a></li>
                <li><a href="cart.jsp">Shopping Cart</a></li>
                <li><a href="login.jsp">Login</a></li>
                <li><a href="register.jsp">Register</a></li>
            </ul>
        </nav>
    </header>
    <main>
        <section>
            <h2>Featured Books</h2>
            <div class="book-list">
                <%-- Here you can dynamically load featured books from the database using a servlet --%>
                <div class="book-item">
                    <img src="path/to/book-cover.jpg" alt="Book Title">
                    <h3>Book Title</h3>
                    <p>Author: Author Name</p>
                    <p>Price: $XX.XX</p>
                    <a href="books.jsp?bookId=1">View Details</a>
                </div>
                <div class="book-item">
                    <img src="path/to/book-cover.jpg" alt="Book Title">
                    <h3>Book Title</h3>
                    <p>Author: Author Name</p>
                    <p>Price: $XX.XX</p>
                    <a href="books.jsp?bookId=2">View Details</a>
                </div>
                <%-- Add more book items as needed --%>
            </div>
        </section>
    </main>
    <footer>
        <p>&copy; 2023 Online Bookstore. All rights reserved.</p>
    </footer>
</body>
</html>