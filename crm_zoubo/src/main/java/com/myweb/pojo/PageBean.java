package com.myweb.pojo;

import java.util.List;

/**
 * ͨ分页对象
 * 
 * @author Administrator
 *
 */
public class PageBean<T> {

	// 当前页的数据
	private List<T> list;
	// 当前页
	private int currPage;
	// 每页展示的数量
	private int pageSize;
	// 一共多少条记录
	private int totalCount;
	// 一共多少页
	private int totalPage;

	public PageBean() {
		super();
	}

	public List<T> getList() {
		return list;
	}

	public void setList(List<T> list) {
		this.list = list;
	}

	public int getCurrPage() {
		return currPage;
	}

	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalCount % pageSize == 0 ? totalCount / pageSize : totalCount / pageSize + 1;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
}
