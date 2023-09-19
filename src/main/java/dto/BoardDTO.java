package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardDTO {
	private int seq;
	private String writer;
	private String category;
	private String nickName;
	private String title;
	private String contents;
	private Timestamp writeDate;
	private int view;
	private int recommend;
	private int replyCount;

	public BoardDTO(){}

	public BoardDTO(int seq, String writer, String category, String nickName, String title, String contents,
			Timestamp writeDate, int view, int recommend) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.category = category;
		this.nickName = nickName;
		this.title = title;
		this.contents = contents;
		this.writeDate = writeDate;
		this.view = view;
		this.recommend = recommend;
	}
	
	public BoardDTO(int seq, String writer, String category, String nickName, String title, String contents,
			Timestamp writeDate, int view, int recommend, int replyCount) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.category = category;
		this.nickName = nickName;
		this.title = title;
		this.contents = contents;
		this.writeDate = writeDate;
		this.view = view;
		this.recommend = recommend;
		this.replyCount = replyCount;
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

	public Timestamp getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Timestamp writeDate) {
		this.writeDate = writeDate;
	}

	public int getView() {
		return view;
	}

	public void setView(int view) {
		this.view = view;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	
	public String getStringFormat() {
		long currentTime = System.currentTimeMillis();
		long writeTime = this.writeDate.getTime();
		long gapTime = currentTime - writeTime;

		if (gapTime < 60000) {
			return (gapTime / 1000) + "초 전";
		} else if (gapTime < 60000 * 60) {
			return gapTime / 60000 + " 분 전";
		} else if (gapTime < 60000 * 60 * 24) {
			long hour = gapTime / 60000 / 60;
			long min = ((gapTime / 60000) % 60);
			return hour + "시간 " + min + "분 전";
		} else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			return sdf.format(writeTime);
		}
	}
	
}
