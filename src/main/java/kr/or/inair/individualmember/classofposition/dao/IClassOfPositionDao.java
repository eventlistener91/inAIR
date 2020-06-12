package kr.or.inair.individualmember.classofposition.dao;

import java.util.List;

import kr.or.inair.vo.ClassOfPositionVO;

public interface IClassOfPositionDao {
	/**
	 * 직급 리스트를 반환하는 메서드 
	 * @return List<ClassOfPositionVO>
	 * @throws Exception
	 * @author JSM
	 * @since 2020-05-05
	 */
	List<ClassOfPositionVO> getClassOfPositionList() throws Exception;
}
