package kr.sh86.myApp.survey.domain;

public class Ars {
	private int num;
	private int arsNum;
	private String name;
	private String tel;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getArsNum() {
		return arsNum;
	}
	public void setArsNum(int arsNum) {
		this.arsNum = arsNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "Ars [num=" + num + ", arsNum=" + arsNum + ", name=" + name + ", tel=" + tel + "]";
	}
	
	
}
