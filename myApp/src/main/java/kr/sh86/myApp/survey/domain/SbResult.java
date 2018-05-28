package kr.sh86.myApp.survey.domain;

public class SbResult {
	private int totalCnt;
	private int resCnt;
	private int bujeCnt;
	private int afterCnt;
	private int rejectCnt;
	private int mmsCnt;
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getResCnt() {
		return resCnt;
	}
	public void setResCnt(int resCnt) {
		this.resCnt = resCnt;
	}
	public int getBujeCnt() {
		return bujeCnt;
	}
	public void setBujeCnt(int bujeCnt) {
		this.bujeCnt = bujeCnt;
	}
	public int getAfterCnt() {
		return afterCnt;
	}
	public void setAfterCnt(int afterCnt) {
		this.afterCnt = afterCnt;
	}
	public int getRejectCnt() {
		return rejectCnt;
	}
	public void setRejectCnt(int rejectCnt) {
		this.rejectCnt = rejectCnt;
	}
	public int getMmsCnt() {
		return mmsCnt;
	}
	public void setMmsCnt(int mmsCnt) {
		this.mmsCnt = mmsCnt;
	}
	@Override
	public String toString() {
		return "SbResult [totalCnt=" + totalCnt + ", resCnt=" + resCnt + ", bujeCnt=" + bujeCnt + ", afterCnt="
				+ afterCnt + ", rejectCnt=" + rejectCnt + ", mmsCnt=" + mmsCnt + "]";
	}
	
	
}
