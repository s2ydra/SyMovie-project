package kr.ac.kopo.symovie.model;

import java.util.Date;


public class CouponCustomer {

	private Long custNum;
	private Long couponNum;
	private Date expireDate;

	public Long getCustNum() {
		return custNum;
	}

	public void setCustNum(Long custNum) {
		this.custNum = custNum;
	}

	public Long getCouponNum() {
		return couponNum;
	}

	public void setCouponNum(Long couponNum) {
		this.couponNum = couponNum;
	}

	public Date getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(Date expireDate) {
		this.expireDate = expireDate;
	}

}
