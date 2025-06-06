package kr.ac.kopo.symovie.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
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

import java.util.*;
import java.util.stream.Collectors;

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

    @Autowired
    CustomerService customerService;


    @GetMapping("/list")
    public String list(Model model, @SessionAttribute Customer member) {

        // 받아와야하는 정보
        // list = 영화제목(Movie), 티켓매수(OrderDetail), 먹거리 주문건수(orderFood.size), 총 금액(OrderDetail), 주문일시
        // OrderDetail - movie / orders - OrderDetail  / orderFood - orderDetail
        // custId 로 orders -> orderDetail -> Movie, orderFood

        List<Ordering> ordersList = service.myOrders(member.getCustNum());

        model.addAttribute("ordersList", ordersList);

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

        if (item.getMovieAmount() > 0) {
            orderDetail.setMovieAmount(item.getMovieAmount());
        } else {
            orderDetail.setMovieAmount(1);
        }

        pager.setPerPage(5);

        List<Food> foodItem = foodService.list(pager);

        orderItem.setMovie(movieItem);
        orderItem.setOrderDetail(orderDetail);
        orderItem.setFood(foodItem);

        model.addAttribute("item", orderItem);

        return path + "orderMovie";
    }

    @ResponseBody
    @GetMapping("/getPrice/{foodNum}")
    Long getPrice(@PathVariable Long foodNum) {

        Food item = foodService.item(foodNum);

        return item.getFoodPrice();
    }

    @GetMapping("/order-popup")
    String orderPopup() {

        return path + "order-popup";
    }

    @PostMapping("/orderMovie/{movieNum}")
    String add(@SessionAttribute Customer member, String foodList,
               @PathVariable Long movieNum, int movieAmount, Long sumPrice, OrderDetail item,
                Long couponNum) throws JsonProcessingException {

        System.out.println(movieNum);
        System.out.println(movieAmount);
        System.out.println(sumPrice);

        Ordering ordering = new Ordering();
        OrderDetail orderDetail = new OrderDetail();

        OrderFood orderFood = new OrderFood();

        if (foodList != null && !foodList.trim().isEmpty()) {
            ObjectMapper objectMapper = new ObjectMapper();

            List<Map<String, Integer>> tempList = objectMapper.readValue(foodList, new TypeReference<List<Map<String, Integer>>>() {
            });

            List<Map<Long, Integer>> finalList = tempList.stream()
                    .map(map -> map.entrySet().stream()
                            .collect(Collectors.toMap(
                                    entry -> Long.parseLong(entry.getKey()),
                                    Map.Entry::getValue)))
                    .collect(Collectors.toList());


            orderDetail.setMovieNum(movieNum);
            orderDetail.setSumPrice(sumPrice);
            orderDetail.setMovieAmount(movieAmount);
            orderDetail.setRunTime(item.getRunTime());
            orderDetail.setPickupDate(item.getPickupDate());

            Map<Long, Integer> foodMap = new HashMap<>();

            for (Map<Long, Integer> map : finalList) {
                map.forEach((k, v) -> foodMap.put(k, v));
            }

            orderFood.setFoodMap(foodMap);

            ordering.setOrderFood(orderFood);
        }

        Orders orders = new Orders();
        orders.setCustNum(member.getCustNum());


        ordering.setOrderDetail(orderDetail);
        ordering.setOrders(orders);

        service.reserve(ordering);

        return "redirect:../complete";
    }


    @GetMapping("/complete")
    String complete(@SessionAttribute Customer member) {
        return path + "complete";
    }

    @ResponseBody
    @DeleteMapping("delete/{orderDetailNum}")
    String delete(@PathVariable Long orderDetailNum) {

        if(service.itemAsNum(orderDetailNum)) {
            service.deleteOrder(orderDetailNum);
            return "OK";
        } else{
        return "error";
        }
    }


    @GetMapping("/list-popup")
    String listPopup(@SessionAttribute Customer member, Model model) {
        List<Ordering> ordersList = service.myOrders(member.getCustNum());

        model.addAttribute("ordersList", ordersList);

        return path + "list-popup";
    }

    @ResponseBody
    @GetMapping("/hasFood/{ordersDetailNum}")
    String hasFood(@PathVariable Long ordersDetailNum, @SessionAttribute Customer member) {

        OrderDetail orderItem = service.hasFood(ordersDetailNum);

        if(orderItem.getFoodOrderingNum() != null) {
            return "Yes";
        }else{
            return "No";
        }
    }

    @ResponseBody
    @PostMapping("/addFood/{ordersDetailNum}")
    String addFood(@PathVariable Long ordersDetailNum, @RequestBody AddFood addFood) {

        addFood.setOrdersDetailNum(ordersDetailNum);

        service.addFood(addFood);

        return "OK";
    }

    @GetMapping("/detail/{orderDetailNum}")
    String detail(Model model, @PathVariable Long orderDetailNum){

        Ordering item = service.detail(orderDetailNum);
        List<OrderFood> orderfoods = new ArrayList<OrderFood>();

        if(item.getOrderDetail().getFoodOrderingNum() != null){
            orderfoods = service.myOrderFoods(item.getOrderDetail().getFoodOrderingNum());
        }else {
            orderfoods = null;
        }

        model.addAttribute("item", item);
        model.addAttribute("orderFoods", orderfoods);

        return path + "detail";
    }
}
