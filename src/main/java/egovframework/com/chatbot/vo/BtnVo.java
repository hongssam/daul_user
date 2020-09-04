package egovframework.com.chatbot.vo;

public class BtnVo {
	private String btn_id;
	private String parent_id;
	private String name;
	private String position;
	private String function1;
	private String function2;
	private String intent_id;
	
	
	
	public String getIntent_id() {
		return intent_id;
	}
	public void setIntent_id(String intent_id) {
		this.intent_id = intent_id;
	}
	public String getBtn_id() {
		return btn_id;
	}
	public void setBtn_id(String btn_id) {
		this.btn_id = btn_id;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getFunction1() {
		return function1;
	}
	public void setFunction1(String function1) {
		this.function1 = function1;
	}
	public String getFunction2() {
		return function2;
	}
	public void setFunction2(String function2) {
		this.function2 = function2;
	}
	@Override
	public String toString() {
		return "BtnVo [btn_id=" + btn_id + ", parent_id=" + parent_id + ", name=" + name + ", position=" + position
				+ ", function1=" + function1 + ", function2=" + function2 + "]";
	}	
}
