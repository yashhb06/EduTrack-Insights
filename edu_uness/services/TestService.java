package com.example.edutrackinsight.services;

import com.example.edutrackinsight.dto.TestDTO;
import com.example.edutrackinsight.models.ClassEntity;
import com.example.edutrackinsight.models.TestEntity;
import com.example.edutrackinsight.repositories.ClassRepository;
import com.example.edutrackinsight.repositories.TestRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service
public class TestService {

    @Autowired
    private TestRepository testRepository;

    @Autowired
    private ClassRepository classRepository;

    public TestDTO createTest(TestDTO testDTO) {
        ClassEntity classEntity = classRepository.findById(testDTO.getClassId()).orElseThrow(() -> new RuntimeException("Class not found"));

        TestEntity testEntity = new TestEntity();
        testEntity.setTestName(testDTO.getTestName());
        testEntity.setTestDate(testDTO.getTestDate());
        testEntity.setClassEntity(classEntity);

        testEntity = testRepository.save(testEntity);

        testDTO.setTestId(testEntity.getTestId());
        return testDTO;
    }

    public TestDTO getTestById(Long testId) {
        TestEntity testEntity = testRepository.findById(testId).orElse(null);
        if (testEntity == null) {
            return null;
        }

        TestDTO testDTO = new TestDTO();
        testDTO.setTestId(testEntity.getTestId());
        testDTO.setTestName(testEntity.getTestName());
        testDTO.setTestDate(testEntity.getTestDate());
        testDTO.setClassId(testEntity.getClassEntity().getClassId());

        return testDTO;
    }
}
