package kr.sh86.myApp.survey.domain;

public class ExceptionTel {
	private int no;
	private String tel;
	private String local;
	
	
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "ExceptionTel [no=" + no + ", tel=" + tel + ", local=" + local + "]";
	}
	
	
}
