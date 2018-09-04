package com.myweb.dao;

import java.util.List;

import com.myweb.pojo.Customer;
import com.myweb.pojo.QueryVo;

public interface CustomerMapper {
	
	public List<Customer> pageList(QueryVo queryVo);
	
	public int getCount(QueryVo queryVo);
	
	public Customer getById(String id);
	
	public void updateById(Customer customer);
	
	public void delById(String id);
}