package egovframework.com.suggestion.vo;

import egovframework.com.cmmn.paging.Pagination;

public class SuggestionOpinionVo extends Pagination{
	private String opinion_idx;
	private String suggestion_idx;
	private String parent_opinion_idx;
	private String opinion_content;
	private int like_count;
	private String create_user;
	private String create_date;
	private String update_user;
	private String update_date;
	private String del_chk;
	private String suggestion_ref;
	private int suggestion_indent;
	private int suggestion_step;
	
	private int num;
	
	private String emotion_type;
	private String emotion_score;

	private String reg_user;
	
	
	
	public String getReg_user() {
		return reg_user;
	}
	public void setReg_user(String reg_user) {
		this.reg_user = reg_user;
	}
	public String getEmotion_type() {
		return emotion_type;
	}
	public void setEmotion_type(String emotion_type) {
		this.emotion_type = emotion_type;
	}
	public String getEmotion_score() {
		return emotion_score;
	}
	public void setEmotion_score(String emotion_score) {
		this.emotion_score = emotion_score;
	}
	public String getOpinion_idx() {
		return opinion_idx;
	}
	public void setOpinion_idx(String opinion_idx) {
		this.opinion_idx = opinion_idx;
	}
	public String getSuggestion_idx() {
		return suggestion_idx;
	}
	public void setSuggestion_idx(String suggestion_idx) {
		this.suggestion_idx = suggestion_idx;
	}
	public String getParent_opinion_idx() {
		return parent_opinion_idx;
	}
	public void setParent_opinion_idx(String parent_opinion_idx) {
		this.parent_opinion_idx = parent_opinion_idx;
	}
	public String getOpinion_content() {
		return opinion_content;
	}
	public void setOpinion_content(String opinion_content) {
		this.opinion_content = opinion_content;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
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
	public String getSuggestion_ref() {
		return suggestion_ref;
	}
	public void setSuggestion_ref(String suggestion_ref) {
		this.suggestion_ref = suggestion_ref;
	}
	public int getSuggestion_indent() {
		return suggestion_indent;
	}
	public void setSuggestion_indent(int suggestion_indent) {
		this.suggestion_indent = suggestion_indent;
	}
	public int getSuggestion_step() {
		return suggestion_step;
	}
	public void setSuggestion_step(int suggestion_step) {
		this.suggestion_step = suggestion_step;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	
	@Override
	public String toString() {
		return "SuggestionOpinionVo [opinion_idx=" + opinion_idx + ", suggestion_idx=" + suggestion_idx
				+ ", parent_opinion_idx=" + parent_opinion_idx + ", opinion_content=" + opinion_content
				+ ", like_count=" + like_count + ", create_user=" + create_user + ", create_date=" + create_date
				+ ", reg_user=" + reg_user + ", update_date=" + update_date + ", del_chk=" + del_chk
				+ ", suggestion_ref=" + suggestion_ref + ", suggestion_indent=" + suggestion_indent
				+ ", suggestion_step=" + suggestion_step + "]";
	}
}
