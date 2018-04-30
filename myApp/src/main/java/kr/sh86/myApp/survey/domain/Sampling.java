package kr.sh86.myApp.survey.domain;

public class Sampling {
	private int num;
	private int arsNum;
	private String sido;
	private String sigungu;
	private int sample;
	private String dataInDate;
	
	private String name;
	private String tel;
	private String dong;
	
	
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
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
	public int getSample() {
		return sample;
	}
	public void setSample(int sample) {
		this.sample = sample;
	}
	public String getDataInDate() {
		return dataInDate;
	}
	public void setDataInDate(String dataInDate) {
		this.dataInDate = dataInDate;
	}
	@Override
	public String toString() {
		return "Sampling [num=" + num + ", arsNum=" + arsNum + ", sido=" + sido + ", sigungu=" + sigungu + ", sample="
				+ sample + ", dataInDate=" + dataInDate + ", name=" + name + ", tel=" + tel + "]";
	}
	
	
}
