package kr.or.inair.individualmember.finalacademic.service;

import java.util.List;

import kr.or.inair.vo.Final_AcademicVO;

public interface IFinalAcademicService {
	
	/**
	 * 최종학력 리스트를 반환하는 메서드
	 * @return 최종학력 리스트
	 * @throws Exception
	 * @author 우영래
	 * @since 2020-05-04
	 */
	List<Final_AcademicVO> getFinalAcademicList() throws Exception;
	
	/**
	 * 구인글에 보여줄 최종학력 리스트를 반환하는 메서드 
	 * @return
	 * @throws Exception
	 */
	List<Final_AcademicVO> getJobOfferFinalAcademicList() throws Exception;
}
