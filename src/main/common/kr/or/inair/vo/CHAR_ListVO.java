package kr.or.inair.vo;

import java.util.List;

public class CHAR_ListVO {
	private String char_date;
	private String char_num;
	private String indvdl_id;
	private List<CHAR_ResultVO> result;
	
	public String getChar_date() {
		return char_date;
	}
	public void setChar_date(String char_date) {
		this.char_date = char_date;
	}
	public String getChar_num() {
		return char_num;
	}
	public void setChar_num(String char_num) {
		this.char_num = char_num;
	}
	public String getIndvdl_id() {
		return indvdl_id;
	}
	public void setIndvdl_id(String indvdl_id) {
		this.indvdl_id = indvdl_id;
	}
	public List<CHAR_ResultVO> getResult() {
		return result;
	}
	public void setResult(List<CHAR_ResultVO> result) {
		this.result = result;
	}

}
