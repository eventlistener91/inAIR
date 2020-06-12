package kr.or.inair.academicdata.dao;

import java.util.List;

import kr.or.inair.vo.Academic_DetaVO;

public interface IAcademicDataDao {
	/**
	 * 학력 리스트를 파라미터로 전달받아 insert하는 메서드 
	 * @param insertAcademicDetaList
	 */
	void insertAcademicDataList(List<Academic_DetaVO> insertAcademicDetaList) throws Exception;
	
	/**
	 * 업데이트 학력 리스트를 파라미터로 전달받아 update하는 메서드 
	 * @param updateAcademicDetaList
	 * @throws Exception
	 */
	void updateAcademicDataList(List<Academic_DetaVO> updateAcademicDetaList) throws Exception;
}
