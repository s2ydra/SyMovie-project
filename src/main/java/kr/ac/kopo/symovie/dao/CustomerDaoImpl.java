package kr.ac.kopo.symovie.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.kopo.symovie.model.Coupon;
import kr.ac.kopo.symovie.model.CouponCustomer;
import kr.ac.kopo.symovie.model.Customer;
import kr.ac.kopo.symovie.pager.Pager;

@Repository
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	SqlSession sql;
	
	@Override
	public List<Customer> list(Pager pager) {
		
		return sql.selectList("customer.list", pager);
	}

	@Override
	public void add(Customer item) {
		
		sql.insert("customer.add", item);
	}

	@Override
	public Customer item(Long custNum) {
		
		return sql.selectOne("customer.item", custNum);
	}

	@Override
	public void update(Customer item) {
		
		sql.update("customer.update", item);
	}

	@Override
	public void delete(Long custNum) {
		
		sql.delete("customer.delete",custNum);
	}

	@Override
	public Customer item(String custId) {
		
		return sql.selectOne("customer.itemid", custId);
	}

	@Override
	public int total() {
		return sql.selectOne("customer.total");
	}


}
