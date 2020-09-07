package egovframework.com.survey.vo;

public class SurveyOpinionVo {
	private String opinion_idx;
	private String survey_idx;
	private String parent_opinion_idx;
	private String opinion_content;
	private int like_count;
	private String create_user;
	private String create_date;
	private String update_user;
	private String update_date;
	private String del_chk;
	private String survey_ref;
	private int survey_indent;
	private int survey_step;
	private String name;
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOpinion_idx() {
		return opinion_idx;
	}
	public void setOpinion_idx(String opinion_idx) {
		this.opinion_idx = opinion_idx;
	}
	public String getSurvey_idx() {
		return survey_idx;
	}
	public void setSurvey_idx(String survey_idx) {
		this.survey_idx = survey_idx;
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
	public String getSurvey_ref() {
		return survey_ref;
	}
	public void setSurvey_ref(String survey_ref) {
		this.survey_ref = survey_ref;
	}
	public int getSurvey_indent() {
		return survey_indent;
	}
	public void setSurvey_indent(int survey_indent) {
		this.survey_indent = survey_indent;
	}
	public int getSurvey_step() {
		return survey_step;
	}
	public void setSurvey_step(int survey_step) {
		this.survey_step = survey_step;
	}
	
	
}
