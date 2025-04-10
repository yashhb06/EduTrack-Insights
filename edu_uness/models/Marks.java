package com.example.edutrackinsight.models;

import jakarta.persistence.*;

@Entity
@Table(name = "marks")
public class Marks {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "student_id")
    private Long studentId;

    @Column(name = "classroom_id")
    private Long classroomId;

    @Column(name = "subject")
    private String subject;

    @Column(name = "term_test_1")
    private int termTest1;

    @Column(name = "term_test_2")
    private int termTest2;

    @Column(name = "end_sem_exam")
    private int endSemExam;

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getStudentId() {
        return studentId;
    }

    public void setStudentId(Long studentId) {
        this.studentId = studentId;
    }

    public Long getClassroomId() {
        return classroomId;
    }

    public void setClassroomId(Long classroomId) {
        this.classroomId = classroomId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public int getTermTest1() {
        return termTest1;
    }

    public void setTermTest1(int termTest1) {
        this.termTest1 = termTest1;
    }

    public int getTermTest2() {
        return termTest2;
    }

    public void setTermTest2(int termTest2) {
        this.termTest2 = termTest2;
    }

    public int getEndSemExam() {
        return endSemExam;
    }

    public void setEndSemExam(int endSemExam) {
        this.endSemExam = endSemExam;
    }
}
