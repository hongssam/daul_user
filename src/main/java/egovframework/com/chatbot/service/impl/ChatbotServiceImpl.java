package egovframework.com.chatbot.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.ibatis.common.logging.Log;

import egovframework.com.chatbot.mapper.ChatbotMapper;
import egovframework.com.chatbot.service.ChatbotService;
import egovframework.com.chatbot.vo.BtnVo;
import egovframework.com.chatbot.vo.ConditionVo;
import egovframework.com.chatbot.vo.InputVo;
import egovframework.com.chatbot.vo.IntentVo;
import egovframework.com.chatbot.vo.ItemVo;
import egovframework.com.chatbot.vo.ResponeListVo;
import egovframework.com.chatbot.vo.ResponeVo;
import egovframework.com.chatbot.vo.SkillVo;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.user.vo.UserVo;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("chatbotService")
public class ChatbotServiceImpl extends EgovAbstractServiceImpl implements ChatbotService{
	
	static String intent_id;
	
	@Resource(name="chatbotMapper")
	private ChatbotMapper chatbotMapper;
	
	@Override
	public List<IntentVo> getIntentList() throws Exception {
		return chatbotMapper.getIntentList();
	}

	@Override
	public void addScenario(IntentVo vo) throws Exception {
		chatbotMapper.addScenario(vo);
	}
	
	@Override
	public void addBlock(IntentVo vo) throws Exception {
		chatbotMapper.addBlock(vo);
	}

	@Override
	public void deleteCategory(IntentVo vo) throws Exception {
		chatbotMapper.deleteCategory(vo);
		
	}

	@Override
	public void renameCategory(IntentVo vo) throws Exception {
		chatbotMapper.renameCategory(vo);
		
	}

	@Override
	public void registInputText(InputVo vo) throws Exception {
		chatbotMapper.registInputText(vo);
	}

	@Override
	public int check(InputVo vo) throws Exception {
		
		return chatbotMapper.check(vo);
	}

	@Override
	public void updateInputText(InputVo vo) throws Exception {
		chatbotMapper.updateInputText(vo);
	}

	@Override
	public List<InputVo> getInputText(InputVo vo) throws Exception {
		return chatbotMapper.getInputText(vo);
	}

	@Override
	public int checkIntentId(String intent_id) throws Exception {
		return chatbotMapper.checkIntentId(intent_id);
	}
	
