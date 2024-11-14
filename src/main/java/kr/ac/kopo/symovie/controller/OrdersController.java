package kr.ac.kopo.symovie.controller;

import kr.ac.kopo.symovie.model.*;
import kr.ac.kopo.symovie.pager.Pager;
import kr.ac.kopo.symovie.service.CustomerService;
import kr.ac.kopo.symovie.service.FoodService;
import kr.ac.kopo.symovie.service.MovieService;
import kr.ac.kopo.symovie.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/orders")
public class OrdersController {
    final String path = "orders/";


    @Autowired
    OrdersService service;

    @Autowired
    MovieService movieService;

    @Autowired
    FoodService foodService;


    @GetMapping("/list")
    public String list(Model model, @SessionAttribute Customer member) {

        List<Orders> list = service.list(member.getCustNum());

        model.addAttribute("list", list);

        return path + "list";
    }

    @GetMapping("/orderMovie/{movieNum}")
    String orderMovie(Model model, OrderDetail item, @PathVariable Long movieNum,
                      @SessionAttribute Customer member, Pager pager) {

        // 예매하기 버튼을 누르면 주문상세번호, 영화제목, 티켓 매수, 먹거리 주문 창, 총 금액, 픽업일시 설정창 필요
        // 영화 <->(movieNum) 주문상세 <->(orderNum) 주문(리스트)
        // 주문상세에서 예매하기를 누르면 주문에 추가.
        // 받아올 수 있는 값 : movieNum, movieAmount, custNum
        // 값 3개를 가지는 객체를 가지고, database에서 해당 주문 정보를 resultMap으로 저장
        // service 단에서 selectOne 을 가지고 해당 고객이

        Ordering orderItem = new Ordering();

        Movie movieItem = movieService.item(movieNum);
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setMovieAmount(item.getMovieAmount());

        pager.setPerPage(5);

        List<Food> foodItem = foodService.list(pager);

        orderItem.setMovie(movieItem);
        orderItem.setOrderDetail(orderDetail);
        orderItem.setFood(foodItem);

        model.addAttribute("item", orderItem);

        return path + "orderMovie";
    }




}
