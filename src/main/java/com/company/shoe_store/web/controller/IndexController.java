package com.company.shoe_store.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class IndexController {

    //@GetMapping("/")
    @RequestMapping(value = { "", "/", "/index", "/index.html" })
    public ModelAndView index(HttpServletRequest request) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("jsp/index");

        return modelAndView;
    }

    @GetMapping(value = {"/server_error"})
    public String triggerServerError(HttpServletRequest request) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        "ser".charAt(30);
        return "jsp/index";
    }

    @PostMapping(value = {"/general_error"})
    public String triggerGeneralError(HttpServletRequest request) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        return "jsp/index";
    }
}