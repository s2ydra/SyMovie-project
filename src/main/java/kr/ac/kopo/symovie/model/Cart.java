package kr.ac.kopo.symovie.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	
	private Map<Long, Integer> cart = new HashMap<Long, Integer>();

	public Map<Long, Integer> getCart() {
		return cart;
	}

	public void setCart(Long movieNum, Integer movieAmount) {
		if(cart.containsKey(movieNum)) {
			cart.put(movieNum, cart.get(movieNum) + movieAmount);
		}else {
			cart.put(movieNum, movieAmount);
		}
	}

	public void delete(Long movieNum) {
		
		cart.remove(movieNum);
	}
	
	
}
