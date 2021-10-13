package com.company.shoe_store.web.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@PreAuthorize("hasAuthority('ADMIN')")
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/protected")
    public ModelAndView slash(HttpServletRequest request) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView response = new ModelAndView();
        response.setViewName("admin/protected");

        return response;
    }

    //public String getCurrentUsername() {
    //    SecurityContext context = SecurityContextHolder.getContext();
    //    if (context != null && context.getAuthentication() != null) {
    //        final org.springframework.security.core.userdetails.User principal = (org.springframework.security.core.userdetails.User) context.getAuthentication().getPrincipal();
    //        return principal.getUsername();
    //    } else {
    //        return null;
    //    }
    //}
}
