package egovframework.com.cmmn;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;

@Component("callNotificationTalkAPI")
public class CallNotificationTalkAPI {
	public void CallAPI(String action_id,NotificationVo vo,HttpServletResponse response) throws Exception {
		URL url = null;
		HttpURLConnection connection = null;
		
		InputStream input = null;
		OutputStream output = null;
		ByteArrayOutputStream results = null;
		
		String parameters = "";
		byte[] buffer = new byte[2048];
		int readed = 0;
		
		try {
			
			parameters = setParameters(action_id, vo);
//			parameters += "{ " +
//				" \"tmp_number\": \"15641\", "+
//				" \"kakao_res\": \"N\", " +
//				" \"kakao_url\": null, " +
//				" \"kakao_sender\": \"01082980345\", " +
//				" \"kakao_name\": \"홍진표\", " +
//				" \"kakao_phone\": \"01047581398\", " +
//				" \"kakao_add1\": \"e-daul\", " +
//				" \"kakao_add2\": \"\", " +
//				" \"kakao_add3\": \"\", " +
//				" \"kakao_add4\": \"\", " +
//				" \"kakao_add5\": \"\", " +
//				" \"kakao_add6\": \"\", " +
//				" \"kakao_add7\": \"\", " +
//				" \"kakao_add8\": \"\", " +
//				" \"kakao_add9\": \"\", " +
//				" \"kakao_add10\": \"\", " +
//				" \"kakao_080\": \"N\", " +
//				" \"kakao_url1_1\": null, " +
//				" \"kakao_url1_2\": null, " +
//				" \"kakao_url2_1\": null, " +
//				" \"kakao_url2_2\": null, " +
//				" \"kakao_url3_1\": null, " +
//				" \"kakao_url3_2\": null, " +
//				" \"kakao_url4_1\": null, " +
//				" \"kakao_url4_2\": null, " +
//				" \"kakao_url5_1\": null, " +
//				" \"kakao_url5_2\": null, " +
//				" \"TRAN_REPLACE_TYPE\": \"S\" " +
//	 		" }";
			
			url = new URL("http://www.apiorange.com/api/send/notice.do");
			connection = (HttpURLConnection)url.openConnection();
			
			connection.setRequestProperty("Content-Type", "application/json; charset=utf-8");
			connection.setRequestProperty("Authorization", "uAWjrNSMWPTH8yPiE95q4KWe4UawvJ3Cqf7jyu2X1Tk=");
			
			connection.setRequestMethod("POST");
			
			connection.setDoOutput(true);
			connection.setUseCaches(false);
			connection.setDefaultUseCaches(false);

			output = connection.getOutputStream();

			output.write(parameters.getBytes());
			output.flush();

			input = connection.getInputStream();
			results = new ByteArrayOutputStream();

			while ((readed = input.read(buffer, 0, buffer.length)) != -1) results.write(buffer, 0, readed);
			
			
			response.getWriter().print(parameters.toString());
		} finally {
			if (input != null) input.close();
			if (output != null) output.close();
			if (results != null) results.close();
			if (connection != null) connection.disconnect();
		}
	}
	
	public String setParameters(String action_id, NotificationVo vo) {
		String paramJson = "";
		String tmp_number = "";
		String kakao_res = "";
		String kakao_url = "";
		String kakao_sender = "";
		String kakao_name = "";
		String kakao_phone = "";
		String kakao_add1 = "";
		String kakao_add2 = "";
		String kakao_add3 = "";
		String kakao_add4 = "";
		String kakao_add5 = "";
		String kakao_add6 = "";
		String kakao_add7 = "";
		String kakao_add8 = "";
		String kakao_add9 = "";
		String kakao_add10 = "";
		String kakao_080 = "";
		String tran_replace_type = "";
		
		if(action_id.equals("U01")) {
			
			tmp_number = "15641";
			kakao_res = "N";
			kakao_url = "null";
			kakao_sender = "01082980345";
			kakao_name = vo.getName();
			kakao_phone = vo.getPhone();
			kakao_add1 = "e-다울마당";
			kakao_080 = "N";
			tran_replace_type = "S";
			
			paramJson += "{ " +
						" \"tmp_number\": \""+tmp_number+"\", "+
						" \"kakao_res\": \""+kakao_res+"\", " +
						" \"kakao_url\": "+ kakao_url+", " +
						" \"kakao_sender\": \""+ kakao_sender +"\", " +
						" \"kakao_name\": \""+ kakao_name +"\", " +
						" \"kakao_phone\": \""+ kakao_phone +"\", " +
						" \"kakao_add1\": \"e-"+kakao_add1+"\", " +
						" \"kakao_add2\": \"\", " +
						" \"kakao_add3\": \"\", " +
						" \"kakao_add4\": \"\", " +
						" \"kakao_add5\": \"\", " +
						" \"kakao_add6\": \"\", " +
						" \"kakao_add7\": \"\", " +
						" \"kakao_add8\": \"\", " +
						" \"kakao_add9\": \"\", " +
						" \"kakao_add10\": \"\", " +
						" \"kakao_080\": \""+kakao_080+"\", " +
						" \"kakao_url1_1\": null, " +
						" \"kakao_url1_2\": null, " +
						" \"kakao_url2_1\": null, " +
						" \"kakao_url2_2\": null, " +
						" \"kakao_url3_1\": null, " +
						" \"kakao_url3_2\": null, " +
						" \"kakao_url4_1\": null, " +
						" \"kakao_url4_2\": null, " +
						" \"kakao_url5_1\": null, " +
						" \"kakao_url5_2\": null, " +
						" \"TRAN_REPLACE_TYPE\": \""+tran_replace_type+"\" " +
						" }";
		}
		
		return paramJson;
	}
	
}
