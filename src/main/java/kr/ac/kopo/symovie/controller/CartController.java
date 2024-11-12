package kr.ac.kopo.symovie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.symovie.model.Cart;
import kr.ac.kopo.symovie.model.Customer;
import kr.ac.kopo.symovie.model.Movie;
import kr.ac.kopo.symovie.service.MovieService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	MovieService service;
	
	
	@ResponseBody
	@GetMapping("/{movieNum}/{movieAmount}")
	Cart add(@PathVariable Long movieNum, @PathVariable int movieAmount, 
			@SessionAttribute Customer member, @SessionAttribute(required = false) Cart cart, HttpSession session) {
		
		if(cart == null) {
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		
		cart.setCart(movieNum, movieAmount);
		
		
		return cart;
	}
	
	@GetMapping
	String cart(@SessionAttribute Customer member, @SessionAttribute(required = false) Cart cart,
			Model model) {
		
		// 장바구니에 없으면. 새로운 HashMap 을 만든다.
		if(cart == null) {
			
			cart = new Cart();
		}
		
		List<Movie> list = service.list(cart.getCart().keySet());
		
		model.addAttribute("list", list);
		
		
		return "cart";
	}
	
	@ResponseBody
	@DeleteMapping("/{movieNum}")
	void delete(@PathVariable Long movieNum, @SessionAttribute Cart cart) {
		
		cart.delete(movieNum);
	}
}
