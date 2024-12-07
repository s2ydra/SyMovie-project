package kr.ac.kopo.symovie.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// Order에 관련된 데이터들이 많아, 임의의 Model 객체 생성
public class Ordering {
    private Movie movie;
    private Orders orders;
    private OrderDetail orderDetail;
    private Customer customer;
    private Coupon coupon;

    private List<Orders> ordersList;

    private List<Food> food;

    private OrderFood orderFood;

    private List<OrderFood> orderFoodList;

    private MovieImage movieImage;

    private List<FoodImage> foodImageList;


    public List<FoodImage> getFoodImageList() {
        return foodImageList;
    }

    public void setFoodImageList(List<FoodImage> foodImageList) {
        this.foodImageList = foodImageList;
    }

    public List<OrderFood> getOrderFoodList() {
        return orderFoodList;
    }

    public MovieImage getMovieImage() {
        return movieImage;
    }

    public void setMovieImage(MovieImage movieImage) {
        this.movieImage = movieImage;
    }

    public Coupon getCoupon() {
        return coupon;
    }


    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
    }

    //JavaScript 에서 fetch로 리스트를 가지고올 때(list-popup)


    public void setOrderFoodList(List<OrderFood> orderFoodList) {
        this.orderFoodList = orderFoodList;
    }



    public List<Orders> getOrdersList() {
        return ordersList;
    }

    public void setOrdersList(List<Orders> ordersList) {
        this.ordersList = ordersList;
    }



    public OrderFood getOrderFood() {
        return orderFood;
    }

    public void setOrderFood(OrderFood orderFood) {
        this.orderFood = orderFood;
    }

    public Customer getCustomer() {
        return customer;
    }

    public void setCustomer(Customer customer) {
        this.customer = customer;
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
