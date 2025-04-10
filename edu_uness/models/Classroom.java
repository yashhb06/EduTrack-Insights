package com.example.edutrackinsight.models;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "classroom")
public class Classroom {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "class_code", unique = true)
    private String classCode;

    @Column(name = "class_name")
    private String className;

    @OneToMany(mappedBy = "classroom", cascade = CascadeType.ALL)
    private List<Student> students;

    @OneToMany(mappedBy = "classroom", cascade = CascadeType.ALL)
    private List<Assignment> assignments;

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }
    public List<Assignment> getAssignments() {
        return assignments;
    }

    public void setAssignments(List<Assignment> assignments) {
        this.assignments = assignments;
    }
}
