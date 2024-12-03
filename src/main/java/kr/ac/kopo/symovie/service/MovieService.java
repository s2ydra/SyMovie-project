package kr.ac.kopo.symovie.service;

import java.util.List;
import java.util.Set;

import kr.ac.kopo.symovie.model.MegaMovie;
import kr.ac.kopo.symovie.model.Movie;
import kr.ac.kopo.symovie.pager.Pager;

public interface MovieService {

	List<Movie> list(Pager pager);

	void add(Movie item);

	Movie item(Long movieNum);

	void update(Movie item);

	void delete(Long movieNum);

	void dummy();

	void init();

	List<Movie> list(Set<Long> keySet);

    void megabox(MegaMovie item);
}
