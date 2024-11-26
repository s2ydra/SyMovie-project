package kr.ac.kopo.symovie.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.symovie.dao.MovieDao;
import kr.ac.kopo.symovie.model.Movie;
import kr.ac.kopo.symovie.model.MovieImage;
import kr.ac.kopo.symovie.pager.Pager;

@Service
public class MovieServiceImpl implements MovieService {

    @Autowired
    MovieDao dao;

    @Override
    public List<Movie> list(Pager pager) {

        int total = dao.total(pager);

        pager.setTotal(total);

        return dao.list(pager);
    }

    @Transactional
    @Override
    public void add(Movie item) {
        dao.add(item);

        if (item.getMovieImage() != null) {

            MovieImage image = item.getMovieImage();
            image.setMovieNum(item.getMovieNum());

            dao.addImage(image);
        }
    }

    @Transactional
    @Override
    public Movie item(Long movieNum) {

        Movie movie = dao.item(movieNum);

        return movie;
    }

    @Override
    public void update(Movie item) {

        dao.update(item);

        MovieImage movieImage = dao.itemImage(item.getMovieNum());

        if (item.getMovieImage() != null) {
            MovieImage image = item.getMovieImage();
            image.setMovieNum(item.getMovieNum());

            if (movieImage != null) {
                dao.updateImage(image);
            } else {
                dao.addImage(image);
            }

        }
    }

    @Transactional
    @Override
    public void delete(Long movieNum) {

        dao.delete_image(movieNum);
        dao.delete(movieNum);

    }

    @Override
    public void dummy() {
        Movie item = new Movie();

        // 사용자 편의를 위해 jsp에서 input 타입을 date로 줬기 때문에, Model 객체에서 openDate 필드를
        // Date(DateTimeFormat을 이용해)로 받았음.
        // 대량추가를 했을 때, 마땅히 랜덤한 날짜를 주는 것 보단, 오늘 날짜를 이용.
        // Java에서의 LocalDate.now 로 Java 의 날짜데이터를 생성 이후 데이터베이스(sql, Oracle)의 날짜로
        // 변환(MyBatis 기능).
        LocalDate someDay = LocalDate.now();
        Date today = java.sql.Date.valueOf(someDay);

        // 검색 기능 테스트를 위해 랜덤
        String[] agerange = {"15세 관람가", "전체이용가", "12세 관람가", "19세 관람가"};
        String[] genre = {"액션", "로맨스", "멜로", "판타지", "공포", "코미디", "다큐멘터리"};
        String[] country = {"대한민국", "미국", "일본", "중국", "동남아시아", "영국"};

        for (Long i = 1L; i < 100L; i++) {
            item.setMovieName("영화제목" + i);
            item.setMovieGenre(genre[(int) (Math.random() * genre.length)]);
            item.setMovieDirector("감독" + i);
            item.setMovieOpendate(today);
            item.setMovieAgerange(agerange[(int) (Math.random() * agerange.length)]);
            item.setMovieCountry(country[(int) (Math.random() * country.length)]);
            item.setMoviePrice(i * 1000L);
            item.setMovieInfo("영화소개" + i);

            dao.add(item);
        }
    }

    @Override
    public void init() {

        Pager pager = new Pager();
        pager.setPerPage(0);

        List<Movie> list = dao.list(pager);

        for (Movie item : list) {
            dao.delete_image(item.getMovieNum());
            dao.delete(item.getMovieNum());
        }

    }

    @Override
    public List<Movie> list(Set<Long> keySet) {

        if (keySet.isEmpty())
            return new ArrayList<Movie>();


        return dao.list(keySet);
    }


}
