package kr.or.inair.vo;

public class JoSubmitChartsVO {
	//성별 차트 변수
	private int fcount;					//지원자 여성 수 
    private int mcount;                 //지원자 남성 수 
    
    //연봉 현황 차트 변수 
    private int salaryscope1;           //2,200미만
    private int salaryscope2;           //2,200 ~ 2,600
    private int salaryscope3;           //2,600 ~ 3,000
    private int salaryscope4;           //3,000 ~ 4,000
    private int salaryscope5;			//4,000이상
    
    //최종 학력 현황 차트 변수 
    private int fin_acdmcr1;            //고등학교 졸업
    private int fin_acdmcr2;            //대학 2~3년제 졸업
    private int fin_acdmcr3;            //대학교 4년제 졸업
    private int fin_acdmcr4;            //박사 이상
    private int fin_acdmcr5;			//기타 

    //연령 현황 차트 변수 
    private String agescope1;           //20대
    private String agescope2;           //30대
    private String agescope3;           //40대
    private String agescope4;           //50대
    private String agescope5;			//60대
    
    
    public String getAgescope1() {
		return agescope1;
	}
	public void setAgescope1(String agescope1) {
		this.agescope1 = agescope1;
	}
	public String getAgescope2() {
		return agescope2;
	}
	public void setAgescope2(String agescope2) {
		this.agescope2 = agescope2;
	}
	public String getAgescope3() {
		return agescope3;
	}
	public void setAgescope3(String agescope3) {
		this.agescope3 = agescope3;
	}
	public String getAgescope4() {
		return agescope4;
	}
	public void setAgescope4(String agescope4) {
		this.agescope4 = agescope4;
	}
	public String getAgescope5() {
		return agescope5;
	}
	public void setAgescope5(String agescope5) {
		this.agescope5 = agescope5;
	}
	public int getFin_acdmcr1() {
		return fin_acdmcr1;
	}
	public void setFin_acdmcr1(int fin_acdmcr1) {
		this.fin_acdmcr1 = fin_acdmcr1;
	}
	public int getFin_acdmcr2() {
		return fin_acdmcr2;
	}
	public void setFin_acdmcr2(int fin_acdmcr2) {
		this.fin_acdmcr2 = fin_acdmcr2;
	}
	public int getFin_acdmcr3() {
		return fin_acdmcr3;
	}
	public void setFin_acdmcr3(int fin_acdmcr3) {
		this.fin_acdmcr3 = fin_acdmcr3;
	}
	public int getFin_acdmcr4() {
		return fin_acdmcr4;
	}
	public void setFin_acdmcr4(int fin_acdmcr4) {
		this.fin_acdmcr4 = fin_acdmcr4;
	}
	public int getFin_acdmcr5() {
		return fin_acdmcr5;
	}
	public void setFin_acdmcr5(int fin_acdmcr5) {
		this.fin_acdmcr5 = fin_acdmcr5;
	}
	public int getFcount() {
		return fcount;
	}
	public void setFcount(int fcount) {
		this.fcount = fcount;
	}
	public int getMcount() {
		return mcount;
	}
	public void setMcount(int mcount) {
		this.mcount = mcount;
	}
	public int getSalaryscope1() {
		return salaryscope1;
	}
	public void setSalaryscope1(int salaryscope1) {
		this.salaryscope1 = salaryscope1;
	}
	public int getSalaryscope2() {
		return salaryscope2;
	}
	public void setSalaryscope2(int salaryscope2) {
		this.salaryscope2 = salaryscope2;
	}
	public int getSalaryscope3() {
		return salaryscope3;
	}
	public void setSalaryscope3(int salaryscope3) {
		this.salaryscope3 = salaryscope3;
	}
	public int getSalaryscope4() {
		return salaryscope4;
	}
	public void setSalaryscope4(int salaryscope4) {
		this.salaryscope4 = salaryscope4;
	}
	public int getSalaryscope5() {
		return salaryscope5;
	}
	public void setSalaryscope5(int salaryscope5) {
		this.salaryscope5 = salaryscope5;
	}
	
}
