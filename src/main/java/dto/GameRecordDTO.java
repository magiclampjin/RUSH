package dto;

import java.sql.Timestamp;

public class GameRecordDTO {
	private int seq;
	private String id;
	private String gameName;
	private String nickName;
	private Timestamp startGameTime;
	private int score;
	private int level;
	
	public GameRecordDTO() {}
	
	public GameRecordDTO(String id, String gameName, int score, int level) {
		super();
		this.id = id;
		this.gameName = gameName;
		this.score = score;
		this.level = level;
	}
	
	
	public GameRecordDTO(int seq, String id, String gameName, String nickName, Timestamp startGameTime, int score) {
		super();
		this.seq = seq;
		this.id = id;
		this.gameName = gameName;
		this.nickName = nickName;
		this.startGameTime = startGameTime;
		this.score = score;
	}

	public GameRecordDTO(int seq, String id, String gameName, String nickName, Timestamp startGameTime, int score,
			int level) {
		super();
		this.seq = seq;
		this.id = id;
		this.gameName = gameName;
		this.nickName = nickName;
		this.startGameTime = startGameTime;
		this.score = score;
		this.level = level;
	}
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public Timestamp getStartGameTime() {
		return startGameTime;
	}
	public void setStartGameTime(Timestamp startGameTime) {
		this.startGameTime = startGameTime;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
}
