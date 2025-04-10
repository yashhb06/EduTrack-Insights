package com.example.edutrackinsight.services;

import com.example.edutrackinsight.dto.ClassDTO;
import com.example.edutrackinsight.models.ClassEntity;
import com.example.edutrackinsight.models.User;
import com.example.edutrackinsight.repositories.ClassRepository;
import com.example.edutrackinsight.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class ClassService {

    @Autowired
    private ClassRepository classRepository;

    @Autowired
    private UserRepository userRepository;

    public ClassDTO createClass(ClassDTO classDTO) {
        User teacher = userRepository.findById(classDTO.getTeacherId())
                .orElseThrow(() -> new RuntimeException("Teacher not found"));

        ClassEntity classEntity = new ClassEntity();
        classEntity.setClassName(classDTO.getClassName());
        classEntity.setClassCode(classDTO.getClassCode());
        classEntity.setDescription(classDTO.getDescription());
        classEntity.setTeacherId(teacher);

        classEntity = classRepository.save(classEntity);

        classDTO.setClassId(classEntity.getClassId());
        return classDTO;
    }

    public List<ClassDTO> getAllClasses() {
        return classRepository.findAll().stream().map(classEntity -> {
            ClassDTO classDTO = new ClassDTO();
            classDTO.setClassId(classEntity.getClassId());
            classDTO.setClassName(classEntity.getClassName());
            classDTO.setClassCode(classEntity.getClassCode());
            classDTO.setDescription(classEntity.getDescription());
            classDTO.setTeacherId(classEntity.getTeacherId());
            return classDTO;
        }).collect(Collectors.toList());
    }
}
