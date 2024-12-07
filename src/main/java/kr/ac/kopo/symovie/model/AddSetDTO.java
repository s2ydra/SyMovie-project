package kr.ac.kopo.symovie.model;

public class AddSetDTO {
    private Long setNum;
    private String setName;
    private Long movieNum;
    private int movieAmount;
    private Long foodNum;
    private int foodAmount;
    private int setPrice;

    public int getFoodAmount() {
        return foodAmount;
    }

    public void setFoodAmount(int foodAmount) {
        this.foodAmount = foodAmount;
    }

    public Long getFoodNum() {
        return foodNum;
    }

    public void setFoodNum(Long foodNum) {
        this.foodNum = foodNum;
    }

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

    public int getSetPrice() {
        return setPrice;
    }

    public void setSetPrice(int setPrice) {
        this.setPrice = setPrice;
    }
}
