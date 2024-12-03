package kr.ac.kopo.symovie.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Set;

import kr.ac.kopo.symovie.model.MegaMovie;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.symovie.model.Movie;
import kr.ac.kopo.symovie.model.MovieImage;
import kr.ac.kopo.symovie.pager.Pager;

@Repository
public class MovieDaoImpl implements MovieDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Movie> list(Pager pager) {
		
		return sql.selectList("movie.list", pager);
	}

	@Override
	public void add(Movie item) {
		sql.insert("movie.add", item);
		
	}

	@Override
	public Movie item(Long movieNum) {
		
		return sql.selectOne("movie.item", movieNum);
	}

	@Override
	public void update(Movie item) {
		
		sql.update("movie.update", item);
	}

	@Override
	public void delete(Long movieNum) {
		
		sql.delete("movie.delete", movieNum);
	}

	@Override
	public int total(Pager pager) {
		
		return sql.selectOne("movie.total", pager);
	}

	@Override
	public void addImage(MovieImage image) {
		
		sql.insert("movie.add_image", image);
	}

	@Override
	public void delete_image(Long movieNum) {
		
		sql.delete("movie.delete_image", movieNum);
	}

	@Override
	public List<Movie> list(Set<Long> keySet) {
		
		HashMap<String, Set<Long>> map = new HashMap<String, Set<Long>>();
		
		map.put("keySet", keySet);
		
		return sql.selectList("movie.cart", map);
	}

	@Override
	public void updateImage(MovieImage image) {

		sql.update("movie.update_image", image);
	}

	@Override
	public MovieImage itemImage(Long movieNum) {
		return sql.selectOne("movie.itemImage", movieNum);
	}

	@Override
	public void megabox(MegaMovie item) {
		sql.insert("movie.megabox", item);
	}

}
