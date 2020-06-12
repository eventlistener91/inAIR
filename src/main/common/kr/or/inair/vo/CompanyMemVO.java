package kr.or.inair.vo;

import java.util.List;

public class CompanyMemVO {
    private String com_id;				// 기업회원 아이디
    private String com_pass;            // 기업회원 비밀번호
    private String com_mail;            // 기업회원 이메일
    private String com_tel;             // 기업회원 연락처
    private String com_profit;          // 기업회원 순이익
    private String com_selng;           // 기업회원 연매출
    private String com_delete;          // 기업회원 삭제여부
    private String upinduty_num;        // 
    private String upinduty_name;       // 
    private String lwinduty_num;        // 하위업종 번호
    private String lwinduty_name;       // 
    private String corp_code;           // 고유번호
    private String com_secsn;			// 기업회원 탈퇴사유
    
    private List<LowIndustryVO> lwindutyNumList;
    private List<CompanyInfoVO> companyInfoList;
    
    private CompanyVO companyVo;
    private CompanyInfoVO companyInfoVo;
   
	private String corp_name;			// 정식명칭
	private String corp_name_eng;       // 영문명칭
	private String stock_name;          // 종목명
	private String stock_code;          // 종목코드
	private String ceo_nm;              // 대표자명
	private String corp_cls;            // 법인구분
	private String jurir_no;            // 법인등록번호
	private String bizr_no;             // 사업자등록번호
	private String adres;               // 주소
	private String hm_url;              // 홈페이지주소
	private String ir_url;              // IR홈페이지주소
	private String phn_no;              // 전화번호
	private String fax_no;              // 팩스번호
	private String induty_code;         // 업종코드
	private String est_dt;              // 설립일
	private String acc_mt;              // 결산월
   
	
	public String getUpinduty_name() {
		return upinduty_name;
	}
	public void setUpinduty_name(String upinduty_name) {
		this.upinduty_name = upinduty_name;
	}
	public List<CompanyInfoVO> getCompanyInfoList() {
		return companyInfoList;
	}
	public void setCompanyInfoList(List<CompanyInfoVO> companyInfoList) {
		this.companyInfoList = companyInfoList;
	}
	public String getLwinduty_name() {
		return lwinduty_name;
	}
	public void setLwinduty_name(String lwinduty_name) {
		this.lwinduty_name = lwinduty_name;
	}
	public CompanyVO getCompanyVo() {
		return companyVo;
	}
	public void setCompanyVo(CompanyVO companyVo) {
		this.companyVo = companyVo;
	}
	public CompanyInfoVO getCompanyInfoVo() {
		return companyInfoVo;
	}
	public void setCompanyInfoVo(CompanyInfoVO companyInfoVo) {
		this.companyInfoVo = companyInfoVo;
	}
	public List<LowIndustryVO> getLwindutyNumList() {
		return lwindutyNumList;
	}
	public void setLwindutyNumList(List<LowIndustryVO> lwindutyNumList) {
		this.lwindutyNumList = lwindutyNumList;
	}
	public String getUpinduty_num() {
		return upinduty_num;
	}
	public void setUpinduty_num(String upinduty_num) {
		this.upinduty_num = upinduty_num;
	}
	public String getCom_id() {
		return com_id;
	}
	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}
	public String getCom_pass() {
		return com_pass;
	}
	public void setCom_pass(String com_pass) {
		this.com_pass = com_pass;
	}
	public String getCom_tel() {
		return com_tel;
	}
	public void setCom_tel(String com_tel) {
		this.com_tel = com_tel;
	}
	public String getCom_selng() {
		return com_selng;
	}
	public void setCom_selng(String com_selng) {
		this.com_selng = com_selng;
	}
	public String getCom_profit() {
		return com_profit;
	}
	public void setCom_profit(String com_profit) {
		this.com_profit = com_profit;
	}
	public String getCom_mail() {
		return com_mail;
	}
	public void setCom_mail(String com_mail) {
		this.com_mail = com_mail;
	}
	public String getCom_delete() {
		return com_delete;
	}
	public void setCom_delete(String com_delete) {
		this.com_delete = com_delete;
	}
	public String getLwinduty_num() {
		return lwinduty_num;
	}
	public void setLwinduty_num(String lwinduty_num) {
		this.lwinduty_num = lwinduty_num;
	}
	public String getCorp_code() {
		return corp_code;
	}
	public void setCorp_code(String corp_code) {
		this.corp_code = corp_code;
	}
	public String getCorp_name() {
		return corp_name;
	}
	public void setCorp_name(String corp_name) {
		this.corp_name = corp_name;
	}
	public String getCorp_name_eng() {
		return corp_name_eng;
	}
	public void setCorp_name_eng(String corp_name_eng) {
		this.corp_name_eng = corp_name_eng;
	}
	public String getStock_name() {
		return stock_name;
	}
	public void setStock_name(String stock_name) {
		this.stock_name = stock_name;
	}
	public String getStock_code() {
		return stock_code;
	}
	public void setStock_code(String stock_code) {
		this.stock_code = stock_code;
	}
	public String getCeo_nm() {
		return ceo_nm;
	}
	public void setCeo_nm(String ceo_nm) {
		this.ceo_nm = ceo_nm;
	}
	public String getCorp_cls() {
		return corp_cls;
	}
	public void setCorp_cls(String corp_cls) {
		this.corp_cls = corp_cls;
	}
	public String getJurir_no() {
		return jurir_no;
	}
	public void setJurir_no(String jurir_no) {
		this.jurir_no = jurir_no;
	}
	public String getBizr_no() {
		return bizr_no;
	}
	public void setBizr_no(String bizr_no) {
		this.bizr_no = bizr_no;
	}
	public String getAdres() {
		return adres;
	}
	public void setAdres(String adres) {
		this.adres = adres;
	}
	public String getHm_url() {
		return hm_url;
	}
	public void setHm_url(String hm_url) {
		this.hm_url = hm_url;
	}
	public String getIr_url() {
		return ir_url;
	}
	public void setIr_url(String ir_url) {
		this.ir_url = ir_url;
	}
	public String getPhn_no() {
		return phn_no;
	}
	public void setPhn_no(String phn_no) {
		this.phn_no = phn_no;
	}
	public String getFax_no() {
		return fax_no;
	}
	public void setFax_no(String fax_no) {
		this.fax_no = fax_no;
	}
	public String getInduty_code() {
		return induty_code;
	}
	public void setInduty_code(String induty_code) {
		this.induty_code = induty_code;
	}
	public String getEst_dt() {
		return est_dt;
	}
	public void setEst_dt(String est_dt) {
		this.est_dt = est_dt;
	}
	public String getAcc_mt() {
		return acc_mt;
	}
	public void setAcc_mt(String acc_mt) {
		this.acc_mt = acc_mt;
	}
	public String getCom_secsn() {
		return com_secsn;
	}
	public void setCom_secsn(String com_secsn) {
		this.com_secsn = com_secsn;
	}
	
}
