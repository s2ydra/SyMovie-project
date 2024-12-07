package kr.ac.kopo.symovie.model;

import java.util.List;

public class SetMenu {
    private Long setNum;
    private String setName;
    private Movie movie;
    private int movieAmount;
    private List<Food> food;
    private int foodAmount;
    private int setPrice;


    public int getFoodAmount() {
        return foodAmount;
    }

    public void setFoodAmount(int foodAmount) {
        this.foodAmount = foodAmount;
    }

    public int getMovieAmount() {
        return movieAmount;
    }

    public void setMovieAmount(int movieAmount) {
        this.movieAmount = movieAmount;
    }

    public int getSetPrice() {
        return setPrice;
    }

    public void setSetPrice(int setPrice) {
        this.setPrice = setPrice;
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

    public String getSetName() {
        return setName;
    }

    public void setSetName(String setName) {
        this.setName = setName;
    }

    public Long getSetNum() {
        return setNum;
    }

    public void setSetNum(Long setNum) {
        this.setNum = setNum;
    }
}
