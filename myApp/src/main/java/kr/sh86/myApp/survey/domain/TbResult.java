package kr.sh86.myApp.survey.domain;

public class TbResult {
	private int no;
	private String result;
	private String result2;
	private String senddate;
	private String stime;
	private String rtime;
	private String duration;
	private String a1;
	private String a2;
	private String a3;
	private String a4;
	private String a5;
	private String isCompany;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getResult2() {
		return result2;
	}
	public void setResult2(String result2) {
		this.result2 = result2;
	}
	public String getSenddate() {
		return senddate;
	}
	public void setSenddate(String senddate) {
		this.senddate = senddate;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getRtime() {
		return rtime;
	}
	public void setRtime(String rtime) {
		this.rtime = rtime;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getA1() {
		return a1;
	}
	public void setA1(String a1) {
		this.a1 = a1;
	}
	public String getA2() {
		return a2;
	}
	public void setA2(String a2) {
		this.a2 = a2;
	}
	public String getA3() {
		return a3;
	}
	public void setA3(String a3) {
		this.a3 = a3;
	}
	public String getA4() {
		return a4;
	}
	public void setA4(String a4) {
		this.a4 = a4;
	}
	public String getA5() {
		return a5;
	}
	public void setA5(String a5) {
		this.a5 = a5;
	}
	public String getIsCompany() {
		return isCompany;
	}
	public void setIsCompany(String isCompany) {
		this.isCompany = isCompany;
	}
	@Override
	public String toString() {
		return "TbResult [no=" + no + ", result=" + result + ", result2=" + result2 + ", senddate=" + senddate
				+ ", stime=" + stime + ", rtime=" + rtime + ", duration=" + duration + ", a1=" + a1 + ", a2=" + a2
				+ ", a3=" + a3 + ", a4=" + a4 + ", a5=" + a5 + ", isCompany=" + isCompany + "]";
	}
	
	
}
