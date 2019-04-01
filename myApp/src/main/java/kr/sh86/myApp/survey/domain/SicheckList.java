package kr.sh86.myApp.survey.domain;

public class SicheckList {
	private String local;
	private int totalCnt;
	private int manCnt;
	private int womanCnt;
	private int targetCnt;
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getManCnt() {
		return manCnt;
	}
	public void setManCnt(int manCnt) {
		this.manCnt = manCnt;
	}
	public int getWomanCnt() {
		return womanCnt;
	}
	public void setWomanCnt(int womanCnt) {
		this.womanCnt = womanCnt;
	}
	public int getTargetCnt() {
		return targetCnt;
	}
	public void setTargetCnt(int targetCnt) {
		this.targetCnt = targetCnt;
	}
	@Override
	public String toString() {
		return "SicheckList [local=" + local + ", totalCnt=" + totalCnt + ", manCnt=" + manCnt + ", womanCnt="
				+ womanCnt + ", targetCnt=" + targetCnt + "]";
	}
	
	
}
