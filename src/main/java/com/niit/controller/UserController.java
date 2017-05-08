package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.MobileStoreBackEnd.dao.UserDAO;
import com.niit.MobileStoreBackEnd.domain.User;

@Controller
public class UserController 
{	
	@Autowired UserDAO userDAO;
	@Autowired User user;
	
	
	//get user id and password from login page and send these values to userDAO.validate
	
	@RequestMapping("/validate")
	public ModelAndView login(@RequestParam("userName") String id, @RequestParam("password") String password)
	{
		ModelAndView mv=new ModelAndView("/index");
		if(userDAO.validate(id, password)==true)
		{
			user=userDAO.get(id);
			mv.addObject("message","Welcome "+user.getName());
		}
		else
			mv.addObject("message","Invalid credentials. Please try again.");	
		return mv;
	}
}
