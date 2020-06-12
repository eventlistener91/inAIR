package kr.or.inair.admin.adminchart.dao;

import kr.or.inair.vo.AdminChartVO;
import kr.or.inair.vo.INDVDLMEMVO;
import kr.or.inair.vo.ResumeVO;

public interface IAdminChartDao {
	/**
	 * 여성과 남성회원의 수를 원그래프로 나타내주는 매서드 
	 * @date 2020-06-01
	 * @author 한유경
	 * @return
	 * @throws Exception
	 */
	public AdminChartVO genderChart() throws Exception;
	/**
	 * 연령별 비율을 막대차트로 나타내주는 매서드 
	 * @date 2020-06-01
	 * @author 한유경
	 * @return
	 * @throws Exception
	 */
    public AdminChartVO ageIndvdlChart() throws Exception;
    /**
     * 회원의 현재 근무형태를 원으로 나태내주는 매서드
     * @date 2020-06-01
     * @author 한유경 
     * @return
     * @throws Exception
     */
    public ResumeVO workIndvdlChart() throws Exception;
    /**
     * 탈퇴한 회원들의 탈퇴사유에 대한 차트를 나타내주는 매서드 
     * @date 2020-06-01
     * @author 한유경
     * @return
     * @throws Exception
     */
    public AdminChartVO IndvdlDropChart() throws Exception;
    /**
     * 최종학력 차트를 나타내주는 매서드
     * @date 2020-06-01
     * @author 한유경
     * @return
     * @throws Exception
     */
    public AdminChartVO FinAcadmcr() throws Exception;
    /**
     * 관리자게시판 관리차트를 나타내주는 매서드 
     * @date 2020-06-02
     * @author 한유경 
     * @return
     * @throws Exception
     */
    public AdminChartVO AdminBoard() throws Exception;
}
