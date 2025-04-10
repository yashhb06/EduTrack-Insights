package com.example.edutrackinsight.controllers;

import com.example.edutrackinsight.dto.MarksDTO;
import com.example.edutrackinsight.models.Marks;
import com.example.edutrackinsight.services.MarksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/marks")
public class MarksController {

    @Autowired
    private MarksService marksService;

    @PostMapping("/add")
    public ResponseEntity<Marks> addMarks(@RequestBody MarksDTO marksDTO) {
        Marks savedMarks = marksService.addMarks(marksDTO);
        return ResponseEntity.ok(savedMarks);
    }

    @GetMapping("/get")
    public ResponseEntity<List<Marks>> getMarks(@RequestParam Long studentId, @RequestParam Long classroomId) {
        List<Marks> marksList = marksService.getMarksByStudent(studentId, classroomId);
        return ResponseEntity.ok(marksList);
    }
}
