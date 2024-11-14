package kr.ac.kopo.symovie.service;

import kr.ac.kopo.symovie.dao.MovieDao;
import kr.ac.kopo.symovie.dao.OrdersDao;
import kr.ac.kopo.symovie.model.Ordering;
import kr.ac.kopo.symovie.model.Orders;
import kr.ac.kopo.symovie.model.OrderDetail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    OrdersDao dao;

    @Autowired
    MovieDao movieDao;

    @Override
    public List<Orders> list(Long custNum) {
        return dao.list(custNum);
    }

    @Override
    public Orders item(Long orderNum) {
        return dao.item(orderNum);
    }

    @Override
    public Ordering orderMovie(Ordering orderItem) {

        return dao.ordering(orderItem);
    }

}
