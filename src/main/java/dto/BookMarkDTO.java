package dto;

public class BookMarkDTO {
	private int bookMarkSeq;
	private int commonBoardSeq;
	private String bookMarkId;
	
	public BookMarkDTO() {
		// TODO Auto-generated constructor stub
	}

	public BookMarkDTO(int bookMarkSeq, int commonBoardSeq, String bookMarkId) {
		super();
		this.bookMarkSeq = bookMarkSeq;
		this.commonBoardSeq = commonBoardSeq;
		this.bookMarkId = bookMarkId;
	}

	public int getBookMarkSeq() {
		return bookMarkSeq;
	}

	public void setBookMarkSeq(int bookMarkSeq) {
		this.bookMarkSeq = bookMarkSeq;
	}

	public int getCommonBoardSeq() {
		return commonBoardSeq;
	}

	public void setCommonBoardSeq(int commonBoardSeq) {
		this.commonBoardSeq = commonBoardSeq;
	}

	public String getBookMarkId() {
		return bookMarkId;
	}

	public void setBookMarkId(String bookMarkId) {
		this.bookMarkId = bookMarkId;
	}
	
}
