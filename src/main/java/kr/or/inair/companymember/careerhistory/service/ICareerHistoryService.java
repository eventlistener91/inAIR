package kr.or.inair.companymember.careerhistory.service;

import java.util.List;

import kr.or.inair.vo.CareerHistoryVO;

public interface ICareerHistoryService {

	/**
	 * 경력 리스트를 반환하는 메서드
	 * @return
	 * @throws Exception
	 */
	List<CareerHistoryVO> getcareerHistoryList() throws Exception;
}
