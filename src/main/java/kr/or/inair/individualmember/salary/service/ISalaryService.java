package kr.or.inair.individualmember.salary.service;

import java.util.List;

import kr.or.inair.vo.SalaryVO;

public interface ISalaryService {
	/**
	 * 연봉 리스트를 반환하는 메서드 
	 * @return List<SalaryVO>
	 * @author JSM
	 */
	List<SalaryVO> getSalaryList() throws Exception;
}
