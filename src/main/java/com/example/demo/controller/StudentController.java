package com.example.demo.controller;

import com.example.demo.entity.Student;
import com.example.demo.services.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin(origins = "*")
@RequestMapping("api/v1/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @PostMapping(value = "/save")
    private String saveStudent(@RequestBody Student students)
    {

        studentService.saveorUpdate(students);
        return students.getId();
    }

    @GetMapping(value = "/getAll")
    private Iterable<Student>getStudent()
    {
        return studentService.litAll();
    }

    @PutMapping(value = "/edit/{id}")
    private Student update(@RequestBody Student student, @PathVariable(name = "id")String id)
    {
        student.setId(id);
        studentService.saveorUpdate(student);
        return student;

    }

    @DeleteMapping("delete/{id}")
    private void deleteStudent(@PathVariable("id")String id)
    {
        studentService.deleteStudent(id);

    }

    @RequestMapping("/search/{id}")
    private Student getStudent(@PathVariable(name = "id")String studentid)
    {
        return studentService.getStudentByID(studentid);
    }

}
