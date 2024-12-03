package kr.ac.kopo.symovie.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class MegaMovie {
    private String movieName;
    private String movieOpendate;
    private String imgFilename;
    private MovieImage movieImage;
    private Long movieNum;
    private String movieImageUuid;
    private String movieAgerange;
    private String movieInfo;

    public String getMovieInfo() {
        return movieInfo;
    }

    public void setMovieInfo(String movieInfo) {
        this.movieInfo = movieInfo;
    }

    public String getMovieAgerange() {
        return movieAgerange;
    }

    public void setMovieAgerange(String movieAgerange) {
        this.movieAgerange = movieAgerange;
    }

    public String getMovieImageUuid() {
        return movieImageUuid;
    }

    public void setMovieImageUuid(String movieImageUuid) {
        this.movieImageUuid = movieImageUuid;
    }

    public Long getMovieNum() {
        return movieNum;
    }

    public void setMovieNum(Long movieNum) {
        this.movieNum = movieNum;
    }

    public MovieImage getMovieImage() {
        return movieImage;
    }

    public void setMovieImage(MovieImage movieImage) {
        this.movieImage = movieImage;
    }

    public String getImgFilename() {
        return imgFilename;
    }

    public void setImgFilename(String imgFilename) {
        this.imgFilename = imgFilename;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public String getMovieOpendate() {
        return movieOpendate;
    }

    public void setMovieOpendate(String movieOpendate) {
        this.movieOpendate = movieOpendate;
    }
}
