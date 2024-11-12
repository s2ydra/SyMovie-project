package kr.ac.kopo.symovie.service;

import kr.ac.kopo.symovie.dao.OrdersDao;
import kr.ac.kopo.symovie.model.Orders;
import kr.ac.kopo.symovie.model.OrdersDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Set;

@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    OrdersDao dao;

    @Override
    public List<Orders> list(Long custNum) {
        return dao.list(custNum);
    }

    @Override
    public Orders item(Long orderNum) {
        return dao.item(orderNum);
    }

}
