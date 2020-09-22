package egovframework.com.survey.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
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

	@Override
	public List<Map<String, String>> getSurveyOpinionList(SurveyOpinionVo vo) throws Exception {
		return surveyMapper.getSurveyOpinionList(vo);
	}

	@Override
	public List<Map<String, Object>> getSurveyQuestionList(SurveyVo vo) throws Exception {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> titleList = new ArrayList<>();
		List<Map<String, Object>> contentList = new ArrayList<>();
		
		try {
			list = surveyMapper.getSurveyQuestionList(vo);
			
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> qesMap = list.get(i);
				
				if (qesMap.get("ref").equals(qesMap.get("question_idx"))) {
					titleList.add(qesMap);
				} else {
					contentList.add(qesMap);
				}
			}
			
			for (int j = 0; j < titleList.size(); j++) {
				Map<String, Object> titleMap = titleList.get(j);
				titleMap.put("title", titleMap.get("question_content"));
				
				List<Map<String, Object>> content = new ArrayList<>();
				
				for (int k = 0; k < contentList.size(); k++) {
					Map<String, Object> contentMap = contentList.get(k);
					
					if (titleMap.get("ref").equals(contentMap.get("ref"))) {
						content.add(contentMap);
					}
				}
				
				titleMap.put("question_content", content);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return titleList;
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

	@Override
	public void increaseViewCount(String notice_idx) throws Exception {
		surveyMapper.increaseViewCount(notice_idx);
	}

	@Override
	public int getSurveyNoticeListCnt(SurveyVo vo) throws Exception {
		return surveyMapper.getSurveyNoticeListCnt(vo);
	}

	@Override
	public NoticeVo getBeforeNotice(NoticeVo vo) throws Exception {
		return surveyMapper.getBeforeNotice(vo);
	}
	@Override
	public NoticeVo getAfterNotice(NoticeVo vo) throws Exception {
		return surveyMapper.getAfterNotice(vo);
	}

	@Override
	public List<Map<String, String>> getSurveyNoticeFile(NoticeVo vo) throws Exception {
		return surveyMapper.getSurveyNoticeFile(vo);
	}

	@Override
	public FileVo selectDownloadFile(FileVo vo) throws Exception {
		return  surveyMapper.selectDownloadFile(vo);
	}

	@Override
	public Map<String, String> selectImageFile(String survey_idx) throws Exception {
		return surveyMapper.selectImageFile(survey_idx);
	}

	@Override
	public int selectSurveyParticipationUserCount(SurveyVo vo) throws Exception {
		return surveyMapper.selectSurveyParticipationUserCount(vo);
	}

}
