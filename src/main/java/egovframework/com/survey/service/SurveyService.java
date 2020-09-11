package egovframework.com.survey.service;

import java.util.List;
import java.util.Map;

import egovframework.com.survey.vo.SurveyOpinionVo;
import egovframework.com.survey.vo.SurveyVo;

public interface SurveyService {

	List<SurveyVo> getSurveyList(SurveyVo vo) throws Exception;
	SurveyVo getSurveyDetail(SurveyVo vo) throws Exception;
	List<SurveyOpinionVo> getSurveyOpinionList(SurveyVo vo) throws Exception;
	List<Map<String,String>> getSurveyQuestionList(SurveyVo vo) throws Exception;
	void insertVote(Map<String,Object> map) throws Exception;
	List<Map<String,String>> getSurveyResult(SurveyVo vo) throws Exception;
	SurveyOpinionVo selectParentSurveyOpinion(SurveyOpinionVo vo) throws Exception;
	void updateChildSurveyOpinion(SurveyOpinionVo topOpnVo) throws Exception;
	String selectSurveyOpinionIdx() throws Exception;
	void insertSurveyOpinion(SurveyOpinionVo vo) throws Exception;
	void deleteSurveyOpinion(SurveyOpinionVo vo) throws Exception;
	String selectSurveyOpinionCount(SurveyOpinionVo vo) throws Exception;

}
