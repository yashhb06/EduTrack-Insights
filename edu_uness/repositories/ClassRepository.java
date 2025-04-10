package com.example.edutrackinsight.repositories;

import com.example.edutrackinsight.models.ClassEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface ClassRepository extends JpaRepository<ClassEntity, Long> {
    Optional<ClassEntity> findByClassCode(String classCode);
}