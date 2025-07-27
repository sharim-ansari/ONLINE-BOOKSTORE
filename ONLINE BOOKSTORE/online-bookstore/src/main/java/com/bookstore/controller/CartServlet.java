package com.bookstore.controller;

import com.bookstore.dao.CartDAO;
import com.bookstore.model.Cart;
import com.bookstore.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private CartDAO cartDAO;

    public void init() {
        cartDAO = new CartDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if (user != null) {
            Cart cart = cartDAO.getCartByUserId(user.getId());
            request.setAttribute("cart", cart);
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        if (user != null) {
            switch (action) {
                case "add":
                    int bookIdToAdd = Integer.parseInt(request.getParameter("bookId"));
                    cartDAO.addBookToCart(user.getId(), bookIdToAdd);
                    break;
                case "remove":
                    int bookIdToRemove = Integer.parseInt(request.getParameter("bookId"));
                    cartDAO.removeBookFromCart(user.getId(), bookIdToRemove);
                    break;
                case "update":
                    int bookIdToUpdate = Integer.parseInt(request.getParameter("bookId"));
                    int quantity = Integer.parseInt(request.getParameter("quantity"));
                    cartDAO.updateBookQuantity(user.getId(), bookIdToUpdate, quantity);
                    break;
            }
            response.sendRedirect("cart");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}