package kr.sh86.myApp.bc.domain;

public class FavorCate {
	private int cateNum;
	private String cateName;
	public int getCateNum() {
		return cateNum;
	}
	public void setCateNum(int cateNum) {
		this.cateNum = cateNum;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	@Override
	public String toString() {
		return "FavorCate [cateNum=" + cateNum + ", cateName=" + cateName + "]";
	}
	
	
}
