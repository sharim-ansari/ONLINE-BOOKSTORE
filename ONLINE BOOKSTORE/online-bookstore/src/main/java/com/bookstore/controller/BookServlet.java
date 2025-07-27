package com.bookstore.controller;

import com.bookstore.dao.BookDAO;
import com.bookstore.model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/books")
public class BookServlet extends HttpServlet {
    private BookDAO bookDAO;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            listBooks(request, response);
        } else if (action.equals("view")) {
            viewBook(request, response);
        }
    }

    private void listBooks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> bookList = bookDAO.getAllBooks();
        request.setAttribute("bookList", bookList);
        request.getRequestDispatcher("books.jsp").forward(request, response);
    }

    private void viewBook(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookId = Integer.parseInt(request.getParameter("id"));
        Book book = bookDAO.getBookById(bookId);
        request.setAttribute("book", book);
        request.getRequestDispatcher("bookDetail.jsp").forward(request, response);
    }
}