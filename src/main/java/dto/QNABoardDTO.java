package dto;

import java.sql.Timestamp;

public class QNABoardDTO {
	private int seq;
	private String writer;
	private String category;
	private String nickName;
	private String title;
	private String contents;
	private boolean secret;
	private Timestamp writeDate;
	
	public QNABoardDTO() {}

	public QNABoardDTO(int seq, String writer, String category, String nickName, String title, String contents,
			boolean secret) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.category = category;
		this.nickName = nickName;
		this.title = title;
		this.contents = contents;
		this.secret = secret;
	}

	public QNABoardDTO(int seq, String writer, String category, String nickName, String title, String contents,
			boolean secret, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.category = category;
		this.nickName = nickName;
		this.title = title;
		this.contents = contents;
		this.secret = secret;
		this.writeDate = writeDate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public boolean isSecret() {
		return secret;
	}

	public void setSecret(boolean secret) {
		this.secret = secret;
	}

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}
	
	
	
	
}
