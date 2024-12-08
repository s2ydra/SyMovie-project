package kr.ac.kopo.symovie.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import kr.ac.kopo.symovie.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

	@Autowired
	OrdersService ordersService;
	
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

	@GetMapping("/movieTest")
	String movieTest() {
		return "movieTest";
	}

	@GetMapping("/mypage")
	String myPage(Model model, @SessionAttribute Customer member) {
		Customer customer = service.item(member.getCustNum());

		model.addAttribute("item", customer);

		return "/mypage";
	}

	@GetMapping("/mypage-update")
	String myPageUpdate(Model model, @SessionAttribute Customer member) {
		Customer customer = service.item(member.getCustNum());

		model.addAttribute("item", customer);

		return "/mypage-update";
	}

	@PostMapping("/mypage-update")
	String myPageUpdate(Customer item, @SessionAttribute Customer member) {
		item.setCustNum(member.getCustNum());
		item.setCustRole(member.getCustRole());

		service.update(item);

		return "redirect:mypage";
	}

	@ResponseBody
	@DeleteMapping("/accountCancel/{custNum}")
	String accountCancel(@PathVariable Long custNum, HttpSession session) {

		if(ordersService.myOrders(custNum).isEmpty()){
			service.accountCancel(custNum);

			session.invalidate();

			return "OK";
		}else {

			return "FAIL";
		}
	}

}
