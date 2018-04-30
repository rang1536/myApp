package kr.sh86.myApp.survey.domain;

public class User {
	private String tel;
	private String sido;
	private String sigungu;
	private String dong;
	private String sangse;
	private String name;
	private String hp;
	
	
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getSigungu() {
		return sigungu;
	}
	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getSangse() {
		return sangse;
	}
	public void setSangse(String sangse) {
		this.sangse = sangse;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "User [tel=" + tel + ", sido=" + sido + ", sigungu=" + sigungu + ", dong=" + dong + ", sangse=" + sangse
				+ ", name=" + name + ", hp=" + hp + "]";
	}
	
}
