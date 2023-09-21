package dto;

import java.sql.Timestamp;

public class ReplyDTO {
	private int seq;
	private String writer;
	private int parentSeq;
	private String nickName;
	private String contents;
	private Timestamp writeDate;
	private int recommend;
	private String recId;
	private int parentRSeq;
	
	public ReplyDTO() {}
	public ReplyDTO(int seq, String writer, int parentSeq, String nickName, String contents, Timestamp writeDate,
			int recommend, String recId, int parentRSeq) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.parentSeq = parentSeq;
		this.nickName = nickName;
		this.contents = contents;
		this.writeDate = writeDate;
		this.recommend = recommend;
		this.recId = recId;
		this.parentRSeq = parentRSeq;
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
	public int getParentSeq() {
		return parentSeq;
	}
	public void setParentSeq(int parentSeq) {
		this.parentSeq = parentSeq;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	public int getRecommend() {
		return recommend;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public String getRecId() {
		return recId;
	}
	public void setRecId(String recId) {
		this.recId = recId;
	}
	public int getParentRSeq() {
		return parentRSeq;
	}
	public void setParentRSeq(int parentRSeq) {
		this.parentRSeq = parentRSeq;
	}
}
