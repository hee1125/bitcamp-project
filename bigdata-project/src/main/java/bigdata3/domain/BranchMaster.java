package bigdata3.domain;

public class BranchMaster {
	int no;
	String email;
	String password;
	String name;
	String tel;
	String facebook;
	String grade;
//	String bname;
//	int bno;
//	String btel;
	
	

	@Override
	public String toString() {
		return "BranchMaster [no=" + no + ", email=" + email + ", password=" + password + ", name=" + name + ", tel="
				+ tel + ", facebook=" + facebook + ", grade=" + grade /*+ ", bname=" + bname + ", bno=" + bno + ", btel="
				+ btel*/ + "]";
	}
	
	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getTel() {
		return tel;
	}
	
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	public String getFacebook() {
		return facebook;
	}
	
	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}
	
	public String getGrade() {
		return grade;
	}
	
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
//	public String getBname() {
//		return bname;
//	}
//	
//	public void setBname(String bname) {
//		this.bname = bname;
//	}
//	
//	public int getBno() {
//		return bno;
//	}
//	
//	public void setBno(int bno) {
//		this.bno = bno;
//	}
//	
//	public String getBtel() {
//		return btel;
//	}
//	
//	public void setBtel(String btel) {
//		this.btel = btel;
//	}
//	

}
