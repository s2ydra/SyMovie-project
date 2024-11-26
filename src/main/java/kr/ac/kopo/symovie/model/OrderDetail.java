package kr.ac.kopo.symovie.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class OrderDetail {
    private Long ordersDetailNum;
    private Long orderNum;
    private Long movieNum;
    private int movieAmount;
    private Long foodOrderingNum;
    private Long setNum;
    private Long sumPrice;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private Date runTime;

    @DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
    private Date pickupDate;

    public Date getRunTime() {
        return runTime;
    }

    public void setRunTime(Date runTime) {
        this.runTime = runTime;
    }

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

    public Long getFoodOrderingNum() {
        return foodOrderingNum;
    }

    public void setFoodOrderingNum(Long foodOrderingNum) {
        this.foodOrderingNum = foodOrderingNum;
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
