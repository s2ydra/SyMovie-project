package kr.ac.kopo.symovie.service;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.symovie.dao.CustomerDao;
import kr.ac.kopo.symovie.model.Coupon;
import kr.ac.kopo.symovie.model.CouponCustomer;
import kr.ac.kopo.symovie.model.Customer;
import kr.ac.kopo.symovie.pager.Pager;

@Service
public class CustomerServiceImpl implements CustomerService {

	@Autowired
	CustomerDao dao;
	
	@Override
	public List<Customer> list(Pager pager) {
		
		return dao.list(pager);
	}

	@Override
	public void add(Customer item) {
		
		dao.add(item);
	}

	@Override
	public Customer item(Long custNum) {
		
		
		
		return dao.item(custNum);
	}

	@Override
	public void update(Customer item) {
		
		dao.update(item);
	}

	@Override
	public void delete(Long custNum) {
		
		dao.delete(custNum);
	}

	@Override
	public boolean login(Customer item) {
		Customer customer = dao.item(item.getCustId());
		
		if(customer != null && item.getCustPasswd().equals(customer.getCustPasswd())) {
			
			BeanUtils.copyProperties(customer, item);
			
			item.setCustPasswd(null);
			
			return true;
		}
		
		return false;
	}

	@Override
	public boolean idCheck(String custId) {

		Customer customer = dao.item(custId);
		
		if(customer == null) {
			return true;
		}

		return false;
	}

	@Override
	public void signup(Customer item) {
		item.setCustRole(0L);
		
		dao.add(item);
		
		
		
	}




	



}
