package kr.ac.kopo.symovie.pager;

import java.util.ArrayList;
import java.util.List;

public class Pager {
	private int page = 1;
	private int perPage = 20;
	private int perGroup = 5;
	
	private float total;

	private int movieSearch;
	private String movieKeyword;

	private int foodSearch;
	private String foodKeyword;


	
	public int getFoodSearch() {
		return foodSearch;
	}


	public void setFoodSearch(int foodSearch) {
		this.foodSearch = foodSearch;
	}


	public String getFoodKeyword() {
		return foodKeyword;
	}


	public void setFoodKeyword(String foodKeyword) {
		this.foodKeyword = foodKeyword;
	}


	public String getQuery() {
		String query = "";
		
		if(movieSearch > 0) {
			query += "&movieSearch=" + movieSearch + "&movieKeyword=" + movieKeyword;
		}
		
		return query;
	}
	

	public int getMovieSearch() {
		return movieSearch;
	}

	public void setMovieSearch(int movieSearch) {
		this.movieSearch = movieSearch;
	}

	public String getMovieKeyword() {
		return movieKeyword;
	}

	public void setMovieKeyword(String movieKeyword) {
		this.movieKeyword = movieKeyword;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPerPage() {
		return perPage;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getPerGroup() {
		return perGroup;
	}

	public void setPerGroup(int perGroup) {
		this.perGroup = perGroup;
	}

	public int getLast() {

		return (int) Math.ceil(total / perPage);
	}

	public List<Integer> getList() {
		List<Integer> list = new ArrayList<Integer>();

		int startPage;
		

		if(page - 2 >= 1) {
			startPage = page - 2;
		}else {
			startPage = 1;
		}
		
		for (int i = startPage; i < (startPage + perGroup) && i <= getLast(); i++)
				list.add(i);
		

		if (list.isEmpty())
			list.add(1);

		return list;
	}
	
	
	
	
}
