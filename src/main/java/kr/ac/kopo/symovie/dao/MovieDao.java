package kr.ac.kopo.symovie.dao;

import java.util.List;
import java.util.Set;

import kr.ac.kopo.symovie.model.Movie;
import kr.ac.kopo.symovie.model.MovieImage;
import kr.ac.kopo.symovie.pager.Pager;

public interface MovieDao {

	List<Movie> list(Pager pager);

	void add(Movie item);

	Movie item(Long movieNum);

	void update(Movie item);

	void delete(Long movieNum);

	int total(Pager pager);

	void addImage(MovieImage image);

	void delete_image(Long movieNum);

	List<Movie> list(Set<Long> keySet);

}
