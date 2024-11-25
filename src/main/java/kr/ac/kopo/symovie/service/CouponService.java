package kr.ac.kopo.symovie.service;

import kr.ac.kopo.symovie.model.Coupon;
import kr.ac.kopo.symovie.model.CouponCustomer;

import java.util.List;

public interface CouponService {

    void addCoupon(CouponCustomer coupon);

    List<Coupon> myCoupon(Long custNum);

    boolean hasCheck(CouponCustomer item);


    Coupon item(Long couponNum);
}
