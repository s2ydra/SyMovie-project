package kr.ac.kopo.symovie.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Ordering {

    private Movie movie;
    private Orders orders;
    private OrderDetail orderDetail;

    private List<Food> food;

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
