package bigdata3.domain;

import java.util.List;

public class EventTemplate {
	int no;
	String title;
	String info;
	String date;
	boolean delCheck;
	List<String> imageList;

	@Override
	public String toString() {
		return "EventTemplate [no=" + no + ", title=" + title + ", info=" + info + ", date=" + date + ", delCheck="
				+ delCheck + ", imageList=" + imageList + "]";
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public boolean isDelCheck() {
		return delCheck;
	}

	public void setDelCheck(boolean delCheck) {
		this.delCheck = delCheck;
	}

	public List<String> getImageList() {
		return imageList;
	}

	public void setImageList(List<String> imageList) {
		this.imageList = imageList;
	}

}
