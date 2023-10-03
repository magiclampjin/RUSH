package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class QNABoardDTO {
	private int seq;
	private String writer;
	private String nickName;
	private String title;
	private String contents;
	private Timestamp writeDate;
	private boolean secret;
	private int answeryn;
	private int fileyn;
	public QNABoardDTO() {}
	
	public QNABoardDTO(int seq, String writer, String nickName, String title, String contents, boolean secret) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.nickName = nickName;
		this.title = title;
		this.contents = contents;
		this.secret = secret;
	}

	public QNABoardDTO(int seq, String writer, String nickName, String title, String contents, Timestamp writeDate, boolean secret) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.nickName = nickName;
		this.title = title;
		this.contents = contents;
		this.writeDate = writeDate;
		this.secret = secret;
	}
	

	public QNABoardDTO(int seq, String writer, String nickName, String title, String contents, Timestamp writeDate, boolean secret, int answeryn, int fileyn) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.nickName = nickName;
		this.title = title;
		this.contents = contents;
		this.writeDate = writeDate;
		this.secret = secret;
		this.answeryn = answeryn;
		this.fileyn = fileyn;
	}
	
	public QNABoardDTO(int seq, String title, String contents, boolean secret) {
		super();
		this.seq = seq;
		this.title = title;
		this.contents = contents;
		this.secret = secret;
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

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public boolean isSecret() {
		return secret;
	}

	public void setSecret(boolean secret) {
		this.secret = secret;
	}

	public int getAnsweryn() {
		return answeryn;
	}

	public void setAnsweryn(int answeryn) {
		this.answeryn = answeryn;
	}

	public int getFileyn() {
		return fileyn;
	}

	public void setFileyn(int fileyn) {
		this.fileyn = fileyn;
	}

	public String timeCal(String where) {
		long currentTime = System.currentTimeMillis();
		long writeTime = this.writeDate.getTime();
		long gapTime = currentTime - writeTime;

		if (gapTime < 60000) {
			return "방금 전";
		} else if (gapTime < 60000 * 60) {
			return gapTime / 60000 + " 분 전";
		} else if (gapTime < 60000 * 60 * 24) {
			long hour = gapTime / 60000 / 60;
			return "약 "+hour + "시간 전";
		} else {
			SimpleDateFormat sdf = null;
			if(where.equals("board")) {
				sdf = new SimpleDateFormat("yyyy-MM-dd");
				
			}else if(where.equals("post")) {
				sdf = new SimpleDateFormat("yyyy.MM.dd hh:mm");
			}
			return sdf.format(writeTime);
		}
	}
	
	public String getStringFormat() {
		return this.timeCal("board");
	}
}
