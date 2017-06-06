package com.niit.controller;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.servlet.ModelAndView;

import com.niit.MobileStoreBackEnd.dao.CategoryDAO;
import com.niit.MobileStoreBackEnd.dao.ProductDAO;
import com.niit.MobileStoreBackEnd.dao.SupplierDAO;
import com.niit.MobileStoreBackEnd.domain.Product;

@Controller
public class ProductController
{
	@Autowired ProductDAO productDAO;
	@Autowired CategoryDAO categoryDAO;
	@Autowired SupplierDAO supplierDAO;

	Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private HttpSession session;
	
	//Retriving Product.jsp page from admin home
	@RequestMapping(value={"/manageProducts","/Product"}, method=RequestMethod.GET)
	public ModelAndView manageProducts()
	{
		ModelAndView mv=new ModelAndView("admin/Product");
		mv.addObject("isAdminClickedProducts","true");
		mv.addObject("product", new Product());
		setData();
		return mv;
	}
	
	//Post Method to Add Product
	
	@RequestMapping(value={"/admin/Product"}, method=RequestMethod.POST)
	public ModelAndView addProduct(@ModelAttribute("product") @Valid Product prod, BindingResult result,Model model,HttpServletRequest request)
	{
		System.out.println(prod.getName());
		 if(result.hasErrors())
		 {
			 System.out.println(result.getFieldError().getField());
			 return new ModelAndView("/admin/Product");
		 }
		 else
		 {
			 if(prod.getFile()==null)
			 System.out.println("file is empty");
			 String filenm= prod.getFile().getOriginalFilename();
			 prod.setImagepath(filenm);
			 productDAO.storeFile(prod, request);
			 boolean saved= productDAO.save(prod);
			 if(saved)
			 {
				 model.addAttribute("msg","Product Updated Sucessfully");
			 }
			 ModelAndView mv=new ModelAndView("/admin/Product");
			 mv.addObject("product",new Product());
			 setData();			
			 return mv;
		 }
	 }
	
	//GET Method to show product to be edited
	
	@RequestMapping(value="/manage_product_edit/{id}", method=RequestMethod.GET)
	public ModelAndView editProduct(@PathVariable("id")String id)
	{
		ModelAndView mv = new ModelAndView("/admin/Product");
		Product prod =productDAO.getProductById(id);
		mv.addObject("product",prod);
		mv.addObject("isEditing",true);
		
		return mv;	
	}
	
	@RequestMapping(value="/product_view/{id}", method=RequestMethod.GET)
	public ModelAndView viewProduct(@PathVariable("id")String id)
	{
		ModelAndView mv = new ModelAndView("/ViewProduct");
		Product prod =productDAO.getProductById(id);
		mv.addObject("product",prod);
		return mv;	
	}
	
	//Post method to store edited product

	@RequestMapping(value="/admin/editProduct", method=RequestMethod.POST)
	public ModelAndView editProduct(@ModelAttribute("product") @Valid Product prod, BindingResult result,Model model,HttpServletRequest request)
		{
		 if(result.hasErrors())
		 {
			 return new ModelAndView("/admin/Product");
		 }
		 else
		 {
			 prod.setImagepath(prod.getFile().getName());
			 productDAO.storeFile(prod, request);
			boolean saved= productDAO.update(prod);
			if(saved)
			{
				model.addAttribute("msg","Product Updated Sucessfully");
			}
			setData();
			ModelAndView mv=new ModelAndView("/admin/Product");
			mv.addObject("product",new Product());
			return mv;
		 }
		}
	
	@RequestMapping("/manage_product_delete/{id}")
	public ModelAndView deleteProduct(@PathVariable("id") String id)
	{
		
		log.debug("Starting of the method deleteProduct");
		log.debug("You are going to delete " + id);
		ModelAndView mv = new ModelAndView("redirect:/manageProducts");
		
		//check whether products are there for this product or not
	//	int size = productDAO.getAllProductsByProductID(id).size();
	/*	if(size!=0)
		{
			log.debug("Few products are there under this product. you can not delete");
			 mv.addObject("message", size+ " products are there under product" + id +". you cannot delete");
			 session.setAttribute("message ", size+ " products are there under product" + id +". you cannot delete");
			 return mv;
		}*/
		
		if( productDAO.delete(id))
		{
			mv.addObject("message", "successfully deleted the product");
		}
		else
		{
			mv.addObject("message", "Not able to delete the product");
		}
		setData();
		log.debug("Ending of the method deleteProduct");
		return mv;	
	}
	
	private void setData()
	{
		session.setAttribute("productList", productDAO.list());
		session.setAttribute("categoryList", categoryDAO.list());
		session.setAttribute("supplierList", supplierDAO.list());
	}
	
}