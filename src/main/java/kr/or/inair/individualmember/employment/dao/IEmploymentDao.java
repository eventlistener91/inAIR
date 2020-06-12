package kr.or.inair.individualmember.employment.dao;

import java.util.List;

import kr.or.inair.vo.EmploymentVO;

public interface IEmploymentDao {
	/**
	 * 고용형태 항목 리스트를 반환하는 메서드 
	 * @return List<EmploymentVO>
	 * @author JSM
	 */
	List<EmploymentVO> getEmploymentList() throws Exception;

}
