package bigdata3.service.impl;

import java.util.Date;

public class MenuTemplate {
  private int templateNo;
  private String branchName;
  private String templateType;
  private String templateArea;
  private String templateContent;
  private String menuType;
  private String menuName;
  private String menuPrice;
  private String menuKcal;
  private Date createDate;
  private Date updateDate;

  @Override
  public String toString() {
    return "Template [templateNo=" + templateNo + ", branchName=" + branchName + ", templateType=" + templateType
        + ", templateArea=" + templateArea + ", templateContent=" + templateContent + ", menuType=" + menuType
        + ", menuName=" + menuName + ", menuPrice=" + menuPrice + ", menuKcal=" + menuKcal + ", createDate="
        + createDate + ", updateDate=" + updateDate + "]";
  }

  public int getTemplateNo() {
    return templateNo;
  }

  public void setTemplateNo(int templateNo) {
    this.templateNo = templateNo;
  }

  public String getBranchName() {
    return branchName;
  }

  public void setBranchName(String branchName) {
    this.branchName = branchName;
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

  public String getTemplateContent() {
    return templateContent;
  }

  public void setTemplateContent(String templateContent) {
    this.templateContent = templateContent;
  }

  public String getMenuType() {
    return menuType;
  }

  public void setMenuType(String menuType) {
    this.menuType = menuType;
  }

  public String getMenuName() {
    return menuName;
  }

  public void setMenuName(String menuName) {
    this.menuName = menuName;
  }

  public String getMenuPrice() {
    return menuPrice;
  }

  public void setMenuPrice(String menuPrice) {
    this.menuPrice = menuPrice;
  }

  public String getMenuKcal() {
    return menuKcal;
  }

  public void setMenuKcal(String menuKcal) {
    this.menuKcal = menuKcal;
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

}
