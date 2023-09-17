package dto;

import java.sql.Timestamp;

public class MemberDTO {
	private String id;
	private int level;
	private String pw;
	private String idNumber; // 주민등록번호
	private String name;
	private String email;
	private String nickName;
	private String phone;
	private int point;
	private Timestamp signupDate;
	private int warningCount; // 경고횟수
	private boolean agreement; //개인정보동의 여부
	
	public MemberDTO() {}
	public MemberDTO(String id, int level, String pw, String idNumber, String name, String email, String nickName,
			String phone, int point, Timestamp signupDate, int warningCount, boolean agreement) {
		super();
		this.id = id;
		this.level = level;
		this.pw = pw;
		this.idNumber = idNumber;
		this.name = name;
		this.email = email;
		this.nickName = nickName;
		this.phone = phone;
		this.point = point;
		this.signupDate = signupDate;
		this.warningCount = warningCount;
		this.agreement = agreement;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public Timestamp getSingupDate() {
		return signupDate;
	}
	public void setSingupDate(Timestamp singupDate) {
		this.signupDate = singupDate;
	}
	public int getWarningCount() {
		return warningCount;
	}
	public void setWarningCount(int warningCount) {
		this.warningCount = warningCount;
	}
	public boolean isAgreement() {
		return agreement;
	}
	public void setAgreement(boolean agreement) {
		this.agreement = agreement;
	}
	
	
}
