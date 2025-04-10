package com.example.edutrackinsight.controllers;

import com.example.edutrackinsight.models.Assignment;
import com.example.edutrackinsight.services.AssignmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@RestController
@RequestMapping("/api/assignments")
public class AssignmentController {

    @Autowired
    private AssignmentService assignmentService;

    // Endpoint to create a new assignment
    @PostMapping("/create")
    public ResponseEntity<Assignment> createAssignment(
            @RequestParam String title,
            @RequestParam String description,
            @RequestParam @DateTimeFormat(pattern = "MM/dd/yyyy") Date dueDate,
            @RequestParam Long classroomId,
            @RequestParam(required = false) MultipartFile file) {

        try {
            Assignment assignment = assignmentService.createAssignment(title, description, dueDate, classroomId, file);
            if (assignment != null) {
                return ResponseEntity.ok(assignment);
            } else {
                return ResponseEntity.badRequest().body(null);  // Classroom not found
            }
        } catch (IOException e) {
            return ResponseEntity.status(500).body(null);  // File handling error
        }
    }

    // Endpoint to retrieve assignments for a classroom
    @GetMapping("/classroom/{classroomId}")
    public ResponseEntity<List<Assignment>> getAssignmentsByClassroom(@PathVariable Long classroomId) {
        List<Assignment> assignments = assignmentService.getAssignmentsByClassroomId(classroomId);

        if (assignments != null) {
            return ResponseEntity.ok(assignments);
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
