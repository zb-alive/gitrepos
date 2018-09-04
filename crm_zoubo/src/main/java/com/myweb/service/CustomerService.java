package com.myweb.service;

import com.myweb.pojo.Customer;
import com.myweb.pojo.PageBean;
import com.myweb.pojo.QueryVo;

public interface CustomerService {
	
	//带查询条件的分页查询客户列表
	public PageBean<Customer> findPageList(QueryVo queryVo);
	
	public Customer getCustomerById(String id);
	
	public void update(Customer customer);
	
	public void delete(String id);
	
}
