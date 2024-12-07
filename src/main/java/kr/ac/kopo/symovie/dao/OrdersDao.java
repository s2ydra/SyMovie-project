package kr.ac.kopo.symovie.dao;

import kr.ac.kopo.symovie.model.*;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface OrdersDao {


    Orders item(Long orderNum);





    void addOrderFood(OrderFood orderFood);

    void addOrderDetail(OrderDetail orderDetail);

    void addOrders(Orders orders);

    List<Ordering> myOrders(Long custNum);

    Ordering itemAsNum(Long orderDetailNum);

    void deleteOrderDetail(Long orderDetailNum);

    void deleteOrderFood(Long foodOrderingNum);

    void deleteOrders(Long orderNum);

    OrderDetail hasFood(Long ordersDetailNum);

    void addFood(AddFood addFood);

    void updateOrderDetail(AddFood addFood);

    Ordering detail(Long orderDetailNum);

    List<OrderFood> myOrderFoods(Long foodOrderingNum);
}
