package kr.ac.kopo.symovie.model;

import java.util.List;
import java.util.Map;

public class OrderFood {
    private Long foodOrderingNum;
    private Long orderFoodNum;

    private List<OrderDetail> orderDetails;

    private Map<Long, Integer> foodMap;


    public List<OrderDetail> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetail> orderDetails) {
        this.orderDetails = orderDetails;
    }

    public Long getFoodOrderingNum() {
        return foodOrderingNum;
    }

    public void setFoodOrderingNum(Long foodOrderingNum) {
        this.foodOrderingNum = foodOrderingNum;
    }

    public Long getOrderFoodNum() {
        return orderFoodNum;
    }

    public void setOrderFoodNum(Long orderFoodNum) {
        this.orderFoodNum = orderFoodNum;
    }

    public Map<Long, Integer> getFoodMap() {
        return foodMap;
    }

    public void setFoodMap(Map<Long, Integer> foodMap) {
        this.foodMap = foodMap;
    }
}
