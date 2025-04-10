package com.example.edutrackinsight.controllers;

import com.example.edutrackinsight.models.User;
import com.example.edutrackinsight.services.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private AuthService authService;

    @PostMapping("/login")
    public ResponseEntity<String> login(@RequestParam String email, @RequestParam String password) {
        User user = authService.authenticate(email, password);
        if (user != null) {
            return ResponseEntity.ok("Login successful!");

        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid credentials");

    }
    }
}

