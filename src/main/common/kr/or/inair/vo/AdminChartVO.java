package kr.or.inair.vo;

import java.util.List;

public class AdminChartVO {
	private String indvdl_id;
	private String indvdl_pass;
	private String indvdl_name;
	private String indvdl_bir;
	private String indvdl_tel;
	private String indvdl_mail;
	private String indvdl_gend;
	private String indvdl_adres1;
	private String indvdl_adres2;
	private String indvdl_delete;
	private String mentoranswer_regist;
	private String enterreview_possible_date;
	private String fin_acdmcr_num;
	private String fin_acdmcr_string;
	private String hopepro_string;
	private String hopepro_num;
	private String indvdl_secsn;
	private String indvdl_social;
	private List<IDPictureVO> pictures;
	
	//관리자 성별 차트 변수 
	private int fcount;					//지원자 여성 수 
	private int mcount;					//지원자 
	
	//연령 현황 차트 변수
	private String agescope1;           //20대
	private String agescope2;           //30대
	private String agescope3;           //40대
	private String agescope4;           //50대
	private String agescope5;			//60대
	
	//탈퇴 차트 변수
	private int indvdldrop1;        //구직완료
	private int indvdldrop2;		//한시 사용 목적 아이디
	private int indvdldrop3;        //서비스 기능 불만
	private int indvdldrop4;        //개인정보 및 보안 우려
	private int indvdldrop5;        //더이상 이용 안함
	private int indvdldrop6;        //아이디 변경/재가입을 위해
	private int indvdldrop7;        //타 사이트의 유사서비스 이용
	private int indvdldrop8;        //찾고자 하는 정보가 없음
	private int indvdldrop9;        //이용 불편
	private int indvdldrop10;       //기타
	
	//최종 학력 차트 변수
	private int finacdmcr1;			// 초등학교 졸업
	private int finacdmcr2;         // 중학교 졸업 
	private int finacdmcr3;         // 학력무관
	private int finacdmcr4;         // 고등학교 졸업
	private int finacdmcr5;         // 대학졸업(2,3년)
	private int finacdmcr6;         // 대학교졸업(4년)
	private int finacdmcr7;         // 박사졸업
	private int finacdmcr8;         // 대학졸업
	
	//게시판 관리 변수
	private int adminboard1;        //공지사항 갯수
	private int adminboard2;		//자유게시판 갯수
	private int adminboard3;		//멘토게시판 갯수
	private int adminboard4;		//자료실 게시판 갯수
	
