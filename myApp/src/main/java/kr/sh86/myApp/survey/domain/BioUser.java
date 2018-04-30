package kr.sh86.myApp.survey.domain;

public class BioUser {
	private int no;
	private String comName;
	private String comCeo;
	private String comProduct;
	private String comImport17;
	private String comWorkerCnt;
	private String comAddress;
	private String comTel;
	private String comHomepage;
	private String comFax;
	private String comEmail;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public String getComCeo() {
		return comCeo;
	}
	public void setComCeo(String comCeo) {
		this.comCeo = comCeo;
	}
	public String getComProduct() {
		return comProduct;
	}
	public void setComProduct(String comProduct) {
		this.comProduct = comProduct;
	}
	public String getComImport17() {
		return comImport17;
	}
	public void setComImport17(String comImport17) {
		this.comImport17 = comImport17;
	}
	
	public String getComWorkerCnt() {
		return comWorkerCnt;
	}
	public void setComWorkerCnt(String comWorkerCnt) {
		this.comWorkerCnt = comWorkerCnt;
	}
	public String getComAddress() {
		return comAddress;
	}
	public void setComAddress(String comAddress) {
		this.comAddress = comAddress;
	}
	public String getComTel() {
		return comTel;
	}
	public void setComTel(String comTel) {
		this.comTel = comTel;
	}
	
	public String getComHomepage() {
		return comHomepage;
	}
	public void setComHomepage(String comHomepage) {
		this.comHomepage = comHomepage;
	}
	public String getComFax() {
		return comFax;
	}
	public void setComFax(String comFax) {
		this.comFax = comFax;
	}
	public String getComEmail() {
		return comEmail;
	}
	public void setComEmail(String comEmail) {
		this.comEmail = comEmail;
	}
	@Override
	public String toString() {
		return "BioUser [no=" + no + ", comName=" + comName + ", comCeo=" + comCeo + ", comProduct=" + comProduct
				+ ", comImport17=" + comImport17 + ", comWorkerCnt=" + comWorkerCnt + ", comAddress=" + comAddress
				+ ", comTel=" + comTel + ", comHomepage=" + comHomepage + ", comFax=" + comFax + ", comEmail="
				+ comEmail + "]";
	}
	
}
