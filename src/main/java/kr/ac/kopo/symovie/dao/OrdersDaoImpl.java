package kr.ac.kopo.symovie.dao;

import kr.ac.kopo.symovie.model.Ordering;
import kr.ac.kopo.symovie.model.Orders;
import kr.ac.kopo.symovie.model.OrderDetail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class OrdersDaoImpl implements OrdersDao {

    @Autowired
    SqlSession sql;


    @Override
    public List<Orders> list(Long custNum) {
        return sql.selectList("orders.list", custNum);
    }

    @Override
    public Orders item(Long orderNum) {
        return sql.selectOne("orders.item", orderNum);
    }

    @Override
    public Ordering ordering(Ordering orderItem) {

        Map<String, Object> map = new HashMap<String, Object>();

        map.put("movie", orderItem.getMovie());
        map.put("orders", orderItem.getOrders());
        map.put("orderDetail", orderItem.getOrderDetail());

        return sql.selectOne("orders.ordering", map);
    }

}
