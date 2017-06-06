package com.niit.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.MobileStoreBackEnd.dao.UserDAO;
import com.niit.MobileStoreBackEnd.domain.User;

@Controller
public class UserController 
{	
	@Autowired UserDAO userDAO;
	@Autowired User user;
	@Autowired private HttpSession session;
	Logger log = LoggerFactory.getLogger(ProductController.class);
	
	//get username and password from login page and send these values to userDAO.validate
	
	@RequestMapping("/Register")
	public ModelAndView register()
	{
		ModelAndView mv=new ModelAndView("Register");
		mv.addObject("isAdminClickedRegister","true");
		mv.addObject("user", new User());
		return mv;
	}
	
	@RequestMapping(value="/Register", method=RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("user") @Valid User user, BindingResult result,Model model,HttpServletRequest request)
	{
		System.out.println(user.getName());
		 if(result.hasErrors())
		 {
			 System.out.println(result.getFieldError().getField());
			 return new ModelAndView("Register");
		 }
		 else
		 {
			 user.setRole("role_user");
			 boolean saved= userDAO.save(user);
			 if(saved)
			 {
				 model.addAttribute("msg","Registered Sucessfully");
			 }
			 ModelAndView mv=new ModelAndView("Register");
			 mv.addObject("user",new User());
			 return mv;
		 }
	 }
	 
	@RequestMapping("/failedLogin")
	public String failedLogin(Model model)
	{
		model.addAttribute("msg", "Invalid credentials");
		return "Login";
	}
	
	@RequestMapping("/Logout")
	public String Logout(Model model)
	{
		model.addAttribute("msg", "Logged out successfully");
		session.removeAttribute("LoggedInUser");
		session.removeAttribute("isAdmin");
		session.removeAttribute("isUser");
		return "Login";
	}
	
	@RequestMapping(value="/validate")
	public ModelAndView validate(HttpServletRequest request, HttpServletResponse response) throws Exception 
	{
		ModelAndView mv;
		session = request.getSession(true);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String username = auth.getName();
		Collection<? extends GrantedAuthority> authority=auth.getAuthorities();
		session.setAttribute("LoggedInUser",username);
		for (GrantedAuthority grantedAuthority : authority) {
			if(grantedAuthority.getAuthority().equals("ROLE_ADMIN")){
				mv= new ModelAndView("admin/adminHome");
				session.setAttribute("isAdmin", true);
				return mv;
			}
			if(grantedAuthority.getAuthority().equals("ROLE_USER")){
				mv= new ModelAndView("index");
				session.setAttribute("isUser", true);
				return mv;
			}
		}
		mv= new ModelAndView("index");
		return mv;
	}
}