package com.example.edutrackinsight.controllers;

import com.example.edutrackinsight.dto.RegistrationDTO;
import com.example.edutrackinsight.models.User;
import com.example.edutrackinsight.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/users")
public class UserController {

    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public User registerUser(@RequestBody RegistrationDTO request) {
        return userService.registerUser(
                request.getName(),
                request.getEmail(),
                request.getPassword(),
                request.getRole()
        );
    }
}