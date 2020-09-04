package egovframework.com.chatbot.vo;

public class ItemVo {
	private String skill_item_id;
	private String skill_id;
	private String condition_item_id;
	private String condition_id;
	private String list_item_id;
	private String title;
	private String content;
	private String position;
	private String list_type_id;
	private String img_attach_id;
	private String name;
	private String function_name;
	private String intent_id;
	
	
	
	
	
	public String getImg_attach_id() {
		return img_attach_id;
	}
	public void setImg_attach_id(String img_attach_id) {
		this.img_attach_id = img_attach_id;
	}
	public String getIntent_id() {
		return intent_id;
	}
	public void setIntent_id(String intent_id) {
		this.intent_id = intent_id;
	}
	public String getList_item_id() {
		return list_item_id;
	}
	public void setList_item_id(String list_item_id) {
		this.list_item_id = list_item_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getList_type_id() {
		return list_type_id;
	}
	public void setList_type_id(String list_type_id) {
		this.list_type_id = list_type_id;
	}
	public String getSkill_item_id() {
		return skill_item_id;
	}
	public void setSkill_item_id(String skill_item_id) {
		this.skill_item_id = skill_item_id;
	}
	public String getSkill_id() {
		return skill_id;
	}
	public void setSkill_id(String skill_id) {
		this.skill_id = skill_id;
	}
	public String getCondition_item_id() {
		return condition_item_id;
	}
	public void setCondition_item_id(String condition_item_id) {
		this.condition_item_id = condition_item_id;
	}
	public String getCondition_id() {
		return condition_id;
	}
	public void setCondition_id(String condition_id) {
		this.condition_id = condition_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFunction_name() {
		return function_name;
	}
	public void setFunction_name(String function_name) {
		this.function_name = function_name;
	}
	@Override
	public String toString() {
		return "ItemVo [skill_item_id=" + skill_item_id + ", skill_id=" + skill_id + ", condition_item_id="
				+ condition_item_id + ", condition_id=" + condition_id + ", name=" + name + ", function_name="
				+ function_name + "]";
	}
	
}
