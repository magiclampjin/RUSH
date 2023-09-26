package dto;

public class KordleWordDTO {
	private int seq;
	private String ori_word;
	private String jamo_word;

	public KordleWordDTO() {}

	public KordleWordDTO(int seq, String ori_word, String jamo_word) {
		super();
		this.seq = seq;
		this.ori_word = ori_word;
		this.jamo_word = jamo_word;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getOri_word() {
		return ori_word;
	}

	public void setOri_word(String ori_word) {
		this.ori_word = ori_word;
	}

	public String getJamo_word() {
		return jamo_word;
	}

	public void setJamo_word(String jamo_word) {
		this.jamo_word = jamo_word;
	}
}
