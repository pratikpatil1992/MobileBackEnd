package com.niit.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.niit.MobileStoreBackEnd.dao.CategoryDAO;
import com.niit.MobileStoreBackEnd.domain.Category;

@Controller
public class CategoryController
{
	@Autowired CategoryDAO categoryDAO;
	@Autowired Category category;
	Logger log = LoggerFactory.getLogger(CategoryController.class);
	
	@Autowired
	private HttpSession session;
	@RequestMapping("/manage_category_add")
	public ModelAndView createCategory(@RequestParam("id") String id, @RequestParam("name") String name, @RequestParam("description") String description)
	{
		category.setId(id);
		category.setName(name);
		category.setDescription(description);
		
		ModelAndView mv=new ModelAndView("redirect:/manageCategories");
		mv.addObject("category",new Category());
		//check whether category id exists or not
		if(categoryDAO.getCategoryById(id)!=null)
		{
			//category exists
			mv.addObject("errorMessage","Category exists");
			return mv;
		}
		else
		{
			categoryDAO.save(category);
			setData();
			return mv;
		}	
	}
	
	
	@RequestMapping("/manage_category_delete/{id}")
	public ModelAndView deleteCategory(@PathVariable("id") String id)
	{
		
		log.debug("You are going to delete " + id);
		ModelAndView mv = new ModelAndView("redirect:/manageCategories");
		
		 if( categoryDAO.delete(id))
		 {
			 mv.addObject("message", "Successfully deleted the category");
		 }
		 else
		 {
			 mv.addObject("message", "Not able to delete the category");
		 }
		 
			setData();
		
			log.debug("Ending of the method deleteCategory");
		 
		 return mv;
		
	}
	
	private void setData()
	{
		session.setAttribute("categoryList", categoryDAO.list());
		session.setAttribute("category", category);
	}
	
	@RequestMapping("/manageCategories")
	public ModelAndView manageCategories()
	{
		ModelAndView mv=new ModelAndView("admin/Category");
		mv.addObject("isAdminClickedCategories","true");
		setData();
		mv.addObject("category",new Category());
		return mv;
	}
	
	@RequestMapping(value="/manage_category_edit/{id}", method=RequestMethod.GET)
	public ModelAndView edit(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("/admin/Category");
		Category cat =categoryDAO.getCategoryById(id);
		mv.addObject("category", cat);
		mv.addObject("isEdit",true);
		return mv;		
	}
	
	@RequestMapping(value="/admin/Category", method=RequestMethod.POST)
	public ModelAndView edit(@ModelAttribute("category") @Valid Category cat, BindingResult result,Model model)
		{
		 if(result.hasErrors())
		 {
			 return new ModelAndView("/admin/Category");
		 }
		 else
		 {
			boolean saved= categoryDAO.update(cat);
			if(saved)
			{
				model.addAttribute("msg","Category Updated Sucessfully");
			}
			setData();
			ModelAndView mv=new ModelAndView("/admin/Category");
			mv.addObject("category",category);
			return mv;
		 }
		}
}
