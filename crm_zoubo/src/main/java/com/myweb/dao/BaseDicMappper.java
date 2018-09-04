package com.myweb.dao;

import java.util.List;

import com.myweb.pojo.BaseDict;

public interface BaseDicMappper {
	
	public List<BaseDict> getDicItemName(String dictypecode);
	
}