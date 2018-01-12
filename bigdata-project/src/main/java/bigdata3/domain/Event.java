package bigdata3.domain;

import java.util.List;

public class Event {
	int no;
	int etpno;
	int bno;
	String type;
	String title;
	String info;
	String content;
	String content2;
	String startdate;
	String enddate;
	boolean delCheck;
	List<Upload> uploadList;
	String bname;
	String etptitle;

	
	@Override
	public String toString() {
		return "Event [no=" + no + ", etpno=" + etpno + ", bno=" + bno + ", type=" + type + ", title=" + title
				+ ", info=" + info + ", content=" + content + ", content2=" + content2 + ", startdate=" + startdate
				+ ", enddate=" + enddate + ", delCheck=" + delCheck + ", uploadList=" + uploadList + ", bname=" + bname
				+ ", etptitle=" + etptitle + "]";
	}

	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getEtpno() {
		return etpno;
	}
	public void setEtpno(int etpno) {
		this.etpno = etpno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public boolean isDelCheck() {
		return delCheck;
	}
	public void setDelCheck(boolean delCheck) {
		this.delCheck = delCheck;
	}
	public List<Upload> getUploadList() {
		return uploadList;
	}
	public void setUploadList(List<Upload> uploadList) {
		this.uploadList = uploadList;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getEtptitle() {
		return etptitle;
	}
	public void setEtptitle(String etptitle) {
		this.etptitle = etptitle;
	}
	
	
	
	

	

}
