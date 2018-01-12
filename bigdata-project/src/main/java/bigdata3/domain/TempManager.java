package bigdata3.domain;

import java.sql.Date;

public class TempManager extends Template {
  private int tempManagerNo;
  private String templateType;
  private Date createDate;
  private String manager;
  private String templateComment;
  private Upload upload;

  @Override
  public String toString() {
    return "TempManager [tempManagerNo=" + tempManagerNo + ", templateType=" + templateType + ", createDate="
        + createDate + ", manager=" + manager + ", templateComment=" + templateComment + ", upload=" + upload + "]";
  }

  public int getTempManagerNo() {
    return tempManagerNo;
  }

  public void setTempManagerNo(int tempManagerNo) {
    this.tempManagerNo = tempManagerNo;
  }

  public String getTemplateType() {
    return templateType;
  }

  public void setTemplateType(String templateType) {
    this.templateType = templateType;
  }

  public Date getCreateDate() {
    return createDate;
  }

  public void setCreateDate(Date createDate) {
    this.createDate = createDate;
  }

  public String getManager() {
    return manager;
  }

  public void setManager(String manager) {
    this.manager = manager;
  }

  public String getTemplateComment() {
    return templateComment;
  }

  public void setTemplateComment(String templateComment) {
    this.templateComment = templateComment;
  }

  public Upload getUpload() {
    return upload;
  }

  public void setUpload(Upload upload) {
    this.upload = upload;
  }

}
