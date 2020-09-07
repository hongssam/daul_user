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

}
