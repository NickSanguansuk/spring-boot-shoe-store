package com.company.shoe_store.web.controller;

import com.company.shoe_store.data.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/login")
public class LoginController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    //@RequestMapping(value = "login", method = RequestMethod.GET)
    @GetMapping("/login")
    public ModelAndView loginGet(HttpServletRequest request) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView("jsp/login/login");

        int x = 1 / 0;

        return modelAndView;
    }



}
