package valueObject;

public class UserVO extends ParentVO {
	// fields
	private String userNum, name, major, phoneNum, joinDate, status;
	// getters
	public String getUserNum() {return userNum;}
	public String getName() {return name;}
	public String getMajor() {return major;}
	public String getPhoneNum() {return phoneNum;}
	public String getJoinDate() {return joinDate;}
	public String getStatus() {return status;}
	// setters
	public void setUserNum(String userNum) {this.userNum = userNum;}
	public void setName(String name) {this.name = name;}
	public void setMajor(String major) {this.major = major;}
	public void setPhoneNum(String phoneNum) {this.phoneNum = phoneNum;}
	public void setJoinDate(String joinDate) {this.joinDate = joinDate;}
	public void setStatus(String status) {this.status = status;}
}
