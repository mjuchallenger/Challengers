package valueObject;

public class FeedVO extends ParentVO {
	// fields
	private String feed_id, userNum, text, fileName, uploadTime;
	// getters
	public String getFeed_id() {return feed_id;}
	public String getUserNum() {return userNum;}
	public String getText() {return text;}
	public String getFileName() {return fileName;}
	public String getUploadTime() {return uploadTime;}
	// setters
	public void setFeed_id(String feed_id) {this.feed_id = feed_id;}
	public void setUserNum(String userNum) {this.userNum = userNum;}
	public void setText(String text) {this.text = text;}
	public void setFileName(String fileName) {this.fileName = fileName;}
	public void setUploadTime(String uploadTime) {this.uploadTime = uploadTime;}
}
