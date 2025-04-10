package com.example.edutrackinsight.models;

import com.example.edutrackinsight.models.ClassEntity;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "edutrack_tests")
public class TestEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "test_id")
    private Long testId;

    @ManyToOne
    @JoinColumn(name = "class_id", nullable = false)
    private ClassEntity classEntity;

    @Column(name = "test_name", nullable = false)
    private String testName;

    @Column(name = "test_date")
    private LocalDateTime testDate;

    // Getters and Setters

    public Long getTestId() {
        return testId;
    }

    public void setTestId(Long testId) {
        this.testId = testId;
    }

    public ClassEntity getClassEntity() {
        return classEntity;
    }

    public void setClassEntity(ClassEntity classEntity) {
        this.classEntity = classEntity;
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName;
    }

    public LocalDateTime getTestDate() {
        return testDate;
    }

    public void setTestDate(LocalDateTime testDate) {
        this.testDate = testDate;
    }
}