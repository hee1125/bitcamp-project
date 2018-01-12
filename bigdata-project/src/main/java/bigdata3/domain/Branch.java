package bigdata3.domain;

import java.util.List;

public class Branch {
	int no;
	String name;
	String addr;
	String tel;
	String intro;
	String area;
	int bmno;
	String bmname;
	List<String> photoList;
	List<Upload> uploadList;
	
	
	
	@Override
	public String toString() {
		return "Branch [no=" + no + ", name=" + name + ", addr=" + addr + ", tel=" + tel + ", intro=" + intro
				+ ", area=" + area + ", bmno=" + bmno + ", bmname=" + bmname + ", photoList=" + photoList
				+ ", uploadList=" + uploadList + "]";
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getBmno() {
		return bmno;
	}
	public void setBmno(int bmno) {
		this.bmno = bmno;
	}
	public String getBmname() {
		return bmname;
	}
	public void setBmname(String bmname) {
		this.bmname = bmname;
	}
	public List<String> getPhotoList() {
		return photoList;
	}
	public void setPhotoList(List<String> photoList) {
		this.photoList = photoList;
	}
	public List<Upload> getUploadList() {
		return uploadList;
	}
	public void setUploadList(List<Upload> uploadList) {
		this.uploadList = uploadList;
	}
	
	
	
	
	
}
