package com.example.greenApi.Model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "greenplants")
public class Data {
    @Id
    private String id;
    private String discription;
    private String title;

    private String height;
    private String temprature;
    private String image;
    private String pot;
    private String price;

    public Data(String id, String discription, String title, String height, String temprature, String image, String pot, String price) {
        this.id = id;
        this.discription = discription;
        this.title = title;
        this.height = height;
        this.temprature = temprature;
        this.image = image;
        this.pot = pot;
        this.price = price;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getTemprature() {
        return temprature;
    }

    public void setTemprature(String temprature) {
        this.temprature = temprature;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getPot() {
        return pot;
    }

    public void setPot(String pot) {
        this.pot = pot;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }
}