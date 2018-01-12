package bigdata3.domain;

import java.util.Date;

public class Reply {
  private int replyNo;
  private String replyContent;
  private String replyer;
  private String userName;
  private String replySubject;
  private Date createDate;

  @Override
  public String toString() {
    return "Reply [replyNo=" + replyNo + ", replyContent=" + replyContent + ", replyer=" + replyer + ", userName="
        + userName + ", replySubject=" + replySubject + ", createDate=" + createDate + "]";
  }

  public int getReplyNo() {
    return replyNo;
  }

  public void setReplyNo(int replyNo) {
    this.replyNo = replyNo;
  }

  public String getReplyContent() {
    return replyContent;
  }

  public void setReplyContent(String replyContent) {
    this.replyContent = replyContent;
  }

  public String getReplyer() {
    return replyer;
  }

  public void setReplyer(String replyer) {
    this.replyer = replyer;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getReplySubject() {
    return replySubject;
  }

  public void setReplySubject(String replySubject) {
    this.replySubject = replySubject;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }

}
