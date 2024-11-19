package kr.ac.kopo.symovie.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

// Order에 관련된 데이터들이 많아, 임의의 Model 객체 생성
public class Ordering {

    private Movie movie;
    private Orders orders;
    private OrderDetail orderDetail;
    private Customer customer;

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
    }

    //JavaScript 에서 fetch로 리스트를 가지고올 때(list-popup)
    private List<Food> food;


    private Long orderFoodNum;
    private Map<Long, Integer> foodMap;

    public Map<Long, Integer> getFoodMap() {
        return foodMap;
    }

    public void setFoodMap(Map<Long, Integer> foodMap) {
        this.foodMap = foodMap;
    }

    public Long getOrderFoodNum() {
        return orderFoodNum;
    }

    public void setOrderFoodNum(Long orderFoodNum) {
        this.orderFoodNum = orderFoodNum;
    }

    public List<Food> getFood() {
        return food;
    }

    public void setFood(List<Food> food) {
        this.food = food;
    }

    public Movie getMovie() {

        return movie;
    }

    public void setMovie(Movie movie) {

        this.movie = movie;
    }

    public Orders getOrders() {

        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public OrderDetail getOrderDetail() {


        if (orderDetail == null) {
            orderDetail = new OrderDetail();
        }

        return orderDetail;
    }

    public void setOrderDetail(OrderDetail orderDetail) {
        this.orderDetail = orderDetail;
    }
}
