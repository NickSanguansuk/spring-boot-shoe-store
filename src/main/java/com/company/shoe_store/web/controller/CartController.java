package com.company.shoe_store.web.controller;

import com.company.shoe_store.data.entity.*;
import com.company.shoe_store.data.repository.*;
import com.company.shoe_store.web.form.AddToCartForm;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@RestController
@PreAuthorize("hasAuthority('USER')")
@RequestMapping(value = "/cart")
public class CartController {

    private final Logger LOG = LoggerFactory.getLogger(this.getClass());

    private SubproductRepository subproductRepository;
    private ProductRepository productRepository;
    private UserRepository userRepository;
    private CartItemRepository cartItemRepository;
    private OrderRepository orderRepository;
    private OrderDetailRepository orderDetailRepository;

    public CartController() {
    }

    @Autowired
    public CartController(SubproductRepository subproductRepository, ProductRepository productRepository, UserRepository userRepository, CartItemRepository cartItemRepository, OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.subproductRepository = subproductRepository;
        this.productRepository = productRepository;
        this.userRepository = userRepository;
        this.cartItemRepository = cartItemRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    @GetMapping(value = {"", "/cart"})
    public ModelAndView cartGet(HttpServletRequest request, HttpSession session) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("cart/cart");

        User user = userRepository.findUserById((Integer) session.getAttribute("userId"));
        List<CartItem> cartItems = user.getCartItems();
        //List<CartItem> cartItems = cartItemRepository.findCartItemsByUserObjectCart(user);

        session.setAttribute("cartItems", cartItems);

        return modelAndView;
    }

    @PostMapping(value = {"", "/cart"})
    public ModelAndView cartPost(HttpServletRequest request, HttpSession session) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("cart/cart");

        User user = userRepository.findUserById((Integer) session.getAttribute("userId"));
        List<CartItem> cartItems = user.getCartItems();

        // Business logic
        String checkoutMessages = null;

        if (cartItems != null) {

            Order order = new Order();
            order.setUserObjectOrder(user);
            order.setStatus(Order.Status.IN_PROCESS);
            order.setOrderedDate(LocalDateTime.now());
            order.setShippedDate(null);

            System.out.println("---> order: " + order);
            orderRepository.save(order); // Commit to database
            LOG.debug("########## Created a new Order in the database ---> order: " + order + "##########");
            System.out.println("---> Added new Order to the Database.");

            for (int i = 0; i < cartItems.size(); i++) {

                Product product = cartItems.get(i).getProductObjectCart();

                OrderDetail orderDetail = new OrderDetail();

                OrderDetailKey key = new OrderDetailKey();
                key.setOrderIdKey(order.getId());
                key.setProductIdKey(product.getId());

                orderDetail.setKey(key);
                orderDetail.setOrderObject(order);
                orderDetail.setProductObject(product);
                orderDetail.setQuantityOrdered(cartItems.get(i).getQuantity());
                orderDetail.setAlreadyReviewed(false);

                System.out.println("---> orderDetail: " + orderDetail);
                orderDetailRepository.save(orderDetail); // Commit to database
                LOG.debug("########## Created a new OrderDetail in the database ---> orderDetail: " + orderDetail + "##########");
                System.out.println("---> Added new OrderDetail to the Database.");

                cartItemRepository.delete(cartItems.get(i));
            }

            checkoutMessages = "Successfully checkout! Thank you for doing business with us.";
        }

        cartItems = cartItemRepository.findCartItemsByUserObjectCart(user);
        session.setAttribute("cartItems", cartItems);
        session.setAttribute("checkoutMessages", checkoutMessages);

        return modelAndView;
    }

    @PostMapping(value = "/add-to-cart")
    public ModelAndView detailPost(HttpServletRequest request, @RequestParam(required = true) Integer subId, @RequestParam(required = false) Integer proId, @Valid AddToCartForm form, BindingResult bindingResult, HttpSession session) throws Exception {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("search/detail");

        // Form validation
        modelAndView.addObject("form", form);

        System.out.println("---> form (AddToCartForm): " + form.toString());

        if (bindingResult.hasErrors()) {
            List<String> errorMessages = new ArrayList<>();

            for (FieldError error : bindingResult.getFieldErrors()) {
                System.out.println(error.getField() + " = " + error.getDefaultMessage());
                errorMessages.add(error.getDefaultMessage());
            }

            modelAndView.addObject("errorFields", bindingResult.getFieldErrors());
            modelAndView.addObject("errorMessages", errorMessages);

            return modelAndView;
        }

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

        // Business logic
        String cartMessagesGood = null; // success message
        String cartMessagesBad = null; // failure message

        User user = userRepository.findUserById((Integer) session.getAttribute("userId"));

        CartItem cartItem = cartItemRepository.findCartItemByUserObjectCartAndProductObjectCart(user, product);

        Integer productQuantityInCart;

        if (cartItem == null) {

            cartItem = new CartItem();

            CartItemKey key = new CartItemKey();
            key.setUserIdKey(user.getId());
            key.setProductIdKey(product.getId());

            cartItem.setKey(key);
            cartItem.setUserObjectCart(user);
            cartItem.setProductObjectCart(product);
            cartItem.setQuantity(form.getProductQuantity());

            cartMessagesGood = "Added to cart.";
            productQuantityInCart = cartItem.getQuantity();

        } else {

            productQuantityInCart = cartItem.getQuantity() + form.getProductQuantity();

            if (productQuantityInCart <= product.getAvailability()) {
                cartItem.setQuantity(productQuantityInCart);

                cartMessagesGood = "Added to cart.";

            } else {
                cartMessagesBad = "Not enough product available.";
            }

        }

        System.out.println("---> cartItem: " + cartItem);
        cartItemRepository.save(cartItem); // Commit to database
        LOG.debug("########## Created a new CartItem in the database ---> cartItem: " + cartItem + "##########");
        System.out.println("---> Added new Product to the Cart (Database).");

        session.setAttribute("subproduct", subproduct);
        session.setAttribute("product", product);
        session.setAttribute("productQuantityInCart", productQuantityInCart);
        modelAndView.addObject("cartMessagesGood", cartMessagesGood);
        modelAndView.addObject("cartMessagesBad", cartMessagesBad);

        return modelAndView;
    }

}
