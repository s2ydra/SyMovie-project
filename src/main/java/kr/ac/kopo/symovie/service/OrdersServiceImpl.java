package kr.ac.kopo.symovie.service;

import kr.ac.kopo.symovie.dao.MovieDao;
import kr.ac.kopo.symovie.dao.OrdersDao;
import kr.ac.kopo.symovie.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.DeleteMapping;

import java.util.List;

@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    OrdersDao dao;

    @Autowired
    MovieDao movieDao;


    @Override
    public Orders item(Long orderNum) {
        return dao.item(orderNum);
    }

    @Transactional
    @Override
    public void reserve(Ordering ordering) {

        dao.addOrders(ordering.getOrders());

        if(ordering.getOrderFood() != null) {
            if(ordering.getOrderFood().getFoodMap() != null && !ordering.getOrderFood().getFoodMap().isEmpty()){
                dao.addOrderFood(ordering.getOrderFood());
            }

        }

        OrderDetail orderDetail = ordering.getOrderDetail();
        orderDetail.setOrderNum(ordering.getOrders().getOrderNum());

        if(ordering.getOrderFood() != null) {
            if(ordering.getOrderFood().getFoodMap() != null && !ordering.getOrderFood().getFoodMap().isEmpty()) {
                orderDetail.setFoodOrderingNum(ordering.getOrderFood().getFoodOrderingNum());
            }
        }else{
            orderDetail.setFoodOrderingNum(null);
        }

        dao.addOrderDetail(orderDetail);
    }

    @Override
    public List<Ordering> myOrders(Long custNum) {
        return dao.myOrders(custNum);
    }

    @Override
    public boolean itemAsNum(Long orderDetailNum) {
        Ordering ordering = dao.itemAsNum(orderDetailNum);

        if(ordering.getOrderDetail() != null && ordering.getOrders() != null) {
            return true;
        }else{
            return false;
        }
    }

    @Transactional
    @Override
    public void deleteOrder(Long orderDetailNum) {

        Ordering ordering = dao.itemAsNum(orderDetailNum);

        dao.deleteOrderDetail(orderDetailNum);

        if(ordering.getOrderFoodList() != null && !ordering.getOrderFoodList().isEmpty()){
            dao.deleteOrderFood(ordering.getOrderFood().getFoodOrderingNum());
        }

        dao.deleteOrders(ordering.getOrders().getOrderNum());

    }

    @Override
    public OrderDetail hasFood(Long ordersDetailNum) {
        return dao.hasFood(ordersDetailNum);
    }

    @Transactional
    @Override
    public void addFood(AddFood addFood) {

        dao.addFood(addFood);

        dao.updateOrderDetail(addFood);
    }
}
