package com.example.edutrackinsight.services;

import com.example.edutrackinsight.dto.MarksDTO;
import com.example.edutrackinsight.models.Marks;
import com.example.edutrackinsight.repositories.MarksRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MarksService {

    @Autowired
    private MarksRepository marksRepository;

    public Marks addMarks(MarksDTO marksDTO) {
        Marks marks = new Marks();
        marks.setStudentId(marksDTO.getStudentId());
        marks.setClassroomId(marksDTO.getClassroomId());
        marks.setSubject(marksDTO.getSubject());
        marks.setTermTest1(marksDTO.getTermTest1());
        marks.setTermTest2(marksDTO.getTermTest2());
        marks.setEndSemExam(marksDTO.getEndSemExam());

        return marksRepository.save(marks);
    }

    public List<Marks> getMarksByStudent(Long studentId, Long classroomId) {
        return marksRepository.findByStudentIdAndClassroomId(studentId, classroomId);
    }
}
