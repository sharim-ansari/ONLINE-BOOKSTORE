<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.bookstore.model.Cart" %>
<%@ page import="com.bookstore.model.User" %>
<%@ page import="com.bookstore.dao.CartDAO" %>
<%@ page import="com.bookstore.util.DBUtil" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.List" %>

<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    CartDAO cartDAO = new CartDAO();
    List<Cart> cartItems = cartDAO.getCartItems(user.getId());
    double totalPrice = 0;

    for (Cart item : cartItems) {
        totalPrice += item.getBook().getPrice() * item.getQuantity();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Checkout</title>
</head>
<body>
    <div class="container">
        <h1>Checkout</h1>
        <h2>Hello, <%= user.getUsername() %></h2>
        <h3>Your Cart Items:</h3>
        <table>
            <tr>
                <th>Book Title</th>
                <th>Quantity</th>
                <th>Price</th>
            </tr>
            <%
                for (Cart item : cartItems) {
            %>
            <tr>
                <td><%= item.getBook().getTitle() %></td>
                <td><%= item.getQuantity() %></td>
                <td>$<%= item.getBook().getPrice() * item.getQuantity() %></td>
            </tr>
            <%
                }
            %>
        </table>
        <h3>Total Price: $<%= totalPrice %></h3>
        <form action="OrderServlet" method="post">
            <input type="hidden" name="totalPrice" value="<%= totalPrice %>">
            <button type="submit">Confirm Order</button>
        </form>
    </div>
</body>
</html>