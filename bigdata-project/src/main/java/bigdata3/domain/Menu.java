package bigdata3.domain;

import java.util.Date;

public class Menu {
  private int menuNo;
  private String menuType;
  private String menuName;
  private String menuPrice;
  private String menuContent;
  private String menuKcal;
  private Date createDate;
  private String deleteCheck;
  private String manager;

  @Override
  public String toString() {
    return "Menu [menuNo=" + menuNo + ", menuType=" + menuType + ", menuName=" + menuName + ", menuPrice=" + menuPrice
        + ", menuContent=" + menuContent + ", menuKcal=" + menuKcal + ", createDate=" + createDate + ", deleteCheck="
        + deleteCheck + ", manager=" + manager + "]";
  }

  public int getMenuNo() {
    return menuNo;
  }

  public void setMenuNo(int menuNo) {
    this.menuNo = menuNo;
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

  public String getMenuContent() {
    return menuContent;
  }

  public void setMenuContent(String menuContent) {
    this.menuContent = menuContent;
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

  public String getDeleteCheck() {
    return deleteCheck;
  }

  public void setDeleteCheck(String deleteCheck) {
    this.deleteCheck = deleteCheck;
  }

  public String getManager() {
    return manager;
  }

  public void setManager(String manager) {
    this.manager = manager;
  }

}
