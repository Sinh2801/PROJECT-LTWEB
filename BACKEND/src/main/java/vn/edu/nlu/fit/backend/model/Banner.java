package vn.edu.nlu.fit.backend.model;

public class Banner {
    private int id;
    private String imageUrl;
    private String title;
    private int position;
    private boolean status;

    // getter & setter


    public Banner(int id, String imageUrl, String title, int position, boolean status) {
        this.id = id;
        this.imageUrl = imageUrl;
        this.title = title;
        this.position = position;
        this.status = status;
    }
    public Banner() {}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPosition() {
        return position;
    }

    public void setPosition(int position) {
        this.position = position;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
