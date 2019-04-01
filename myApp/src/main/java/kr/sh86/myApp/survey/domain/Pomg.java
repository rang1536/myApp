package kr.sh86.myApp.survey.domain;

public class Pomg {
	private int poNum;
	private String poTel2;
	public int getPoNum() {
		return poNum;
	}
	public void setPoNum(int poNum) {
		this.poNum = poNum;
	}
	public String getPoTel2() {
		return poTel2;
	}
	public void setPoTel2(String poTel2) {
		this.poTel2 = poTel2;
	}
	@Override
	public String toString() {
		return "Pomg [poNum=" + poNum + ", poTel2=" + poTel2 + "]";
	}
	
	
}
