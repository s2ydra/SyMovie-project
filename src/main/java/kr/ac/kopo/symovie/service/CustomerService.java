package kr.ac.kopo.symovie.service;

import java.util.List;

import kr.ac.kopo.symovie.model.Customer;
import kr.ac.kopo.symovie.pager.Pager;

public interface CustomerService {

	List<Customer> list(Pager pager);

	void add(Customer item);

	Customer item(Long custNum);

	void update(Customer item);

	void delete(Long custNum);

	boolean login(Customer item);

	boolean idCheck(String custId);

	void signup(Customer item);

    void accountCancel(Long custNum);
}
