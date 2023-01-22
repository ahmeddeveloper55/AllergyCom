package com.example.glutenfreeapp;

import com.example.glutenfreeapp.Model.Data;
import com.example.glutenfreeapp.Repo.remotest1;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class modelController {
    @Autowired
    public final remotest1 rp;

    public modelController(remotest1 rp) {
        this.rp = rp;
    }

    @RequestMapping(value = "/allergy",method = RequestMethod.GET)
    public List<Data> getlist(){
        return rp.findAll();
    }


}
