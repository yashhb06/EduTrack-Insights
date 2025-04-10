package com.example.edutrackinsight.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomepageController {

    // Endpoint to render the homepage (homepage.jsp)
    @GetMapping("/")
    public String showHomepage(Model model) {
        // Return the name of the JSP file (without the .jsp extension)
        return "Homepage";
    }
}