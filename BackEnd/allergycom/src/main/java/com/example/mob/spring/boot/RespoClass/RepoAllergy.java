package com.example.mob.spring.boot.RespoClass;

import com.example.mob.spring.boot.model.AllergyData;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface RepoAllergy extends MongoRepository<AllergyData,String> {
}
