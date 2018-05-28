package kr.sh86.myApp.bc.domain;

public class BcGroup {
	private int bcNo;
	private String bcName;
	private String bcHp;
	private String bcOrderHp;
	private int bcCate;
	private int bcReject;
	
	
	public int getBcReject() {
		return bcReject;
	}
	public void setBcReject(int bcReject) {
		this.bcReject = bcReject;
	}
	public int getBcNo() {
		return bcNo;
	}
	public void setBcNo(int bcNo) {
		this.bcNo = bcNo;
	}
	public String getBcName() {
		return bcName;
	}
	public void setBcName(String bcName) {
		this.bcName = bcName;
	}
	public String getBcHp() {
		return bcHp;
	}
	public void setBcHp(String bcHp) {
		this.bcHp = bcHp;
	}
	public String getBcOrderHp() {
		return bcOrderHp;
	}
	public void setBcOrderHp(String bcOrderHp) {
		this.bcOrderHp = bcOrderHp;
	}
	
	public int getBcCate() {
		return bcCate;
	}
	public void setBcCate(int bcCate) {
		this.bcCate = bcCate;
	}
	@Override
	public String toString() {
		return "BcGroup [bcNo=" + bcNo + ", bcName=" + bcName + ", bcHp=" + bcHp + ", bcOrderHp=" + bcOrderHp
				+ ", bcCate=" + bcCate + ", bcReject=" + bcReject + "]";
	}
	
}
