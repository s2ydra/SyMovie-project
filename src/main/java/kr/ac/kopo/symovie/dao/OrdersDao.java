package kr.ac.kopo.symovie.dao;

import kr.ac.kopo.symovie.model.OrderDetail;
import kr.ac.kopo.symovie.model.Ordering;
import kr.ac.kopo.symovie.model.Orders;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface OrdersDao {
    List<Orders> list(Long custNum);

    Orders item(Long orderNum);

    Ordering ordering(Ordering orderItem);

    void addOrders(Long custNum);

    void addOrderFood(Map<Long, Integer> foodMap);

    void addOrderDetail(OrderDetail orderDetail);
}
