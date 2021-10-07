package com.company.shoe_store.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/test")
public class TestJspThymeleafController {
    // URL: "http://localhost:8080/test/sample-jsp?name=Wasin"
    @GetMapping("/sample-jsp")
    String jspPage(Model model, @RequestParam(required = false) String name) {
        model.addAttribute("name", name);
        return "jsp/sample/sample-j";
    }

    // URL: "http://localhost:8080/test/sample-thymeleaf?name=Wasin"
    @GetMapping("/sample-thymeleaf")
    String thymeleafPage(Model model,@RequestParam(required = false) String name) {
        model.addAttribute("name", name);
        return "thymeleaf/sample/sample-t";
    }
}
