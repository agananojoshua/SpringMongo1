package com.example.demo.repo;

import com.example.demo.entity.Student;
//import demp.example.demo.entity.Student;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface StudentRepo extends MongoRepository<Student, String> {
}
