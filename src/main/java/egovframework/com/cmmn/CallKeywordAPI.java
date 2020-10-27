package egovframework.com.cmmn;

import org.springframework.stereotype.Component;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

@Component("callKeywordAPI")
public class CallKeywordAPI {

	public void CallAPI(String action_id) {
		try {
			OkHttpClient client = new OkHttpClient();
			Request request = new Request.Builder()
					//.addHeader("x-api-key", "")
					.url("http://183.111.102.211:9000/weather")
					.build(); //GET Request 
                        
                       //동기 처리시 execute함수 사용 
			Response response = client.newCall(request).execute(); 
			
			//출력 
			String message = response.body().string();
			System.out.println(message);
		} catch (Exception e){
			System.err.println(e.toString());
		}
	}


	
}
