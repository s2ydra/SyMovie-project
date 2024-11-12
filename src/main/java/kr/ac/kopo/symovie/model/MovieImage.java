package kr.ac.kopo.symovie.model;

public class MovieImage {
	private Long movieImageNum;
	private Long movieNum;
	private String movieImageFilename;
	private String movieImageUuid;

	public Long getMovieImageNum() {
		return movieImageNum;
	}

	public void setMovieImageNum(Long movieImageNum) {
		this.movieImageNum = movieImageNum;
	}

	public Long getMovieNum() {
		return movieNum;
	}

	public void setMovieNum(Long movieNum) {
		this.movieNum = movieNum;
	}

	public String getMovieImageFilename() {
		return movieImageFilename;
	}

	public void setMovieImageFilename(String movieImageFilename) {
		this.movieImageFilename = movieImageFilename;
	}

	public String getMovieImageUuid() {
		return movieImageUuid;
	}

	public void setMovieImageUuid(String movieImageUuid) {
		this.movieImageUuid = movieImageUuid;
	}

}
