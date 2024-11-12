package kr.ac.kopo.symovie.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Movie {
	private Long movieNum;
	private String movieGenre;
	private String movieName;
	private String movieDirector;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date movieOpendate;

	private String movieAgerange;
	private String movieCountry;
	private Long moviePrice;
	private String movieInfo;
	
	private MovieImage movieImage;
	
	
	public String getMovieInfo() {
		return movieInfo;
	}


	public MovieImage getMovieImage() {
		return movieImage;
	}


	public void setMovieImage(MovieImage movieImage) {
		this.movieImage = movieImage;
	}


	public void setMovieInfo(String movieInfo) {
		this.movieInfo = movieInfo;
	}

	public Long getMovieNum() {
		return movieNum;
	}

	public void setMovieNum(Long movieNum) {
		this.movieNum = movieNum;
	}

	public String getMovieGenre() {
		return movieGenre;
	}

	public void setMovieGenre(String movieGenre) {
		this.movieGenre = movieGenre;
	}

	public String getMovieName() {
		return movieName;
	}

	public void setMovieName(String movieName) {
		this.movieName = movieName;
	}

	public String getMovieDirector() {
		return movieDirector;
	}

	public void setMovieDirector(String movieDirector) {
		this.movieDirector = movieDirector;
	}

	public Date getMovieOpendate() {
		return movieOpendate;
	}

	public void setMovieOpendate(Date movieOpendate) {
		this.movieOpendate = movieOpendate;
	}


	public String getMovieAgerange() {
		return movieAgerange;
	}

	public void setMovieAgerange(String movieAgerange) {
		this.movieAgerange = movieAgerange;
	}

	public String getMovieCountry() {
		return movieCountry;
	}

	public void setMovieCountry(String movieCountry) {
		this.movieCountry = movieCountry;
	}

	public Long getMoviePrice() {
		return moviePrice;
	}

	public void setMoviePrice(Long moviePrice) {
		this.moviePrice = moviePrice;
	}

}