package dto;

public class BlackListDTO {
	private int blSeq;
	private String blID;
	private String blNickname;
	private String blPhone;
	private String blEmail;
	
	public BlackListDTO() {
		// TODO Auto-generated constructor stub
	}
	

	public BlackListDTO(int blSeq, String blID, String blNickname, String blPhone, String blEmail) {
		super();
		this.blSeq = blSeq;
		this.blID = blID;
		this.blNickname = blNickname;
		this.blPhone = blPhone;
		this.blEmail = blEmail;
	}


	public int getBlSeq() {
		return blSeq;
	}

	public void setBlSeq(int blSeq) {
		this.blSeq = blSeq;
	}

	public String getBlID() {
		return blID;
	}

	public void setBlID(String blID) {
		this.blID = blID;
	}

	public String getBlNickname() {
		return blNickname;
	}

	public void setBlNickname(String blNickname) {
		this.blNickname = blNickname;
	}

	public String getBlPhone() {
		return blPhone;
	}

	public void setBlPhone(String blPhone) {
		this.blPhone = blPhone;
	}

	public String getBlEmail() {
		return blEmail;
	}

	public void setBlEmail(String blEmail) {
		this.blEmail = blEmail;
	}
	
	
}
