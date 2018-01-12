package bigdata3.domain;

import java.util.Date;

public class Board {
	/*
	 * bdno bdtype bdwriter bdsubject bdhit bdcontent bddate bdupdate
	 * delchk
	 */

	private int boardNo;
	private String boardType;
	private String boardWriter;
	private String boardSubject;
	private String boardHit;
	private String boardContent;
	private Date createDate;
	private Date updateDate;
	private String deleteCheck;

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", boardWriter=" + boardWriter
				+ ", boardSubject=" + boardSubject + ", boardHit=" + boardHit + ", boardContent=" + boardContent
				+ ", createDate=" + createDate + ", updateDate=" + updateDate + ", deleteCheck=" + deleteCheck + "]";
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getBoardType() {
		return boardType;
	}

	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getBoardSubject() {
		return boardSubject;
	}

	public void setBoardSubject(String boardSubject) {
		this.boardSubject = boardSubject;
	}

	public String getBoardHit() {
		return boardHit;
	}

	public void setBoardHit(String boardHit) {
		this.boardHit = boardHit;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getDeleteCheck() {
		return deleteCheck;
	}

	public void setDeleteCheck(String deleteCheck) {
		this.deleteCheck = deleteCheck;
	}

}
