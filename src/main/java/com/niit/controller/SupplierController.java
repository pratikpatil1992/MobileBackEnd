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

import com.niit.MobileStoreBackEnd.dao.SupplierDAO;
import com.niit.MobileStoreBackEnd.domain.Supplier;

@Controller
public class SupplierController
{
	@Autowired SupplierDAO supplierDAO;
	@Autowired Supplier supplier;
	Logger log = LoggerFactory.getLogger(SupplierController.class);
	
	@Autowired
	private HttpSession session;
	@RequestMapping("/manage_supplier_add")
	public ModelAndView createSupplier(@RequestParam("id") String id, @RequestParam("name") String name, @RequestParam("address") String address)
	{
		supplier.setId(id);
		supplier.setName(name);
		supplier.setAddress(address);
		
		ModelAndView mv=new ModelAndView("redirect:/manageSuppliers");
		mv.addObject("supplier",new Supplier());
		//check whether supplier id exists or not
		if(supplierDAO.getSupplierById(id)!=null)
		{
			//supplier exists
			mv.addObject("errorMessage","Supplier exists");
			return mv;
		}
		else
		{
			supplierDAO.save(supplier);
			setData();
			return mv;
		}	
	}
	
	
	@RequestMapping("/manage_supplier_delete/{id}")
	public ModelAndView deleteSupplier(@PathVariable("id") String id)
	{
		
		log.debug("You are going to delete " + id);
		ModelAndView mv = new ModelAndView("redirect:/manageSuppliers");
		
		 if( supplierDAO.delete(id))
		 {
			 mv.addObject("message", "Successfully deleted the supplier");
		 }
		 else
		 {
			 mv.addObject("message", "Not able to delete the supplier");
		 }
		 
			setData();
		
			log.debug("Ending of the method deleteSupplier");
		 
		 return mv;
		
	}
	
	private void setData()
	{
		session.setAttribute("supplierList", supplierDAO.list());
		session.setAttribute("supplier", supplier);
	}
	
	@RequestMapping("/manageSuppliers")
	public ModelAndView manageSuppliers()
	{
		ModelAndView mv=new ModelAndView("admin/Supplier");
		mv.addObject("isAdminClickedSuppliers","true");
		setData();
		mv.addObject("supplier",new Supplier());
		return mv;
	}
	
	@RequestMapping(value="/manage_supplier_edit/{id}", method=RequestMethod.GET)
	public ModelAndView edit(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("/admin/Supplier");
		Supplier supplier =supplierDAO.getSupplierById(id);
		mv.addObject("supplier", supplier);
		mv.addObject("isEdit",true);
		
		return mv;		
	}
	
	@RequestMapping(value="/admin/Supplier", method=RequestMethod.POST)
	public ModelAndView edit(@ModelAttribute("supplier") @Valid Supplier supplier, BindingResult result,Model model)
		{
		 if(result.hasErrors())
		 {
			 return new ModelAndView("/admin/Supplier");
		 }
		 else
		 {
			boolean saved= supplierDAO.update(supplier);
			if(saved)
			{
				model.addAttribute("msg","Supplier Updated Sucessfully");
			}
			setData();
			ModelAndView mv=new ModelAndView("/admin/Supplier");
			mv.addObject("supplier",supplier);
			return mv;
		 }
		}
}
