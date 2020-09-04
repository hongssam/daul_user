package egovframework.com.chatbot.vo;

public class InputVo {
	private String input_id;
	private String intent_id;
	private String input_text;
	private String create_user;
	private String create_date;
	private String update_user;
	private String update_date;
	
	
	
	
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getUpdate_user() {
		return update_user;
	}
	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}
	public String getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(String update_date) {
		this.update_date = update_date;
	}
	public String getInput_id() {
		return input_id;
	}
	public void setInput_id(String input_id) {
		this.input_id = input_id;
	}
	public String getIntent_id() {
		return intent_id;
	}
	public void setIntent_id(String intent_id) {
		this.intent_id = intent_id;
	}
	public String getInput_text() {
		return input_text;
	}
	public void setInput_text(String input_text) {
		this.input_text = input_text;
	}
	@Override
	public String toString() {
		return "InputVo [input_id=" + input_id + ", intent_id=" + intent_id + ", input_text=" + input_text + "]";
	}
	
	
}
