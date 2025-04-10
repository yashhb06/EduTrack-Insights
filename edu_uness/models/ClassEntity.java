package com.example.edutrackinsight.models;
import jakarta.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "edutrack_classes")
public class ClassEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "class_id")
    private Long classId;

    @Column(name = "class_code", unique = true, nullable = false)
    private String classCode;

    @Column(name = "class_name", nullable = false)
    private String className;

    @Column(name = "description")
    private String description;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "teacher_id")
    private Long teacherId;


    // Getters and Setters
    public Long getClassId() {
        return classId;
    }

    public void setClassId(Long classId) {
        this.classId = classId;
    }

    public String getClassCode() {
        return classCode;
    }

    public void setClassCode(String classCode) {
        this.classCode = classCode;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(User teacherId) {
        this.teacherId = teacherId.getId();
    }
}