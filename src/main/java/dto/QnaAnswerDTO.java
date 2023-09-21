package dto;

import java.sql.Timestamp;

public class QnaAnswerDTO {
	private int seq;
	private int parentSeq;
	private String contents;
	private Timestamp writeDate;
	
	public QnaAnswerDTO() {
		// TODO Auto-generated constructor stub
	}

	public QnaAnswerDTO(int seq, int parentSeq, String contents, Timestamp writeDate) {
		super();
		this.seq = seq;
		this.parentSeq = parentSeq;
		this.contents = contents;
		this.writeDate = writeDate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getParentSeq() {
		return parentSeq;
	}

	public void setParentSeq(int parentSeq) {
		this.parentSeq = parentSeq;
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
	
}
