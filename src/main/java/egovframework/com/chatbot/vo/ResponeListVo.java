package egovframework.com.chatbot.vo;

import java.util.List;

public class ResponeListVo {
	private String intent_id;
	private String list_id;
	private String type;
	private String trans_type;
	private String position;
	private String create_user;
	private List<ResponeVo> responeVo;
	
	
	
	
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}
	public List<ResponeVo> getResponeVo() {
		return responeVo;
	}
	public void setResponeVo(List<ResponeVo> responeVo) {
		this.responeVo = responeVo;
	}
	public String getIntent_id() {
		return intent_id;
	}
	public void setIntent_id(String intent_id) {
		this.intent_id = intent_id;
	}
	public String getList_id() {
		return list_id;
	}
	public void setList_id(String list_id) {
		this.list_id = list_id;
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
	
	
}
