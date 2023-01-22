package com.example.springbootgluetn.Repo;

import org.springframework.data.mongodb.repository.MongoRepository;
public interface repo extends MongoRepository<Data, String> {
}
