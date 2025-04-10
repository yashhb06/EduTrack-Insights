package com.example.edutrackinsight.controllers;

import com.example.edutrackinsight.dto.LoginDTO;
import com.example.edutrackinsight.models.User;
import com.example.edutrackinsight.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginDTO loginDTO) {
        Optional<User> userOptional = userService.findByEmail(loginDTO.getEmail());

        if (userOptional.isPresent()) {
            User user = userOptional.get();
            if (passwordEncoder.matches(loginDTO.getPassword(), user.getPassword())) {
                return ResponseEntity.ok().body("{\"success\": true, \"message\": \"Login successful!\"}");
            }
        }

        return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                .body("{\"success\": false, \"message\": \"Invalid email or password.\"}");
    }
}
