package com.niit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.MobileStoreBackEnd.dao.CartDAO;
import com.niit.MobileStoreBackEnd.dao.CategoryDAO;
import com.niit.MobileStoreBackEnd.dao.ProductDAO;
import com.niit.MobileStoreBackEnd.domain.Category;
import com.niit.MobileStoreBackEnd.domain.Product;

@Controller
public class HomeController
{
     @Autowired HttpSession session;
     @Autowired Category category;
     @Autowired CategoryDAO categoryDAO;
     @Autowired ProductDAO productDAO;
	 @Autowired CartDAO cartDAO;
	 
	 @RequestMapping(value = {"/","/MobileStore"})
	 public ModelAndView goToHome()
     {
		 session.setAttribute("productList", productDAO.list());
		 session.setAttribute("categoryList", categoryDAO.list());
		
		 ModelAndView mv=new ModelAndView("index");
		 mv.addObject("message","Welcome to the Mobile Store");
		 return mv;
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
     @RequestMapping("/Products")
     public String products()
     {
    	 return "Products";
     }
     @RequestMapping("/Login")
     public String login(Model model)
     {
    	 model.addAttribute("isUserClickedLogin","true");
    	 return "Login";
     }
     @RequestMapping("/Brands")
     public String brands()
     {
    	 return "Brands";
     }
     @RequestMapping("/Admin")
     public String admin()
     {
    	 return "admin/adminHome";
     }
     
     
    @RequestMapping(value="/search")
 	public ModelAndView search(@RequestParam("name") String name)
 	{
 		
 		List<Product> prod=productDAO.search(name);
 		System.out.println(prod);
 		ModelAndView mv= new ModelAndView("/admin/Product","productList",prod);
 		return mv;
 		
 	}
}
