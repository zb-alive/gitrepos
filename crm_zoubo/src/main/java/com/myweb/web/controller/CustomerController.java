package com.myweb.web.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.myweb.pojo.BaseDict;
import com.myweb.pojo.Customer;
import com.myweb.pojo.PageBean;
import com.myweb.pojo.QueryVo;
import com.myweb.service.BaseDictService;
import com.myweb.service.CustomerService;
import com.myweb.utils.SystemDic;
import com.myweb.utils.SystemDicUtils;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Resource(name = "customerService")
	private CustomerService customerService;

	@Resource(name = "baseDictService")
	private BaseDictService baseDictService;

	/**
	 * 客户列表展示:分页
	 * 
	 * @param currPage
	 * @return
	 */
	@RequestMapping("/list")
	public String list(QueryVo queryVo, ModelMap map) {
		PageBean<Customer> page = customerService.findPageList(queryVo);
		// 处理customer表的数据字典
		List<BaseDict> sources = baseDictService.getDictItems(SystemDic.DIC_CUST_SOURCE);
		List<BaseDict> industry = baseDictService.getDictItems(SystemDic.DIC_CUST_INDUSTRY);
		List<BaseDict> level = baseDictService.getDictItems(SystemDic.DIC_CUST_LEVEL);
		// 每个客户具体的客户来源，客户行业，客户等级是什么
		for (Customer customer : page.getList()) {
			String sourceName = SystemDicUtils.getDictItemName(customer.getCust_source(), sources);
			customer.setCust_source_info(sourceName);
			String industryName = SystemDicUtils.getDictItemName(customer.getCust_industry(), industry);
			customer.setCust_industry_info(industryName);
			String levelName = SystemDicUtils.getDictItemName(customer.getCust_level(), level);
			customer.setCust_level_info(levelName);
		}
		map.put("page", page);
		map.put("sourceType", sources);
		map.put("industryType", industry);
		map.put("level", level);
		//设置回显查询条件
		map.put("queryVo", queryVo);
		return "customer";
	}
	
	@RequestMapping("/edit")
	public void edit(String id,HttpServletResponse response) throws Exception {
		Customer customer = customerService.getCustomerById(id);
		response.getWriter().print(JSON.toJSONString(customer));
	}
	
	@RequestMapping("/update")
	public void update(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//修改客户
		Customer customer = new Customer();
		org.apache.commons.beanutils.BeanUtils.populate(customer, request.getParameterMap());
		customerService.update(customer);
		//发送修改结果给界面
		response.getWriter().print("客戶修改成功！");
	}
	
	@RequestMapping("/delete")
	public void delete(String id,HttpServletResponse response) throws Exception{
		customerService.delete(id);
		response.getWriter().print("刪除成功！");
	}
}
