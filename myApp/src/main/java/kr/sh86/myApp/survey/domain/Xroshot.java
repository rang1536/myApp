package kr.sh86.myApp.survey.domain;

public class Xroshot {
	private String destName;
	private int result;
	private int tcsResult;
	private String repliedFile;
	private String phoneNumber;
	private String sendDate;
	private int ans1;
	private int ans2;
	private int ans3;
	private int ans4;
	private String ans5;
	private int ans6;
	private int ans7;
	private int ans8;
	private int ans9;
	private int ans10;
	private int ans11;
	private String jobId;
	private int msgId;
	private int no;
	private String stime;
	private String rtime;
	private int duration;
	private String isCompany;
	
	
	public int getDuration() {
		return duration;
	}
	public void setDuration(int duration) {
		this.duration = duration;
	}
	public String getIsCompany() {
		return isCompany;
	}
	public void setIsCompany(String isCompany) {
		this.isCompany = isCompany;
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
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMsgId() {
		return msgId;
	}
	public void setMsgId(int msgId) {
		this.msgId = msgId;
	}
	public int getAns1() {
		return ans1;
	}
	public void setAns1(int ans1) {
		this.ans1 = ans1;
	}
	public int getAns2() {
		return ans2;
	}
	public void setAns2(int ans2) {
		this.ans2 = ans2;
	}
	public int getAns3() {
		return ans3;
	}
	public void setAns3(int ans3) {
		this.ans3 = ans3;
	}
	public int getAns4() {
		return ans4;
	}
	public void setAns4(int ans4) {
		this.ans4 = ans4;
	}
	
	public String getAns5() {
		return ans5;
	}
	public void setAns5(String ans5) {
		this.ans5 = ans5;
	}
	public int getAns6() {
		return ans6;
	}
	public void setAns6(int ans6) {
		this.ans6 = ans6;
	}
	public int getAns7() {
		return ans7;
	}
	public void setAns7(int ans7) {
		this.ans7 = ans7;
	}
	public int getAns8() {
		return ans8;
	}
	public void setAns8(int ans8) {
		this.ans8 = ans8;
	}
	public int getAns9() {
		return ans9;
	}
	public void setAns9(int ans9) {
		this.ans9 = ans9;
	}
	public int getAns10() {
		return ans10;
	}
	public void setAns10(int ans10) {
		this.ans10 = ans10;
	}
	public int getAns11() {
		return ans11;
	}
	public void setAns11(int ans11) {
		this.ans11 = ans11;
	}
	
	public String getJobId() {
		return jobId;
	}
	public void setJobId(String jobId) {
		this.jobId = jobId;
	}
	public String getDestName() {
		return destName;
	}
	public void setDestName(String destName) {
		this.destName = destName;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public int getTcsResult() {
		return tcsResult;
	}
	public void setTcsResult(int tcsResult) {
		this.tcsResult = tcsResult;
	}
	public String getRepliedFile() {
		return repliedFile;
	}
	public void setRepliedFile(String repliedFile) {
		this.repliedFile = repliedFile;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	@Override
	public String toString() {
		return "Xroshot [destName=" + destName + ", result=" + result + ", tcsResult=" + tcsResult + ", repliedFile="
				+ repliedFile + ", phoneNumber=" + phoneNumber + ", sendDate=" + sendDate + ", ans1=" + ans1 + ", ans2="
				+ ans2 + ", ans3=" + ans3 + ", ans4=" + ans4 + ", ans5=" + ans5 + ", ans6=" + ans6 + ", ans7=" + ans7
				+ ", ans8=" + ans8 + ", ans9=" + ans9 + ", ans10=" + ans10 + ", ans11=" + ans11 + ", jobId=" + jobId
				+ ", msgId=" + msgId + ", no=" + no + ", stime=" + stime + ", rtime=" + rtime + ", duration=" + duration
				+ ", isCompany=" + isCompany + "]";
	}
	
}
