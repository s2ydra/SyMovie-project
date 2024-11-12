package kr.ac.kopo.symovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.symovie.dao.EventDao;
import kr.ac.kopo.symovie.model.Coupon;
import kr.ac.kopo.symovie.model.CouponCustomer;
import kr.ac.kopo.symovie.model.Event;

@Service
public class EventServiceImpl implements EventService {

	@Autowired
	EventDao dao;
	
	@Override
	public List<Event> list() {
		
		return dao.list();
	}

	@Transactional
	@Override
	public void add(Event item) {
		
		dao.add(item);
		
		if(item.getCoupon() != null) {
			Coupon coupon = item.getCoupon();
			
			
			
			coupon.setEventNum(item.getEventNum());
			dao.addCoupon(coupon);
			
		}
	}

	@Override
	public Event item(Long eventNum) {
		
		return dao.item(eventNum);
	}

	@Override
	public void update(Event item) {
		
		dao.update(item);
	}

	@Transactional
	@Override
	public void delete(Long eventNum) {
		
		dao.deleteCoupon(eventNum);
		
		dao.delete(eventNum);
	}

	@Override
	public void giveCoupon(CouponCustomer item) {
		
		dao.giveCoupon(item);
	}

	@Override
	public List<Coupon> couponList(Long custNum) {
		
		
		
		return dao.couponList(custNum);
	}

}
