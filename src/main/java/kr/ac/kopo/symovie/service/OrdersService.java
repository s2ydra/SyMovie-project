package kr.ac.kopo.symovie.service;

import kr.ac.kopo.symovie.model.*;
import org.springframework.core.annotation.Order;

import java.util.List;

public interface OrdersService {

    Orders item(Long orderNum);

    void reserve(Ordering ordering);


    List<Ordering> myOrders(Long custNum);

    boolean itemAsNum(Long orderDetailNum);

    void deleteOrder(Long orderDetailNum);


    OrderDetail hasFood(Long ordersDetailNum);

    void addFood(AddFood addFood);

    Ordering detail(Long orderDetailNum);

    List<OrderFood> myOrderFoods(Long foodOrderingNum);
}
