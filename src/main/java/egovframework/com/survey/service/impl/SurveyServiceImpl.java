package egovframework.com.survey.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.survey.mapper.SurveyMapper;
import egovframework.com.survey.service.SurveyService;
import egovframework.com.survey.vo.SurveyOpinionVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("surveyService")
public class SurveyServiceImpl extends EgovAbstractServiceImpl implements SurveyService {
	
	@Resource(name="surveyMapper")
	private SurveyMapper surveyMapper;
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;
	
	@Override
	public List<SurveyVo> getSurveyList(SurveyVo vo) throws Exception{
		return surveyMapper.getSurveyList(vo);
	}

	@Override
	public SurveyVo getSurveyDetail(SurveyVo vo) throws Exception {
		return surveyMapper.getSurveyDetail(vo);
	}

	@Override
	public List<SurveyOpinionVo> getSurveyOpinionList(SurveyVo vo) throws Exception {
		return surveyMapper.getSurveyOpinionList(vo);
		
	}

	@Override
	public List<Map<String, String>> getSurveyQuestionList(SurveyVo vo) throws Exception {
		return surveyMapper.getSurveyQuestionList(vo);
	}

}
