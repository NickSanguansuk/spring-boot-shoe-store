package com.company.shoe_store.web.controller;

import com.company.shoe_store.web.form.TimeForm;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping(value = "/time")
public class TimeController {

    //@RequestMapping(value = {"", "/time"})
    @GetMapping(value = {"", "/time"})
    public ModelAndView time(HttpServletRequest request) {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("time/time");
        return modelAndView;
    }

    //@RequestMapping(value = "/timeSubmit")
    @GetMapping(value = "/time-submit")
    public ModelAndView timeSubmit(HttpServletRequest request, TimeForm form) throws ParseException {
        System.out.println("Method: " + request.getMethod() + "\t\tURI: " + request.getRequestURI());

        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("time/time");

        System.out.println("---> form.getFullDate(): \t" + form.getFullDate());
        System.out.println("---> form.getStartTime(): \t" + form.getStartTime());
        System.out.println("---> form.getEndTime(): \t" + form.getEndTime());

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date dateTimeStart = dateFormat.parse(form.getFullDate() + " " + form.getStartTime());
        Date dateTimeEnd = dateFormat.parse(form.getFullDate() + " " + form.getEndTime());

        System.out.println("---> Date dateTimeStart: \t" + dateTimeStart);
        System.out.println("---> Date dateTimeEnd: \t\t" + dateTimeEnd);

        modelAndView.addObject("dateTimeStartDisplay", dateTimeStart);
        modelAndView.addObject("dateTimeEndDisplay", dateTimeEnd);

        return modelAndView;
    }

}
