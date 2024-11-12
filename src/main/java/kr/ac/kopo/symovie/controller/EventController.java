package kr.ac.kopo.symovie.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.symovie.model.Coupon;
import kr.ac.kopo.symovie.model.CouponCustomer;
import kr.ac.kopo.symovie.model.Customer;
import kr.ac.kopo.symovie.model.Event;
import kr.ac.kopo.symovie.service.EventService;

@Controller
@RequestMapping("/event")
public class EventController {

	@Autowired
	EventService service;
	
	final String eventPath = "event/";
	
	
	@GetMapping("/list")
	String list(Model model) {
		List<Event> list = service.list();
		
		model.addAttribute("list", list);
		
		return eventPath + "list";
	}
	
	@GetMapping("/add")
	String add() {
		
		return eventPath + "add";
	}
	
	@PostMapping("/add")
	String add(Event item, Coupon couponData, @SessionAttribute Customer member) {
		
		Coupon coupons = new Coupon();
		
		String couponName = couponData.getCouponName();
		int discountRate = couponData.getDiscountRate();
		
		try {
			
			coupons.setCouponName(couponName);
			coupons.setDiscountRate(discountRate);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		item.setCoupon(coupons);
		
		service.add(item);
		
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{eventNum}")
	String update(@PathVariable Long eventNum, Model model) {
		
		Event item = service.item(eventNum);
		
		model.addAttribute("item", item);
		
		return eventPath + "update";
	}
	
	@PostMapping("/update/{eventNum}")
	String update(@PathVariable Long eventNum, Event item) {
		item.setEventNum(eventNum);
		
		service.update(item);
		
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{eventNum}")
	String delete(@PathVariable Long eventNum) {
		
		service.delete(eventNum);
		
		return "redirect:../list";
	}
	
	@GetMapping("/detail/{eventNum}")
	String detail(@PathVariable Long eventNum, Model model) {
		
		Event item = service.item(eventNum);
		
		System.out.println(item.getCoupon().getCouponNum());
		
		model.addAttribute("items", item);
		
		return eventPath + "detail";
		
	}
	
	
	
}
