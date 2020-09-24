package egovframework.com.contest.vo;

import egovframework.com.cmmn.util.SearchVo;

public class ContestVo extends SearchVo {
	private String admin_contest_idx;
	private String user_contest_idx;
	private String contest_topic;
	private String title;
	private String content;
	private String contest_s_date;
	private String contest_e_date;
	private String submit_s_date;
	private String submit_e_date;
	private String create_user;
	private String create_date;
	private String update_user;
	private String update_date;
	private String del_chk;
	private int user_contest_cnt;
	private String ing;
	private String user_title;
	private int num;
	private String user_name;
	private String login_user;
	
	
	
	public String getLogin_user() {
		return login_user;
	}
	public void setLogin_user(String login_user) {
		this.login_user = login_user;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_title() {
		return user_title;
	}
	public void setUser_title(String user_title) {
		this.user_title = user_title;
	}
	public String getUser_contest_idx() {
		return user_contest_idx;
	}
	public void setUser_contest_idx(String user_contest_idx) {
		this.user_contest_idx = user_contest_idx;
	}
	public String getIng() {
		return ing;
	}
	public void setIng(String ing) {
		this.ing = ing;
	}
	public int getUser_contest_cnt() {
		return user_contest_cnt;
	}
	public void setUser_contest_cnt(int user_contest_cnt) {
		this.user_contest_cnt = user_contest_cnt;
	}
	public String getAdmin_contest_idx() {
		return admin_contest_idx;
	}
	public void setAdmin_contest_idx(String admin_contest_idx) {
		this.admin_contest_idx = admin_contest_idx;
	}
	public String getContest_topic() {
		return contest_topic;
	}
	public void setContest_topic(String contest_topic) {
		this.contest_topic = contest_topic;
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
	public String getContest_s_date() {
		return contest_s_date;
	}
	public void setContest_s_date(String contest_s_date) {
		this.contest_s_date = contest_s_date;
	}
	public String getContest_e_date() {
		return contest_e_date;
	}
	public void setContest_e_date(String contest_e_date) {
		this.contest_e_date = contest_e_date;
	}
	public String getSubmit_s_date() {
		return submit_s_date;
	}
	public void setSubmit_s_date(String submit_s_date) {
		this.submit_s_date = submit_s_date;
	}
	public String getSubmit_e_date() {
		return submit_e_date;
	}
	public void setSubmit_e_date(String submit_e_date) {
		this.submit_e_date = submit_e_date;
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
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "ContestVo [admin_contest_idx=" + admin_contest_idx + ", user_contest_idx=" + user_contest_idx
				+ ", contest_topic=" + contest_topic + ", title=" + title + ", content=" + content + ", contest_s_date="
				+ contest_s_date + ", contest_e_date=" + contest_e_date + ", submit_s_date=" + submit_s_date
				+ ", submit_e_date=" + submit_e_date + ", create_user=" + create_user + ", create_date=" + create_date
				+ ", update_user=" + update_user + ", update_date=" + update_date + ", del_chk=" + del_chk
				+ ", user_contest_cnt=" + user_contest_cnt + ", ing=" + ing + ", user_title=" + user_title + ", num="
				+ num + ", user_name=" + user_name + "]";
	}

	
}
