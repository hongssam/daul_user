package egovframework.com.cmmn;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletResponse;


public class CallNotificationTalkAPI {
	public void CallAPI(String action_id,HttpServletResponse response) throws Exception {
		URL url = null;
		HttpURLConnection connection = null;
		
		InputStream input = null;
		OutputStream output = null;
		ByteArrayOutputStream results = null;
		
		String parameters = "";
		byte[] buffer = new byte[2048];
		int readed = 0;
		
		try {
			parameters += "{ " +
				" \"tmp_number\": \"템플럿번호\", "+
				" \"kakao_res\": \"N\", " +
				" \"kakao_url\": null, " +
				" \"kakao_sender\": \"발신번호\", " +
				" \"kakao_name\": \"받으시는분의고객명\", " +
				" \"kakao_phone\": \"수신자번호\", " +
				" \"kakao_add1\": \"\", " +
				" \"kakao_add2\": \"\", " +
				" \"kakao_add3\": \"\", " +
				" \"kakao_add4\": \"\", " +
				" \"kakao_add5\": \"\", " +
				" \"kakao_add6\": \"\", " +
				" \"kakao_add7\": \"\", " +
				" \"kakao_add8\": \"\", " +
				" \"kakao_add9\": \"\", " +
				" \"kakao_add10\": \"\", " +
				" \"kakao_080\": \"N\", " +
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
				" \"TRAN_REPLACE_TYPE\": \"L\" " +
	 		" }";
			
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
	
}
