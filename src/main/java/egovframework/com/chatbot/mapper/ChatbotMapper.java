package egovframework.com.chatbot.mapper;

import java.util.List;
import java.util.Map;

import egovframework.com.chatbot.vo.BtnVo;
import egovframework.com.chatbot.vo.ConditionVo;
import egovframework.com.chatbot.vo.InputVo;
import egovframework.com.chatbot.vo.IntentVo;
import egovframework.com.chatbot.vo.ItemVo;
import egovframework.com.chatbot.vo.ResponeListVo;
import egovframework.com.chatbot.vo.ResponeVo;
import egovframework.com.chatbot.vo.SkillVo;
import egovframework.com.cmmn.util.FileVo;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("chatbotMapper")
public interface ChatbotMapper {
	List<IntentVo> getIntentList() throws Exception;
	void addScenario(IntentVo vo) throws Exception;
	void addBlock(IntentVo vo) throws Exception;
	void deleteCategory(IntentVo vo) throws Exception;
	void renameCategory(IntentVo vo) throws Exception;
	void registInputText(InputVo vo) throws Exception;
	void updateInputText(InputVo vo) throws Exception;
	int check(InputVo vo) throws Exception;
	List<InputVo> getInputText(InputVo vo) throws Exception;
	int registResponeList(ResponeListVo vo) throws Exception;
	int registTextTypeList(ResponeVo vo) throws Exception;
	void registListTypeList(ResponeVo vo) throws Exception;
	void registListTypeItemList(ItemVo vo) throws Exception;
	void registBtn(BtnVo vo) throws Exception;
	void registImgTypeList(ResponeVo vo) throws Exception;
	void registCardTypeList(ResponeVo vo) throws Exception;
	void registSkillTypeList(ResponeVo vo) throws Exception;
	void registDirectTypeList(ResponeVo vo) throws Exception;
	void registConditionTypeList(ResponeVo vo) throws Exception;
	String getTextTypeCnt() throws Exception;
	String getListId() throws Exception;
	String getTextId() throws Exception;
	String getDirectTypeId() throws Exception;
	String getImgTypeId() throws Exception;
	String getCardTypeId() throws Exception;
	String getSkillTypeId() throws Exception;
	String getListTypeId() throws Exception;
	String getListTypeItemId() throws Exception;
	String getBtnId() throws Exception;
	String getConditionTypeId() throws Exception;
	
	int checkIntentId(String intent_id) throws Exception;
	
	
	//등록전 삭제
	void deleteResponeList(String intent_id) throws Exception;
	void deleteResponeTextType(String intent_id) throws Exception;
	void deleteResponeImageType(String intent_id) throws Exception;
	void deleteResponeCardType(String intent_id) throws Exception;
	void deleteResponeListType(String intent_id) throws Exception;
	void deleteResponeSkillType(String intent_id) throws Exception;
	void deleteResponeDirectType(String intent_id) throws Exception;
	void deleteResponeBtn(String intent_id) throws Exception;
	void deleteResponeSkillTypeItem(String intent_id) throws Exception;
	void deleteResponeListTypeItem(String intent_id) throws Exception;
	void deleteResponeConditionType(String intent_id) throws Exception;
	int checkIntentName(IntentVo vo) throws Exception;
	
	List<Map<String,Object>> getResponeListVoList(ResponeListVo vo) throws Exception;
	//textTyp[e
	List<Map<String,Object>> getTextTypeCardList(String list_id) throws Exception;
	List<Map<String,Object>> getTextTypeCardBtnList(String text_id) throws Exception;
	//imgType
	List<Map<String,Object>> getImgTypeCardList(String list_id) throws Exception;
	//cardType
	List<Map<String,Object>> getCardTypeCardList(String list_id) throws Exception;
	List<Map<String,Object>> getCardTypeCardBtnList(String card_id) throws Exception;
	//listType
	List<Map<String,Object>> getListTypeCardList(String list_id) throws Exception;
	List<Map<String,Object>> getListTypeCardItemList(String list_type_id) throws Exception;
	List<Map<String,Object>> getListTypeCardBtnList(String list_type_id) throws Exception;
	//skillType
	List<Map<String,Object>> getSkillTypeCardList(String list_id) throws Exception;
	List<Map<String,Object>> getSkillTypeCardItemList(String skill_id) throws Exception; 
	//directType
	List<Map<String,Object>> getDirectTypeCardList(String list_id) throws Exception;
	List<Map<String,Object>> getDirectTypeCardBtnList(String direct_id) throws Exception;
	//conditionType
	List<Map<String,Object>> getConditionTypeCardList(String list_id) throws Exception;
	//imageFile
	void insertImageFile(FileVo fileVo) throws Exception;
	void deleteImageFile(String intent_id) throws Exception;
	Map<String, String> selectImageFile(String img_attach_id) throws Exception;

	List<SkillVo> selectSkillList(SkillVo vo) throws Exception;
	List<ConditionVo> selectConditionList(ConditionVo vo) throws Exception;
	List<IntentVo> getIntentListInBtn() throws Exception;
	
	
	
}
