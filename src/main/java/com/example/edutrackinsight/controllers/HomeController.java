package com.example.edutrackinsight.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/login")
    public String showLoginPage() {
        return "login"; // This will look for login.jsp in WEB-INF/views
    }
}