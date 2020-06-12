package kr.or.inair.vo;

import java.util.List;

public class CareerVO {
	private String career_num;			//경력번호
	private String com_name;            //회사명
	private String com_adres1;          //회사 주소1
	private String com_adres2;          //회사 주소2
	private String salary;              //급여
	private String job;                 //담당업무
	private String tchnlgy;             //보유기술
	private String com_encpn;           //회사입사일
	private String com_retire;          //회사퇴사일
	private String clsf_num;            //직급번호
	private String uppro_num;
	private String lowpro_num;          //하위직종 번호
	private String upinduty_num;
	private String lwinduty_num;        //하위업종 번호
	private String resume_num;			//이력서 번호 
	
	private List<LowProVO> lowproList;
	private List<LowIndustryVO> lwindutyList;
	
	public List<LowProVO> getLowproList() {
		return lowproList;
	}
	public void setLowproList(List<LowProVO> lowproList) {
		this.lowproList = lowproList;
	}
	public List<LowIndustryVO> getLwindutyList() {
		return lwindutyList;
	}
	public void setLwindutyList(List<LowIndustryVO> lwindutyList) {
		this.lwindutyList = lwindutyList;
	}
	public String getCareer_num() {
		return career_num;
	}
	public void setCareer_num(String career_num) {
		this.career_num = career_num;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getCom_adres1() {
		return com_adres1;
	}
	public void setCom_adres1(String com_adres1) {
		this.com_adres1 = com_adres1;
	}
	public String getCom_adres2() {
		return com_adres2;
	}
	public void setCom_adres2(String com_adres2) {
		this.com_adres2 = com_adres2;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getTchnlgy() {
		return tchnlgy;
	}
	public void setTchnlgy(String tchnlgy) {
		this.tchnlgy = tchnlgy;
	}
	public String getCom_encpn() {
		return com_encpn;
	}
	public void setCom_encpn(String com_encpn) {
		this.com_encpn = com_encpn;
	}
	public String getCom_retire() {
		return com_retire;
	}
	public void setCom_retire(String com_retire) {
		this.com_retire = com_retire;
	}
	public String getClsf_num() {
		return clsf_num;
	}
	public void setClsf_num(String clsf_num) {
		this.clsf_num = clsf_num;
	}
	public String getLowpro_num() {
		return lowpro_num;
	}
	public void setLowpro_num(String lowpro_num) {
		this.lowpro_num = lowpro_num;
	}
	public String getLwinduty_num() {
		return lwinduty_num;
	}
	public void setLwinduty_num(String lwinduty_num) {
		this.lwinduty_num = lwinduty_num;
	}
	public String getResume_num() {
		return resume_num;
	}
	public void setResume_num(String resume_num) {
		this.resume_num = resume_num;
	}
	public String getUppro_num() {
		return uppro_num;
	}
	public void setUppro_num(String uppro_num) {
		this.uppro_num = uppro_num;
	}
	public String getUpinduty_num() {
		return upinduty_num;
	}
	public void setUpinduty_num(String upinduty_num) {
		this.upinduty_num = upinduty_num;
	}
}
