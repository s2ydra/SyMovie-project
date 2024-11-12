package kr.ac.kopo.symovie.model;

import java.util.List;

public class Coupon {
	private Long couponNum;
	private Long eventNum;
	private String couponName;
	private int discountRate;

	private List<CouponCustomer> couponCustomer;
	
	
	public List<CouponCustomer> getCouponCustomer() {
		return couponCustomer;
	}

	public void setCouponCustomer(List<CouponCustomer> couponCustomer) {
		this.couponCustomer = couponCustomer;
	}

	public String getCouponName() {
		return couponName;
	}

	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}

	public Long getCouponNum() {
		return couponNum;
	}

	public void setCouponNum(Long couponNum) {
		this.couponNum = couponNum;
	}

	public Long getEventNum() {
		return eventNum;
	}

	public void setEventNum(Long eventNum) {
		this.eventNum = eventNum;
	}

	public int getDiscountRate() {
		return discountRate;
	}

	public void setDiscountRate(int discountRate) {
		this.discountRate = discountRate;
	}

}
