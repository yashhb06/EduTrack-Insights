package com.example.edutrackinsight.controllers;

import com.example.edutrackinsight.dto.TestDTO;
import com.example.edutrackinsight.services.TestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/tests")
public class TestController {

    @Autowired
    private TestService testService;

    @PostMapping("/create")
    public ResponseEntity<TestDTO> createTest(@RequestBody TestDTO testDTO) {
        TestDTO createdTest = testService.createTest(testDTO);
        return ResponseEntity.ok(createdTest);
    }

    @GetMapping("/{testId}")
    public ResponseEntity<TestDTO> getTestById(@PathVariable Long testId) {
        TestDTO testDTO = testService.getTestById(testId);
        if (testDTO == null) {
            return ResponseEntity.notFound().build();
        }
        return ResponseEntity.ok(testDTO);
    }
}
