package egovframework.com.qna.vo;

import egovframework.com.cmmn.util.SearchVo;

public class QnaVo extends SearchVo {
	private String qna_idx;
	private String question;
	private String content;
	private String parent_qna_idx;
	private String ref;
	private int view_count;
	private String create_user;
	private String create_date;
	private String update_user;
	private String update_date;
	private String del_chk;
	private String auth_type;
	private int indent;
	private int num;
	private String name;
	private String lock_chk;
	
	
	
	
	public String getLock_chk() {
		return lock_chk;
	}
	public void setLock_chk(String lock_chk) {
		this.lock_chk = lock_chk;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getQna_idx() {
		return qna_idx;
	}
	public void setQna_idx(String qna_idx) {
		this.qna_idx = qna_idx;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getParent_qna_idx() {
		return parent_qna_idx;
	}
	public void setParent_qna_idx(String parent_qna_idx) {
		this.parent_qna_idx = parent_qna_idx;
	}
	public String getRef() {
		return ref;
	}
	public void setRef(String ref) {
		this.ref = ref;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
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
	public String getAuth_type() {
		return auth_type;
	}
	public void setAuth_type(String auth_type) {
		this.auth_type = auth_type;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "QnaVo [qna_idx=" + qna_idx + ", question=" + question + ", content=" + content + ", parent_qna_idx="
				+ parent_qna_idx + ", ref=" + ref + ", view_count=" + view_count + ", create_user=" + create_user
				+ ", create_date=" + create_date + ", update_user=" + update_user + ", update_date=" + update_date
				+ ", del_chk=" + del_chk + ", auth_type=" + auth_type + ", indent=" + indent + ", num=" + num
				+ ", name=" + name + ", lock_chk=" + lock_chk + "]";
	}
	
	
}
