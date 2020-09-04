package egovframework.com.chatbot.vo;

public class IntentVo {
	private String id;
	private String text;
	private String parent;
	private String type;
	private String position;
	private String module;
	private String create_user;
	private String create_date;
	private String update_user;
	private String update_date;
	private String del_chk;
	private String intent_id;
	private String title;
	
	public String getIntent_id() {
		return intent_id;
	}
	public void setIntent_id(String intent_id) {
		this.intent_id = intent_id;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getParent() {
		return parent;
	}
	public void setParent(String parent) {
		this.parent = parent;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
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
	public String getDel_chk() {
		return del_chk;
	}
	public void setDel_chk(String del_chk) {
		this.del_chk = del_chk;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "IntentVo [id=" + id + ", text=" + text + ", parent=" + parent + ", type=" + type + ", position="
				+ position + ", module=" + module + ", create_user=" + create_user + ", create_date=" + create_date
				+ ", update_user=" + update_user + ", update_date=" + update_date + ", del_chk=" + del_chk
				+ ", intent_id=" + intent_id + ", title=" + title + "]";
	}
}
