package kr.ac.kopo.symovie.model;

import java.util.Date;

public class Orders {
    private Long orderNum;
    private Long custNum;
    private Date orderDate;

    OrderDetail orderDetail;

    public Long getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Long orderNum) {
        this.orderNum = orderNum;
    }

    public Long getCustNum() {
        return custNum;
    }

    public void setCustNum(Long custNum) {
        this.custNum = custNum;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public OrderDetail getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(OrderDetail orderDetail) {
        this.orderDetail = orderDetail;
    }
}
