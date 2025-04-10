package com.example.edutrackinsight.dto;

public class MarksDTO {

    private Long studentId;
    private Long classroomId;
    private String subject;
    private int termTest1;
    private int termTest2;
    private int endSemExam;

    // Getters and Setters

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
