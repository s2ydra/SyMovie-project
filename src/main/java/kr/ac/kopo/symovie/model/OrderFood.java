package kr.ac.kopo.symovie.model;

public class OrderFood {

    private Long orderFoodNum;
    private Long foodNum;
    private int amount;

    public Long getOrderFoodNum() {
        return orderFoodNum;
    }

    public void setOrderFoodNum(Long orderFoodNum) {
        this.orderFoodNum = orderFoodNum;
    }

    public Long getFoodNum() {
        return foodNum;
    }

    public void setFoodNum(Long foodNum) {
        this.foodNum = foodNum;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
