package kr.ac.kopo.symovie.model;

import org.springframework.core.annotation.Order;

import java.util.List;

public class Customer {
	private Long custNum;
	private String custId;
	private String custPasswd;
	private String custName;
	private Long custAge;
	private String custPhone;
	private Long custRole;
	
	private List<CouponCustomer> couponCustomer;

	private List<Orders> orders;

	public List<Orders> getOrders() {
		return orders;
	}

	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}

	public List<CouponCustomer> getCouponCustomer() {
		return couponCustomer;
	}

	public void setCouponCustomer(List<CouponCustomer> couponCustomer) {
		this.couponCustomer = couponCustomer;
	}

	public Long getCustNum() {
		return custNum;
	}

	public void setCustNum(Long custNum) {
		this.custNum = custNum;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public String getCustPasswd() {
		return custPasswd;
	}

	public void setCustPasswd(String custPasswd) {
		this.custPasswd = custPasswd;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public Long getCustAge() {
		return custAge;
	}

	public void setCustAge(Long custAge) {
		this.custAge = custAge;
	}

	public String getCustPhone() {
		return custPhone;
	}

	public void setCustPhone(String custPhone) {
		this.custPhone = custPhone;
	}

	public Long getCustRole() {
		return custRole;
	}

	public void setCustRole(Long custRole) {
		this.custRole = custRole;
	}

}
