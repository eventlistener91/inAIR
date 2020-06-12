package kr.or.inair.individualmember.joboffersubmit.dao;

import java.util.List;
import java.util.Map;

import kr.or.inair.vo.JoSubmitChartsVO;
import kr.or.inair.vo.Jo_SubmitVO;

public interface IJOSubmitDao {
	/**
	 * 구인게시판 번호, 이력서번호를 매개변수로 전달받아 joSubmit에 insert하는 메서드 
	 * @param params
	 * @throws Exception
	 */
	void insertJoSubmit(Map<String, String> params) throws Exception;
	
	/**
	 * 구인게시판 번호를 매개변수로 전달받아 지원자 리스트를 반환하는 메서드 
	 * @param jo_num
	 * @return List<Jo_SubmitVO> 
	 * @throws Exception
	 */
	List<Jo_SubmitVO> getjoSubmitList(String jo_num) throws Exception;
	
	/**
	 * 구인게시글 번호와, 회원 아이디를 매개변수로 전달받아 지원 내역이 있는지 카운트를 반환하는 메서드 
	 * @param params
	 * @return int
	 * @throws Exception
	 */
	int getjoSubmitListCount(Map<String, String> params) throws Exception;
	
	/**
	 * 개인 회원이 지원한 구인 현황 리스트를 반환하는 메서드
	 * @param indvdl_id
	 * @return 구인 현황 리스트
	 * @throws Exception
	 * @author 이혜인
	 */
	List<Jo_SubmitVO> joSubmitList(String indvdl_id) throws Exception;
	
	/**
	 * 구인게시판 번호를 매개변수로 전달받아 
	 * @param jo_num
	 * @return JoSubmitChartsVO
	 * @throws Exception
	 */
	JoSubmitChartsVO getJoSubmitCharts(String jo_num) throws Exception;
	
	/**
	 * 구인게시판 번호를 매개변수로 전달받아 급여 차트 데이터 값을 반환하는 메서드
	 * @param jo_num
	 * @return JoSubmitChartsVO
	 * @throws Exception
	 * @author JSM
	 * @since 2020-05-28
	 */
	JoSubmitChartsVO getJoSubmitSalaryCharts(String jo_num) throws Exception;
	
	/**
	 * 이력서 번호를 매개변수로 받아 최종 합격 정보를 업데이트하는 메서드
	 * @param submit_num
	 * @throws Exception
	 * @author 이혜인
	 */
	void finalPassIndvdlMem(String submit_num) throws Exception;
	
	/**
	 * 이력서 번호를 매개변수로 받아 최종 불합격 정보를 업데이트하는 메서드
	 * @param submit_num
	 * @throws Exception
	 * @author 이혜인
	 */
	void finalFailIndvdlMem(String submit_num) throws Exception;
	
	/**
	 * 이력서 번호를 매개변수로 받아 AI 합격 정보를 업데이트하는 메서드
	 * @param submit_num
	 * @throws Exception
	 * @author 이혜인
	 */
	void aiPassIndvdlMem(String submit_num) throws Exception;
	
	/**
	 * 이력서 번호를 매개변수로 받아 AI 불합격 정보를 업데이트하는 메서드
	 * @param submit_num
	 * @throws Exception
	 * @author 이혜인
	 */
	void aiFailIndvdlMem(String submit_num) throws Exception;
	
	/**
	 * 구인게시판 번호를 매개변수로 전달받아 최종학력 차트 데이터 값을 반환하는 메서드
	 * @param jo_num
	 * @return JoSubmitChartsVO
	 * @throws Excption
	 * @author JSM
	 * @since 2020-05-29
	 */
	JoSubmitChartsVO getJoSubmitFinalAcademicCharts(String jo_num) throws Exception;

	/**
	 * 구인게시판 번호를 매개변수로 전달받아 연령 차트 데이터 값을 반환하는 메서드 
	 * @param jo_num
	 * @return JoSubmitChartsVO
	 * @throws Excption
	 * @author JSM
	 * @since 2020-05-29
	 */
	JoSubmitChartsVO getJoSubmitAgeCharts(String jo_num) throws Exception;
}