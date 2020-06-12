package kr.or.inair.individualmember.salary.dao;

import java.util.List;

import kr.or.inair.vo.SalaryVO;

public interface ISalaryDao {
	/**
	 * 연봉 리스트를 반환하는 메서드 
	 * @return List<SalaryVO>
	 * @author JSM
	 */
	List<SalaryVO> getSalaryList() throws Exception;
	
}
