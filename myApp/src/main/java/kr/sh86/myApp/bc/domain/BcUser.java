package kr.sh86.myApp.bc.domain;

public class BcUser {
	private int poNum;
	private String poName;
	private String poEmail;
	private String poTel1;
	private String poTel2;
	private String poFax;
	private String poSex;
	private String poJob;
	private String poZip1;
	private String poZip2;
	private String poSido;
	private String poGuGun;
	private String poDong;
	private String poAddr;
	private String poBizName;
	private String poBizDepartment;
	private String poBizPosition;
	private String poRelationShip;
	private String poJobCate;
	private int poFavor; //즐겨찾기 1:아님 2:즐겨찾기 추가
	private String poFullAdd;
	private String poBcImgPath;
	private String poBcImgName;
	private int poFavorCate;
	private String poSangseAddr;
	
	
	public String getPoSangseAddr() {
		return poSangseAddr;
	}
	public void setPoSangseAddr(String poSangseAddr) {
		this.poSangseAddr = poSangseAddr;
	}
	public int getPoFavorCate() {
		return poFavorCate;
	}
	public void setPoFavorCate(int poFavorCate) {
		this.poFavorCate = poFavorCate;
	}
	
	public String getPoBcImgPath() {
		return poBcImgPath;
	}
	public void setPoBcImgPath(String poBcImgPath) {
		this.poBcImgPath = poBcImgPath;
	}
	public String getPoBcImgName() {
		return poBcImgName;
	}
	public void setPoBcImgName(String poBcImgName) {
		this.poBcImgName = poBcImgName;
	}
	public int getPoNum() {
		return poNum;
	}
	public void setPoNum(int poNum) {
		this.poNum = poNum;
	}
	public String getPoName() {
		return poName;
	}
	public void setPoName(String poName) {
		this.poName = poName;
	}
	public String getPoEmail() {
		return poEmail;
	}
	public void setPoEmail(String poEmail) {
		this.poEmail = poEmail;
	}
	public String getPoTel1() {
		return poTel1;
	}
	public void setPoTel1(String poTel1) {
		this.poTel1 = poTel1;
	}
	public String getPoTel2() {
		return poTel2;
	}
	public void setPoTel2(String poTel2) {
		this.poTel2 = poTel2;
	}
	public String getPoFax() {
		return poFax;
	}
	public void setPoFax(String poFax) {
		this.poFax = poFax;
	}
	public String getPoSex() {
		return poSex;
	}
	public void setPoSex(String poSex) {
		this.poSex = poSex;
	}
	public String getPoJob() {
		return poJob;
	}
	public void setPoJob(String poJob) {
		this.poJob = poJob;
	}
	public String getPoZip1() {
		return poZip1;
	}
	public void setPoZip1(String poZip1) {
		this.poZip1 = poZip1;
	}
	public String getPoZip2() {
		return poZip2;
	}
	public void setPoZip2(String poZip2) {
		this.poZip2 = poZip2;
	}
	public String getPoSido() {
		return poSido;
	}
	public void setPoSido(String poSido) {
		this.poSido = poSido;
	}
	public String getPoGuGun() {
		return poGuGun;
	}
	public void setPoGuGun(String poGuGun) {
		this.poGuGun = poGuGun;
	}
	public String getPoDong() {
		return poDong;
	}
	public void setPoDong(String poDong) {
		this.poDong = poDong;
	}
	public String getPoAddr() {
		return poAddr;
	}
	public void setPoAddr(String poAddr) {
		this.poAddr = poAddr;
	}
	public String getPoBizName() {
		return poBizName;
	}
	public void setPoBizName(String poBizName) {
		this.poBizName = poBizName;
	}
	public String getPoBizDepartment() {
		return poBizDepartment;
	}
	public void setPoBizDepartment(String poBizDepartment) {
		this.poBizDepartment = poBizDepartment;
	}
	public String getPoBizPosition() {
		return poBizPosition;
	}
	public void setPoBizPosition(String poBizPosition) {
		this.poBizPosition = poBizPosition;
	}
	public String getPoRelationShip() {
		return poRelationShip;
	}
	public void setPoRelationShip(String poRelationShip) {
		this.poRelationShip = poRelationShip;
	}
	public String getPoJobCate() {
		return poJobCate;
	}
	public void setPoJobCate(String poJobCate) {
		this.poJobCate = poJobCate;
	}
	public int getPoFavor() {
		return poFavor;
	}
	public void setPoFavor(int poFavor) {
		this.poFavor = poFavor;
	}
	public String getPoFullAdd() {
		return poFullAdd;
	}
	public void setPoFullAdd(String poFullAdd) {
		this.poFullAdd = poFullAdd;
	}
	@Override
	public String toString() {
		return "BcUser [poNum=" + poNum + ", poName=" + poName + ", poEmail=" + poEmail + ", poTel1=" + poTel1
				+ ", poTel2=" + poTel2 + ", poFax=" + poFax + ", poSex=" + poSex + ", poJob=" + poJob + ", poZip1="
				+ poZip1 + ", poZip2=" + poZip2 + ", poSido=" + poSido + ", poGuGun=" + poGuGun + ", poDong=" + poDong
				+ ", poAddr=" + poAddr + ", poBizName=" + poBizName + ", poBizDepartment=" + poBizDepartment
				+ ", poBizPosition=" + poBizPosition + ", poRelationShip=" + poRelationShip + ", poJobCate=" + poJobCate
				+ ", poFavor=" + poFavor + ", poFullAdd=" + poFullAdd + ", poBcImgPath=" + poBcImgPath
				+ ", poBcImgName=" + poBcImgName + ", poFavorCate=" + poFavorCate + ", poSangseAddr=" + poSangseAddr
				+ "]";
	}
	
	
}
