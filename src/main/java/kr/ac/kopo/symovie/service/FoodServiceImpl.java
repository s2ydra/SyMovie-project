package kr.ac.kopo.symovie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.symovie.dao.FoodDao;
import kr.ac.kopo.symovie.model.Food;
import kr.ac.kopo.symovie.model.FoodImage;
import kr.ac.kopo.symovie.pager.Pager;

@Service
public class FoodServiceImpl implements FoodService {

	@Autowired
	FoodDao dao;
	
	@Override
	public List<Food> list(Pager pager) {

		int total = dao.total(pager);
		
		pager.setTotal(total);
		
		return dao.list(pager);
	}

	@Transactional
	@Override
	public void add(Food item) {
		
		dao.add(item);
		
		if(item.getFoodImage() != null) {
			for(FoodImage image : item.getFoodImage()) {
				image.setFoodNum(item.getFoodNum());
				
				dao.addImage(image);
			}
		}
		
	}

	@Override
	public Food item(Long foodNum) {
		
		return dao.item(foodNum);
	}

	@Override
	public void update(Food item) {
		dao.update(item);
		
	}

	@Override
	public void delete(Long foodNum) {
		dao.delete(foodNum);
		
	}

}
