package com.example.edutrackinsight.controllers;

import com.example.edutrackinsight.models.Classroom;
import com.example.edutrackinsight.models.Student;
import com.example.edutrackinsight.services.ClassroomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/classrooms")
public class ClassroomController {

    @Autowired
    private ClassroomService classroomService;

    // Endpoint to join the classroom using class code
    @PostMapping("/join")
    public ResponseEntity<Classroom> joinClass(@RequestParam String classCode, @RequestBody Student student) {
        Classroom classroom = classroomService.joinClass(classCode, student);

        if (classroom != null) {
            return ResponseEntity.ok(classroom);
        }

        return ResponseEntity.badRequest().body(null);  // If class code doesn't exist
    }

    // Endpoint to retrieve list of students in a class
    @GetMapping("/{classCode}/students")
    public ResponseEntity<List<Student>> getStudentsByClassCode(@PathVariable String classCode) {
        List<Student> students = classroomService.getStudentsByClassCode(classCode);

        if (students != null) {
            return ResponseEntity.ok(students);
        }

        return ResponseEntity.notFound().build();  // If class code doesn't exist
    }
}
