package vn.edu.nlu.fit.backend.model;

import java.sql.Timestamp;

public class Promotion {
    private int id;
    private int productId;
    private int discountPercent;
    private Timestamp startDate;
    private Timestamp endDate;

    public Promotion() {}

    public Promotion(int id, int productId, int discountPercent, Timestamp startDate, Timestamp endDate) {
        this.id = id;
        this.productId = productId;
        this.discountPercent = discountPercent;
        this.startDate = startDate;
        this.endDate = endDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getDiscountPercent() {
        return discountPercent;
    }

    public void setDiscountPercent(int discountPercent) {
        this.discountPercent = discountPercent;
    }

    public Timestamp getStartDate() {
        return startDate;
    }

    public void setStartDate(Timestamp startDate) {
        this.startDate = startDate;
    }

    public Timestamp getEndDate() {
        return endDate;
    }

    public void setEndDate(Timestamp endDate) {
        this.endDate = endDate;
    }
}
