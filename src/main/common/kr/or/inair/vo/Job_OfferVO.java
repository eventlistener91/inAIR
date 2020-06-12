package kr.or.inair.vo;

import java.util.List;

public class Job_OfferVO {
	private String jo_num;				//구인게시판 번호
	private String com_id;              //기업회원 아이디
	private String jo_sj;               //구인게시판 제목
	private String jo_cn;               //구인게시판 내용
	private String jo_hit;              //구인게시판 조회수
	private String jo_rgsde;            //구인게시판 등록일
	private String jo_clos;             //구인게시판 마감일
	private String jo_adres1;           //구인게시판 주소1
	private String jo_adres2;           //구인게시판 주소2
	private String jo_wlfare;           //구인게시판 복리후생
	private String jo_delete;           //구인게시판 삭제여부
	private String jo_aireqst;          //구인게시판 AI신청여부
	private String jo_aistart;          //구인게시판 AI면접시작일
	private String jo_aiend;            //구인게시판 AI면접마감일
	private String lowpro_num;          //하위직종 번호
	private String fin_acdmcr_num;      //최종학력 번호
	private String salary_num;          //급여 번호
	private String emplym_num;			//고용형태 번호
	private String jo_work_day;			//구인게시판 근무요일
	private String jo_work_time;        //구인게시판 근무시간
	private String jo_manager_name;     //구인게시판 담당자이름
	private String jo_manager_tel;      //구인게시판 담당자연락처
	private String jo_manager_mail;     //구인게시판 담당자메일
	private String jo_finish;			//구인게시판 구인완료여부
	
	private String finAcdmcrString;     //최종학력 명
	private String salaryString;        //급여 명
	private String emplymString;		//고용형태 명
	
	private List<Recruitment_FieldVO> recruitmentFieldList;	//모집분야
	private List<Job_Offer_FileVO> jobOfferFileList;		//구인게시판 첨부파일 
	
	public List<Job_Offer_FileVO> getJobOfferFileList() {
		return jobOfferFileList;
	}
	public void setJobOfferFileList(List<Job_Offer_FileVO> jobOfferFileList) {
		this.jobOfferFileList = jobOfferFileList;
	}
	public String getSalaryString() {
		return salaryString;
	}
	public void setSalaryString(String salaryString) {
		this.salaryString = salaryString;
	}
	public String getEmplymString() {
		return emplymString;
	}
	public void setEmplymString(String emplymString) {
		this.emplymString = emplymString;
	}
	public String getFinAcdmcrString() {
		return finAcdmcrString;
	}
	public void setFinAcdmcrString(String finAcdmcrString) {
		this.finAcdmcrString = finAcdmcrString;
	}
	public List<Recruitment_FieldVO> getRecruitmentFieldList() {
		return recruitmentFieldList;
	}
	public void setRecruitmentFieldList(
			List<Recruitment_FieldVO> recruitmentFieldList) {
		this.recruitmentFieldList = recruitmentFieldList;
	}
	public String getEmplym_num() {
		return emplym_num;
	}
	public void setEmplym_num(String emplym_num) {
		this.emplym_num = emplym_num;
	}
	public String getJo_num() {
		return jo_num;
	}
	public void setJo_num(String jo_num) {
		this.jo_num = jo_num;
	}
	public String getCom_id() {
		return com_id;
	}
	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}
	public String getJo_sj() {
		return jo_sj;
	}
	public void setJo_sj(String jo_sj) {
		this.jo_sj = jo_sj;
	}
	public String getJo_cn() {
		return jo_cn;
	}
	public void setJo_cn(String jo_cn) {
		this.jo_cn = jo_cn;
	}
	public String getJo_hit() {
		return jo_hit;
	}
	public void setJo_hit(String jo_hit) {
		this.jo_hit = jo_hit;
	}
	public String getJo_rgsde() {
		return jo_rgsde;
	}
	public void setJo_rgsde(String jo_rgsde) {
		this.jo_rgsde = jo_rgsde;
	}
	public String getJo_clos() {
		return jo_clos;
	}
	public void setJo_clos(String jo_clos) {
		this.jo_clos = jo_clos;
	}
	public String getJo_adres1() {
		return jo_adres1;
	}
	public void setJo_adres1(String jo_adres1) {
		this.jo_adres1 = jo_adres1;
	}
	public String getJo_adres2() {
		return jo_adres2;
	}
	public void setJo_adres2(String jo_adres2) {
		this.jo_adres2 = jo_adres2;
	}
	public String getJo_wlfare() {
		return jo_wlfare;
	}
	public void setJo_wlfare(String jo_wlfare) {
		this.jo_wlfare = jo_wlfare;
	}
	public String getJo_delete() {
		return jo_delete;
	}
	public void setJo_delete(String jo_delete) {
		this.jo_delete = jo_delete;
	}
	public String getJo_aireqst() {
		return jo_aireqst;
	}
	public void setJo_aireqst(String jo_aireqst) {
		this.jo_aireqst = jo_aireqst;
	}
	public String getJo_aistart() {
		return jo_aistart;
	}
	public void setJo_aistart(String jo_aistart) {
		this.jo_aistart = jo_aistart;
	}
	public String getJo_aiend() {
		return jo_aiend;
	}
	public void setJo_aiend(String jo_aiend) {
		this.jo_aiend = jo_aiend;
	}
	public String getLowpro_num() {
		return lowpro_num;
	}
	public void setLowpro_num(String lowpro_num) {
		this.lowpro_num = lowpro_num;
	}
	public String getFin_acdmcr_num() {
		return fin_acdmcr_num;
	}
	public void setFin_acdmcr_num(String fin_acdmcr_num) {
		this.fin_acdmcr_num = fin_acdmcr_num;
	}
	public String getSalary_num() {
		return salary_num;
	}
	public void setSalary_num(String salary_num) {
		this.salary_num = salary_num;
	}
	public String getJo_work_day() {
		return jo_work_day;
	}
	public void setJo_work_day(String jo_work_day) {
		this.jo_work_day = jo_work_day;
	}
	public String getJo_work_time() {
		return jo_work_time;
	}
	public void setJo_work_time(String jo_work_time) {
		this.jo_work_time = jo_work_time;
	}
	public String getJo_manager_name() {
		return jo_manager_name;
	}
	public void setJo_manager_name(String jo_manager_name) {
		this.jo_manager_name = jo_manager_name;
	}
	public String getJo_manager_tel() {
		return jo_manager_tel;
	}
	public void setJo_manager_tel(String jo_manager_tel) {
		this.jo_manager_tel = jo_manager_tel;
	}
	public String getJo_manager_mail() {
		return jo_manager_mail;
	}
	public void setJo_manager_mail(String jo_manager_mail) {
		this.jo_manager_mail = jo_manager_mail;
	}
	public String getJo_finish() {
		return jo_finish;
	}
	public void setJo_finish(String jo_finish) {
		this.jo_finish = jo_finish;
	}
}
