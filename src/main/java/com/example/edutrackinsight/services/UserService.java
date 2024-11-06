package com.example.edutrackinsight.services;

import com.example.edutrackinsight.models.User;
import com.example.edutrackinsight.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.time.LocalDateTime;
import java.util.Optional;

@Service
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User registerUser(String name, String email, String password, String role) {
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(role);
        user.setCreatedAt(LocalDateTime.now());

        return userRepository.save(user);
    }

    public boolean authenticateUser(String email, String password) {

        return false;
    }

    public void save(User user) {
    }

    public Optional<User> findByEmail(String email) {
        return Optional.empty();
    }

    public boolean registerUser(User user) {
        return false;
    }
}

