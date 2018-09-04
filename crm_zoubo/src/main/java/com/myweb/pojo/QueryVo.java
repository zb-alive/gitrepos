package com.myweb.pojo;

public class QueryVo {

	//用户查询条件
	private String custName;
	private String custSource;
	private String custIndustry;
	private String custLevel;

	//分页条件
	private int currPage = 1;
	private int sindex;
	private int scount = 10;
	
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getSindex() {
		return (currPage-1)*scount;
	}
	public void setSindex(int sindex) {
		this.sindex = sindex;
	}
	public int getScount() {
		return scount;
	}
	public void setScount(int scount) {
		this.scount = scount;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public String getCustSource() {
		return custSource;
	}
	public void setCustSource(String custSource) {
		this.custSource = custSource;
	}
	public String getCustIndustry() {
		return custIndustry;
	}
	public void setCustIndustry(String custIndustry) {
		this.custIndustry = custIndustry;
	}
	public String getCustLevel() {
		return custLevel;
	}
	public void setCustLevel(String custLevel) {
		this.custLevel = custLevel;
	}
}
