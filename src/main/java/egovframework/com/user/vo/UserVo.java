package egovframework.com.user.vo;

public class UserVo {
	private String user_id;
	private String name;
	private String pw;
	private String new_pw;
	private String email;
	private String phone;
	private String channel;
	private String reg_date;
	private String last_login_date;
	private String email_chk;
	private String talk_chk;
	private String sms_chk;
	private String auth_type;
	private String user_key;
	private String kakao_key;
	
	private int contest_cnt;
	private int suggestion_cnt;
	private int participation_cnt;
	private int opinion_cnt;
	
	private String key = "daul";
	
	private int num;
	private String user_di;
	//sms
	private String authType;
	private String birthDate;
	private String connInfo;
	private String dupInfo;
	private String gender;
	private String mobileCo;
	private String mobileNo;
	private String msg;
	private String nationalInfo;
	private String requestNumber;
	private String responseNumber;
	
	private String mileage;
	private String userchannel_key;

	
	
	public String getMileage() {
		return mileage;
	}
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	public String getUserchannel_key() {
		return userchannel_key;
	}
	public void setUserchannel_key(String userchannel_key) {
		this.userchannel_key = userchannel_key;
	}
	public String getUser_di() {
		return user_di;
	}
	public void setUser_di(String user_di) {
		this.user_di = user_di;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNew_pw() {
		return new_pw;
	}
	public void setNew_pw(String new_pw) {
		this.new_pw = new_pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getChannel() {
		return channel;
	}
	public void setChannel(String channel) {
		this.channel = channel;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getLast_login_date() {
		return last_login_date;
	}
	public void setLast_login_date(String last_login_date) {
		this.last_login_date = last_login_date;
	}
	public String getEmail_chk() {
		return email_chk;
	}
	public void setEmail_chk(String email_chk) {
		this.email_chk = email_chk;
	}
	public String getTalk_chk() {
		return talk_chk;
	}
	public void setTalk_chk(String talk_chk) {
		this.talk_chk = talk_chk;
	}
	public String getSms_chk() {
		return sms_chk;
	}
	public void setSms_chk(String sms_chk) {
		this.sms_chk = sms_chk;
	}
	public String getAuth_type() {
		return auth_type;
	}
	public void setAuth_type(String auth_type) {
		this.auth_type = auth_type;
	}
	public String getUser_key() {
		return user_key;
	}
	public void setUser_key(String user_key) {
		this.user_key = user_key;
	}
	public String getKakao_key() {
		return kakao_key;
	}
	public void setKakao_key(String kakao_key) {
		this.kakao_key = kakao_key;
	}
	public int getContest_cnt() {
		return contest_cnt;
	}
	public void setContest_cnt(int contest_cnt) {
		this.contest_cnt = contest_cnt;
	}
	public int getSuggestion_cnt() {
		return suggestion_cnt;
	}
	public void setSuggestion_cnt(int suggestion_cnt) {
		this.suggestion_cnt = suggestion_cnt;
	}
	public int getParticipation_cnt() {
		return participation_cnt;
	}
	public void setParticipation_cnt(int participation_cnt) {
		this.participation_cnt = participation_cnt;
	}
	public int getOpinion_cnt() {
		return opinion_cnt;
	}
	public void setOpinion_cnt(int opinion_cnt) {
		this.opinion_cnt = opinion_cnt;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getPwKey() {
		return getPw() + getKey();
	}
	public String getAuthType() {
		return authType;
	}
	public void setAuthType(String authType) {
		this.authType = authType;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getConnInfo() {
		return connInfo;
	}
	public void setConnInfo(String connInfo) {
		this.connInfo = connInfo;
	}
	public String getDupInfo() {
		return dupInfo;
	}
	public void setDupInfo(String dupInfo) {
		this.dupInfo = dupInfo;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getMobileCo() {
		return mobileCo;
	}
	public void setMobileCo(String mobileCo) {
		this.mobileCo = mobileCo;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getNationalInfo() {
		return nationalInfo;
	}
	public void setNationalInfo(String nationalInfo) {
		this.nationalInfo = nationalInfo;
	}
	public String getRequestNumber() {
		return requestNumber;
	}
	public void setRequestNumber(String requestNumber) {
		this.requestNumber = requestNumber;
	}
	public String getResponseNumber() {
		return responseNumber;
	}
	public void setResponseNumber(String responseNumber) {
		this.responseNumber = responseNumber;
	}
	@Override
	public String toString() {
		return "UserVo [user_id=" + user_id + ", name=" + name + ", pw=" + pw + ", new_pw=" + new_pw + ", email="
				+ email + ", phone=" + phone + ", channel=" + channel + ", reg_date=" + reg_date + ", last_login_date="
				+ last_login_date + ", email_chk=" + email_chk + ", talk_chk=" + talk_chk + ", sms_chk=" + sms_chk
				+ ", auth_type=" + auth_type + ", user_key=" + user_key + ", kakao_key=" + kakao_key + ", contest_cnt="
				+ contest_cnt + ", suggestion_cnt=" + suggestion_cnt + ", participation_cnt=" + participation_cnt
				+ ", opinion_cnt=" + opinion_cnt + ", key=" + key + ", num=" + num + ", user_di=" + user_di
				+ ", authType=" + authType + ", birthDate=" + birthDate + ", connInfo=" + connInfo + ", dupInfo="
				+ dupInfo + ", gender=" + gender + ", mobileCo=" + mobileCo + ", mobileNo=" + mobileNo + ", msg=" + msg
				+ ", nationalInfo=" + nationalInfo + ", requestNumber=" + requestNumber + ", responseNumber="
				+ responseNumber + ", userchannel_key=" + userchannel_key + "]";
	}
}
