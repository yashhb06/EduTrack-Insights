package com.example.edutrackinsight.controllers;

import com.example.edutrackinsight.models.User;
import com.example.edutrackinsight.services.UserService;
import com.example.edutrackinsight.dto.ChangePasswordDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/settings")
public class UserSettingsController {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @PostMapping("/changePassword")
    public ResponseEntity<String> changePassword(@RequestBody ChangePasswordDTO changePasswordDTO) {
        Optional<User> optionalUser = userService.findByEmail(changePasswordDTO.getEmail());

        if (optionalUser.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found.");
        }

        User user = optionalUser.get();

        // Check if current password matches
        if (!passwordEncoder.matches(changePasswordDTO.getCurrentPassword(), user.getPassword())) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Current password is incorrect.");
        }

        // Update password
        user.setPassword(passwordEncoder.encode(changePasswordDTO.getNewPassword()));
        userService.save(user);

        return ResponseEntity.ok("Password updated successfully.");
    }
}
