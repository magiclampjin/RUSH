package dto;

public class FileDTO {
	private int seq;
	private int parentSeq;
	private String originName;
	private String systemName;
	private boolean img;
	private boolean qna;
	
	public FileDTO() {}
	public FileDTO(int seq, int parentSeq, String originName, String systemName, boolean img, boolean qna) {
		super();
		this.seq = seq;
		this.parentSeq = parentSeq;
		this.originName = originName;
		this.systemName = systemName;
		this.img = img;
		this.qna = qna;
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
	public boolean isImg() {
		return img;
	}
	public void setImg(boolean img) {
		this.img = img;
	}
	public boolean isQna() {
		return qna;
	}
	public void setQna(boolean qna) {
		this.qna = qna;
	}
	
	
	
}
