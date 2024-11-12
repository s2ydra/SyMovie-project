package kr.ac.kopo.symovie.controller;

import kr.ac.kopo.symovie.model.Customer;
import kr.ac.kopo.symovie.model.Movie;
import kr.ac.kopo.symovie.model.Orders;
import kr.ac.kopo.symovie.model.OrdersDetail;
import kr.ac.kopo.symovie.service.MovieService;
import kr.ac.kopo.symovie.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/orders")
public class OrdersController {
    final String path = "orders/";

    @Autowired
    OrdersService service;

    @Autowired
    MovieService movieService;

    @GetMapping("/list")
    public String list(Model model, @SessionAttribute Customer member) {

        List<Orders> list = service.list(member.getCustNum());

        model.addAttribute("list", list);

        return path + "list";
    }

    @GetMapping("/order/{movieNum}")
    String order(Model model, @PathVariable Long movieNum) {
        Orders item = service.item(movieNum);

        model.addAttribute("item", item);

        return path + "orderMovie";
    }

    @GetMapping("/orderDetail/{movieNum}/{movieAmount}")
    String orderDetail(Model model, @PathVariable Long movieNum,
                       @PathVariable int movieAmount, @SessionAttribute Customer member) {
        OrdersDetail ordersDetail = new OrdersDetail();

        return path + "orderMovieDetail";
    }

}
