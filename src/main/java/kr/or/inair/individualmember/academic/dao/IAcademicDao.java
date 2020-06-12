package kr.or.inair.individualmember.academic.dao;

import java.util.List;

import kr.or.inair.vo.AcademicVO;

public interface IAcademicDao {
	/**
	 * 학력 리스트를반환하는 메서드 
	 * @return
	 * @throws Exception
	 */
	List<AcademicVO> getAcademicList() throws Exception;
}
