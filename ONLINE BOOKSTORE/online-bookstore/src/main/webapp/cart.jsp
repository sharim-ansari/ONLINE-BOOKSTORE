<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.bookstore.model.Cart" %>
<%@ page import="com.bookstore.model.Book" %>
<%@ page import="com.bookstore.dao.CartDAO" %>
<%@ page import="com.bookstore.dao.BookDAO" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    HttpSession session = request.getSession();
    Cart cart = (Cart) session.getAttribute("cart");
    if (cart == null) {
        cart = new Cart();
    }
    List<Book> cartItems = cart.getItems();
    double totalPrice = cart.getTotalPrice();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/style.css">
    <title>Your Shopping Cart</title>
</head>
<body>
    <h1>Your Shopping Cart</h1>
    <table>
        <thead>
            <tr>
                <th>Title</th>
                <th>Author</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (cartItems.isEmpty()) {
            %>
                <tr>
                    <td colspan="5">Your cart is empty.</td>
                </tr>
            <%
                } else {
                    for (Book book : cartItems) {
            %>
                <tr>
                    <td><%= book.getTitle() %></td>
                    <td><%= book.getAuthor() %></td>
                    <td><%= book.getPrice() %></td>
                    <td><%= cart.getQuantity(book) %></td>
                    <td>
                        <form action="CartServlet" method="post">
                            <input type="hidden" name="action" value="remove">
                            <input type="hidden" name="bookId" value="<%= book.getId() %>">
                            <input type="submit" value="Remove">
                        </form>
                    </td>
                </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    <h2>Total Price: $<%= totalPrice %></h2>
    <form action="checkout.jsp" method="get">
        <input type="submit" value="Proceed to Checkout">
    </form>
    <a href="books.jsp">Continue Shopping</a>
</body>
</html>