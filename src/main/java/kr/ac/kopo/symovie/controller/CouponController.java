package kr.ac.kopo.symovie.controller;

import kr.ac.kopo.symovie.model.Coupon;
import kr.ac.kopo.symovie.service.CouponService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;


import kr.ac.kopo.symovie.model.CouponCustomer;
import kr.ac.kopo.symovie.model.Customer;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/coupon")
public class CouponController {

	final String path = "coupon/";

	@Autowired
	CouponService service;



	@ResponseBody
	@GetMapping("/addCoupon/{couponNum}")
	String addCoupon(@PathVariable Long couponNum, @SessionAttribute Customer member) {

			CouponCustomer item = new CouponCustomer();


			item.setCouponNum(couponNum);
			item.setCustNum(member.getCustNum());

		if(!service.hasCheck(item)){
			System.out.println(item.getCouponNum());
			System.out.println(item.getCustNum());

			service.addCoupon(item);

			return "ok";
		}else if(service.hasCheck(item)){
			return "error";
		}else {
			return "systemError";
		}

	}

	@GetMapping("/list")
	String couponList(Model model, @SessionAttribute Customer member) {

		List<Coupon> list = service.myCoupon(member.getCustNum());

		model.addAttribute("list", list);

		return path + "list";
	}

	@GetMapping("/list-popup")
	String couponPopup(Model model, @SessionAttribute Customer member) {
		List<Coupon> list = service.myCoupon(member.getCustNum());
		model.addAttribute("list", list);
		return path + "list-popup";
	}

	@ResponseBody
	@GetMapping("/item/{couponNum}")
	Coupon couponItem(@PathVariable Long couponNum, @SessionAttribute Customer member) {

        return service.item(couponNum);
	}
}
