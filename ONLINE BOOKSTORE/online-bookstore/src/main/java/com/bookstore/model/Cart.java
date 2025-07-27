package com.bookstore.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items;
    private double totalPrice;

    public Cart() {
        this.items = new ArrayList<>();
        this.totalPrice = 0.0;
    }

    public void addItem(Book book, int quantity) {
        CartItem item = new CartItem(book, quantity);
        items.add(item);
        totalPrice += book.getPrice() * quantity;
    }

    public void removeItem(Book book) {
        for (CartItem item : items) {
            if (item.getBook().equals(book)) {
                totalPrice -= item.getBook().getPrice() * item.getQuantity();
                items.remove(item);
                break;
            }
        }
    }

    public void updateItemQuantity(Book book, int quantity) {
        for (CartItem item : items) {
            if (item.getBook().equals(book)) {
                totalPrice -= item.getBook().getPrice() * item.getQuantity();
                item.setQuantity(quantity);
                totalPrice += item.getBook().getPrice() * quantity;
                break;
            }
        }
    }

    public List<CartItem> getItems() {
        return items;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void clear() {
        items.clear();
        totalPrice = 0.0;
    }
}

class CartItem {
    private Book book;
    private int quantity;

    public CartItem(Book book, int quantity) {
        this.book = book;
        this.quantity = quantity;
    }

    public Book getBook() {
        return book;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}