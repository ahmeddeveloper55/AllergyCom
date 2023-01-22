package com.example.springbootgluetn.Repo;



import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "modelData")
public
class Data {
    @Id
    public String _id;
    public String number;
    public String description;
    public String category;
    public String status;

    public String get_id() {
        return _id;
    }

    public void set_id(String _id) {
        this._id = _id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Data(String _id, String number, String description, String category, String status) {
        this._id = _id;
        this.number = number;
        this.description = description;
        this.category = category;
        this.status = status;
    }
}

