package kr.or.inair.vo;

public class LanguageVO {
	private String rnum;
	private String lang_delete;
	private String lang_num;
	private String lang_kind;
	
	public String getLang_num() {
		return lang_num;
	}
	public void setLang_num(String lang_num) {
		this.lang_num = lang_num;
	}
	public String getLang_kind() {
		return lang_kind;
	}
	public void setLang_kind(String lang_kind) {
		this.lang_kind = lang_kind;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getLang_delete() {
		return lang_delete;
	}
	public void setLang_delete(String lang_delete) {
		this.lang_delete = lang_delete;
	}
}
