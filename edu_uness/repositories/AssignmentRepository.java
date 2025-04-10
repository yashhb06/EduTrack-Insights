package com.example.edutrackinsight.repositories;

import com.example.edutrackinsight.models.Assignment;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface AssignmentRepository extends JpaRepository<Assignment, Long> {
    List<Assignment> findByClassroom_Id(Long classroomId);
}
