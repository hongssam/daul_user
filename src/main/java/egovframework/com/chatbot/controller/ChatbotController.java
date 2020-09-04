package egovframework.com.chatbot.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.com.chatbot.service.ChatbotService;
import egovframework.com.chatbot.vo.ConditionVo;
import egovframework.com.chatbot.vo.InputVo;
import egovframework.com.chatbot.vo.IntentVo;
import egovframework.com.chatbot.vo.ResponeListVo;
import egovframework.com.chatbot.vo.SkillVo;
import egovframework.com.cmmn.util.CmmnUtil;
import egovframework.com.cmmn.util.FileUtil;
import egovframework.com.cmmn.util.FileVo;
import egovframework.com.user.vo.UserVo;

@Controller
@RequestMapping(value = "/chatbot")
public class ChatbotController {
	protected Log log = LogFactory.getLog(ChatbotController.class);

	@Resource(name = "chatbotService")
	private ChatbotService chatbotService;
	
	@Resource(name="fileUtil")
	private FileUtil fileUtil;

	@RequestMapping(value = "/intentListPage.do")
	public String intentsListPage(ModelMap model) {
		model.addAttribute("inputVo", new InputVo());
		return "chatbot/intentList";
	}
	
	@RequestMapping(value = "/skillListPage.do")
	public String skillListPage(ModelMap model) {
		model.addAttribute("inputVo", new InputVo());
		return "chatbot/skillList";
	}
	
	@RequestMapping(value = "/conditionListPage.do")
	public String conditionListPage(ModelMap model) {
		model.addAttribute("inputVo", new InputVo());
		return "chatbot/conditionList";
	}

	@RequestMapping(value = "/getIntentList.do")
	public ResponseEntity<?> getIntentList() throws Exception {
		List<IntentVo> intentList = null;
		try {
			intentList = chatbotService.getIntentList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return new ResponseEntity<>(intentList, HttpStatus.OK);
	}

	@RequestMapping(value = "/addScenario.do")
	public ResponseEntity<?> addScenario(HttpSession session) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("login");
		IntentVo vo = new IntentVo();
		try {
			vo.setCreate_user(userVo.getUser_id());
			chatbotService.addScenario(vo);
		}catch(Exception e){
			log.debug("ChatbotController - addScenario.do - Exception");
		}
		return new ResponseEntity<>("success", HttpStatus.OK);

	}

	@RequestMapping(value = "/deleteCategory.do")
	public ResponseEntity<?> deleteCategory(HttpSession session, @RequestParam("intent_id") String intent_id)
			throws Exception {
		IntentVo vo = new IntentVo();
		try {
			vo.setId(intent_id);
			chatbotService.deleteCategory(vo);
			chatbotService.deleteIntentId(intent_id);
		}catch(Exception e) {
			log.debug("ChatbotController - deleteCategory.do - Exception");
		}
		return new ResponseEntity<>("success", HttpStatus.OK);
	}

	@RequestMapping(value = "/deleteResponse.do", method = RequestMethod.POST)
	public ResponseEntity<?> deleteIntent(HttpSession session, InputVo vo) throws Exception {
		IntentVo intentVo = new IntentVo();
		try {
			intentVo.setId(vo.getIntent_id());
			chatbotService.deleteCategory(intentVo);
			chatbotService.deleteIntentId(vo.getIntent_id());
		}catch(Exception e){
			log.debug("ChatbotController - dleteResponse.do - Exception");
		}
		return new ResponseEntity<>("success", HttpStatus.OK);
	}

	@RequestMapping(value = "/renameCategory.do")
	public ResponseEntity<?> renameCategory(@RequestParam("intent_id") String intent_id,
			@RequestParam("title") String title) throws Exception {
		IntentVo vo = new IntentVo();
		String msg = "";
		try {
			vo.setId(intent_id);
			vo.setText(title);
			
			int SameNameCnt = chatbotService.checkIntentName(vo);
			if(SameNameCnt > 0) {
				msg = "overlap";
			}else {
				chatbotService.renameCategory(vo);
				msg = "success";
			}
		}catch(Exception e) {
			log.debug("ChatbotController - renameCategory.do - Exception");

		}
		return new ResponseEntity<>(msg, HttpStatus.OK);
	}

