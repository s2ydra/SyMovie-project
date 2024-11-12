package kr.ac.kopo.symovie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.symovie.model.Coupon;
import kr.ac.kopo.symovie.model.CouponCustomer;
import kr.ac.kopo.symovie.model.Event;

@Repository
public class EventDaoImpl implements EventDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Event> list() {

		return sql.selectList("event.list");
	}

	@Override
	public void add(Event item) {
		
		sql.insert("event.add", item);
	}

	@Override
	public Event item(Long eventNum) {
		
		return sql.selectOne("event.item", eventNum);
	}

	@Override
	public void update(Event item) {
		
		sql.update("event.update", item);
	}

	@Override
	public void delete(Long eventNum) {
		
		sql.delete("event.delete", eventNum);
	}

	@Override
	public void addCoupon(Coupon coupon) {
		
		sql.insert("event.addCoupon", coupon);
	}

	@Override
	public void deleteCoupon(Long eventNum) {
		
		sql.delete("event.deleteCoupon", eventNum);
	}

	@Override
	public void giveCoupon(CouponCustomer item) {
		
		sql.insert("event.giveCoupon", item);
	}

	@Override
	public List<Coupon> couponList(Long custNum) {
		
		return sql.selectList("event.couponList", custNum);
	}

}
