package egovframework.com.sub.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import egovframework.com.cmmn.SecurityUtil;
import egovframework.com.sub.service.SubService;
import egovframework.com.sub.vo.SubVo;

@Controller
@RequestMapping(value = "/sub")
public class SubController {
	
	protected Log log = LogFactory.getLog(SubController.class);
	
	@Resource(name = "subService")
	private SubService subService;
	
	@RequestMapping(value = "/sub.do")
	public String test(ModelMap model) {
		System.out.println("---------- SubController test() sub/sub.do ----------");
		model.addAttribute("subVo", new SubVo());
		return "sub/sub";
	}
	
	
	@RequestMapping(value = "/subs.do", method = RequestMethod.POST)
	//@ModelAttribute는 생략해도  무관하나 명시적으로 붙여는것이 좋
	public String test2(@ModelAttribute @Valid SubVo vo, BindingResult result) {
		System.out.println("---------- SubController test2() sub/subs.do ----------");
		System.out.println("vo userId : " + vo.getEmail());
		
		if (result.hasErrors()) {
			System.out.println("result Error : " + result.getFieldError().getDefaultMessage());
			return "sub/sub";
		}
		
		return "main/main";
	}
	
    @RequestMapping(value ="/boardInsert.do", method=RequestMethod.POST)
    public String boardInsert(ModelMap model, MultipartFile[] file) throws Exception {
       System.out.println("11111111111111");
       
        //boardService.insertBoard(commandMap);
        for(int i=0; i<file.length; i++) {
            log.debug("================== file start ==================");
            log.debug("파일 이름: "+file[i].getName());
            log.debug("파일 실제 이름: "+file[i].getOriginalFilename());
            log.debug("파일 크기: "+file[i].getSize());
            log.debug("content type: "+file[i].getContentType());
            log.debug("================== file   END ==================");
        }
        return "main/main";
    }

	
	
	
}
