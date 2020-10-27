package egovframework.com.mileage.vo;

public class MileageVo {
	String action_id;
	String board_id;
	String user_id;
	String mileage_value;
	String on_off;
	
	
	
	public String getOn_off() {
		return on_off;
	}
	public void setOn_off(String on_off) {
		this.on_off = on_off;
	}
	public String getAction_id() {
		return action_id;
	}
	public void setAction_id(String action_id) {
		this.action_id = action_id;
	}
	public String getBoard_id() {
		return board_id;
	}
	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getMileage_value() {
		return mileage_value;
	}
	public void setMileage_value(String mileage_value) {
		this.mileage_value = mileage_value;
	}
	@Override
	public String toString() {
		return "MileageVo [action_id=" + action_id + ", board_id=" + board_id + ", user_id=" + user_id
				+ ", mileage_value=" + mileage_value + "]";
	}
	
	
}
