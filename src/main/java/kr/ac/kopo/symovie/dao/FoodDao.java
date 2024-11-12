package kr.ac.kopo.symovie.dao;

import java.util.List;

import kr.ac.kopo.symovie.model.Food;
import kr.ac.kopo.symovie.model.FoodImage;
import kr.ac.kopo.symovie.pager.Pager;

public interface FoodDao {

	List<Food> list(Pager pager);

	void add(Food item);

	Food item(Long foodNum);

	void update(Food item);

	void delete(Long foodNum);

	void addImage(FoodImage image);

	int total(Pager pager);

}
