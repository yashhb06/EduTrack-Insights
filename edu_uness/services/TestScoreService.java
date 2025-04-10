package com.example.edutrackinsight.services;

import com.example.edutrackinsight.dto.TestScoreDTO;
import com.example.edutrackinsight.models.TestEntity;
import com.example.edutrackinsight.models.TestScoreEntity;
import com.example.edutrackinsight.models.User;
import com.example.edutrackinsight.repositories.TestRepository;
import com.example.edutrackinsight.repositories.TestScoreRepository;
import com.example.edutrackinsight.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TestScoreService {

    @Autowired
    private TestScoreRepository testScoreRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TestRepository testRepository;

    public TestScoreDTO createTestScore(TestScoreDTO testScoreDTO) {
        User student = userRepository.findById(testScoreDTO.getStudentId())
                .orElseThrow(() -> new RuntimeException("Student not found"));
        TestEntity test = testRepository.findById(testScoreDTO.getTestId())
                .orElseThrow(() -> new RuntimeException("Test not found"));

        TestScoreEntity testScoreEntity = new TestScoreEntity();
        testScoreEntity.setScore(testScoreDTO.getScore());
        testScoreEntity.setStudent(student);
        testScoreEntity.setTest(test);

        testScoreEntity = testScoreRepository.save(testScoreEntity);

        testScoreDTO.setScoreId(testScoreEntity.getScoreId());
        return testScoreDTO;
    }

    public TestScoreDTO getTestScoreById(Long scoreId) {
        TestScoreEntity testScoreEntity = testScoreRepository.findById(scoreId).orElse(null);
        if (testScoreEntity == null) {
            return null;
        }

        TestScoreDTO testScoreDTO = new TestScoreDTO();
        testScoreDTO.setScoreId(testScoreEntity.getScoreId());
        testScoreDTO.setScore(testScoreEntity.getScore());
        testScoreDTO.setStudentId(testScoreEntity.getStudent());
        testScoreDTO.setTestId(testScoreEntity.getTest().getTestId());

        return testScoreDTO;
    }
}
