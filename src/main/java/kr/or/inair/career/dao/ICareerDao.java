package kr.or.inair.career.dao;

import java.util.List;

import kr.or.inair.vo.CareerVO;

public interface ICareerDao {
	/**
	 * 경력 리스트를 insert하는 메서드 
	 * @param insertCareerInfoList
	 * @throws Exception
	 */
	void insertCareerInfoList(List<CareerVO> insertCareerInfoList) throws Exception;
	
	/**
	 * 업데이트할 경력 리스트를 매개변수로 전달받아 update하는 메서드 
	 * @param updateCareerInfoList
	 * @throws Exception
	 */
	void updateCareerInfoList(List<CareerVO> updateCareerInfoList) throws Exception;
}
