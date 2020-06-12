package kr.or.inair.individualmember.work.service;

import java.util.List;

import kr.or.inair.vo.WorkVO;

public interface IWorkService {
	/**
	 * 근무 형태 리스트를 반환하는 메서드 
	 * @return List<WorkVO>
	 * @throws Exception
	 */
	List<WorkVO> getWorkList() throws Exception;
}
