package kr.ac.kopo.symovie.dao;

import java.util.List;


import kr.ac.kopo.symovie.model.Customer;
import kr.ac.kopo.symovie.pager.Pager;

public interface CustomerDao {

	List<Customer> list(Pager pager);

	void add(Customer item);

	Customer item(Long custNum);

	void update(Customer item);

	void delete(Long custNum);

	Customer item(String custId);

    int total();
}
