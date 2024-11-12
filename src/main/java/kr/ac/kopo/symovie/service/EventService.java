package kr.ac.kopo.symovie.service;

import java.util.List;

import kr.ac.kopo.symovie.model.Coupon;
import kr.ac.kopo.symovie.model.CouponCustomer;
import kr.ac.kopo.symovie.model.Event;

public interface EventService {

	List<Event> list();

	void add(Event item);

	Event item(Long eventNum);

	void update(Event item);

	void delete(Long eventNum);

	void giveCoupon(CouponCustomer item);

	List<Coupon> couponList(Long custNum);

}
