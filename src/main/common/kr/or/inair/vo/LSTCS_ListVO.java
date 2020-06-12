package kr.or.inair.vo;

public class LSTCS_ListVO {
	private String lstcs_dtls_num;		//어학내역 번호 
	private String lang_num;            //언어 번호 	1
	private String score;               //점수		3
	private String grad;                //급수		4
	private String acqdt;               //취득일		5
	private String lang_test_name;      //언어 시험명	2
	private String resume_num;
	
	public String getLstcs_dtls_num() {
		return lstcs_dtls_num;
	}
	public void setLstcs_dtls_num(String lstcs_dtls_num) {
		this.lstcs_dtls_num = lstcs_dtls_num;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getGrad() {
		return grad;
	}
	public void setGrad(String grad) {
		this.grad = grad;
	}
	public String getAcqdt() {
		return acqdt;
	}
	public void setAcqdt(String acqdt) {
		this.acqdt = acqdt;
	}
	public String getLang_num() {
		return lang_num;
	}
	public void setLang_num(String lang_num) {
		this.lang_num = lang_num;
	}
	public String getLang_test_name() {
		return lang_test_name;
	}
	public void setLang_test_name(String lang_test_name) {
		this.lang_test_name = lang_test_name;
	}
	public String getResume_num() {
		return resume_num;
	}
	public void setResume_num(String resume_num) {
		this.resume_num = resume_num;
	}
}
