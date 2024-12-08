package kr.ac.kopo.symovie.dao;

import kr.ac.kopo.symovie.model.Coupon;
import kr.ac.kopo.symovie.model.CouponCustomer;

import java.util.List;

public interface CouponDao {

    void takeCoupon(CouponCustomer coupon);

    List<Coupon> myCoupon(Long custNum);

    CouponCustomer forCheck(CouponCustomer item);

    Coupon item(Long couponNum);

    void giveUpCoupon(Long custNum);
}
