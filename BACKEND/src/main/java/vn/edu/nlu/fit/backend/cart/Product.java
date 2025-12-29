package vn.edu.nlu.fit.backend.cart;

public class Product {
    private int id;
    private String productName;
    private double price;
    private double oldPrice;
    private String image;
    private int categoryId;

    // Constructor không đối số
    public Product() {}

    public Product(int id, String productName, double price, double oldPrice, String image, int categoryId) {
        this.id = id;
        this.productName = productName;
        this.price = price;
        this.oldPrice = oldPrice;
        this.image = image;
        this.categoryId = categoryId;
    }

    public int getId() {
        return id;
    }

    public String getProductName() {
        return productName;
    }

    public double getPrice() {
        return price;
    }

    public double getOldPrice() {
        return oldPrice;
    }

    public String getImage() {
        return image;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setOldPrice(double oldPrice) {
        this.oldPrice = oldPrice;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}