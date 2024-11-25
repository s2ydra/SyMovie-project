package kr.ac.kopo.symovie.service;

import kr.ac.kopo.symovie.dao.CouponDao;
import kr.ac.kopo.symovie.model.Coupon;
import kr.ac.kopo.symovie.model.CouponCustomer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CouponServiceImpl implements CouponService {

    @Autowired
    CouponDao dao;

    @Override
    public void addCoupon(CouponCustomer coupon) {

        dao.takeCoupon(coupon);
    }

    @Override
    public List<Coupon> myCoupon(Long custNum) {
        return dao.myCoupon(custNum);
    }

    @Override
    public boolean hasCheck(CouponCustomer item) {

        CouponCustomer hasCheck = dao.forCheck(item);

        if(hasCheck == null){
            return false;
        }
        else{
            return true;
        }
        }

    @Override
    public Coupon item(Long couponNum) {
        return dao.item(couponNum);
    }


}
