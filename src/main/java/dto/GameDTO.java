package dto;

public class GameDTO {
	private String gName;
	private String gCategory;
	private String gDeveloper;
	private String gImageURL;
	private String id;
	private int playCount;
	private String gameDesc;
	
	// bestbookmark
	private String gender;
	private float genderRatio;
	
	public GameDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public GameDTO(String gName, int playCount) {
		this.gName = gName;
		this.playCount = playCount;
	}
	
	/*
	 * // bestbookmark (구) public GameDTO(String gName, String gImageURL) {
	 * this.gName = gName; this.gImageURL = gImageURL; }
	 */
	
	// bestplay
	public GameDTO(String gName, String gDeveloper, String gImageURL, String gameDesc) {
		super();
		this.gName = gName;
		this.gDeveloper = gDeveloper;
		this.gImageURL = gImageURL;
		this.gameDesc = gameDesc;
	}
	
	// bestbookmark
	public GameDTO(String gName, String gImageURL, String gender, float genderRatio) {
		this.gName = gName;
		this.gImageURL = gImageURL;
		this.gender = gender;
		this.genderRatio = genderRatio; 
	}

	public GameDTO(String gName, String gImageURL, String id) {
		super();
		this.gName = gName;
		this.gImageURL = gImageURL;
		this.id = id;
	}
	
	public GameDTO(String gName, String gCategory, String gDeveloper, String gImageURL, String id) {
		super();
		this.gName = gName;
		this.gCategory = gCategory;
		this.gDeveloper = gDeveloper;
		this.gImageURL = gImageURL;
		this.id = id;
	}

	public String getgName() {
		return gName;
	}

	public void setgName(String gName) {
		this.gName = gName;
	}

	public String getgCategory() {
		return gCategory;
	}

	public void setgCategory(String gCategory) {
		this.gCategory = gCategory;
	}

	public String getgDeveloper() {
		return gDeveloper;
	}

	public void setgDeveloper(String gDeveloper) {
		this.gDeveloper = gDeveloper;
	}

	public String getgImageURL() {
		return gImageURL;
	}

	public void setgImageURL(String gImageURL) {
		this.gImageURL = gImageURL;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getPlayCount() {
		return playCount;
	}

	public void setPlayCount(int playCount) {
		this.playCount = playCount;
	}

	public String getGameDesc() {
		return gameDesc;
	}

	public void setGameDesc(String gameDesc) {
		this.gameDesc = gameDesc;
	}

	public String getSex() {
		return gender;
	}

	public void setSex(String gender) {
		this.gender = gender;
	}

	public float getSexRatio() {
		return genderRatio;
	}

	public void setSexRatio(float genderRatio) {
		this.genderRatio = genderRatio;
	}
	
}
