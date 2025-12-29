package vn.edu.nlu.fit.backend.cart;

import java.io.Serializable;

public class CartItem  implements Serializable {
    private Product product;
    private double price;
    private int quantity;

    public CartItem(Product product, double price, int quantity) {
        this.product = product;
        this.price = price;
        this.quantity = quantity;

    }

    public CartItem() {
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public void upQuantity(int quantity) {
        this.quantity += quantity;
    }
}