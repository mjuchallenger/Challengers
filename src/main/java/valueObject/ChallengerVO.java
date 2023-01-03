package valueObject;

public class ChallengerVO extends ParentVO {
	// fields
	private String id, name, startDate, endDate, updateTime, userNum;
	// getters
	public String getId() {return id;}
	public String getName() {return name;}
	public String getStartDate() {return startDate;}
	public String getEndDate() {return endDate;}
	public String getUpdateTime() {return updateTime;}
	public String getUserNum() {return userNum;}
	// setters
	public void setId(String id) {this.id = id;}
	public void setName(String name) {this.name = name;}
	public void setStartDate(String startDate) {this.startDate = startDate;}
	public void setEndDate(String endDate) {this.endDate = endDate;}
	public void setUpdateTime(String updateTime) {this.updateTime = updateTime;}
	public void setUserNum(String userNum) {this.userNum = userNum;}
}
