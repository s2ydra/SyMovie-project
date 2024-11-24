package kr.ac.kopo.symovie.service;

import kr.ac.kopo.symovie.model.OrderFood;
import kr.ac.kopo.symovie.model.Ordering;
import kr.ac.kopo.symovie.model.Orders;
import kr.ac.kopo.symovie.model.OrderDetail;
import org.springframework.core.annotation.Order;

import java.util.List;

public interface OrdersService {

    Orders item(Long orderNum);

    void reserve(Ordering ordering);


    List<Ordering> myOrders(Long custNum);
}
