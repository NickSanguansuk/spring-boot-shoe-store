package com.company.shoe_store.web.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping(value = "/nav")
public class NavController {

    @GetMapping(value = {"/men"})
    public ModelAndView menGet(HttpServletRequest request) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("nav/men");

        return modelAndView;
    }

    @GetMapping(value = {"/women"})
    public ModelAndView womenGet(HttpServletRequest request) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("nav/women");

        return modelAndView;
    }

    @GetMapping(value = {"/kids"})
    public ModelAndView kidsGet(HttpServletRequest request) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("nav/kids");

        return modelAndView;
    }

    @GetMapping(value = {"/contact"})
    public ModelAndView contactGet(HttpServletRequest request) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("nav/contact");

        return modelAndView;
    }

}
