package com.myweb.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.myweb.dao.BaseDicMappper;
import com.myweb.pojo.BaseDict;
import com.myweb.service.BaseDictService;

@Service(value="baseDictService")
public class BaseDictServiceImpl implements BaseDictService {
	
	@Resource(name="baseDicMappper")
	private BaseDicMappper baseDicMappper;
	
	@Override
	public List<BaseDict> getDictItems(String dicttypecode) {
		return baseDicMappper.getDicItemName(dicttypecode);
	}
}
