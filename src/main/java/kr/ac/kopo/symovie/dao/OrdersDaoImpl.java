package kr.ac.kopo.symovie.dao;

import kr.ac.kopo.symovie.model.Orders;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

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
}