	@RequestMapping(value = "/addBlock.do")
	public ResponseEntity<?> addBlock(HttpSession session, @RequestParam("intent_id") String intent_id)
			throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("login");
		IntentVo vo = new IntentVo();
		try {
			vo.setCreate_user(userVo.getUser_id());
			vo.setId(intent_id);
			chatbotService.addBlock(vo);
		}catch(Exception e) {
			log.debug("ChatbotController - addBlock.do - Exception");
		}
		return new ResponseEntity<>("success", HttpStatus.OK);
	}

	@RequestMapping(value = "/registInputText.do")
	public ResponseEntity<?> insertInputText(HttpSession session, InputVo vo, BindingResult bindingResult,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserVo userVo = (UserVo) session.getAttribute("login");
		try {
			vo.setCreate_user(userVo.getUser_id());
			vo.setUpdate_user(userVo.getUser_id());
			int cnt = chatbotService.check(vo);
			
			if (cnt > 0) {
				chatbotService.updateInputText(vo);
			} else {
				chatbotService.registInputText(vo);
			}
		}catch(Exception e){
			log.debug("ChatbotController - registInputText.do - Exception");
		}
		return new ResponseEntity<>("success", HttpStatus.OK);
	}

	@RequestMapping(value = "/serializedObj.do", method = RequestMethod.POST)
	public ResponseEntity<?> serializedObj(HttpSession session, @RequestBody Map<Object, Object> params) throws Exception {
		System.out.println("params === " + params);
		try {
			//저장전에 해당 intent_id가 있으면 다 지움
			if(chatbotService.checkIntentId((String)params.get("intent_id")) != 0) {
				chatbotService.deleteIntentId((String)params.get("intent_id"));
			}
			List<Map<Object, Object>> list = (List<Map<Object, Object>>) params.get("cardList");
			if(list != null) {
				for (int i = 0; i < list.size(); i++) {
					if(list.get(i) != null) {
						list.get(i).put("intent_id", params.get("intent_id"));
					}
				}
				chatbotService.registResponeList(session, list);
			}
		}catch(Exception e){
			log.debug("ChatbotController - serializedObj.do - Exception");

		}
		return new ResponseEntity<>("success", HttpStatus.OK);
	}
	
	@RequestMapping(value = "/getInputText.do", method = RequestMethod.GET)
	public ResponseEntity<?> getInputText(@RequestParam("intent_id") String intent_id) throws Exception {

		InputVo vo = new InputVo();
		List<InputVo> inputList = null;
		try {
			vo.setIntent_id(intent_id);
			inputList = chatbotService.getInputText(vo);
			if(inputList.size() == 0) {
				return new ResponseEntity<>("nodata", HttpStatus.OK);
			}
		}catch(Exception e) {
			log.debug("ChatbotController - getInputText.do - Exception");
		}
		return new ResponseEntity<>(inputList, HttpStatus.OK);
	}

	@RequestMapping(value = "/getRespone.do", method = RequestMethod.GET)
	public ResponseEntity<?> getRespone(@RequestParam("intent_id") String intent_id) throws Exception {

		// respone_list를 뽑아온다
		ResponeListVo responeListVo = new ResponeListVo();
		List<Map<String,Object>>  responeListVoList = null;
		List<Map<String,Object>> textTypeCardList = null;
		List<Map<String,Object>> imgTypeCardList = null;
		List<Map<String,Object>> cardTypeCardList = null;
		List<Map<String,Object>> listTypeCardList = null;
		List<Map<String,Object>> skillTypeCardList = null;
		List<Map<String,Object>> directTypeCardList = null;
		List<Map<String,Object>> textTypeCardBtnList = null;
		List<Map<String,Object>> cardTypeCardBtnList = null;
		List<Map<String,Object>> listTypeCardItemList = null;
		List<Map<String,Object>> skillTypeCardItemList = null;
		List<Map<String,Object>> listTypeCardBtnList = null;
		List<Map<String,Object>> directTypeCardBtnList = null;
		List<Map<String,Object>> conditionTypeCardList = null;
		try {
			responeListVo.setIntent_id(intent_id);
			responeListVoList = chatbotService.getResponeListVoList(responeListVo);
			
			
			String responeListType = "";
			for(int responeListVoCnt = 0; responeListVoCnt < responeListVoList.size(); responeListVoCnt++) {
				
				responeListType =  (String) responeListVoList.get(responeListVoCnt).get("type");
				switch(responeListType) {
				case "text":
					textTypeCardList = chatbotService.getTextTypeCardList((String)responeListVoList.get(responeListVoCnt).get("list_id"));
					for(int textTypeCardCnt = 0; textTypeCardCnt < textTypeCardList.size(); textTypeCardCnt++) {
						textTypeCardBtnList = chatbotService.getTextTypeCardBtnList((String)textTypeCardList.get(textTypeCardCnt).get("text_id"));
						textTypeCardList.get(textTypeCardCnt).put("button", textTypeCardBtnList);
					}
					responeListVoList.get(responeListVoCnt).put("card", textTypeCardList);
					break;
					
				case "image":
					imgTypeCardList = chatbotService.getImgTypeCardList((String)responeListVoList.get(responeListVoCnt).get("list_id"));
					responeListVoList.get(responeListVoCnt).put("card", imgTypeCardList);
					break;
					
				case "card":
					cardTypeCardList = chatbotService.getCardTypeCardList((String)responeListVoList.get(responeListVoCnt).get("list_id"));
					for(int cardTypeCardCnt = 0; cardTypeCardCnt < cardTypeCardList.size(); cardTypeCardCnt++ ) {
						cardTypeCardBtnList = chatbotService.getCardTypeCardBtnList((String)cardTypeCardList.get(cardTypeCardCnt).get("card_id"));
						cardTypeCardList.get(cardTypeCardCnt).put("button", cardTypeCardBtnList);
					}
					responeListVoList.get(responeListVoCnt).put("card", cardTypeCardList);
					break;
					
				case "list":
					listTypeCardList = chatbotService.getListTypeCardList((String)responeListVoList.get(responeListVoCnt).get("list_id"));
					for(int listTypeCardCnt = 0; listTypeCardCnt < listTypeCardList.size(); listTypeCardCnt++) {
						listTypeCardItemList = chatbotService.getListTypeCardItemList((String)listTypeCardList.get(listTypeCardCnt).get("list_type_id"));
						listTypeCardList.get(listTypeCardCnt).put("list", listTypeCardItemList);
						listTypeCardBtnList = chatbotService.getListTypeCardBtnList((String)listTypeCardList.get(listTypeCardCnt).get("list_type_id"));
						listTypeCardList.get(listTypeCardCnt).put("button", listTypeCardBtnList);
					}
					responeListVoList.get(responeListVoCnt).put("card", listTypeCardList);
					
					break;
					
				case "skill":
					skillTypeCardList = chatbotService.getSkillTypeCardList((String)responeListVoList.get(responeListVoCnt).get("list_id"));
					System.out.println("@@skillTypeCardList = " + responeListVoCnt + "," + skillTypeCardList);
					responeListVoList.get(responeListVoCnt).put("list_id", skillTypeCardList.get(0).get("list_id"));
					responeListVoList.get(responeListVoCnt).put("skill_id", skillTypeCardList.get(0).get("skill_id"));
					responeListVoList.get(responeListVoCnt).put("position", skillTypeCardList.get(0).get("position"));
					responeListVoList.get(responeListVoCnt).put("skill_item_id", skillTypeCardList.get(0).get("skill_item_id"));
					break;
					
				case "direct":
					directTypeCardList = chatbotService.getDirectTypeCardList((String)responeListVoList.get(responeListVoCnt).get("list_id"));
					for(int directTypeCardCnt = 0; directTypeCardCnt < directTypeCardList.size(); directTypeCardCnt++) {
						directTypeCardBtnList = chatbotService.getDirectTypeCardBtnList((String)directTypeCardList.get(directTypeCardCnt).get("direct_btn_id"));
						directTypeCardList.get(directTypeCardCnt).put("button", directTypeCardBtnList);
					}
					responeListVoList.get(responeListVoCnt).put("card", directTypeCardList);
					break;
				case "condition":
					conditionTypeCardList = chatbotService.getConditionTypeCardList((String)responeListVoList.get(responeListVoCnt).get("list_id"));
					System.out.println("@@conditionTypeCardList = "+ responeListVoCnt + ","  + conditionTypeCardList);
					responeListVoList.get(responeListVoCnt).put("list_id", conditionTypeCardList.get(0).get("list_id"));
					responeListVoList.get(responeListVoCnt).put("condition_id", conditionTypeCardList.get(0).get("condition_id"));
					responeListVoList.get(responeListVoCnt).put("position", conditionTypeCardList.get(0).get("position"));
					responeListVoList.get(responeListVoCnt).put("condition_item_id", conditionTypeCardList.get(0).get("condition_item_id"));
					break;
				default:
					System.out.println("모두해당없음");
				}
			}
		}catch(Exception e){
			log.debug("ChatbotController - getRespone.do - Exception");
			e.printStackTrace();
		}
		System.out.println("***responeListVoList = " + responeListVoList);
		return new ResponseEntity<>(responeListVoList, HttpStatus.OK);
	}
	
	@RequestMapping(value="/getImg.do")
	public void getImage(@RequestParam("img_attach_id") String img_attach_id, HttpServletResponse response) throws Exception {
		Map<String, String> file = null;
		
		try {
			file = chatbotService.selectImageFile(img_attach_id);
			if (!file.isEmpty()) {
				fileUtil.getImgFile(response, file.get("save_file_name"));
			}
		} catch (Exception e) {
			log.debug("ChatbotController - getImg.do - Exception");
		}
	}
	
	@RequestMapping(value="/getIntentListInBtn.do")
	public  ResponseEntity<?> getIntentListInBtn() throws Exception{
		List<IntentVo> intentList = null;
		try {
			intentList = chatbotService.getIntentListInBtn();
		}catch(Exception e) {
			log.debug("ChatbotController - getIntentListInBtn.do - Exception");
		}
		return new ResponseEntity<>(intentList, HttpStatus.OK);	
	}
	
	@RequestMapping(value="/getSkillList.do", method = RequestMethod.GET)
	public ResponseEntity<?> getSkillList(ModelMap model, SkillVo vo) throws Exception{
		List<SkillVo> skillList = null;
		try {
			skillList = chatbotService.selectSkillList(vo);
		}catch(Exception e) {
			log.debug("chatbotController > /getSkillList.do > Exception");
		}		
		
		return new ResponseEntity<>(skillList, HttpStatus.OK);	
	}
	
	@RequestMapping(value="/getConditionList.do", method = RequestMethod.GET)
	public ResponseEntity<?> getConditionList(ModelMap model, ConditionVo vo) throws Exception{
		List<ConditionVo> conditionList = null;
		try {
			conditionList = chatbotService.selectConditionList(vo);
		}catch(Exception e) {
			log.debug("chatbotController > /getSkillList.do > Exception");
		}		
		return new ResponseEntity<>(conditionList, HttpStatus.OK);	
	}
	
	
	@RequestMapping(value="/registImg.do", method=RequestMethod.POST)
	public ResponseEntity<?> registImg(HttpServletRequest request, @RequestParam Map<String, Object> params) throws Exception {
		List<Long> id = null;
		
		try {
			FileVo fileVo = new FileVo();
			List<FileVo> fileList = fileUtil.parseFileInfo(fileVo, request);
			id = CmmnUtil.generateKeys(fileList.size());
			
			for (int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setIdx(String.valueOf(id.get(i)));
				
				log.debug("[Chatbot Intent] Chatbot Intent 이미지 파일 등록");
				chatbotService.insertImageFile(fileList.get(i));
			}
		} catch (Exception e) {
			log.debug("ChatbotController - registImg.do - Exception");
		}
		return new ResponseEntity<>(id, HttpStatus.OK);
	}
}
