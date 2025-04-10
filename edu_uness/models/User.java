package com.example.edutrackinsight.models;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "edutrack_users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long id;

    // If there is another field with the same column mapping, mark it as insertable = false, updatable = false
   // @ManyToOne
   // @JoinColumn(name = "user_id", insertable = false, updatable = false)
   // private Long duplicateUserIdField;  // Example duplicate field name, adjust as per your code

    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "email", unique = true, nullable = false)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "role", nullable = false)
    private String role;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    public User(String name, String email, String password) {
    }

    public User() {

    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setCreatedAt(LocalDateTime now) {
    }

}
