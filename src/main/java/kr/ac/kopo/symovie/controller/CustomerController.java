package kr.ac.kopo.symovie.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;


import kr.ac.kopo.symovie.model.CouponCustomer;
import kr.ac.kopo.symovie.model.Customer;
import kr.ac.kopo.symovie.pager.Pager;
import kr.ac.kopo.symovie.service.CustomerService;


@Controller
@RequestMapping("/customer")
public class CustomerController {
	
	final String customerPath = "customer/";
	
	@Autowired
	CustomerService service;
	
	@GetMapping("/list")
	String list(Model model, Pager pager) {
		
		List<Customer> list = service.list(pager);
		
		model.addAttribute("list", list);
		
		return customerPath + "list";
	}
	
	@GetMapping("/add")
	String add(){
		
		return customerPath + "add";
	}
	
	@PostMapping("/add")
	String add(Customer item) {
		
		
		service.add(item);
		
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{custNum}")
	String update(@PathVariable Long custNum, Model model) {
		
		Customer item = service.item(custNum);
		
		model.addAttribute("item", item);
		
		return customerPath + "update";
	}
	
	@PostMapping("/update/{custNum}")
	String update(@PathVariable Long custNum, Customer item) {
		item.setCustNum(custNum);
		
		service.update(item);
		
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{custNum}")
	String delete(@PathVariable Long custNum) {
		
		service.delete(custNum);
		
		return "redirect:../list";
	}
	
	
	
	
	
}