	public int getAdminboard1() {
		return adminboard1;
	}
	public void setAdminboard1(int adminboard1) {
		this.adminboard1 = adminboard1;
	}
	public int getAdminboard2() {
		return adminboard2;
	}
	public void setAdminboard2(int adminboard2) {
		this.adminboard2 = adminboard2;
	}
	public int getAdminboard3() {
		return adminboard3;
	}
	public void setAdminboard3(int adminboard3) {
		this.adminboard3 = adminboard3;
	}
	public int getAdminboard4() {
		return adminboard4;
	}
	public void setAdminboard4(int adminboard4) {
		this.adminboard4 = adminboard4;
	}
	public int getFinacdmcr1() {
		return finacdmcr1;
	}
	public void setFinacdmcr1(int finacdmcr1) {
		this.finacdmcr1 = finacdmcr1;
	}
	public int getFinacdmcr2() {
		return finacdmcr2;
	}
	public void setFinacdmcr2(int finacdmcr2) {
		this.finacdmcr2 = finacdmcr2;
	}
	public int getFinacdmcr3() {
		return finacdmcr3;
	}
	public void setFinacdmcr3(int finacdmcr3) {
		this.finacdmcr3 = finacdmcr3;
	}
	public int getFinacdmcr4() {
		return finacdmcr4;
	}
	public void setFinacdmcr4(int finacdmcr4) {
		this.finacdmcr4 = finacdmcr4;
	}
	public int getFinacdmcr5() {
		return finacdmcr5;
	}
	public void setFinacdmcr5(int finacdmcr5) {
		this.finacdmcr5 = finacdmcr5;
	}
	public int getFinacdmcr6() {
		return finacdmcr6;
	}
	public void setFinacdmcr6(int finacdmcr6) {
		this.finacdmcr6 = finacdmcr6;
	}
	public int getFinacdmcr7() {
		return finacdmcr7;
	}
	public void setFinacdmcr7(int finacdmcr7) {
		this.finacdmcr7 = finacdmcr7;
	}
	public int getFinacdmcr8() {
		return finacdmcr8;
	}
	public void setFinacdmcr8(int finacdmcr8) {
		this.finacdmcr8 = finacdmcr8;
	}
	public int getIndvdldrop1() {
		return indvdldrop1;
	}
	public void setIndvdldrop1(int indvdldrop1) {
		this.indvdldrop1 = indvdldrop1;
	}
	public int getIndvdldrop2() {
		return indvdldrop2;
	}
	public void setIndvdldrop2(int indvdldrop2) {
		this.indvdldrop2 = indvdldrop2;
	}
	public int getIndvdldrop3() {
		return indvdldrop3;
	}
	public void setIndvdldrop3(int indvdldrop3) {
		this.indvdldrop3 = indvdldrop3;
	}
	public int getIndvdldrop4() {
		return indvdldrop4;
	}
	public void setIndvdldrop4(int indvdldrop4) {
		this.indvdldrop4 = indvdldrop4;
	}
	public int getIndvdldrop5() {
		return indvdldrop5;
	}
	public void setIndvdldrop5(int indvdldrop5) {
		this.indvdldrop5 = indvdldrop5;
	}
	public int getIndvdldrop6() {
		return indvdldrop6;
	}
	public void setIndvdldrop6(int indvdldrop6) {
		this.indvdldrop6 = indvdldrop6;
	}
	public int getIndvdldrop7() {
		return indvdldrop7;
	}
	public void setIndvdldrop7(int indvdldrop7) {
		this.indvdldrop7 = indvdldrop7;
	}
	public int getIndvdldrop8() {
		return indvdldrop8;
	}
	public void setIndvdldrop8(int indvdldrop8) {
		this.indvdldrop8 = indvdldrop8;
	}
	public int getIndvdldrop9() {
		return indvdldrop9;
	}
	public void setIndvdldrop9(int indvdldrop9) {
		this.indvdldrop9 = indvdldrop9;
	}
	public int getIndvdldrop10() {
		return indvdldrop10;
	}
	public void setIndvdldrop10(int indvdldrop10) {
		this.indvdldrop10 = indvdldrop10;
	}
	public String getIndvdl_social() {
		return indvdl_social;
	}
	public void setIndvdl_social(String indvdl_social) {
		this.indvdl_social = indvdl_social;
	}
	public String getIndvdl_id() {
		return indvdl_id;
	}
	public void setIndvdl_id(String indvdl_id) {
		this.indvdl_id = indvdl_id;
	}
	public String getIndvdl_pass() {
		return indvdl_pass;
	}
	public void setIndvdl_pass(String indvdl_pass) {
		this.indvdl_pass = indvdl_pass;
	}
	public String getIndvdl_name() {
		return indvdl_name;
	}
	public void setIndvdl_name(String indvdl_name) {
		this.indvdl_name = indvdl_name;
	}
	public String getIndvdl_bir() {
		return indvdl_bir;
	}
	public void setIndvdl_bir(String indvdl_bir) {
		this.indvdl_bir = indvdl_bir;
	}
	public String getIndvdl_tel() {
		return indvdl_tel;
	}
	public void setIndvdl_tel(String indvdl_tel) {
		this.indvdl_tel = indvdl_tel;
	}
	public String getIndvdl_mail() {
		return indvdl_mail;
	}
	public void setIndvdl_mail(String indvdl_mail) {
		this.indvdl_mail = indvdl_mail;
	}
	public String getIndvdl_gend() {
		return indvdl_gend;
	}
	public void setIndvdl_gend(String indvdl_gend) {
		this.indvdl_gend = indvdl_gend;
	}
	public String getIndvdl_adres1() {
		return indvdl_adres1;
	}
	public void setIndvdl_adres1(String indvdl_adres1) {
		this.indvdl_adres1 = indvdl_adres1;
	}
	public String getIndvdl_adres2() {
		return indvdl_adres2;
	}
	public void setIndvdl_adres2(String indvdl_adres2) {
		this.indvdl_adres2 = indvdl_adres2;
	}
	public String getIndvdl_delete() {
		return indvdl_delete;
	}
	public void setIndvdl_delete(String indvdl_delete) {
		this.indvdl_delete = indvdl_delete;
	}
	public String getMentoranswer_regist() {
		return mentoranswer_regist;
	}
	public void setMentoranswer_regist(String mentoranswer_regist) {
		this.mentoranswer_regist = mentoranswer_regist;
	}
	public String getEnterreview_possible_date() {
		return enterreview_possible_date;
	}
	public void setEnterreview_possible_date(String enterreview_possible_date) {
		this.enterreview_possible_date = enterreview_possible_date;
	}
	public String getFin_acdmcr_num() {
		return fin_acdmcr_num;
	}
	public void setFin_acdmcr_num(String fin_acdmcr_num) {
		this.fin_acdmcr_num = fin_acdmcr_num;
	}
	public String getHopepro_num() {
		return hopepro_num;
	}
	public void setHopepro_num(String hopepro_num) {
		this.hopepro_num = hopepro_num;
	}
	public String getIndvdl_secsn() {
		return indvdl_secsn;
	}
	public void setIndvdl_secsn(String indvdl_secsn) {
		this.indvdl_secsn = indvdl_secsn;
	}
	public List<IDPictureVO> getPictures() {
		return pictures;
	}
	public void setPictures(List<IDPictureVO> pictures) {
		this.pictures = pictures;
	}
	public String getFin_acdmcr_string() {
		return fin_acdmcr_string;
	}
	public void setFin_acdmcr_string(String fin_acdmcr_string) {
		this.fin_acdmcr_string = fin_acdmcr_string;
	}
	public String getHopepro_string() {
		return hopepro_string;
	}
	public void setHopepro_string(String hopepro_string) {
		this.hopepro_string = hopepro_string;
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

}
