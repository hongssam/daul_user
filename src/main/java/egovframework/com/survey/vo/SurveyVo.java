package egovframework.com.survey.vo;

import java.util.List;

import egovframework.com.cmmn.util.SearchVo;


public class SurveyVo extends SearchVo{
	
	private String survey_idx;
	private String question_idx;
	private String title;
	private String content;
	private String survey_type;
	private String s_date;
	private String e_date;
	private String create_user;
	private String create_date;
	private String update_user;
	private String update_date;
	private String del_chk;
	private int opinion_count;
	private int participation_count;
	private String ing;
	private String answer;
	private String question_content;
	private String surveyFile;
	private String q_seq;
	private int num;
	
	private List<String> answer_arr;
	

	public List<String> getAnswer_arr() {
		return answer_arr;
	}
	public void setAnswer_arr(List<String> answer_arr) {
		this.answer_arr = answer_arr;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getIng() {
		return ing;
	}
	public void setIng(String ing) {
		this.ing = ing;
	}
	public int getOpinion_count() {
		return opinion_count;
	}
	public void setOpinion_count(int opinion_count) {
		this.opinion_count = opinion_count;
	}
	public int getParticipation_count() {
		return participation_count;
	}
	public void setParticipation_count(int participation_count) {
		this.participation_count = participation_count;
	}
	public String getQ_seq() {
		return q_seq;
	}
	public void setQ_seq(String q_seq) {
		this.q_seq = q_seq;
	}
	public String getQuestion_idx() {
		return question_idx;
	}
	public void setQuestion_idx(String question_idx) {
		this.question_idx = question_idx;
	}
	public String getSurveyFile() {
		return surveyFile;
	}
	public void setSurveyFile(String surveyFile) {
		this.surveyFile = surveyFile;
	}

	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public String getSurvey_idx() {
		return survey_idx;
	}
	public void setSurvey_idx(String survey_idx) {
		this.survey_idx = survey_idx;
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
	public String getSurvey_type() {
		return survey_type;
	}
	public void setSurvey_type(String survey_type) {
		this.survey_type = survey_type;
	}
	public String getS_date() {
		return s_date;
	}
	public void setS_date(String s_date) {
		this.s_date = s_date;
	}
	public String getE_date() {
		return e_date;
	}
	public void setE_date(String e_date) {
		this.e_date = e_date;
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
		return "SurveyVo [survey_idx=" + survey_idx + ", question_idx=" + question_idx + ", title=" + title
				+ ", content=" + content + ", survey_type=" + survey_type + ", s_date=" + s_date + ", e_date=" + e_date
				+ ", create_user=" + create_user + ", create_date=" + create_date + ", update_user=" + update_user
				+ ", update_date=" + update_date + ", del_chk=" + del_chk + ", opinion_count=" + opinion_count
				+ ", participation_count=" + participation_count + ", ing=" + ing + ", answer=" + answer
				+ ", question_content=" + question_content + ", surveyFile=" + surveyFile + ", q_seq=" + q_seq
				+ ", num=" + num + ", answer_arr=" + answer_arr + "]";
	}
	


	
}
