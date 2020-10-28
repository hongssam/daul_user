package egovframework.com.cmmn;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;


@Component("callEmotionAPI")
public class CallEmotionAPI {

	@SuppressWarnings({ "deprecation", "unchecked" })
	public Map<Object, Object> CallAPI(String opinion_content) throws Exception {
		Map<Object, Object> paramMap = null;
	try{
		String jsonMessage = "{\"text\":\"" +opinion_content+ "\"}";
		OkHttpClient client = new OkHttpClient();
		Request request = new Request.Builder()
				.url("http://183.111.102.211:9000/sentiment")
				.post(RequestBody.create(MediaType.parse("application/json"), jsonMessage))
				.build();

                    //동기 처리시 execute함수 사용
		Response response = client.newCall(request).execute();  

		//출력
		String message = response.body().string();
		System.out.println(message);
		
		
		paramMap = new ObjectMapper().readValue(message, new TypeReference<Map<Object, Object>>(){});
		
				
	} catch (Exception e) {
		e.printStackTrace();
		System.out.println("감정분석 API호출 실패");
	}
	return paramMap;
	}
}
