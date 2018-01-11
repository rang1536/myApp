package kr.sh86.myApp.survey.domain;

public class Users {
	private int userNo;
	private String userName;
	private String userGrade;
	private String userSex;
	private String userHp;
	private String userEmail;
	private int resComplete;
	
	
	public int getResComplete() {
		return resComplete;
	}
	public void setResComplete(int resComplete) {
		this.resComplete = resComplete;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getUserHp() {
		return userHp;
	}
	public void setUserHp(String userHp) {
		this.userHp = userHp;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	@Override
	public String toString() {
		return "Users [userNo=" + userNo + ", userName=" + userName + ", userGrade=" + userGrade + ", userSex="
				+ userSex + ", userHp=" + userHp + ", userEmail=" + userEmail + "]";
	}
	
	
}
