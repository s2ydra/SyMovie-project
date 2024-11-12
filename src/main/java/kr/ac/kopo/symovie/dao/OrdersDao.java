package kr.ac.kopo.symovie.dao;

import kr.ac.kopo.symovie.model.Orders;

import java.util.List;

public interface OrdersDao {
    List<Orders> list(Long custNum);

    Orders item(Long orderNum);
}
