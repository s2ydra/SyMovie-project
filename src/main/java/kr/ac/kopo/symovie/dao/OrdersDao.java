package kr.ac.kopo.symovie.dao;

import kr.ac.kopo.symovie.model.OrderDetail;
import kr.ac.kopo.symovie.model.OrderFood;
import kr.ac.kopo.symovie.model.Ordering;
import kr.ac.kopo.symovie.model.Orders;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface OrdersDao {


    Orders item(Long orderNum);





    void addOrderFood(OrderFood orderFood);

    void addOrderDetail(OrderDetail orderDetail);

    void addOrders(Orders orders);

    List<Ordering> myOrders(Long custNum);
}
