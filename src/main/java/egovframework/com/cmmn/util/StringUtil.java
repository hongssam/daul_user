package egovframework.com.cmmn.util;

import java.lang.reflect.Array;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;

public class StringUtil {
	public static boolean isEmpty(String str) {
		if (str == null || "".equals(str)) {
            return true;
        }
		return false;
	}
	
	public static boolean isNotEmpty(String str) {
		return !isEmpty(str);
	}
	
	public static boolean equals(String str1, String str2) {
		return StringUtils.equals(str1, str2);
	}
	public static boolean equalsIgnoreCase(String str1, String str2) {
		return StringUtils.equalsIgnoreCase(str1, str2);
	}
	
	public static boolean notEquals(String str1, String str2) {
		return !StringUtils.equals(str1, str2);
	}
	
	public static String avoidNull(Object object) {
		return avoidNull(object, "");
	}
	
	public static String avoidNull(Object object, String string) {
		if (object != null) {
			string = object.toString().trim();
		}		
		return string;
	}

	public static boolean isEmptyByArray(String[] arr) {
		if (arr == null || arr.length == 0) return true;
		return false;
	}

	public static boolean isNull(Object obj) {
		
		if (obj == null) return true; 
			
		if (obj instanceof String) 
			return "".equals(obj.toString().trim());
		else if (obj instanceof List) 
			return ((List<?>) obj).isEmpty();
		else if (obj instanceof Map) 
			return ((Map<?, ?>) obj).isEmpty();
		else if (obj instanceof Object[]) 
			return Array.getLength(obj) == 0;
		else
			return true;
	}
	
	public static boolean isNotNull(Object obj) {
		return !isNull(obj);
	}
}
