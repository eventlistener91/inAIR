package kr.or.inair.vo;

import java.util.List;

public class MentorVO {
	private String rnum;
	private String mentor_num;
	private String indvdl_id;
	private String mentor_sj;
	private String mentor_cn;
	private String mentor_rgsde;
	private String mentor_group;
	private String mentor_sn;
	private String mentor_depth;
	private String mentor_delete;
	private String mentor_hit;
	private String mentor_comment;
	private List<Mentor_FileVO> items;
	private String mentor_lowpro_name;

	
	public String getMentor_num() {
		return mentor_num;
	}
	public void setMentor_num(String mentor_num) {
		this.mentor_num = mentor_num;
	}
	public String getIndvdl_id() {
		return indvdl_id;
	}
	public void setIndvdl_id(String indvdl_id) {
		this.indvdl_id = indvdl_id;
	}
	public String getMentor_sj() {
		return mentor_sj;
	}
	public void setMentor_sj(String mentor_sj) {
		this.mentor_sj = mentor_sj;
	}
	public String getMentor_cn() {
		return mentor_cn;
	}
	public void setMentor_cn(String mentor_cn) {
		this.mentor_cn = mentor_cn;
	}
	public String getMentor_rgsde() {
		return mentor_rgsde;
	}
	public void setMentor_rgsde(String mentor_rgsde) {
		this.mentor_rgsde = mentor_rgsde;
	}
	public String getMentor_group() {
		return mentor_group;
	}
	public void setMentor_group(String mentor_group) {
		this.mentor_group = mentor_group;
	}
	public String getMentor_sn() {
		return mentor_sn;
	}
	public void setMentor_sn(String mentor_sn) {
		this.mentor_sn = mentor_sn;
	}
	public String getMentor_depth() {
		return mentor_depth;
	}
	public void setMentor_depth(String mentor_depth) {
		this.mentor_depth = mentor_depth;
	}
	public String getMentor_delete() {
		return mentor_delete;
	}
	public void setMentor_delete(String mentor_delete) {
		this.mentor_delete = mentor_delete;
	}
	public String getMentor_hit() {
		return mentor_hit;
	}
	public void setMentor_hit(String mentor_hit) {
		this.mentor_hit = mentor_hit;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public List<Mentor_FileVO> getItems() {
		return items;
	}
	public void setItems(List<Mentor_FileVO> items) {
		this.items = items;
	}
	public String getMentor_comment() {
		return mentor_comment;
	}
	public void setMentor_comment(String mentor_comment) {
		this.mentor_comment = mentor_comment;
	}
	public String getMentor_lowpro_name() {
		return mentor_lowpro_name;
	}
	public void setMentor_lowpro_name(String mentor_lowpro_name) {
		this.mentor_lowpro_name = mentor_lowpro_name;
	}
	
}
