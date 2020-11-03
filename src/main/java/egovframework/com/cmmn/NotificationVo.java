package egovframework.com.cmmn;

public class NotificationVo {
	private String user_id;
	private String name;
	private String phone;
	private String action_id;
	private String talk_chk;
	
	
	
	public String getTalk_chk() {
		return talk_chk;
	}
	public void setTalk_chk(String talk_chk) {
		this.talk_chk = talk_chk;
	}
	public String getAction_id() {
		return action_id;
	}
	public void setAction_id(String action_id) {
		this.action_id = action_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "NotificationVo [user_id=" + user_id + ", name=" + name + ", phone=" + phone + ", action_id=" + action_id
				+ ", talk_chk=" + talk_chk + "]";
	}
	
	

}
