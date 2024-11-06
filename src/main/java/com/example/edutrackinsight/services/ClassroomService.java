package com.example.edutrackinsight.services;

import com.example.edutrackinsight.models.Classroom;
import com.example.edutrackinsight.models.Student;
import com.example.edutrackinsight.repositories.ClassroomRepository;
import com.example.edutrackinsight.repositories.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ClassroomService {

    @Autowired
    private ClassroomRepository classroomRepository;

    @Autowired
    private StudentRepository studentRepository;

    public Classroom joinClass(String classCode, Student student) {
        Optional<Classroom> classroomOptional = classroomRepository.findByClassCode(classCode);

        if (classroomOptional.isPresent()) {
            Classroom classroom = classroomOptional.get();
            student.setClassroom(classroom);
            studentRepository.save(student);  // Save the student with the classroom assigned
            return classroom;
        }

        return null;  // If class with the given code doesn't exist
    }

    public List<Student> getStudentsByClassCode(String classCode) {
        Optional<Classroom> classroomOptional = classroomRepository.findByClassCode(classCode);

        if (classroomOptional.isPresent()) {
            return classroomOptional.get().getStudents();
        }

        return null;  // No students if class with the given code doesn't exist
    }
}
