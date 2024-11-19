package kr.ac.kopo.symovie.service;

import kr.ac.kopo.symovie.model.Ordering;
import kr.ac.kopo.symovie.model.Orders;
import kr.ac.kopo.symovie.model.OrderDetail;
import org.springframework.core.annotation.Order;

import java.util.List;

public interface OrdersService {
    List<Orders> list(Long custNum);

    Orders item(Long orderNum);

    Ordering orderMovie(Ordering orderItem);

    void add(Ordering ordering);
}