	@Override
	public void deleteIntentId(String intent_id) throws Exception {
		chatbotMapper.deleteResponeList(intent_id);
		chatbotMapper.deleteResponeTextType(intent_id);
		chatbotMapper.deleteResponeImageType(intent_id);
		chatbotMapper.deleteResponeCardType(intent_id);
		chatbotMapper.deleteResponeListType(intent_id);
		chatbotMapper.deleteResponeSkillType(intent_id);
		chatbotMapper.deleteResponeDirectType(intent_id);
		chatbotMapper.deleteResponeBtn(intent_id);
		chatbotMapper.deleteResponeSkillTypeItem(intent_id);
		chatbotMapper.deleteResponeListTypeItem(intent_id);
		chatbotMapper.deleteResponeConditionType(intent_id);
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void registResponeList(HttpSession session, List<Map<Object, Object>> list) throws Exception {
		
		UserVo userVo = (UserVo) session.getAttribute("login");
		
		try {
			for(int listCnt = 0 ; listCnt < list.size() ; listCnt++) {
				if(list.get(listCnt) != null) {
					String type = (String) list.get(listCnt).get("type");
					
					ResponeListVo vo = new ResponeListVo();
					System.out.println("(String)list.get(listCnt) = " + list.get(listCnt));
					intent_id = (String)list.get(listCnt).get("intent_id");
					String list_id = chatbotMapper.getListId();
					vo.setIntent_id(intent_id);
					vo.setTrans_type((String)list.get(listCnt).get("trans_type"));
					vo.setType((String)list.get(listCnt).get("type"));
					vo.setPosition((String)list.get(listCnt).get("position"));
					vo.setList_id(list_id);
					vo.setCreate_user(userVo.getUser_id());
					int num = chatbotMapper.registResponeList(vo);
		
					System.out.println("type = " + type);
					switch(type) {
						case "text":
												
							List<Map<Object, Object>> textTypeList =  (List<Map<Object, Object>>) list.get(listCnt).get("card");
							if(textTypeList != null) {
								for(int textTypeCnt = 0; textTypeCnt < textTypeList.size(); textTypeCnt++) {
									ResponeVo textResponeVo = new ResponeVo();
									if(textTypeList.get(textTypeCnt) != null) {
										String text_id = chatbotMapper.getTextId();
										textResponeVo.setList_id(list_id);
										textResponeVo.setText_id((text_id));
										textResponeVo.setContent((String)textTypeList.get(textTypeCnt).get("content"));
										textResponeVo.setPosition((String)textTypeList.get(textTypeCnt).get("position"));
										textResponeVo.setIntent_id(intent_id);
										chatbotMapper.registTextTypeList(textResponeVo);
										if(textTypeList.get(textTypeCnt).get("button") != null) {
											List<Map<Object, Object>> textTypeBtnList =   (List<Map<Object, Object>>) textTypeList.get(textTypeCnt).get("button");
											
											for(int textTypeBtnCnt = 0; textTypeBtnCnt < textTypeBtnList.size(); textTypeBtnCnt++ ) {
												if(textTypeBtnList.get(textTypeBtnCnt) != null) {
													BtnVo textTypeBtnVo = new BtnVo();
													String textTypeBtnId = chatbotMapper.getBtnId();
												
													textTypeBtnVo.setBtn_id(textTypeBtnId);
													textTypeBtnVo.setParent_id(text_id);
													textTypeBtnVo.setName((String)textTypeBtnList.get(textTypeBtnCnt).get("name"));
													textTypeBtnVo.setPosition((String)textTypeBtnList.get(textTypeBtnCnt).get("position"));
													textTypeBtnVo.setFunction1((String)textTypeBtnList.get(textTypeBtnCnt).get("function1"));
													textTypeBtnVo.setFunction2((String)textTypeBtnList.get(textTypeBtnCnt).get("function2"));
													textTypeBtnVo.setIntent_id(intent_id);
													chatbotMapper.registBtn(textTypeBtnVo);
												}
											}
										}
									}
								}
							}
							break;
							
						case "list":
							
							List<Map<Object, Object>> listTypeList =   (List<Map<Object, Object>>) list.get(listCnt).get("card");
							if(listTypeList != null) {
								for(int listTypeCnt = 0; listTypeCnt < listTypeList.size(); listTypeCnt ++) {
									ResponeVo listResponeVo = new ResponeVo();
									if(listTypeList.get(listTypeCnt) != null) {
										String listType_id = chatbotMapper.getListTypeId();
										listResponeVo.setList_id(list_id);
										listResponeVo.setList_type_id(listType_id);
										listResponeVo.setTitle((String)listTypeList.get(listTypeCnt).get("title"));
										listResponeVo.setPosition((String)listTypeList.get(listTypeCnt).get("position"));
										listResponeVo.setIntent_id(intent_id);
										chatbotMapper.registListTypeList(listResponeVo);
										
										if( listTypeList.get(listTypeCnt).get("list") != null) {
											List<Map<Object, Object>> listTypeItemList =   (List<Map<Object, Object>>) listTypeList.get(listTypeCnt).get("list");
											
											for(int listTypeItemCnt = 0; listTypeItemCnt < listTypeItemList.size(); listTypeItemCnt++) {
												ItemVo listTypeItemVo = new ItemVo();
												if(listTypeItemList.get(listTypeItemCnt) != null) {
													String ListItem_id = chatbotMapper.getListTypeItemId();
													listTypeItemVo.setList_item_id(ListItem_id);
													listTypeItemVo.setList_type_id(listType_id);
													listTypeItemVo.setTitle((String)listTypeItemList.get(listTypeItemCnt).get("title"));
													listTypeItemVo.setContent((String)listTypeItemList.get(listTypeItemCnt).get("content"));
													listTypeItemVo.setPosition((String)listTypeItemList.get(listTypeItemCnt).get("position"));
													listTypeItemVo.setIntent_id(intent_id);
													listTypeItemVo.setImg_attach_id((String)listTypeItemList.get(listTypeItemCnt).get("img_attach_id"));
													chatbotMapper.registListTypeItemList(listTypeItemVo);
												}else {
													//listTypeItemList.remove(listTypeItemCnt);
												}
											}
										}
										
										if( (List<Map<Object, Object>>) listTypeList.get(listTypeCnt).get("button") != null) {
											List<Map<Object, Object>> listTypeBtnList =   (List<Map<Object, Object>>) listTypeList.get(listTypeCnt).get("button");
											for(int listTypeBtnCnt = 0; listTypeBtnCnt < listTypeBtnList.size(); listTypeBtnCnt++ ) {
												BtnVo listTypeBtnVo = new BtnVo();
												if(listTypeBtnList.get(listTypeBtnCnt) != null) {
													String listTypeBtnId = chatbotMapper.getBtnId();
													listTypeBtnVo.setBtn_id(listTypeBtnId);
													listTypeBtnVo.setParent_id(listType_id);
													listTypeBtnVo.setName((String)listTypeBtnList.get(listTypeBtnCnt).get("name"));
													listTypeBtnVo.setPosition((String)listTypeBtnList.get(listTypeBtnCnt).get("position"));
													listTypeBtnVo.setFunction1((String)listTypeBtnList.get(listTypeBtnCnt).get("function1"));
													listTypeBtnVo.setFunction2((String)listTypeBtnList.get(listTypeBtnCnt).get("function2"));
													listTypeBtnVo.setIntent_id(intent_id);
													chatbotMapper.registBtn(listTypeBtnVo);
												}
											}
										}
									}
								}
							}
							break;
						case "image":
							
							List<Map<Object, Object>> imgTypeList =   (List<Map<Object, Object>>) list.get(listCnt).get("card");
							if(imgTypeList != null) {
								for(int imgTypeCnt = 0; imgTypeCnt < imgTypeList.size(); imgTypeCnt ++) {
									ResponeVo imgTypeVo = new ResponeVo();
									if(imgTypeList.get(imgTypeCnt) != null) {
										System.out.println("**** intent_id = "+ intent_id);
										
										String imgTypeId = chatbotMapper.getImgTypeId();
										imgTypeVo.setList_id(list_id);
										imgTypeVo.setImg_id(imgTypeId);
										imgTypeVo.setPosition((String)imgTypeList.get(imgTypeCnt).get("position"));
										imgTypeVo.setIntent_id(intent_id);
										imgTypeVo.setImg_attach_id((String)imgTypeList.get(imgTypeCnt).get("img_attach_id"));
										chatbotMapper.registImgTypeList(imgTypeVo);
									}
								}
							}
							
							break;
						case "card":
							
							List<Map<Object, Object>> cardTypeList =   (List<Map<Object, Object>>) list.get(listCnt).get("card");
							if(cardTypeList != null) {
								for(int cardTypeCnt = 0; cardTypeCnt < cardTypeList.size(); cardTypeCnt ++) {
									ResponeVo cardTypeVo = new ResponeVo();
									if(cardTypeList.get(cardTypeCnt) != null) {
										String cardTypeId = chatbotMapper.getCardTypeId();
										cardTypeVo.setList_id(list_id);
										cardTypeVo.setCard_id(cardTypeId);
										cardTypeVo.setTitle((String)cardTypeList.get(cardTypeCnt).get("title"));
										cardTypeVo.setContent((String)cardTypeList.get(cardTypeCnt).get("content"));
										cardTypeVo.setPosition((String)cardTypeList.get(cardTypeCnt).get("position"));
										cardTypeVo.setIntent_id(intent_id);
										cardTypeVo.setImg_attach_id((String)cardTypeList.get(cardTypeCnt).get("img_attach_id"));
										chatbotMapper.registCardTypeList(cardTypeVo);
										if((List<Map<Object, Object>>) cardTypeList.get(cardTypeCnt).get("button") != null) {
											List<Map<Object, Object>> cardTypeBtnList =   (List<Map<Object, Object>>) cardTypeList.get(cardTypeCnt).get("button");
											
											for(int cardTypeBtnCnt = 0; cardTypeBtnCnt < cardTypeBtnList.size(); cardTypeBtnCnt++ ) {
												BtnVo cardTypeBtnVo = new BtnVo();
												if(cardTypeBtnList.get(cardTypeBtnCnt) != null) {
													String cardTypeBtnId = chatbotMapper.getBtnId();
													cardTypeBtnVo.setBtn_id(cardTypeBtnId);
													cardTypeBtnVo.setParent_id(cardTypeId);
													cardTypeBtnVo.setName((String)cardTypeBtnList.get(cardTypeBtnCnt).get("name"));
													cardTypeBtnVo.setPosition((String)cardTypeBtnList.get(cardTypeBtnCnt).get("position"));
													cardTypeBtnVo.setFunction1((String)cardTypeBtnList.get(cardTypeBtnCnt).get("function1"));
													cardTypeBtnVo.setFunction2((String)cardTypeBtnList.get(cardTypeBtnCnt).get("function2"));
													cardTypeBtnVo.setIntent_id(intent_id);
													chatbotMapper.registBtn(cardTypeBtnVo);
												}
											}
										}
									}
								}
							}
							
							break;
						case "skill":
							List<Map<Object, Object>> skillTypeList =   (List<Map<Object, Object>>) list;
							System.out.println("!!!list = " + list);
							if(skillTypeList != null) {
								ResponeVo skillTypeVo = new ResponeVo();
								for(int skillTypeCnt = 0; skillTypeCnt < skillTypeList.size(); skillTypeCnt ++) {
									String skillTypeId = chatbotMapper.getSkillTypeId();
									if(skillTypeList.get(skillTypeCnt) != null && list.get(skillTypeCnt).get("type").equals("skill")) {
										skillTypeVo.setSkill_id(skillTypeId);
										skillTypeVo.setList_id(list_id);
										skillTypeVo.setPosition((String)skillTypeList.get(skillTypeCnt).get("position"));
										skillTypeVo.setSkill_item_id((String)skillTypeList.get(skillTypeCnt).get("skill_item_id"));
										skillTypeVo.setIntent_id(intent_id);
										chatbotMapper.registSkillTypeList(skillTypeVo);
									}
								}
							}
							break;
						case "direct":
							
							List<Map<Object, Object>> directTypeList =   (List<Map<Object, Object>>) list.get(listCnt).get("card");
							if(directTypeList != null) {
								ResponeVo directTypeVo = new ResponeVo();
								
								for(int directTypeCnt = 0; directTypeCnt < directTypeList.size(); directTypeCnt ++) {
									String directTypeId = chatbotMapper.getDirectTypeId();
									
									if(directTypeList.get(directTypeCnt) != null) {
										directTypeVo.setDirect_btn_id(directTypeId);
										directTypeVo.setList_id(list_id);
										directTypeVo.setPosition((String)directTypeList.get(directTypeCnt).get("position"));
										directTypeVo.setIntent_id(intent_id);
										chatbotMapper.registDirectTypeList(directTypeVo);
										
										if(directTypeList.get(directTypeCnt).get("button") != null) {
											List<Map<Object, Object>> directTypeBtnList =   (List<Map<Object, Object>>) directTypeList.get(directTypeCnt).get("button");
										
											for(int directTypeBtnCnt = 0; directTypeBtnCnt < directTypeBtnList.size(); directTypeBtnCnt++ ) {
												BtnVo directTypeBtnVo = new BtnVo();
												
												if(directTypeBtnList.get(directTypeBtnCnt) != null) {
													String directTypeBtnId = chatbotMapper.getBtnId();
													directTypeBtnVo.setBtn_id(directTypeBtnId);
													directTypeBtnVo.setParent_id(directTypeId);
													directTypeBtnVo.setName((String)directTypeBtnList.get(directTypeBtnCnt).get("name"));
													directTypeBtnVo.setPosition((String)directTypeBtnList.get(directTypeBtnCnt).get("position"));
													directTypeBtnVo.setFunction1((String)directTypeBtnList.get(directTypeBtnCnt).get("function1"));
													directTypeBtnVo.setFunction2((String)directTypeBtnList.get(directTypeBtnCnt).get("function2"));
													directTypeBtnVo.setIntent_id(intent_id);
													chatbotMapper.registBtn(directTypeBtnVo);
												}
											}
										}
									}
								}
							}
						break;
						case "condition":
							List<Map<Object, Object>> conditionTypeList = (List<Map<Object, Object>>) list;
							System.out.println("!!!list = " + list);
							if(conditionTypeList != null) {
								ResponeVo conditionTypeVo = new ResponeVo();
								for(int conditionTypeCnt = 0; conditionTypeCnt < conditionTypeList.size(); conditionTypeCnt++) {
									if(list.get(conditionTypeCnt).get("type").equals("condition")) {
										String conditionTypeId = chatbotMapper.getConditionTypeId();
										conditionTypeVo.setCondition_id(conditionTypeId);
										conditionTypeVo.setList_id(list_id);
										conditionTypeVo.setPosition((String)conditionTypeList.get(conditionTypeCnt).get("position"));
										conditionTypeVo.setIntent_id(intent_id);
										conditionTypeVo.setCondition_item_id((String)conditionTypeList.get(conditionTypeCnt).get("condition_item_id"));
										chatbotMapper.registConditionTypeList(conditionTypeVo);
									}
								}
							}
							
						break;
						default:
							System.out.println("모두해당안");
					}
				}
			}
		}catch(Exception e){
			System.out.println("ChatbotService - registResponeList() - Exception");
		}
	}

	@Override
	public List<Map<String,Object>> getResponeListVoList(ResponeListVo vo) throws Exception {
		return chatbotMapper.getResponeListVoList(vo);
	}

	@Override
	public List<Map<String,Object>> getTextTypeCardList(String list_id) throws Exception {
		return chatbotMapper.getTextTypeCardList(list_id);
	}

	@Override
	public List<Map<String, Object>> getTextTypeCardBtnList(String text_id) throws Exception {
		return chatbotMapper.getTextTypeCardBtnList(text_id);
	}

	@Override
	public List<Map<String, Object>> getImgTypeCardList(String list_id) throws Exception {
		return chatbotMapper.getImgTypeCardList(list_id);
	}

	@Override
	public List<Map<String, Object>> getCardTypeCardList(String list_id) throws Exception {
		return chatbotMapper.getCardTypeCardList(list_id);
	}

	@Override
	public List<Map<String, Object>> getCardTypeCardBtnList(String card_id) throws Exception {
		return chatbotMapper.getCardTypeCardBtnList(card_id);
	}

	@Override
	public List<Map<String, Object>> getListTypeCardList(String list_id) throws Exception {
		return chatbotMapper.getListTypeCardList(list_id);
	}

	@Override
	public List<Map<String, Object>> getListTypeCardItemList(String list_type_id) throws Exception {
		return chatbotMapper.getListTypeCardItemList(list_type_id);
	}

	@Override
	public List<Map<String, Object>> getListTypeCardBtnList(String list_type_id) throws Exception {
		return chatbotMapper.getListTypeCardBtnList(list_type_id);
	}

	@Override
	public List<Map<String, Object>> getSkillTypeCardList(String list_id) throws Exception {
		return chatbotMapper.getSkillTypeCardList(list_id);
	}

	@Override
	public List<Map<String, Object>> getDirectTypeCardList(String list_id) throws Exception {
		return chatbotMapper.getDirectTypeCardList(list_id);
	}

	@Override
	public List<Map<String, Object>> getSkillTypeCardItemList(String skill_id) throws Exception {
		return chatbotMapper.getSkillTypeCardItemList(skill_id);	
	}

	@Override
	public List<Map<String, Object>> getDirectTypeCardBtnList(String direct_id) throws Exception {
		return chatbotMapper.getDirectTypeCardBtnList(direct_id);
	}
	@Override
	public List<Map<String, Object>> getConditionTypeCardList(String list_id) throws Exception {
		return chatbotMapper.getConditionTypeCardList(list_id);
	}
	@Override
	public void insertImageFile(FileVo fileVo) throws Exception {
		chatbotMapper.insertImageFile(fileVo);
	}

	@Override
	public void deleteImageFile(String intent_id) throws Exception {
		chatbotMapper.deleteImageFile(intent_id);
	}

	@Override
	public Map<String, String> selectImageFile(String img_attach_id) throws Exception {
		return chatbotMapper.selectImageFile(img_attach_id);
	}
	
	@Override
	public List<SkillVo> selectSkillList(SkillVo vo) throws Exception {
		return chatbotMapper.selectSkillList(vo);
	}

	@Override
	public List<ConditionVo> selectConditionList(ConditionVo vo) throws Exception {
		return chatbotMapper.selectConditionList(vo);
	}

	@Override
	public List<IntentVo> getIntentListInBtn() throws Exception {
		return chatbotMapper.getIntentListInBtn();
	}

	@Override
	public int checkIntentName(IntentVo vo) throws Exception {
		return chatbotMapper.checkIntentName(vo);
	}

	
}
