package com.company.shoe_store.web.controller;

import com.company.shoe_store.data.entity.User;
import com.company.shoe_store.data.entity.UserRole;
import com.company.shoe_store.data.repository.UserRepository;
import com.company.shoe_store.data.repository.UserRoleRepository;
import com.company.shoe_store.web.form.CreateUserForm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/login")
public class LoginController {

    //@Autowired
    private UserRepository userRepository;

    //@Autowired
    private UserRoleRepository userRoleRepository;

    //@Autowired
    private PasswordEncoder passwordEncoder;

    // Constructors
    // No-argument constructor
    //@Autowired
    public LoginController() {
        System.out.println("---> In no-argument constructor, userRepository instance = " + userRepository); // userRepository is always null, here.
    }

    // Specialized constructor
    @Autowired
    public LoginController(UserRepository userRepository, UserRoleRepository userRoleRepository, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.userRoleRepository = userRoleRepository;
        this.passwordEncoder = passwordEncoder;

        System.out.println("---> In specialized constructor, userRepository instance = " + userRepository);
    }

    @PostConstruct
    public void init() {
        System.out.println("---> In @PostConstruct, userRepository instance = " + userRepository);

        // Testing
        List<UserRole> userRoles = userRepository.getUserRolesById(1);
        System.out.println("---> " + userRoles);
    }

    //@RequestMapping(value = "login", method = RequestMethod.GET)
    @GetMapping(value =  {"", "/login"})
    public ModelAndView loginGet(HttpServletRequest request) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView("login/login");

        //int x = 1 / 0;

        return modelAndView;
    }

    //@RequestMapping(value = "/create-user", method = RequestMethod.GET)
    @GetMapping("/create-user")
    public ModelAndView createUserGet(HttpServletRequest request) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView result = new ModelAndView("login/create-user");

        result.addObject("form", new CreateUserForm());

        return result;
    }

    //@RequestMapping(value = "/create-user", method = RequestMethod.POST)
    @PostMapping("/create-user")
    //@PreAuthorize("hasAnyAuthority('ADMIN', 'ANOTHER')")
    public ModelAndView createUserPost(HttpServletRequest request, @Valid CreateUserForm form, BindingResult bindingResult, HttpSession session) throws IOException {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        // Invalidate the old session
        session.invalidate();

        ModelAndView result = new ModelAndView("login/create-user");
        //ModelAndView result = createUserGet();

        // Form validation
        result.addObject("form", form);

        System.out.println("---> form: " + form.toString());

        if (bindingResult.hasErrors()) {
            List<String> errorMessages = new ArrayList<>();

            for (FieldError error : bindingResult.getFieldErrors()) {
                System.out.println(error.getField() + " = " + error.getDefaultMessage());
                errorMessages.add(error.getDefaultMessage());
            }

            result.addObject("errorFields", bindingResult.getFieldErrors());
            result.addObject("errorMessages", errorMessages);

            return result;
        }

        // Business logic
        User user = new User();

        user.setFirstName(form.getFirstName());
        user.setLastName(form.getLastName());
        user.setEmail(form.getEmail());
        //user.setPassword(form.getPassword());
        user.setPassword(passwordEncoder.encode(form.getPassword()));
        user.setPhone(form.getPhone());
        user.setAddress(form.getAddress());
        user.setCity(form.getCity());
        user.setState(form.getState());
        user.setZipCode(form.getZipCode());

        System.out.println("---> user: " + user);

        userRepository.save(user); // Commit to database

        System.out.println("---> Added new User to the Database.");

        UserRole userRole = new UserRole();

        userRole.setUserObject(user);
        userRole.setRole(UserRole.Role.USER);

        System.out.println("---> userRole: " + userRole);

        userRoleRepository.save(userRole); // Commit to database

        System.out.println("---> Added new UserRole (\"USER\") to the Database.");

        // Go to the next page
        //session.setAttribute("userInfo", user);
        //result.setViewName("redirect:/login/inbox");
        result.setViewName("redirect:/login/login");

        return result;
    }

    @RequestMapping(value = "/inbox", method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView inboxGetPost(HttpServletRequest request, HttpSession session) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView result = new ModelAndView("login/inbox");

        // Get userObject or userEmail here
        String currentUsername = null;

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        System.out.println("---> authentication: " + authentication);
        final org.springframework.security.core.userdetails.User principalUser = (org.springframework.security.core.userdetails.User) authentication.getPrincipal();
        System.out.println("---> principalUser: " + principalUser);

        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            System.out.println("---> User is already logged in.");
            currentUsername = authentication.getName();
            User user = userRepository.findUserByEmail(currentUsername);
            String messageStr = user.getFirstName() + " " + user.getLastName() + " (" + user.getEmail() + ")";
            result.addObject("welcomeUserMessage", messageStr);
        } else {
            System.out.println("---> User needs to log in first.");
            result.setViewName("redirect:/login/login");
        }

        return result;
    }
}













