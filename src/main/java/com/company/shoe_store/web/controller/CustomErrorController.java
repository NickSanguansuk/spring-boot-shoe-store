package com.company.shoe_store.web.controller;

import org.apache.commons.lang3.exception.ExceptionUtils;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
@ControllerAdvice
public class CustomErrorController implements ErrorController {

    @RequestMapping(value = "/error")
    public ModelAndView errorGeneral(HttpServletRequest request) {
        System.out.println("########## ########## public String errorGeneral(HttpServletRequest request) ########## ##########");

        String originalUri = (String) request.getAttribute("javax.servlet.forward.request_uri");
        System.out.println("---> Requested URL not found : " + request.getMethod() + " " + originalUri);

        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        System.out.println("---> " + status);

        ModelAndView modelAndView = new ModelAndView("jsp/error/error");

        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());

            if (statusCode == HttpStatus.FORBIDDEN.value()) {
                modelAndView.setViewName("jsp/error/403");
            } else if (statusCode == HttpStatus.NOT_FOUND.value()) {
                modelAndView.setViewName("jsp/error/404");
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                modelAndView.setViewName("jsp/error/500");
            }
        }

        modelAndView.addObject("message", ("Requested URL not found : " + request.getMethod() + " " + originalUri));

        return modelAndView;
    }

    @RequestMapping(value = "/error/404")
    public String error404(HttpServletRequest request) {
        System.out.println("########## ########## public String error404(HttpServletRequest request) ########## ##########");

        String originalUri = (String) request.getAttribute("javax.servlet.forward.request_uri");
        System.out.println("---> Requested URL not found : " + request.getMethod() + " " + originalUri);
        return "jsp/error/404";
    }

    @ExceptionHandler(Exception.class)
    public ModelAndView handleAllException(HttpServletRequest request, Exception ex) {
        System.out.println("########## ########## public ModelAndView handleAllException(HttpServletRequest request, Exception ex) ########## ##########");

        System.out.println("---> Error page exception : " + getRequestURL(request));
        ex.printStackTrace();

        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        System.out.println("---> " + status);

        ModelAndView modelAndView = new ModelAndView("jsp/error/exception");
        String stackTrace = getHTMLStackTrace(ExceptionUtils.getStackFrames(ex));
        modelAndView.addObject("requestUrl", getRequestURL(request));
        modelAndView.addObject("message", ex.getMessage());
        modelAndView.addObject("stackTrace", stackTrace);
        if (ex.getCause() != null) {
            modelAndView.addObject("rootCause", ExceptionUtils.getRootCause(ex));
            String rootTrace = getHTMLStackTrace(ExceptionUtils.getRootCauseStackTrace(ex));
            modelAndView.addObject("rootTrace", rootTrace);
        }
        return modelAndView;

        //String stackTrace = getHTMLStackTrace(ex);
        //modelAndView.addObject("message", ex.getMessage());
        //modelAndView.addObject("stackTrace", stackTrace);
        //return modelAndView;
    }

    private String getHTMLStackTrace(String[] stack) {
        System.out.println("########## ########## private String getHTMLStackTrace(String[] stack) ########## ##########");

        //String stackTrace = ExceptionUtils.getStackTrace(ex);
        //
        //stackTrace = stackTrace.replaceAll("[\\r\\f\\n]+", "<br/>");
        //stackTrace = stackTrace.replaceAll("\\t", " &nbsp; &nbsp; &nbsp;");
        //
        //return stackTrace;

        StringBuffer result = new StringBuffer();
        for (String frame : stack) {
            //if (frame.contains("spring_jsp")) {
            if (frame.contains("")) {
                result.append(" &nbsp; &nbsp; &nbsp;" + frame.trim().substring(3) + "<br>\n");
            } else if (frame.contains("Caused by:")) {
                result.append("Caused By:<br>");
            }
        }
        return result.toString();
    }

    //private String getHTMLStackTrace(Exception ex) {
    //    String stackTrace = ExceptionUtils.getStackTrace(ex);
    //    stackTrace = stackTrace.replaceAll("[\\r\\f\\n]+", "<br/>");
    //    stackTrace = stackTrace.replaceAll("\\t", " &nbsp; &nbsp; &nbsp;");
    //    return stackTrace;
    //}

    private String getRequestURL(HttpServletRequest request) {
        System.out.println("########## ########## private String getRequestURL(HttpServletRequest request) ########## ##########");

        String result = request.getRequestURL().toString();
        if (request.getQueryString() != null) {
            result = result + "?" + request.getQueryString();
        }
        return result;
    }

}
