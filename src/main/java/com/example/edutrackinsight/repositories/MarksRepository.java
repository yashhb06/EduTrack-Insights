package com.example.edutrackinsight.repositories;

import com.example.edutrackinsight.models.Marks;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MarksRepository extends JpaRepository<Marks, Long> {
    List<Marks> findByStudentIdAndClassroomId(Long studentId, Long classroomId);
}
