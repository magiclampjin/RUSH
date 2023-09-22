package dto;

import java.sql.Timestamp;

public class ReplyDTO {
	private int seq;
	private String writer;
	private int parentSeq; // 게시글 번호
	private String nickName;
	private String contents;
	private Timestamp writeDate;
	private int parentRSeq; //답댓일 경우, 원 댓글 번호
	
	private int recommend; //댓글 추천수 replyRecommCnt - recCnt
	private String recId; //추천한 사람 replyrecommend - mid
	
	
	public ReplyDTO() {}
	public ReplyDTO(int seq, int parentSeq, String writer, String nickName, String contents, Timestamp writeDate, int parentRSeq) { // 데이터 삽입용
		super();
		this.seq = seq;
		this.parentSeq = parentSeq;
		this.writer = writer;
		this.nickName = nickName;
		this.contents = contents;
		this.writeDate = writeDate;
		this.parentRSeq = parentRSeq;
	}
	
	public ReplyDTO(int seq, int parentSeq, String writer,  String nickName, String contents, Timestamp writeDate, int parentRSeq, int recommend) { // 데이터 출력용
		super();
		this.seq = seq;
		this.parentSeq = parentSeq;
		this.writer = writer;
		this.nickName = nickName;
		this.contents = contents;
		this.writeDate = writeDate;
		this.parentRSeq = parentRSeq;
		this.recommend = recommend;
	}
	
	public ReplyDTO(int seq, int parentRSeq, String recId) { // 댓글 추천 여부 출력용
		super();
		this.seq = seq;
		this.parentRSeq = parentRSeq;
		this.recId = recId;
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
	public int getParentRSeq() {
		return parentRSeq;
	}
	public void setParentRSeq(int parentRSeq) {
		this.parentRSeq = parentRSeq;
	}
	public String getRecId() {
		return recId;
	}
	public void setRecId(String recId) {
		this.recId = recId;
	}
	
}
