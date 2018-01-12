package bigdata3.domain;

public class BoardManager {
  private int boardManagerNo;
  private String boardType;
  private String boardManager;
  private String boardInfomation;
  private String createDate;
  private String visibleCheck;

  @Override
  public String toString() {
    return "BoardManager [boardManagerNo=" + boardManagerNo + ", boardType=" + boardType + ", boardManager="
        + boardManager + ", boardInfomation=" + boardInfomation + ", createDate=" + createDate + ", visibleCheck="
        + visibleCheck + "]";
  }

  public int getBoardManagerNo() {
    return boardManagerNo;
  }

  public void setBoardManagerNo(int boardManagerNo) {
    this.boardManagerNo = boardManagerNo;
  }

  public String getBoardType() {
    return boardType;
  }

  public void setBoardType(String boardType) {
    this.boardType = boardType;
  }

  public String getBoardManager() {
    return boardManager;
  }

  public void setBoardManager(String boardManager) {
    this.boardManager = boardManager;
  }

  public String getBoardInfomation() {
    return boardInfomation;
  }

  public void setBoardInfomation(String boardInfomation) {
    this.boardInfomation = boardInfomation;
  }

  public String getCreateDate() {
    return createDate;
  }

  public void setCreateDate(String createDate) {
    this.createDate = createDate;
  }

  public String getVisibleCheck() {
    return visibleCheck;
  }

  public void setVisibleCheck(String visibleCheck) {
    this.visibleCheck = visibleCheck;
  }

}
