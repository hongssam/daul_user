package egovframework.com.cmmn.util;

public class SearchVo {
	private String search_s_date;
	private String search_e_date;
	private String search_type;
	private String search;
	private String order;
	
	public String getSearch_s_date() {
		return search_s_date;
	}
	public void setSearch_s_date(String search_s_date) {
		this.search_s_date = search_s_date;
	}
	public String getSearch_e_date() {
		return search_e_date;
	}
	public void setSearch_e_date(String search_e_date) {
		this.search_e_date = search_e_date;
	}
	public String getSearch_type() {
		return search_type;
	}
	public void setSearch_type(String search_type) {
		this.search_type = search_type;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	
	@Override
	public String toString() {
		return "SearchVo [search_s_date=" + search_s_date + ", search_e_date=" + search_e_date + ", search_type="
				+ search_type + ", search=" + search + ", order=" + order + "]";
	}
}
