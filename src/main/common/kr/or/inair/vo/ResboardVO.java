package kr.or.inair.vo;

import java.util.List;

public class ResboardVO {
	private String rnum;
	private String res_num;
	private String indvdl_id;
	private String com_id;
	private String res_sj;
	private String res_cn;
	private String res_rgsde;
	private String res_hit;
	private String res_delete;
	private String res_group;
	private String res_sn;
	private String res_depth;
	private List<Resboard_FileVO> items;
	
	public String getRes_num() {
		return res_num;
	}
	public void setRes_num(String res_num) {
		this.res_num = res_num;
	}
	public String getIndvdl_id() {
		return indvdl_id;
	}
	public void setIndvdl_id(String indvdl_id) {
		this.indvdl_id = indvdl_id;
	}
	public String getCom_id() {
		return com_id;
	}
	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}
	public String getRes_sj() {
		return res_sj;
	}
	public void setRes_sj(String res_sj) {
		this.res_sj = res_sj;
	}
	public String getRes_cn() {
		return res_cn;
	}
	public void setRes_cn(String res_cn) {
		this.res_cn = res_cn;
	}
	public String getRes_rgsde() {
		return res_rgsde;
	}
	public void setRes_rgsde(String res_rgsde) {
		this.res_rgsde = res_rgsde;
	}
	public String getRes_hit() {
		return res_hit;
	}
	public void setRes_hit(String res_hit) {
		this.res_hit = res_hit;
	}
	public String getRes_delete() {
		return res_delete;
	}
	public void setRes_delete(String res_delete) {
		this.res_delete = res_delete;
	}
	public String getRes_group() {
		return res_group;
	}
	public void setRes_group(String res_group) {
		this.res_group = res_group;
	}
	public String getRes_sn() {
		return res_sn;
	}
	public void setRes_sn(String res_sn) {
		this.res_sn = res_sn;
	}
	public String getRes_depth() {
		return res_depth;
	}
	public void setRes_depth(String res_depth) {
		this.res_depth = res_depth;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public List<Resboard_FileVO> getItems() {
		return items;
	}
	public void setItems(List<Resboard_FileVO> items) {
		this.items = items;
	}
	
}
