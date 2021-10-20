package com.company.shoe_store.web.controller;

import com.company.shoe_store.data.entity.*;
import com.company.shoe_store.data.repository.*;
import com.company.shoe_store.web.form.AddToCartForm;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "/search")
public class SearchController {

    private final Logger LOG = LoggerFactory.getLogger(this.getClass());

    private ItemRepository itemRepository;
    private SubproductRepository subproductRepository;
    private ProductRepository productRepository;
    private UserRepository userRepository;
    private CartItemRepository cartItemRepository;

    // Constructors
    // No-argument constructor
    public SearchController() {
    }

    // Specialized constructor
    @Autowired
    public SearchController(ItemRepository itemRepository, SubproductRepository subproductRepository, ProductRepository productRepository, UserRepository userRepository, CartItemRepository cartItemRepository) {
        this.itemRepository = itemRepository;
        this.subproductRepository = subproductRepository;
        this.productRepository = productRepository;
        this.userRepository = userRepository;
        this.cartItemRepository = cartItemRepository;
    }

    @RequestMapping(value = {"", "/search"}, method = {RequestMethod.GET, RequestMethod.POST})
    public ModelAndView searchGetPost(HttpServletRequest request, @RequestParam(required = false) String searchText) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("search/search");

        List<Item> items = new ArrayList<>();

        if (!StringUtils.isEmpty(searchText)) {
            items = itemRepository.findItemsByNameContains(searchText);
        } else {
            items = itemRepository.findAll();
        }

        List<Subproduct> subproducts = new ArrayList<>();

        for (Item i : items) {
            subproducts.addAll(i.getSubproducts());
        }

        modelAndView.addObject("subproducts", subproducts);
        modelAndView.addObject("searchText", searchText);

        // Testing (too much printing; need to comment out)
        subproducts.forEach(x -> System.out.println("---> Searched result: subproductId=" + x.getId()));

        return modelAndView;
    }

    @GetMapping(value = "/detail")
    public ModelAndView detailGet(HttpServletRequest request, @RequestParam(required = true) Integer subId, @RequestParam(required = false) Integer proId, HttpSession session) throws Exception {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("search/detail");

        Subproduct subproduct = subproductRepository.findSubproductById(subId);

        if (subproduct == null) {
            throw new Exception("Subproduct ID " + subId + " does not exist.");
        }

        Product product;

        if (proId == null) {
            product = subproduct.getProducts().get(0);
        } else {
            product = productRepository.findProductById(proId);
        }

        User user = userRepository.findUserById((Integer) session.getAttribute("userId"));
        CartItem cartItem = cartItemRepository.findCartItemByUserObjectCartAndProductObjectCart(user, product);

        Integer productQuantityInCart;

        if (cartItem == null) {
            productQuantityInCart = 0;
        } else {
            productQuantityInCart = cartItem.getQuantity();
        }

        session.setAttribute("subproduct", subproduct);
        session.setAttribute("product", product);
        session.setAttribute("productQuantityInCart", productQuantityInCart);

        return modelAndView;
    }

    ////@RequestMapping(value = "/search")
    //@RequestMapping(value = {"", "/search"}, method = {RequestMethod.GET, RequestMethod.POST})
    //public ModelAndView searchGetPost(HttpServletRequest request, @RequestParam(required = false) String searchText) {
    //    System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());
    //
    //    //// Testing
    //    //System.out.println(request.getRequestURL());
    //    //System.out.println(request.getRequestURI());
    //    //System.out.println(request.getMethod());
    //
    //    ModelAndView modelAndView = new ModelAndView();
    //    modelAndView.setViewName("search/search");
    //
    //    List<User> users = new ArrayList<>();
    //
    //    if (!StringUtils.isEmpty(searchText)) {
    //        users = userRepository.findUsersByEmailContains(searchText);
    //    }
    //
    //    modelAndView.addObject("users", users);
    //    modelAndView.addObject("searchText", searchText);
    //
    //    return modelAndView;
    //}

    ////@RequestMapping(value = "/detail")
    //@GetMapping(value = "/detail")
    //public ModelAndView detailGet(HttpServletRequest request, @RequestParam(required = true) Integer id) throws Exception {
    //    System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());
    //
    //    ModelAndView modelAndView = new ModelAndView();
    //    modelAndView.setViewName("search/detail");
    //
    //    User user = userRepository.findUserById(id);
    //    if (user == null) {
    //        throw new Exception("User ID " + id + " does not exist.");
    //    }
    //
    //    modelAndView.addObject("user", user);
    //
    //    return modelAndView;
    //}


}
