package com.niit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.niit.MobileStoreBackEnd.dao.CategoryDAO;
import com.niit.MobileStoreBackEnd.domain.Category;

@Controller
public class HomeController
{
     @Autowired HttpSession session;
     @Autowired Category category;
     @Autowired CategoryDAO categoryDAO;
	  
	 @RequestMapping("/")
	 public String home()
     {
    	 return "index";
     }
     @RequestMapping("/AboutUs")
     public String about()
     {
    	 return "AboutUs";
     }
     @RequestMapping("/Contact")
     public String contact()
     {
    	 return "Contact";
     }
     @RequestMapping("/SignUp")
     public String signup()
     {
    	 return "SignUp";
     }
     @RequestMapping("/Login")
     public String login()
     {
    	 return "Login";
     }
     @RequestMapping("/Brands")
     public String brands()
     {
    	 return "Brands";
     }
}

