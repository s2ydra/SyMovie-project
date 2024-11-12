package kr.ac.kopo.symovie.service;

import kr.ac.kopo.symovie.model.Orders;
import kr.ac.kopo.symovie.model.OrdersDetail;

import java.util.List;
import java.util.Set;

public interface OrdersService {
    List<Orders> list(Long custNum);

    Orders item(Long orderNum);
    
}
