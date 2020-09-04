package egovframework.com.chatbot.vo;

public class ResponeVo {
	private String list_id;
	private String intent_id;
	private String text_id;
	private String img_id;
	private String card_id;
	private String list_type_id;
	private String skill_id;
	private String direct_btn_id;
	private String condition_id;
	private String skill_item_id;
	private String img_attach_id;
	private String content;
	private String type;
	private String trans_type;
	private String position;
	private String title;
	private String condition_item_id;
	
	
	
	
	
	public String getCondition_item_id() {
		return condition_item_id;
	}
	public void setCondition_item_id(String condition_item_id) {
		this.condition_item_id = condition_item_id;
	}
	public String getImg_attach_id() {
		return img_attach_id;
	}
	public void setImg_attach_id(String img_attach_id) {
		this.img_attach_id = img_attach_id;
	}
	public String getSkill_item_id() {
		return skill_item_id;
	}
	public void setSkill_item_id(String skill_item_id) {
		this.skill_item_id = skill_item_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText_id() {
		return text_id;
	}
	public void setText_id(String text_id) {
		this.text_id = text_id;
	}
	public String getImg_id() {
		return img_id;
	}
	public void setImg_id(String img_id) {
		this.img_id = img_id;
	}
	public String getCard_id() {
		return card_id;
	}
	public void setCard_id(String card_id) {
		this.card_id = card_id;
	}
	public String getList_type_id() {
		return list_type_id;
	}
	public void setList_type_id(String list_type_id) {
		this.list_type_id = list_type_id;
	}
	public String getSkill_id() {
		return skill_id;
	}
	public void setSkill_id(String skill_id) {
		this.skill_id = skill_id;
	}
	public String getDirect_btn_id() {
		return direct_btn_id;
	}
	public void setDirect_btn_id(String direct_btn_id) {
		this.direct_btn_id = direct_btn_id;
	}
	public String getCondition_id() {
		return condition_id;
	}
	public void setCondition_id(String condition_id) {
		this.condition_id = condition_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getList_id() {
		return list_id;
	}
	public void setList_id(String list_id) {
		this.list_id = list_id;
	}
	public String getIntent_id() {
		return intent_id;
	}
	public void setIntent_id(String intent_id) {
		this.intent_id = intent_id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTrans_type() {
		return trans_type;
	}
	public void setTrans_type(String trans_type) {
		this.trans_type = trans_type;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	@Override
	public String toString() {
		return "ResponeVo [list_id=" + list_id + ", intent_id=" + intent_id + ", text_id=" + text_id + ", img_id="
				+ img_id + ", card_id=" + card_id + ", list_type_id=" + list_type_id + ", skill_id=" + skill_id
				+ ", direct_btn_id=" + direct_btn_id + ", condition_id=" + condition_id + ", content=" + content
				+ ", type=" + type + ", trans_type=" + trans_type + ", position=" + position + "]";
	}
	
	
}
