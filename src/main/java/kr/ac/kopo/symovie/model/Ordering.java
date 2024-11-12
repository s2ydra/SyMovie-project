package kr.ac.kopo.symovie.model;

import java.util.HashMap;
import java.util.Map;

public class Ordering {

    private Long movieNum;
    private int movieAmount;
    private Long custNum;


    public int getMovieAmount() {
        return movieAmount;
    }

    public void setMovieAmount(int movieAmount) {
        this.movieAmount = movieAmount;
    }

    public Long getMovieNum() {
        return movieNum;
    }

    public void setMovieNum(Long movieNum) {
        this.movieNum = movieNum;
    }

    public Long getCustNum() {
        return custNum;
    }

    public void setCustNum(Long custNum) {
        this.custNum = custNum;
    }
}
