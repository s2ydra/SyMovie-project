package kr.ac.kopo.symovie.model;

public class FoodImage {
	private Long foodImageNum;
	private Long foodNum;
	private String foodImageFilename;
	private String foodImageUuid;

	public Long getFoodImageNum() {
		return foodImageNum;
	}

	public void setFoodImageNum(Long foodImageNum) {
		this.foodImageNum = foodImageNum;
	}

	public Long getFoodNum() {
		return foodNum;
	}

	public void setFoodNum(Long foodNum) {
		this.foodNum = foodNum;
	}

	public String getFoodImageFilename() {
		return foodImageFilename;
	}

	public void setFoodImageFilename(String foodImageFilename) {
		this.foodImageFilename = foodImageFilename;
	}

	public String getFoodImageUuid() {
		return foodImageUuid;
	}

	public void setFoodImageUuid(String foodImageUuid) {
		this.foodImageUuid = foodImageUuid;
	}

}
