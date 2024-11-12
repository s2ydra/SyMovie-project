package kr.ac.kopo.symovie.model;

import java.util.Date;

public class Orders {
    private Long orderNum;
    private Long movieNum;
    private int movieAmount;
    private Long custNum;
    private Long setNum;
    private Date orderDate;

    private OrderDetail orderDetail;

    public OrderDetail getOrdersDetail() {
        return orderDetail;
    }

    public void setOrdersDetail(OrderDetail orderDetail) {
        this.orderDetail = orderDetail;
    }
    public Long getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Long orderNum) {
        this.orderNum = orderNum;
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

    public Long getCustNum() {
        return custNum;
    }

    public void setCustNum(Long custNum) {
        this.custNum = custNum;
    }

    public Long getSetNum() {
        return setNum;
    }

    public void setSetNum(Long setNum) {
        this.setNum = setNum;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }
}
