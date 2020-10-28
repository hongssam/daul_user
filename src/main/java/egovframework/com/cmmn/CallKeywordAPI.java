package egovframework.com.cmmn;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.suggestion.service.SuggestionService;
import egovframework.com.suggestion.vo.SuggestionKeywordVo;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Component("callKeywordAPI")
public class CallKeywordAPI {
	
	@Resource(name="suggestionService")
	private SuggestionService suggestionService;
	
	@SuppressWarnings({ "deprecation", "unchecked" })
	public void CallAPI(String content) {
		Map<Object, Object> paramMap = null;
		try{
			String jsonMessage = "{\"text\":\"" +content+ "\"}";
			
			System.out.println(jsonMessage);
			
			OkHttpClient client = new OkHttpClient();
			Request request = new Request.Builder()
					.url("http://183.111.102.211:9000/word_count")
					.post(RequestBody.create(MediaType.parse("application/json"), jsonMessage))
					.build();

	                    //동기 처리시 execute함수 사용
			Response response = client.newCall(request).execute();  

			//출력
			String message = response.body().string();
			System.out.println(message);
			
			paramMap = new ObjectMapper().readValue(message, new TypeReference<Map<Object, Object>>(){});
			List<Map<Object, Object>> wordList = (List<Map<Object, Object>>) paramMap.get("words");
			
			for(int wordListCnt = 0; wordListCnt < wordList.size(); wordListCnt++) {
				
				SuggestionKeywordVo suggestionKeywordVo = new SuggestionKeywordVo();
				suggestionKeywordVo.setWord( (String) wordList.get(wordListCnt).get("word"));
				suggestionKeywordVo.setCount( (int) wordList.get(wordListCnt).get("count"));
				
				suggestionService.insertKeywordCnt(suggestionKeywordVo);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("키워드 API호출 실패");
		}

	}
	
}
