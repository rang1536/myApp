package kr.sh86.myApp.survey.domain;

public class ArsRes {
	private int resNo;
	private String sendDate;
	private String order;
	private String subject;
	private int unqCnt; //비적격(결번6)
	private int unqCnt2; //비적격(리절트3)
	private int failCnt; //부재중 4
	private int failCnt2; //통화중 5
	private int succCnt; //접촉 2 
	private int completeCnt; //응답완료
	private int totalCnt;
	
	
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getUnqCnt2() {
		return unqCnt2;
	}
	public void setUnqCnt2(int unqCnt2) {
		this.unqCnt2 = unqCnt2;
	}
	public int getFailCnt2() {
		return failCnt2;
	}
	public void setFailCnt2(int failCnt2) {
		this.failCnt2 = failCnt2;
	}
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getUnqCnt() {
		return unqCnt;
	}
	public void setUnqCnt(int unqCnt) {
		this.unqCnt = unqCnt;
	}
	public int getFailCnt() {
		return failCnt;
	}
	public void setFailCnt(int failCnt) {
		this.failCnt = failCnt;
	}
	public int getSuccCnt() {
		return succCnt;
	}
	public void setSuccCnt(int succCnt) {
		this.succCnt = succCnt;
	}
	public int getCompleteCnt() {
		return completeCnt;
	}
	public void setCompleteCnt(int completeCnt) {
		this.completeCnt = completeCnt;
	}
	@Override
	public String toString() {
		return "ArsRes [resNo=" + resNo + ", sendDate=" + sendDate + ", order=" + order + ", subject=" + subject
				+ ", unqCnt=" + unqCnt + ", unqCnt2=" + unqCnt2 + ", failCnt=" + failCnt + ", failCnt2=" + failCnt2
				+ ", succCnt=" + succCnt + ", completeCnt=" + completeCnt + ", totalCnt=" + totalCnt + "]";
	}
	
	
}
