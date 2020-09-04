package egovframework.com.cmmn.util;

public class FileVo {
	private String idx;
	private String org_file_name;
	private String save_file_name;
	private int file_size;
	private String create_user;
	private String del_chk;
	private String create_date;
	private String attach_type;

	// intent
	private String parent_id;
	private String intent_id;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getOrg_file_name() {
		return org_file_name;
	}
	public void setOrg_file_name(String org_file_name) {
		this.org_file_name = org_file_name;
	}
	public String getSave_file_name() {
		return save_file_name;
	}
	public void setSave_file_name(String save_file_name) {
		this.save_file_name = save_file_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public String getCreate_user() {
		return create_user;
	}
	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}
	public String getDel_chk() {
		return del_chk;
	}
	public void setDel_chk(String del_chk) {
		this.del_chk = del_chk;
	}
	public String getCreate_date() {
		return create_date;
	}
	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}
	public String getAttach_type() {
		return attach_type;
	}
	public void setAttach_type(String attach_type) {
		this.attach_type = attach_type;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public String getIntent_id() {
		return intent_id;
	}
	public void setIntent_id(String intent_id) {
		this.intent_id = intent_id;
	}
	
	@Override
	public String toString() {
		return "FileVo [idx=" + idx + ", org_file_name=" + org_file_name + ", save_file_name=" + save_file_name
				+ ", file_size=" + file_size + ", create_user=" + create_user + ", del_chk=" + del_chk
				+ ", create_date=" + create_date + ", attach_type=" + attach_type + ", parent_id=" + parent_id
				+ ", intent_id=" + intent_id + "]";
	}
}
