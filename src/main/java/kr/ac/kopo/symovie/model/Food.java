package kr.ac.kopo.symovie.model;

import java.util.List;

public class Food {
	private Long foodNum;
	private String foodType;
	private String foodName;
	private Long foodPrice;
	private String foodInfo;
	
	private List<FoodImage> foodImage;

	
	
	public List<FoodImage> getFoodImage() {
		return foodImage;
	}

	public void setFoodImage(List<FoodImage> foodImage) {
		this.foodImage = foodImage;
	}

	public Long getFoodNum() {
		return foodNum;
	}

	public void setFoodNum(Long foodNum) {
		this.foodNum = foodNum;
	}

	public String getFoodType() {
		return foodType;
	}

	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}

	public String getFoodName() {
		return foodName;
	}

	public void setFoodName(String foodName) {
		this.foodName = foodName;
	}

	public Long getFoodPrice() {
		return foodPrice;
	}

	public void setFoodPrice(Long foodPrice) {
		this.foodPrice = foodPrice;
	}

	public String getFoodInfo() {
		return foodInfo;
	}

	public void setFoodInfo(String foodInfo) {
		this.foodInfo = foodInfo;
	}

}
