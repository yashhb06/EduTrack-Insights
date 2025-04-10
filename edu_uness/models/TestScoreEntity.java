package com.example.edutrackinsight.models;

import javax.persistence.*;

@Entity
@Table(name = "edutrack_testscores")
public class TestScoreEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "score_id")
    private Long scoreId;

    @Column(name = "score", nullable = false)
    private Double score;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private User student;

    @ManyToOne
    @JoinColumn(name = "test_id", nullable = false)
    private TestEntity test;

    // Getters and Setters

    public Long getScoreId() {
        return scoreId;
    }

    public void setScoreId(Long scoreId) {
        this.scoreId = scoreId;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public Long getStudent() {
        return student.getId();
    }

    public void setStudent(User student) {
        this.student = student;
    }

    public TestEntity getTest() {
        return test;
    }

    public void setTest(TestEntity test) {
        this.test = test;
    }
}
