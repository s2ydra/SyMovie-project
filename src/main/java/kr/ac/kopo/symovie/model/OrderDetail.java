package kr.ac.kopo.symovie.model;

import java.util.Date;

public class OrderDetail {
    private Long ordersDetailNum;
    private Long orderNum;
    private Long movieNum;
    private int movieAmount;
    private Long orderFoodNum;
    private Long setNum;
    private Long sumPrice;
    private Date pickupDate;

    public Long getMovieNum() {
        return movieNum;
    }

    public void setMovieNum(Long movieNum) {
        this.movieNum = movieNum;
    }

    public int getMovieAmount() {
        return movieAmount;
    }

    public void setMovieAmount(int movieAmount) {
        this.movieAmount = movieAmount;
    }

    public Long getSetNum() {
        return setNum;
    }

    public void setSetNum(Long setNum) {
        this.setNum = setNum;
    }

    public Long getOrdersDetailNum() {
        return ordersDetailNum;
    }

    public void setOrdersDetailNum(Long ordersDetailNum) {
        this.ordersDetailNum = ordersDetailNum;
    }

    public Long getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Long orderNum) {
        this.orderNum = orderNum;
    }

    public Long getOrderFoodNum() {
        return orderFoodNum;
    }

    public void setOrderFoodNum(Long orderFoodNum) {
        this.orderFoodNum = orderFoodNum;
    }

    public Long getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(Long sumPrice) {
        this.sumPrice = sumPrice;
    }

    public Date getPickupDate() {
        return pickupDate;
    }

    public void setPickupDate(Date pickupDate) {
        this.pickupDate = pickupDate;
    }
}
