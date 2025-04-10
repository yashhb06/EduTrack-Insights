package com.example.edutrackinsight.controllers;

import com.example.edutrackinsight.dto.LoginRequest;
import com.example.edutrackinsight.dto.SignupRequest;
import com.example.edutrackinsight.models.User;
import com.example.edutrackinsight.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

    @CrossOrigin(origins = "file:///C:/EdutrackInsight/frontend/login.html")
    @RestController
    @RequestMapping("/api")
    public class LoginController {

        @Autowired
        private UserService userService;  // Your service layer for user operations
        @PostMapping("/register")
        public ResponseEntity<?> registerUser(@RequestBody SignupRequest signupRequest) {
            // Convert SignupRequest to User
            User user = new User(signupRequest.getName(), signupRequest.getEmail(), signupRequest.getPassword());
            boolean isRegistered = userService.registerUser(user);

            if (isRegistered) {
                return ResponseEntity.status(HttpStatus.CREATED).body("User registered successfully.");
            } else {
                return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("User already exists.");
            }
        }


        @PostMapping("/login")
        public ResponseEntity<?> loginUser(@RequestBody LoginRequest loginRequest) {
            boolean isAuthenticated = userService.authenticateUser(loginRequest.getEmail(), loginRequest.getPassword());

            if (isAuthenticated) {
                return ResponseEntity.ok("Login successful!");
            } else {
                return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Invalid credentials");
            }
        }

        }
