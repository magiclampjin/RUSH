package dto;

public class GameDTO {
	private String gName;
	private String gCategory;
	private String gDeveloper;
	private String gImageURL;
	private String id;
	
	public GameDTO() {
		// TODO Auto-generated constructor stub
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
	
	
}
