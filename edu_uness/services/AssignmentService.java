package com.example.edutrackinsight.services;

import com.example.edutrackinsight.models.Assignment;
import com.example.edutrackinsight.models.Classroom;
import com.example.edutrackinsight.repositories.AssignmentRepository;
import com.example.edutrackinsight.repositories.ClassroomRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class AssignmentService {

    @Autowired
    private AssignmentRepository assignmentRepository;

    @Autowired
    private ClassroomRepository classroomRepository;

    public Assignment createAssignment(String title, String description, Date dueDate, Long classroomId, MultipartFile file) throws IOException {
        Optional<Classroom> classroomOptional = classroomRepository.findById(classroomId);

        if (classroomOptional.isPresent()) {
            Classroom classroom = classroomOptional.get();
            Assignment assignment = new Assignment();
            assignment.setTitle(title);
            assignment.setDescription(description);
            assignment.setDueDate(dueDate);
            assignment.setClassroom(classroom);

            if (file != null && !file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                String filePath = "uploads/" + fileName;
                File destinationFile = new File(filePath);
                file.transferTo(destinationFile);
                assignment.setFileName(fileName);
                assignment.setFilePath(filePath);
            }

            return assignmentRepository.save(assignment);
        }

        return null;  // Classroom not found
    }

    public List<Assignment> getAssignmentsByClassroomId(Long classroomId) {
        return assignmentRepository.findByClassroom_Id(classroomId);
    }
}
