package kr.ac.kopo.symovie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.symovie.model.Coupon;
import kr.ac.kopo.symovie.model.CouponCustomer;
import kr.ac.kopo.symovie.model.Customer;
import kr.ac.kopo.symovie.model.Movie;
import kr.ac.kopo.symovie.pager.Pager;
import kr.ac.kopo.symovie.service.CustomerService;
import kr.ac.kopo.symovie.service.EventService;
import kr.ac.kopo.symovie.service.MovieService;

@Controller
public class RootController {
	
	@Autowired
	CustomerService service;
	
	@Autowired
	MovieService movieService;
	
	@Autowired
	EventService eventService;
	
	@GetMapping("/")
	String index(Model model, Pager pager) {
		
		pager.setPerPage(99);
		
		List<Movie> movieList = movieService.list(pager);
		
		model.addAttribute("list", movieList);
		
		return "index";
				
	}
	
	@GetMapping("/login")
	String login() {
		
		return "login";
	}
	
	@ResponseBody
	@PostMapping("/login")
	String login(@RequestBody Customer item,  HttpSession session) {
		
		System.out.println(item.getCustId());
		
		if(service.login(item)) {
			session.setAttribute("member", item);
			return "OK";
		}
		
		return "FAIL";
	}
	
	@GetMapping("/logout")
	String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:.";
	}
	
	@GetMapping("/signup")
	String signup() {
		
		return "signup";
	}
	
	@PostMapping("/signup")
	String signup(Customer item) {
		
		service.signup(item);
		
		return "redirect:/";
	}
	
	
	@ResponseBody
	@GetMapping("/id_check/{custId}")
	String idCheck(@PathVariable String custId) {
		
		System.out.println(custId);
		
		if(service.idCheck(custId)) {
			
			return "OK";
		}
		
		return "FAIL";
		
	}
	
	@GetMapping("/login/{type}/popup")
	String loginPopup(@PathVariable String type) {
		
		return "login_popup";
	}
	
	
	@PostMapping("/login/{type}/popup")
	String loginPopup(@PathVariable String type, Customer item, HttpSession session) {
		
		if(service.login(item)) {
			session.setAttribute("member", item);
			
			return "login_popup";
			}
		
		return "redirect:../login/popup";
	}
	
	@GetMapping("/nav")
	String nav() {
		return "nav";
	}
	
	
	
	
}
