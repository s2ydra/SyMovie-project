package kr.ac.kopo.symovie.model;

public class AddFood {
    private Long foodNum;
    private int amount;
    private Long sumPrice;
    private Long ordersDetailNum;
    private Long foodOrderingNum;

    public Long getFoodOrderingNum() {
        return foodOrderingNum;
    }

    public void setFoodOrderingNum(Long foodOrderingNum) {
        this.foodOrderingNum = foodOrderingNum;
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

    public Long getSumPrice() {
        return sumPrice;
    }

    public void setSumPrice(Long sumPrice) {
        this.sumPrice = sumPrice;
    }

    public Long getOrdersDetailNum() {
        return ordersDetailNum;
    }

    public void setOrdersDetailNum(Long ordersDetailNum) {
        this.ordersDetailNum = ordersDetailNum;
    }
}
