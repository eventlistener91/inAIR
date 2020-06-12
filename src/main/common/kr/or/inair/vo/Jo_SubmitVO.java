package kr.or.inair.vo;

import java.util.List;

public class Jo_SubmitVO {
	private String submit_num;
	private String jo_num;
	private String resume_num;
	private String pass_at;
	private String pass_date;
	private String ai_posbl;
	private String ai_execut;
	
	private ResumeVO resumeInfo;
	private List<ResumeVO> resumeList;
	private Job_OfferVO jobOfferInfo;
	
	public ResumeVO getResumeInfo() {
		return resumeInfo;
	}
	public void setResumeInfo(ResumeVO resumeInfo) {
		this.resumeInfo = resumeInfo;
	}
	public String getSubmit_num() {
		return submit_num;
	}
	public void setSubmit_num(String submit_num) {
		this.submit_num = submit_num;
	}
	public String getJo_num() {
		return jo_num;
	}
	public void setJo_num(String jo_num) {
		this.jo_num = jo_num;
	}
	public String getResume_num() {
		return resume_num;
	}
	public void setResume_num(String resume_num) {
		this.resume_num = resume_num;
	}
	public String getPass_at() {
		return pass_at;
	}
	public void setPass_at(String pass_at) {
		this.pass_at = pass_at;
	}
	public String getPass_date() {
		return pass_date;
	}
	public void setPass_date(String pass_date) {
		this.pass_date = pass_date;
	}
	public String getAi_posbl() {
		return ai_posbl;
	}
	public void setAi_posbl(String ai_posbl) {
		this.ai_posbl = ai_posbl;
	}
	public String getAi_execut() {
		return ai_execut;
	}
	public void setAi_execut(String ai_execut) {
		this.ai_execut = ai_execut;
	}
	public List<ResumeVO> getResumeList() {
		return resumeList;
	}
	public void setResumeList(List<ResumeVO> resumeList) {
		this.resumeList = resumeList;
	}
	public Job_OfferVO getJobOfferInfo() {
		return jobOfferInfo;
	}
	public void setJobOfferInfo(Job_OfferVO jobOfferInfo) {
		this.jobOfferInfo = jobOfferInfo;
	}
}
