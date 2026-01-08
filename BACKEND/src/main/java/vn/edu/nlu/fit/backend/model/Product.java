package vn.edu.nlu.fit.backend.model;

public class Product {
    private int id;
    private Integer categoryId;
    private String name;
    private String description;
    private double originalPrice;
    private String imageUrl;
    private int stockQuantity;
    private int totalSold;
    private double avgRating;
    private int reviewCount;

    public Product() {}

    public Product(int id, Integer categoryId, String name, String description,
                   double originalPrice, String imageUrl, int stockQuantity,
                   int totalSold, double avgRating, int reviewCount) {
        this.id = id;
        this.categoryId = categoryId;
        this.name = name;
        this.description = description;
        this.originalPrice = originalPrice;
        this.imageUrl = imageUrl;
        this.stockQuantity = stockQuantity;
        this.totalSold = totalSold;
        this.avgRating = avgRating;
        this.reviewCount = reviewCount;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public int getTotalSold() {
        return totalSold;
    }

    public void setTotalSold(int totalSold) {
        this.totalSold = totalSold;
    }

    public double getAvgRating() {
        return avgRating;
    }

    public void setAvgRating(double avgRating) {
        this.avgRating = avgRating;
    }

    public int getReviewCount() {
        return reviewCount;
    }

    public void setReviewCount(int reviewCount) {
        this.reviewCount = reviewCount;
    }
}
