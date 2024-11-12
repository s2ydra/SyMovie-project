package kr.ac.kopo.symovie.model;

import java.util.Date;

public class OrdersDetail {
    private Long ordersDetailNum;
    private Long orderNum;
    private Long orderFoodNum;
    private Long foodNum;
    private Long sumPrice;
    private Date pickupDate;

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

    public Long getFoodNum() {
        return foodNum;
    }

    public void setFoodNum(Long foodNum) {
        this.foodNum = foodNum;
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
