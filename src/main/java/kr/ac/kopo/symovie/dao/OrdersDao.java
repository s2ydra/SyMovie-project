package kr.ac.kopo.symovie.dao;

import kr.ac.kopo.symovie.model.Ordering;
import kr.ac.kopo.symovie.model.Orders;
import kr.ac.kopo.symovie.model.OrderDetail;
import org.springframework.core.annotation.Order;

import java.util.List;

public interface OrdersDao {
    List<Orders> list(Long custNum);

    Orders item(Long orderNum);


    Order orderDetail(Ordering ordering);
}
