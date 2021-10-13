package com.company.shoe_store.web.controller;

import com.company.shoe_store.data.entity.User;
import com.company.shoe_store.data.repository.UserRepository;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/search")
public class SearchController {

    //@Autowired
    private UserRepository userRepository;

    // Constructors
    // No-argument constructor
    public SearchController() {
    }

    // Specialized constructor
    @Autowired
    public SearchController(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    //@RequestMapping(value = "/search")
    @RequestMapping(value = {"", "/search"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView searchGetPost(HttpServletRequest request, @RequestParam(required = false) String searchText) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        //// Testing
        //System.out.println(request.getRequestURL());
        //System.out.println(request.getRequestURI());
        //System.out.println(request.getMethod());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("search/search");

        List<User> users = new ArrayList<>();

        if (!StringUtils.isEmpty(searchText)) {
            users = userRepository.findUsersByEmailContains(searchText);
        }

        modelAndView.addObject("users", users);
        modelAndView.addObject("searchText", searchText);

        return modelAndView;
    }

    //@RequestMapping(value = "/detail")
    @GetMapping(value = "/detail")
    public ModelAndView detailGet(HttpServletRequest request, @RequestParam(required = true) Integer id) throws Exception {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("search/detail");

        User user = userRepository.findUserById(id);
        if (user == null) {
            throw new Exception("User ID " + id + " does not exist.");
        }

        modelAndView.addObject("user", user);

        return modelAndView;
    }


}
