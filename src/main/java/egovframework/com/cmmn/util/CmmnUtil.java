package egovframework.com.cmmn.util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

@Component("cmmnUtil")
@RequestMapping(value="/cmmn")
public class CmmnUtil {
    //private Log log = LogFactory.getLog(this.getClass());
    
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
	
	public static String generateKey(){
		long prefix = Calendar.getInstance().getTimeInMillis();
		String key = String.format("%d%03d", prefix, 1);
		return key;
	}
	
	public static String generateKeyWithPrefix(String prefix){
		long time = Calendar.getInstance().getTimeInMillis();
		String key = String.format("%s%d%03d", prefix, time, 1);
		return key;
	}
	
	public static List<String> generateKeys(int count){
		List<String> keyList = new ArrayList<>();
		long prefix = Calendar.getInstance().getTimeInMillis();
		
		for(int suffix=1; suffix<count+1; suffix++) {
			String key = String.format("%d%03d", prefix, suffix);
			keyList.add(key);
		}
		return keyList;
	}
}
