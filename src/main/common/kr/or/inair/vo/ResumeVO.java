package kr.or.inair.vo;

import java.util.List;

public class ResumeVO {
	private String resume_num;			//이력서 번호
	private String indvdl_id;           //개인회원 아이디
	private String resume_sj;           //이력서 제목
	private String resume_adres1;       //이력서주소 
	private String resume_adres2;       //이력서주소 
	private String resume_delete;       //이력서 삭제여부
	private String salary_num;          //급여 번호
	private String salaryString;        //급여 내용
	private String emplym_num;          //고용 번호
	private String emplymString;        //고용 내용
	private String work_num;            //근무형태 번호
	private String workString;          //근무형태 내용 
	private String fin_acdmcr_num;      //최종학력 번호
	private String fin_acdmcrString;    //최종학력 내용 
	private String resume_rgsde;        //이력서 수정일
	private String resume_hope_area;    //희망근무지역 
	private String lowpro_num;			//하위 직종 번호(희망직종)
	private List<LowProVO> lowproList; 
	
	private List<Academic_DetaVO> academicDetaList;         //학력
	private List<CareerVO> careerInfoList;                  //경력
	private List<CerificatieVO> cerificatieList;            //자격증
	private List<WinningPrizeVO> winningPrizeList;			//수상
	private List<LSTCS_ListVO> lstcsListList;               //어학
	private List<SelfIntroductionVO> selfIntroductionList;  //자기소개서
	private List<PortfolioVO> portfolioList;                //포트폴리오
	
	private INDVDLMEMVO indvdlMemInfo;						//개인회원
	
	private int ingcount;									//취업준비중
	private int endcount;									//퇴사
	private int workcount;									//재직중
	
	
	
	
	
	public List<LowProVO> getLowproList() {
		return lowproList;
	}
	public void setLowproList(List<LowProVO> lowproList) {
		this.lowproList = lowproList;
	}
	public String getResume_num() {
		return resume_num;
	}
	public void setResume_num(String resume_num) {
		this.resume_num = resume_num;
	}
	public String getIndvdl_id() {
		return indvdl_id;
	}
	public void setIndvdl_id(String indvdl_id) {
		this.indvdl_id = indvdl_id;
	}
	public String getResume_sj() {
		return resume_sj;
	}
	public void setResume_sj(String resume_sj) {
		this.resume_sj = resume_sj;
	}
	public String getResume_adres1() {
		return resume_adres1;
	}
	public void setResume_adres1(String resume_adres1) {
		this.resume_adres1 = resume_adres1;
	}
	public String getResume_adres2() {
		return resume_adres2;
	}
	public void setResume_adres2(String resume_adres2) {
		this.resume_adres2 = resume_adres2;
	}
	public String getResume_delete() {
		return resume_delete;
	}
	public void setResume_delete(String resume_delete) {
		this.resume_delete = resume_delete;
	}
	public String getSalary_num() {
		return salary_num;
	}
	public void setSalary_num(String salary_num) {
		this.salary_num = salary_num;
	}
	public String getEmplym_num() {
		return emplym_num;
	}
	public void setEmplym_num(String emplym_num) {
		this.emplym_num = emplym_num;
	}
	public String getWork_num() {
		return work_num;
	}
	public void setWork_num(String work_num) {
		this.work_num = work_num;
	}
	public String getFin_acdmcr_num() {
		return fin_acdmcr_num;
	}
	public void setFin_acdmcr_num(String fin_acdmcr_num) {
		this.fin_acdmcr_num = fin_acdmcr_num;
	}
	public String getResume_rgsde() {
		return resume_rgsde;
	}
	public void setResume_rgsde(String resume_rgsde) {
		this.resume_rgsde = resume_rgsde;
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
	public String getWorkString() {
		return workString;
	}
	public void setWorkString(String workString) {
		this.workString = workString;
	}
	public String getFin_acdmcrString() {
		return fin_acdmcrString;
	}
	public void setFin_acdmcrString(String fin_acdmcrString) {
		this.fin_acdmcrString = fin_acdmcrString;
	}
	public String getResume_hope_area() {
		return resume_hope_area;
	}
	public void setResume_hope_area(String resume_hope_area) {
		this.resume_hope_area = resume_hope_area;
	
	}
	public List<Academic_DetaVO> getAcademicDetaList() {
		return academicDetaList;
	}
	public void setAcademicDetaList(List<Academic_DetaVO> academicDetaList) {
		this.academicDetaList = academicDetaList;
	}
	public List<CareerVO> getCareerInfoList() {
		return careerInfoList;
	}
	public void setCareerInfoList(List<CareerVO> careerInfoList) {
		this.careerInfoList = careerInfoList;
	}
	public List<CerificatieVO> getCerificatieList() {
		return cerificatieList;
	}
	public void setCerificatieList(List<CerificatieVO> cerificatieList) {
		this.cerificatieList = cerificatieList;
	}
	public List<WinningPrizeVO> getWinningPrizeList() {
		return winningPrizeList;
	}
	public void setWinningPrizeList(List<WinningPrizeVO> winningPrizeList) {
		this.winningPrizeList = winningPrizeList;
	}
	public List<LSTCS_ListVO> getLstcsListList() {
		return lstcsListList;
	}
	public void setLstcsListList(List<LSTCS_ListVO> lstcsListList) {
		this.lstcsListList = lstcsListList;
	}
	public List<SelfIntroductionVO> getSelfIntroductionList() {
		return selfIntroductionList;
	}
	public void setSelfIntroductionList(
			List<SelfIntroductionVO> selfIntroductionList) {
		this.selfIntroductionList = selfIntroductionList;
	}
	public List<PortfolioVO> getPortfolioList() {
		return portfolioList;
	}
	public void setPortfolioList(List<PortfolioVO> portfolioList) {
		this.portfolioList = portfolioList;
	}
	public String getLowpro_num() {
		return lowpro_num;
	}
	public void setLowpro_num(String lowpro_num) {
		this.lowpro_num = lowpro_num;
	}
	public INDVDLMEMVO getIndvdlMemInfo() {
		return indvdlMemInfo;
	}
	public void setIndvdlMemInfo(INDVDLMEMVO indvdlMemInfo) {
		this.indvdlMemInfo = indvdlMemInfo;
	}
	public int getIngcount() {
		return ingcount;
	}
	public void setIngcount(int ingcount) {
		this.ingcount = ingcount;
	}
	public int getEndcount() {
		return endcount;
	}
	public void setEndcount(int endcount) {
		this.endcount = endcount;
	}
	public int getWorkcount() {
		return workcount;
	}
	public void setWorkcount(int workcount) {
		this.workcount = workcount;
	}
}
