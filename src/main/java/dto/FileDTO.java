package dto;

public class FileDTO {
	private int seq;
	private int parentSeq;
	private String fileLocation;
	private String originName;
	private String systemName;
	public FileDTO() {}
	public FileDTO(int seq, int parentSeq, String fileLocation, String originName, String systemName) {
		super();
		this.seq = seq;
		this.parentSeq = parentSeq;
		this.fileLocation = fileLocation;
		this.originName = originName;
		this.systemName = systemName;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getParentSeq() {
		return parentSeq;
	}
	public void setParentSeq(int parentSeq) {
		this.parentSeq = parentSeq;
	}
	public String getFileLocation() {
		return fileLocation;
	}
	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getSystemName() {
		return systemName;
	}
	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
	
	
}
