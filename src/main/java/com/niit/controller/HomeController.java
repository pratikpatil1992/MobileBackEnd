package com.niit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController 
{
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

