package kr.ac.kopo.symovie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.symovie.model.Food;
import kr.ac.kopo.symovie.model.FoodImage;
import kr.ac.kopo.symovie.pager.Pager;

@Repository
public class FoodDaoImpl implements FoodDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Food> list(Pager pager) {
		
		return sql.selectList("food.list", pager);
	}

	@Override
	public void add(Food item) {
		
		sql.insert("food.add", item);
	}

	@Override
	public Food item(Long foodNum) {
		
		return sql.selectOne("food.item", foodNum);
	}

	@Override
	public void update(Food item) {
		sql.update("food.update", item);
		
	}

	@Override
	public void delete(Long foodNum) {
		sql.delete("food.delete", foodNum);
		
	}

	@Override
	public void addImage(FoodImage image) {
		
		sql.insert("food.addImage", image);
	}

	@Override
	public int total(Pager pager) {
		
		return sql.selectOne("food.total", pager);
	}



}
