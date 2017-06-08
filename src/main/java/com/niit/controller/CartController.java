package com.niit.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.niit.MobileStoreBackEnd.dao.CartDAO;
import com.niit.MobileStoreBackEnd.dao.OrdersDAO;
import com.niit.MobileStoreBackEnd.dao.ProductDAO;
import com.niit.MobileStoreBackEnd.dao.UserDAO;
import com.niit.MobileStoreBackEnd.domain.Cart;
import com.niit.MobileStoreBackEnd.domain.Orders;
import com.niit.MobileStoreBackEnd.domain.Product;

@Controller
public class CartController 
{
	@Autowired CartDAO cartDAO;
	@Autowired ProductDAO productDAO;
	@Autowired OrdersDAO ordersDAO;
	@Autowired UserDAO userDAO;
	@Autowired Cart cart;
	@Autowired private HttpSession session;
	
	Logger log = LoggerFactory.getLogger(CategoryController.class);
	
	@RequestMapping(value="/add_to_cart/{id}", method=RequestMethod.GET)
	public ModelAndView Cart(@PathVariable("id") String id)
	{
		ModelAndView mv = new ModelAndView("Cart");
		cart.setId(cartDAO.getMaxId()+1);
		cart.setUsername((String)session.getAttribute("LoggedInUser"));
		cart.setQuantity(1);
		cart.setProduct_Id(id);
		Product p=productDAO.getProductById(id);
		cart.setProduct_Name(p.getName());
		System.out.println(p.getPrice());
		cart.setPrice(p.getPrice());
		
		boolean saved= cartDAO.save(cart);
		if(saved)
			mv.addObject("msg","Added Sucessfully To Cart");
		double total=cartDAO.getTotalAmount((String)session.getAttribute("LoggedInUser"));
		setData();
		return mv;
	 }
	
	@RequestMapping("/cart_delete/{id}")
	public ModelAndView deleteCart(@PathVariable("id") int id)
	{
		
		log.debug("You are going to delete " + id);
		ModelAndView mv = new ModelAndView("Cart");
		if( cartDAO.delete(id))
		{
			mv.addObject("message", "Successfully deleted the item");
		}
		else
		{
			mv.addObject("message", "Not able to delete the item");
		}
		double total=cartDAO.getTotalAmount((String)session.getAttribute("LoggedInUser"));
		session.setAttribute("total",total);
		setData();
		log.debug("Ending of the method delete");
		return mv;
	}
	
	@RequestMapping("/Checkout")
	public ModelAndView Checkout()
	{
		
	//	log.debug("You are going to checkout " + id);
		ModelAndView mv = new ModelAndView("Checkout");
		log.debug("Ending of the method delete");
		Orders ord=new Orders();
		ord.setId(ordersDAO.getMaxId()+1);
		ord.setPrice(cart.getPrice());
		ord.setProduct_Id(cart.getProduct_Id());
		ord.setProduct_Name(cart.getProduct_Name());
		ord.setQuantity(cart.getQuantity());
		ord.setUsername(cart.getUsername());
		ordersDAO.save(ord);
		cartDAO.deleteCartByUsername((String)session.getAttribute("LoggedInUser"));
		String address=userDAO.getAddressByUsername((String)session.getAttribute("LoggedInUser"));
		double total=cartDAO.getTotalAmount((String)session.getAttribute("LoggedInUser"));
		mv.addObject("total",total);
		mv.addObject("address",address);
		return mv;
	}
	
	private void setData()
	{
		session.setAttribute("cartList", cartDAO.list((String)session.getAttribute("LoggedInUser")));
	}
	
	@RequestMapping("/Cart")
    public String cart()
    {
		setData();
   	 	return "Cart";
    }
}
