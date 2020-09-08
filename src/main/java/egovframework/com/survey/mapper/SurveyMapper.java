package egovframework.com.survey.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.survey.vo.SurveyOpinionVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("surveyMapper")
public interface SurveyMapper {
	List<SurveyVo> getSurveyList(SurveyVo vo) throws Exception;
	SurveyVo getSurveyDetail(SurveyVo vo) throws Exception;
	List<SurveyOpinionVo> getSurveyOpinionList(SurveyVo vo) throws Exception;
	List<Map<String,String>> getSurveyQuestionList(SurveyVo vo) throws Exception;
	void insertVote(Map<String,Object> map) throws Exception;
	List<Map<String,String>> getSurveyResult(SurveyVo vo) throws Exception;
	
}
