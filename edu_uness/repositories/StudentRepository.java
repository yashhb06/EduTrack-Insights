package com.example.edutrackinsight.repositories;

import com.example.edutrackinsight.models.Student;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StudentRepository extends JpaRepository<Student, Long> {
}
