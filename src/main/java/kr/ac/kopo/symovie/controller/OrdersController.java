package kr.ac.kopo.symovie.controller;

import kr.ac.kopo.symovie.model.*;
import kr.ac.kopo.symovie.service.MovieService;
import kr.ac.kopo.symovie.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;

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


        return path + "orderMovie";
    }

    @GetMapping("/{movieNum}/{movieAmount}")
    String orderDetail(Model model, @PathVariable Long movieNum,
                       @PathVariable int movieAmount, @SessionAttribute Customer member) {

       Ordering ordering = new Ordering();

       ordering.setMovieNum(movieNum);
       ordering.setMovieAmount(movieAmount);
       ordering.setCustNum(member.getCustNum());

        Order item = service.orderDetail(ordering);


        model.addAttribute("list", item);

        return path + "orderMovieDetail";
    }

}
