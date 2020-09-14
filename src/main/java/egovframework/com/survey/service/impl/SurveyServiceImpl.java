package egovframework.com.survey.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.notice.vo.NoticeVo;
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

//	@Override
//	public List<SurveyOpinionVo> getSurveyOpinionList(SurveyVo vo) throws Exception {
//		return surveyMapper.getSurveyOpinionList(vo);
//	}
	@Override
	public List<Map<String, String>> getSurveyOpinionList(SurveyVo vo) throws Exception {
		return surveyMapper.getSurveyOpinionList(vo);
	}

	@Override
	public List<Map<String, String>> getSurveyQuestionList(SurveyVo vo) throws Exception {
		return surveyMapper.getSurveyQuestionList(vo);
	}

	@Override
	public void insertVote(Map<String, Object> map) throws Exception {
		surveyMapper.insertVote(map);
		
	}

	@Override
	public List<Map<String, String>> getSurveyResult(SurveyVo vo) throws Exception {
		return surveyMapper.getSurveyResult(vo);
	}

	@Override
	public SurveyOpinionVo selectParentSurveyOpinion(SurveyOpinionVo vo) throws Exception {
		return surveyMapper.selectParentSurveyOpinion(vo);
	}

	@Override
	public void updateChildSurveyOpinion(SurveyOpinionVo topOpnVo) throws Exception {
		surveyMapper.updateChildSurveyOpinion(topOpnVo);
	}

	@Override
	public String selectSurveyOpinionIdx() throws Exception {
		return surveyMapper.selectSurveyOpinionIdx();
	}

	@Override
	public void insertSurveyOpinion(SurveyOpinionVo vo) throws Exception {
		surveyMapper.insertSurveyOpinion(vo);
	}

	@Override
	public void deleteSurveyOpinion(SurveyOpinionVo vo) throws Exception {
		surveyMapper.deleteSurveyOpinion(vo);
	}

	@Override
	public String selectSurveyOpinionCount(SurveyOpinionVo vo) throws Exception {
		return surveyMapper.selectSurveyOpinionCount(vo);
	}

	@Override
	public List<NoticeVo> getSurveyNoticeList(SurveyVo vo) throws Exception {
		return surveyMapper.getSurveyNoticeList(vo);
	}

	@Override
	public NoticeVo getSurveyNoticeDetail(NoticeVo vo) throws Exception {
		return surveyMapper.getSurveyNoticeDetail(vo);
	}

	@Override
	public int getSurveyListCnt(SurveyVo vo) throws Exception {
		return surveyMapper.getSurveyListCnt(vo);
	}

}
