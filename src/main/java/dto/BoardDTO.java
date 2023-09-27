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
	private int fCount;
	private int rCount;
	private boolean pin;
	

	public BoardDTO(){}
	
	

	public BoardDTO(int seq, String writer, String title, Timestamp writeDate, int view, int fCount) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.writeDate = writeDate;
		this.view = view;
		this.fCount = fCount;
	}



	public BoardDTO(int seq, String writer, String category, String nickName, String title, String contents,
			Timestamp writeDate, int view) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.category = category;
		this.nickName = nickName;
		this.title = title;
		this.contents = contents;
		this.writeDate = writeDate;
		this.view = view;
	}
	
	// post.jsp 게시글 내 출력용
	public BoardDTO(int seq, String writer, String category, String nickName, String title, String contents,
			Timestamp writeDate, int view, boolean pin) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.category = category;
		this.nickName = nickName;
		this.title = title;
		this.contents = contents;
		this.writeDate = writeDate;
		this.view = view;
		this.pin = pin;
	}
	
	// boardList 게시글 목록 출력용
	public BoardDTO(int seq, String writer, String category, String nickName, String title, String contents,
			Timestamp writeDate, int view, int recommend, int fCount, int rCount, boolean pin) {
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
		this.fCount = fCount;
		this.rCount = rCount;
		this.pin = pin;
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
		return rCount;
	}

	public void setReplyCount(int replyCount) {
		this.rCount = replyCount;
	}

	public int getfCount() {
		return fCount;
	}

	public void setfCount(int fCount) {
		this.fCount = fCount;
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
	
	public String getFormedDate() { //post.jsp 용 
		return this.timeCal("post");
	}

}
