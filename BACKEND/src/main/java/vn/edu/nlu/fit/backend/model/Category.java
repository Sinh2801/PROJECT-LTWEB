package vn.edu.nlu.fit.backend.model;

import java.util.ArrayList;
import java.util.List;

public class Category {
    private int id;
    private String name;
    private List<Product> Products;

    public Category() {}

    public Category(int id, String name) {
        this.id = id;
        this.name = name;
        this.Products = new ArrayList<>();
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public List<Product> getProducts() {
        return Products;
    }
    public void setProducts(List<Product> products) {
        Products = products;
    }
}

