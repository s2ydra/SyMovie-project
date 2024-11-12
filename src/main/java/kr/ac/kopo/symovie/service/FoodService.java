package kr.ac.kopo.symovie.service;

import java.util.List;

import kr.ac.kopo.symovie.model.Food;
import kr.ac.kopo.symovie.pager.Pager;

public interface FoodService {

	List<Food> list(Pager pager);

	void add(Food item);

	Food item(Long foodNum);

	void update(Food item);

	void delete(Long foodNum);

}
