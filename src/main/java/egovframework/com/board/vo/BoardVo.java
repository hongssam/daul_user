package egovframework.com.board.vo;

import egovframework.com.cmmn.util.SearchVo;

public class BoardVo extends SearchVo{
	private String notice_idx;
	private String title;
	private String content;
	private String notice_type;
	private int view_count;
	private String create_user;
	private String create_date;
	private String update_user;
	private String update_date;
	private String del_chk;
	private int num;
	private int attach_count;
	
	
	
	
	public int getAttach_count() {
		return attach_count;
	}
	public void setAttach_count(int attach_count) {
		this.attach_count = attach_count;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getNotice_idx() {
		return notice_idx;
	}
	public void setNotice_idx(String notice_idx) {
		this.notice_idx = notice_idx;
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
	public String getNotice_type() {
		return notice_type;
	}
	public void setNotice_type(String notice_type) {
		this.notice_type = notice_type;
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
	@Override
	public String toString() {
		return "BoardVo [notice_idx=" + notice_idx + ", title=" + title + ", content=" + content + ", notice_type="
				+ notice_type + ", view_count=" + view_count + ", create_user=" + create_user + ", create_date="
				+ create_date + ", update_user=" + update_user + ", update_date=" + update_date + ", del_chk=" + del_chk
				+ "]";
	}
	
	
	
	
}
