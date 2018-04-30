package kr.sh86.myApp.survey.domain;

public class Result {
	private int num;
	private String tel;
	
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "Result [num=" + num + ", tel=" + tel + "]";
	}
	
	
}
