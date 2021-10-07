package com.company.shoe_store.web.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
public class TestHelloWorldController {

    @RequestMapping("/hello")
    public String hello() {
        return "Hello from Spring Boot - Project shoe-store";
    }

    @RequestMapping("/goodbye")
    public String goodbye() {
        return "Goodbye from Spring Boot - Project shoe-store";
    }
}
