package kr.ac.kopo.symovie.dao;

import kr.ac.kopo.symovie.model.OrderDetail;
import kr.ac.kopo.symovie.model.OrderFood;
import kr.ac.kopo.symovie.model.Ordering;
import kr.ac.kopo.symovie.model.Orders;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Repository
public class OrdersDaoImpl implements OrdersDao {

    @Autowired
    SqlSession sql;


    @Override
    public List<Ordering> myOrders(Long custNum) {
        return sql.selectList("orders.myOrders", custNum);
    }

    @Override
    public Ordering itemAsNum(Long orderDetailNum) {
        return sql.selectOne("orders.itemAsNum", orderDetailNum);
    }

    @Override
    public void deleteOrderDetail(Long orderDetailNum) {
        sql.delete("orders.deleteOrderDetail", orderDetailNum);
    }

    @Override
    public void deleteOrderFood(Long foodOrderingNum) {
        sql.delete("orders.deleteOrderFood", foodOrderingNum);
    }

    @Override
    public void deleteOrders(Long orderNum) {
        sql.delete("orders.deleteOrders", orderNum);
    }

    @Override
    public Orders item(Long orderNum) {
        return sql.selectOne("orders.item", orderNum);
    }


    @Override
    public void addOrders(Orders orders) {
        sql.insert("orders.addOrders", orders);
    }


    @Override
    public void addOrderFood(OrderFood orderFood) {

        sql.insert("orders.addOrderFood", orderFood);

    }
    @Override
    public void addOrderDetail(OrderDetail orderDetail) {
        sql.insert("orders.addOrderDetail", orderDetail);
    }

}
