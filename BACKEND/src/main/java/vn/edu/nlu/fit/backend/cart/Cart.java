package vn.edu.nlu.fit.backend.cart;

import vn.edu.nlu.fit.backend.model.Product;
import vn.edu.nlu.fit.backend.model.User;

import java.io.Serializable;
import java.util.*;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;

import static javax.swing.UIManager.get;

public class Cart implements Serializable {

    private Map<Integer, CartItem> data = new HashMap<>();
    private User user;

    public Cart() {
     data = new HashMap<>();
    }


    public void addItem(Product product , int quantity) {

        if (quantity <= 0) {quantity = 1;}
        if (get(product.getId()) != null)
        data.get(product.getId()).upQuantity(quantity);
        else
            data.put(product.getId(), new CartItem(product, product.getPrice(), quantity));

        }

    public boolean  updateItem(int productId , int quantity) {
        if (get(productId) == null) return false;
        if (quantity <= 0) {quantity = 1;}
        data.get(productId).setQuantity(quantity);
        return true;
    }

    public CartItem removeItem(int productId) {
        if (get(productId) == null) return null;
        return data.remove(productId);

    }

    public List<CartItem> removeAllItems() {
        ArrayList<CartItem> cartItems = new ArrayList<>(data.values());
        data.clear();
        return cartItems;
    }

    public List<CartItem> getItems() {
        return new ArrayList<>(data.values());
    }

    public CartItem getItem(int productId) {
        return data.get(productId);
    }



    public int totalQuantity() {
        AtomicInteger total = new AtomicInteger();
        // Duyệt qua danh sách các món hàng (data.values())
        data.values().forEach(item -> {
            total.addAndGet(item.getQuantity()); // Cộng dồn số lượng từng món
        });
        return total.get();
    }


    public double total() {
        AtomicReference<Double> total = new AtomicReference<>((double) 0);
        // Duyệt qua từng CartItem để tính tiền
        data.values().forEach(item -> {
            total.updateAndGet(v -> v + (item.getQuantity() * item.getPrice()));
        });
        return total.get();
    }

    public void updateCustomerInfor (User user) {
        this.user = user;

    }
    }


