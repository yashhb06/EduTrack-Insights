package com.example.edutrackinsight.controllers;

import com.example.edutrackinsight.dto.LoginRequest;
import com.example.edutrackinsight.dto.SignupRequest;
import com.example.edutrackinsight.models.User;
import com.example.edutrackinsight.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;

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
        @GetMapping
        public String showLoginPage() {
            return "login"; // This will look for login.jsp in /WEB-INF/views/
        }
        @WebServlet("/login")
        public class LoginServlet extends HttpServlet {
            protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                // Perform login logic here

                request.setAttribute("message", "Login attempt for user: " + username);
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }

        }
