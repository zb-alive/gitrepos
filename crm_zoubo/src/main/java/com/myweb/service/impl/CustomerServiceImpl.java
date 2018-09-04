package com.myweb.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myweb.dao.BaseDicMappper;
import com.myweb.dao.CustomerMapper;
import com.myweb.pojo.Customer;
import com.myweb.pojo.PageBean;
import com.myweb.pojo.QueryVo;
import com.myweb.service.CustomerService;

@Service(value = "customerService")
@Transactional
public class CustomerServiceImpl implements CustomerService {

	@Resource(name = "customerMapper")
	private CustomerMapper customerMapper;

	@Resource(name = "baseDicMappper")
	private BaseDicMappper baseDicMapper;

	@Override
	public PageBean<Customer> findPageList(QueryVo queryVo) {
		//加入用户手动选择的查询条件
		PageBean<Customer> pageBean = new PageBean<>();
		pageBean.setCurrPage(queryVo.getCurrPage());
		pageBean.setPageSize(queryVo.getScount());
		List<Customer> list = customerMapper.pageList(queryVo);
		pageBean.setList(list);
		pageBean.setTotalCount(customerMapper.getCount(queryVo));
		return pageBean;
	}

	@Override
	public Customer getCustomerById(String id) {
		return customerMapper.getById(id);
	}

	@Override
	public void update(Customer customer) {
		customerMapper.updateById(customer);
	}

	@Override
	public void delete(String id) {
        customerMapper.delById(id);
	}
}
