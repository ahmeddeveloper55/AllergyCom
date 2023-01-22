package com.example.mob.spring.boot.model;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
@Data
@Document(collection = "allergydb")
public class AllergyData {
    @Id
    private String id;
    private String des;
    private String imgurl;
    private String title;
    private String url;
}
