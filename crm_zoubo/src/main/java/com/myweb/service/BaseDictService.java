package com.myweb.service;

import java.util.List;

import com.myweb.pojo.BaseDict;

public interface BaseDictService {

	public List<BaseDict> getDictItems(String dicttypecode);
}
