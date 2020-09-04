package egovframework.com.survey.service;

import java.util.List;

import egovframework.com.survey.vo.SurveyVo;

public interface SurveyService {

	List<SurveyVo> getSurveyList(SurveyVo vo) throws Exception;

}
