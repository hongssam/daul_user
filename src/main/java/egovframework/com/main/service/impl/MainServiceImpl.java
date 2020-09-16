package egovframework.com.main.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.contest.vo.ContestVo;
import egovframework.com.main.mapper.MainMapper;
import egovframework.com.main.service.MainService;
import egovframework.com.notice.vo.NoticeVo;
import egovframework.com.suggestion.vo.SuggestionVo;
import egovframework.com.survey.vo.SurveyVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("mainService")
public class MainServiceImpl extends EgovAbstractServiceImpl implements MainService {
	@Resource(name="mainMapper")
	private MainMapper mainMapper;

	@Override
	public List<SuggestionVo> selectSuggestionListByLately() throws Exception {
		return mainMapper.selectSuggestionListByLately();
	}

	@Override
	public List<SurveyVo> selectSurveyListByLately() throws Exception {
		return mainMapper.selectSurveyListByLately();
	}

	@Override
	public List<ContestVo> selectContestListByLately() throws Exception {
		return mainMapper.selectContestListByLately();
	}

	@Override
	public List<NoticeVo> selectNoticeListByLately() throws Exception {
		return mainMapper.selectNoticeListByLately();
	}
}
