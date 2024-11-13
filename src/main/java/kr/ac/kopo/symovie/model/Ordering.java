package kr.ac.kopo.symovie.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Ordering {

    private Movie movie;
    private Orders orders;
    private OrderDetail orderDetail;

    public Movie getMovie() {
        if (movie == null) {
            movie = new Movie();
        }
        return movie;
    }

    public void setMovie(Movie movie) {

        this.movie = movie;
    }

    public Orders getOrders() {

        if (orders == null) {
            orders = new Orders();
        }

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
