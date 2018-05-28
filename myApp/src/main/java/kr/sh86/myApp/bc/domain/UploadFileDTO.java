package kr.sh86.myApp.bc.domain;


public class UploadFileDTO {
	private int fileNo;
	private String fileOriginalName;
	private String filePath;
	private String fileName;
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String getFileOriginalName() {
		return fileOriginalName;
	}
	public void setFileOriginalName(String fileOriginalName) {
		this.fileOriginalName = fileOriginalName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "UploadFileDTO [fileNo=" + fileNo + ", fileOriginalName=" + fileOriginalName + ", filePath=" + filePath
				+ ", fileName=" + fileName + "]";
	}
	
	
}
