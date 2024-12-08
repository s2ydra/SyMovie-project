package kr.ac.kopo.symovie.dao;

import kr.ac.kopo.symovie.model.Coupon;
import kr.ac.kopo.symovie.model.CouponCustomer;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CouponDaoImpl implements CouponDao {

    @Autowired
    SqlSession sql;

    @Override
    public void takeCoupon(CouponCustomer coupon) {
        sql.insert("coupon.takeCoupon", coupon);
    }

    @Override
    public List<Coupon> myCoupon(Long custNum) {
        return sql.selectList("coupon.myCoupon", custNum);
    }

    @Override
    public CouponCustomer forCheck(CouponCustomer item) {
        return sql.selectOne("coupon.forCheck", item);
    }

    @Override
    public Coupon item(Long couponNum) {
        return sql.selectOne("coupon.item", couponNum);
    }

    @Override
    public void giveUpCoupon(Long custNum) {
        sql.delete("coupon.giveUpCoupon", custNum);
    }
}
