package bigdata3.domain;

import java.sql.Date;

public class Template {
  private int templateNo;
  private int tempManagerNo;
  private String templateType;
  private String templateArea;
  private Date createDate;
  private Date updateDate;
  private String manager;

  @Override
  public String toString() {
    return "Template [templateNo=" + templateNo + ", tempManagerNo=" + tempManagerNo + ", templateType="
        + templateType + ", templateArea=" + templateArea + ", createDate=" + createDate + ", updateDate=" + updateDate
        + ", manager=" + manager + "]";
  }

  public int getTemplateNo() {
    return templateNo;
  }

  public void setTemplateNo(int templateNo) {
    this.templateNo = templateNo;
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

  public String getTemplateArea() {
    return templateArea;
  }

  public void setTemplateArea(String templateArea) {
    this.templateArea = templateArea;
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

  public String getManager() {
    return manager;
  }

  public void setManager(String manager) {
    this.manager = manager;
  }

}
