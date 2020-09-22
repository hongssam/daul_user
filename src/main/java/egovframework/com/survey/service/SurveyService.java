package egovframework.com.survey.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmmn.util.FileVo;
import egovframework.com.notice.vo.NoticeVo;
import egovframework.com.survey.vo.SurveyOpinionVo;
import egovframework.com.survey.vo.SurveyVo;

public interface SurveyService {

	List<SurveyVo> getSurveyList(SurveyVo vo) throws Exception;
	List<NoticeVo> getSurveyNoticeList(SurveyVo vo) throws Exception;
	SurveyVo getSurveyDetail(SurveyVo vo) throws Exception;
	//List<SurveyOpinionVo> getSurveyOpinionList(SurveyVo vo) throws Exception;
	List<Map<String, String>> getSurveyOpinionList(SurveyOpinionVo vo) throws Exception;
	List<Map<String, Object>> getSurveyQuestionList(SurveyVo vo) throws Exception;
	void insertVote(Map<String,Object> map) throws Exception;
	List<Map<String,String>> getSurveyResult(SurveyVo vo) throws Exception;
	SurveyOpinionVo selectParentSurveyOpinion(SurveyOpinionVo vo) throws Exception;
	void updateChildSurveyOpinion(SurveyOpinionVo topOpnVo) throws Exception;
	String selectSurveyOpinionIdx() throws Exception;
	void insertSurveyOpinion(SurveyOpinionVo vo) throws Exception;
	void deleteSurveyOpinion(SurveyOpinionVo vo) throws Exception;
	String selectSurveyOpinionCount(SurveyOpinionVo vo) throws Exception;
	NoticeVo getSurveyNoticeDetail(NoticeVo vo) throws Exception;
	int getSurveyListCnt(SurveyVo vo) throws Exception;
	void increaseViewCount(String notice_idx) throws Exception;
	int getSurveyNoticeListCnt(SurveyVo vo) throws Exception;
	NoticeVo getBeforeNotice(NoticeVo vo) throws Exception;
	NoticeVo getAfterNotice(NoticeVo vo) throws Exception;
	List<Map<String, String>> getSurveyNoticeFile(NoticeVo vo) throws Exception;
	FileVo selectDownloadFile(FileVo vo) throws Exception;
	Map<String, String> selectImageFile(String survey_idx) throws Exception;
	int selectSurveyParticipationUserCount(SurveyVo vo) throws Exception;

}
