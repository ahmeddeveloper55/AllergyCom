package com.example.mob.spring.boot;

import com.example.mob.spring.boot.RespoClass.RepoAllergy;
import com.example.mob.spring.boot.model.AllergyData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@org.springframework.web.bind.annotation.RestController
public class RestController {
    @Autowired
    public final RepoAllergy repoAllergy;

    public RestController(RepoAllergy repoAllergy) {
        this.repoAllergy = repoAllergy;
    }
    @RequestMapping(value = "/allergy",method = RequestMethod.GET)
    public List<AllergyData> getData(){
        return repoAllergy.findAll();
    }

}
