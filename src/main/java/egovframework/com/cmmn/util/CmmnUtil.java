package egovframework.com.cmmn.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Component("cmmnUtil")
@RequestMapping(value="/cmmn")
public class CmmnUtil {
    private Log log = LogFactory.getLog(this.getClass());
    
	@Resource(name="fileUtil")
	private FileUtil fileUtil;
	
	public List<Map<String, String>> getValid(BindingResult bindingResult) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();

		for(int i = 0; i < bindingResult.getAllErrors().size(); i++) {
			String code = bindingResult.getAllErrors().get(i).getCode();
			String msg = bindingResult.getAllErrors().get(i).getDefaultMessage();

			Map<String, String> resMap = new HashMap<>();
			resMap.put(code, msg);
			
			list.add(resMap);
		}
		
		return list;
	}
	
	public static long generateKey(){
		long prefix = Calendar.getInstance().getTimeInMillis();
		String key = String.format("%d%03d", prefix, 1);
		return Long.parseLong(key);
	}
	
	public static List<Long> generateKeys(int count){
		List<Long> keyList = new ArrayList<>();
		long prefix = Calendar.getInstance().getTimeInMillis();
		
		for(int suffix=1; suffix<count+1; suffix++) {
			String key = String.format("%d%03d", prefix, suffix);
			keyList.add(Long.parseLong(key));
		}
		return keyList;
	}
	
	@RequestMapping(value="/getImg.do")
	public void getImage(@RequestParam("save_file_name") String save_file_name, HttpServletResponse response) throws Exception {
		
		try {
		
				fileUtil.getImgFile(response, save_file_name);
		
		} catch (Exception e) {
			log.debug("ChatbotController - getImg.do - Exception");
		}
	}
}
