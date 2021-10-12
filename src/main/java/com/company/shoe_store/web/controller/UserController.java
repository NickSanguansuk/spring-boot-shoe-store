package com.company.shoe_store.web.controller;

import com.company.shoe_store.data.entity.User;
import com.company.shoe_store.data.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public User getUserById(@PathVariable Integer id) {
        User user = userRepository.findUserById(id);
        return user;
    }

    @RequestMapping(value = "/", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public User getUserByEmail(@RequestParam String email) {
        User user = userRepository.findUserByEmail(email);
        return user;
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public String deleteUserById(@PathVariable Integer id) {
        User user = userRepository.findUserById(id);
        userRepository.delete(user);
        return "{\"status\",\"ok\"}";
    }











}
