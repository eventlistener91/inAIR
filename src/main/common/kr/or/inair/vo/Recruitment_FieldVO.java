package kr.or.inair.vo;

public class Recruitment_FieldVO {
	private String recruitment_field_num;		//모집분야 번호
	private String recruitment_field_career;    //모집분야 경력
	private String recruitment_field_job;       //모집분야 담당업무
	private String recruitment_field_name;      //모집분야 명
	private String recruitment_field_personnel; //모집분야 인원수
	private String recruitment_field_department;//모집분야 근무부서
	private String clsf_num;					//직급 번호
	private String jo_num;						//구인게시판 번호
	private String careerhistory_num;			//경력 번호
	
	private String clsfString;					//직급명
	
	
	public String getClsfString() {
		return clsfString;
	}
	public void setClsfString(String clsfString) {
		this.clsfString = clsfString;
	}
	public String getCareerhistory_num() {
		return careerhistory_num;
	}
	public void setCareerhistory_num(String careerhistory_num) {
		this.careerhistory_num = careerhistory_num;
	}
	public String getRecruitment_field_num() {
		return recruitment_field_num;
	}
	public void setRecruitment_field_num(String recruitment_field_num) {
		this.recruitment_field_num = recruitment_field_num;
	}
	public String getRecruitment_field_department() {
		return recruitment_field_department;
	}
	public void setRecruitment_field_department(String recruitment_field_department) {
		this.recruitment_field_department = recruitment_field_department;
	}
	public String getClsf_num() {
		return clsf_num;
	}
	public void setClsf_num(String clsf_num) {
		this.clsf_num = clsf_num;
	}
	public String getRecruitment_field_personnel() {
		return recruitment_field_personnel;
	}
	public void setRecruitment_field_personnel(String recruitment_field_personnel) {
		this.recruitment_field_personnel = recruitment_field_personnel;
	}
	public String getRecruitment_field_career() {
		return recruitment_field_career;
	}
	public void setRecruitment_field_career(String recruitment_field_career) {
		this.recruitment_field_career = recruitment_field_career;
	}
	public String getRecruitment_field_job() {
		return recruitment_field_job;
	}
	public void setRecruitment_field_job(String recruitment_field_job) {
		this.recruitment_field_job = recruitment_field_job;
	}
	public String getRecruitment_field_name() {
		return recruitment_field_name;
	}
	public void setRecruitment_field_name(String recruitment_field_name) {
		this.recruitment_field_name = recruitment_field_name;
	}
	public String getJo_num() {
		return jo_num;
	}
	public void setJo_num(String jo_num) {
		this.jo_num = jo_num;
	}
}
