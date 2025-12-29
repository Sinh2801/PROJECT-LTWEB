package vn.edu.nlu.fit.backend.cart;

import java.io.Serializable;
import java.util.*;

import static javax.swing.UIManager.get;

public class Cart implements Serializable {

    private Map<Integer, CartItem> data = new HashMap<>();

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

    public CartItem getItem(int productId) {
        return data.get(productId);
    }

    }


