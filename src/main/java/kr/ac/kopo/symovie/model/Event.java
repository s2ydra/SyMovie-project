package kr.ac.kopo.symovie.model;

public class Event {

	private Long eventNum;
	private String eventTitle;
	private String eventInfo;

	private Coupon coupon;

	public Coupon getCoupon() {
		return coupon;
	}

	public void setCoupon(Coupon coupon) {
		this.coupon = coupon;
	}

	public Long getEventNum() {
		return eventNum;
	}

	public void setEventNum(Long eventNum) {
		this.eventNum = eventNum;
	}

	public String getEventTitle() {
		return eventTitle;
	}

	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}

	public String getEventInfo() {
		return eventInfo;
	}

	public void setEventInfo(String eventInfo) {
		this.eventInfo = eventInfo;
	}

}
