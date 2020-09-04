package egovframework.com.survey.mapper;

import java.util.List;

import egovframework.com.survey.vo.SurveyVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("surveyMapper")
public interface SurveyMapper {
	List<SurveyVo> getSurveyList(SurveyVo vo) throws Exception;
}
