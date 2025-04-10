package com.example.edutrackinsight.repositories;

import com.example.edutrackinsight.models.Classroom;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ClassroomRepository extends JpaRepository<Classroom, Long> {
    Optional<Classroom> findByClassCode(String classCode);
}
