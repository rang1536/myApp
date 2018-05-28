package kr.sh86.myApp.survey.domain;

public class Dialing {
	private String dialing;
	private String local;
	public String getDialing() {
		return dialing;
	}
	public void setDialing(String dialing) {
		this.dialing = dialing;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	@Override
	public String toString() {
		return "Dialing [dialing=" + dialing + ", local=" + local + "]";
	}
	
	
}
