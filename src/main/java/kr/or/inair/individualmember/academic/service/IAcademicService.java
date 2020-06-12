package kr.or.inair.individualmember.academic.service;

import java.util.List;

import kr.or.inair.vo.AcademicVO;

public interface IAcademicService {
	/**
	 * 학력 리스트를반환하는 메서드 
	 * @return
	 * @throws Exception
	 */
	List<AcademicVO> getAcademicList() throws Exception;
}
