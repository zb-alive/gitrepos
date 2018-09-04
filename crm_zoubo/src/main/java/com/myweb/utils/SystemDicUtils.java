package com.myweb.utils;

import java.util.List;

import com.myweb.pojo.BaseDict;

/**
 * 字典工具类
 * @author Administrator
 *
 */
public class SystemDicUtils {

	public static String getDictItemName(String dictId,List<BaseDict> list) {
		String dictName = "";
		for (BaseDict baseDict : list) {
			 if(baseDict.getDict_id().equals(dictId)) {
				 dictName = baseDict.getDict_item_name();
				 break;
			 }
		}
		return dictName;
	}
}
