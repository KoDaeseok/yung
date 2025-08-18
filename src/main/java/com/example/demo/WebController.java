package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {

    @GetMapping("/")
    public String home() {
        return "index"; // src/main/webapp/WEB-INF/views/index.jsp 호출
    }

    @GetMapping("/organization")
    public String organization() {
        return "organization";
    }
}