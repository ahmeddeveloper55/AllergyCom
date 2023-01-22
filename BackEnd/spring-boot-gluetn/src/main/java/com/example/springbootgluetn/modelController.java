package com.example.springbootgluetn;

import com.example.springbootgluetn.Repo.Data;
import com.example.springbootgluetn.Repo.repo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
@RestController
public class modelController {
    @Autowired
    public final repo rp;

    public modelController(repo rp) {
        this.rp = rp;
    }

    @RequestMapping(value = "/modelData",method = RequestMethod.GET)
    public List<Data> getlist(){
        return rp.findAll();
    }
}
