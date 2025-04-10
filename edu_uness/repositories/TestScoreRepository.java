package com.example.edutrackinsight.repositories;

import com.example.edutrackinsight.models.TestScoreEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TestScoreRepository extends JpaRepository<TestScoreEntity, Long> {
}
